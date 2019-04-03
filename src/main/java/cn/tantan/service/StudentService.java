package cn.tantan.service;

import cn.tantan.bean.Student;
import com.github.pagehelper.PageInfo;

public interface StudentService  extends IBaseService<Student>  {
    PageInfo<Student> pageStudent(Integer page, Integer limit);
}
