package cn.tantan.service.imp;

import cn.tantan.bean.Student;
import cn.tantan.dao.IBaseDao;
import cn.tantan.mapper.StudentMapper;
import cn.tantan.service.IBaseService;
import cn.tantan.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImp  extends IBseServiceImp<Student> implements StudentService  {

    @Autowired
    private StudentMapper studentMapper;


    public IBaseDao getBaseDao() {
        return studentMapper;
    }

    @Override
    public PageInfo pageStudent(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<Student> lit = studentMapper.pageStudent();
        PageInfo<Student> info = new PageInfo<>(lit);
        return info;
    }
}
