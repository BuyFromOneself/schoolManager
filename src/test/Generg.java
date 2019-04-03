import cn.tantan.bean.Student;
import cn.tantan.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class  Generg{
    @Autowired
  private StudentService studentService;

    @Test
    public  void findAll(){
        PageInfo<Student> info = studentService.pageStudent(1, 3);
        List<Student> list = info.getList();
        System.out.println(list.size());
    }
}
