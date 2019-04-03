package cn.tantan.mapper;

import cn.tantan.bean.Student;
import cn.tantan.dao.IBaseDao;

import java.util.List;

public interface StudentMapper extends IBaseDao<Student> {

    List<Student> pageStudent();
}