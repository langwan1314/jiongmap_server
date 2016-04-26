/*================================================================
 *   Copyright (C) 2014 All rights reserved.
 *
 *   文件名称：UserAction.h
 *   创 建 者：Zhang Yuanhao
 *   邮    箱：bluefoxah@gmail.com
 *   创建日期：2014年12月15日
 *   描    述：
 *
 ================================================================*/

#ifndef __USER_ACTION_H__
#define __USER_ACTION_H__

#include "ImPduBase.h"

namespace DB_PROXY {

    void getUserInfo(CImPdu* pPdu, uint32_t conn_uuid);
    void getChangedUser(CImPdu* pPdu, uint32_t conn_uuid);
    void changeUserSignInfo(CImPdu* pPdu, uint32_t conn_uuid);
    void doPushShield(CImPdu* pPdu, uint32_t conn_uuid);
    void doQueryPushShield(CImPdu* pPdu, uint32_t conn_uuid);
    void addUserRequest(CImPdu* pPdu, uint32_t conn_uuid);
    void agreeAddUser(CImPdu* pPdu, uint32_t conn_uuid);
    void getAddUserRequest(CImPdu* pPdu, uint32_t conn_uuid);
    void getAddRequestDetail(CImPdu* pPdu, uint32_t conn_uuid);
    void deldUser(CImPdu* pPdu, uint32_t conn_uuid);
    void queryAllUser(CImPdu* pPdu, uint32_t conn_uuid);
};


#endif /* __USER_ACTION_H__ */
