package com.jelly.eoss.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jelly.eoss.dao.BaseService;
import com.jelly.eoss.service.MenuService;
import com.jelly.eoss.util.ComUtil;
import com.jelly.eoss.util.Const;
import com.jelly.eoss.util.DateUtil;
import com.jelly.eoss.util.Log;
import com.jelly.eoss.util.Pager;
import com.jelly.eoss.model.Menu;

@Controller
@RequestMapping(value = "/permission")
public class PermissionAction extends BaseAction{
	@Resource
	private BaseService baseService;
	@Resource
	private MenuService menuService;
	
	@RequestMapping(value = "/queryPermissionPage")
	public ModelAndView queryPermissionPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Integer page = ServletRequestUtils.getIntParameter(request, "page", 1);
		
		Map<String, String> param = this.getRequestMap(request);
		param.put("leaf", "1");
		RowBounds rb = new RowBounds((page -1) * Const.PAGE_SIZE, Const.PAGE_SIZE);
		
		Integer totalRow = this.baseService.mySelectOne("_Menu_QueryMenuPage_Count", param);
		List<Map<String, Object>> dataList = this.baseService.getSqlSessionTemplate().selectList("_Menu_QueryMenuPage", param, rb);
		
		Pager pager = new Pager(page.intValue(), Const.PAGE_SIZE, totalRow.intValue());
		pager.setData(dataList);
		
		request.setAttribute("pager", pager);
		this.resetAllRequestParams(request);
		return new ModelAndView("/system/permissionList.jsp");
	}
	
	@RequestMapping(value = "/addPermission")
	public ModelAndView addPermission(HttpServletRequest request, HttpServletResponse response, Menu menu) throws Exception{
		int id = ComUtil.QueryNextID("id", "menu");
		menu.setUrl(Const.BASE_PATH + menu.getUrl());
		menu.setId(id);
		menu.setLeaf(1);
		menu.setPath(menu.getPath() + "#" + id);
		menu.setCreateDatetime(DateUtil.GetCurrentDateTime(true));
		this.baseService.myInsert(Menu.Insert, menu);
		Log.Debug(menu.getTarget());
		return new ModelAndView("/system/permissionList.jsp");
	}
	
	@RequestMapping(value = "/deletePermission")
	public void deletePermission(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
//		Log.Debug("id:" + id);
		this.baseService.myDelete(Menu.DeleteByPk, id);
		response.getWriter().write("y");
	}
	
	@RequestMapping(value = "/updatePermissionPrepare")
	public ModelAndView updatePermissionPrepare(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("id");
		Menu menu = this.baseService.mySelectOne(Menu.SelectByPk, id);
		
		//装饰zTreeNode
		Map<String, String> pm = new HashMap<String, String>();
		pm.put("onlyParent", "yes");
		pm.put("openAll", "yes");
		pm.put("checkedIds", String.valueOf(menu.getPid()));
		pm.put("rootNocheck", "yes");
		String zTreeNodeJson = this.menuService.queryMenuSub(pm);
		
		request.setAttribute("menu", menu);
		request.setAttribute("zTreeNodeJson", zTreeNodeJson);
		return new ModelAndView("/system/permissionUpdate.jsp");
	}
	
	@RequestMapping(value = "/updatePermission")
	public ModelAndView updatePermission(HttpServletRequest request, HttpServletResponse response, Menu menu) throws ServletException, IOException{
		Menu m = this.baseService.mySelectOne(Menu.SelectByPk, menu.getId());
		m.setName(menu.getName());
		m.setTarget(menu.getTarget());
		m.setLev(menu.getLev());
		m.setPath(menu.getPath());
		m.setUrl(menu.getUrl());
		m.setPid(menu.getPid());
		this.baseService.myUpdate(Menu.Update, m);
		return new ModelAndView("/success.jsp");
	}
	
	//getter and setter
	public BaseService getBaseDao() {
		return baseService;
	}

	public void setBaseDao(BaseService baseDao) {
		this.baseService = baseDao;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
}