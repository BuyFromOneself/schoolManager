package cn.tantan.bean;

import java.io.Serializable;
import java.util.List;

public class Result implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -1413655037558647525L;

    // 数据状态的字段名称
    private int code;
    // 状态信息的字段名称
    private String msg;
    // 数据总数的字段名称
    private int count;
    // 数据列表的字段名称
    private List<?> Data;
    /**
     * @return 数据状态的字段名称
     */
    public int getCode() {
        return code;
    }
    /**
     * @param数据状态的字段名称
     */
    public void setCode(int code) {
        this.code = code;
    }
    /**
     * @return 状态信息的字段名称
     */
    public String getMsg() {
        return msg;
    }
    /**状态信息的字段名称
     * @param
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }
    /**
     * @return 数据总数的字段名称
     */
    public int getCount() {
        return count;
    }
    /**
     * 数据总数的字段名称
     * @param
     *
     */
    public void setCount(int count) {
        this.count = count;
    }
    /**
     * @return 数据列表的字段名称
     */
    public List<?> getData() {
        return Data;
    }
    /**
     * 数据列表的字段名称
     * @param
     */
    public void setData(List<?> data) {
        Data = data;
    }
}
