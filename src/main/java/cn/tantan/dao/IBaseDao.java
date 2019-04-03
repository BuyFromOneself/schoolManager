package cn.tantan.dao;


public interface IBaseDao<T> {
    int deleteByPrimaryKey(Integer tId);

    int insert(T  record);

    int insertSelective(T  record);

    T  selectByPrimaryKey(Integer tId);

    int updateByPrimaryKeySelective(T  record);

    int updateByPrimaryKey(T  record);
}
