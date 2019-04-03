package cn.tantan.controller;

import cn.tantan.bean.Result;
import cn.tantan.bean.Student;
import cn.tantan.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("find")
    @ResponseBody
    public Result findAll(Integer page, Integer limit){
        PageInfo<Student> pageInfo = studentService.pageStudent(page, limit);
        Result result = new Result();
        result.setData(pageInfo.getList());
        result.setCount(new Long(pageInfo.getTotal()).intValue());
        result.setCode(0);
        return result;
    }
}
