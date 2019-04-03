package cn.tantan.service.imp;

import cn.tantan.dao.IBaseDao;
import cn.tantan.service.IBaseService;

public abstract class IBseServiceImp<T> implements IBaseService<T> {

    public abstract IBaseDao<T> getBaseDao();

    @Override
    public int deleteByPrimaryKey(Integer orgId) {
        return getBaseDao().deleteByPrimaryKey(orgId);
    }

    @Override
    public int insert(T sysOrg) {
        return getBaseDao().insert(sysOrg);
    }

    @Override
    public int insertSelective(T sysOrg) {
        return getBaseDao().insertSelective(sysOrg);
    }

    @Override
    public T selectByPrimaryKey(Integer orgId) {
        return getBaseDao().selectByPrimaryKey(orgId);
    }

    @Override
    public int updateByPrimaryKeySelective(T sysOrg) {
        return getBaseDao().updateByPrimaryKeySelective(sysOrg);
    }

    @Override
    public int updateByPrimaryKey(T sysOrg) {
        return getBaseDao().updateByPrimaryKey(sysOrg);
    }
}
