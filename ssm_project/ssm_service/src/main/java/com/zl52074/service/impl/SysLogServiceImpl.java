package com.zl52074.service.impl;


import com.github.pagehelper.PageHelper;
import com.zl52074.dao.SysLogDao;
import com.zl52074.domain.SysLog;
import com.zl52074.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogDao sysLogDao;

    @Override
    public List<SysLog> findAll(int page, int size) throws Exception {
        //参数pageNum 是页码值   参数pageSize 代表是每页显示条数
        PageHelper.startPage(page, size);
        return sysLogDao.findAll();
    }

    @Override
    public Integer findCount() {
        return sysLogDao.findCount();
    }

    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLogDao.save(sysLog);
    }
}
