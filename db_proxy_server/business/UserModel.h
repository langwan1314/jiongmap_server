/*================================================================
 *     Copyright (c) 2015年 lanhu. All rights reserved.
 *
 *   文件名称：UserModel.h
 *   创 建 者：Zhang Yuanhao
 *   邮    箱：bluefoxah@gmail.com
 *   创建日期：2015年01月05日
 *   描    述：
 *
 #pragma once
 ================================================================*/
#ifndef __USERMODEL_H__
#define __USERMODEL_H__

#include "IM.BaseDefine.pb.h"
#include "ImPduBase.h"
#include "public_define.h"
class CUserModel {
public:
    static CUserModel* getInstance();
    ~CUserModel();
    void getChangedId(uint32_t& nLastTime, list<uint32_t>& lsIds);
    void getFriendsId(int id, uint32_t& nLastTime, list<uint32_t>& lsIds);
    void getUsers(list<uint32_t> lsIds,
            list<IM::BaseDefine::UserInfo>& lsUsers);
    bool getUser(uint32_t nUserId, DBUserInfo_t& cUser);

    bool updateUser(DBUserInfo_t& cUser);
    bool insertUser(DBUserInfo_t& cUser);
//    void getUserByNick(const list<string>& lsNicks, list<IM::BaseDefine::UserInfo>& lsUsers);
    void clearUserCounter(uint32_t nUserId, uint32_t nPeerId,
            IM::BaseDefine::SessionType nSessionType);
    void setCallReport(uint32_t nUserId, uint32_t nPeerId,
            IM::BaseDefine::ClientType nClientType);

    bool updateUserSignInfo(uint32_t user_id, const string& sign_info);
    bool getUserSingInfo(uint32_t user_id, string* sign_info);
    bool updatePushShield(uint32_t user_id, uint32_t shield_status);
    bool getPushShield(uint32_t user_id, uint32_t* shield_status);
    bool insertUserAddRequest(uint32_t user_id, uint32_t peerId,
            string req_info);
    bool incAddRequestCount(uint32_t nFromId, uint32_t nToId);
    int getAddRequestCount(uint32_t peerId);
    bool insertUserFriends(uint32_t user_id, uint32_t peerId);
    bool delUserFriends(uint32_t user_id, uint32_t peerId);
    int getAddRequestDetail(int user_id,
            list<IM::BaseDefine::AddRequestInfo> &lsReqs,
            list<IM::BaseDefine::UserInfo> &lsUsers);
    void queryUsers(uint32_t peerId, uint32_t peer_gender,
            string peer_nick_name, uint32_t peer_departement_id,
            string peer_tel, uint32_t peer_status,
            list<IM::BaseDefine::UserInfo> &lsUsers);
    bool checkhasResult(string* sql);

private:
    CUserModel();
private:
    static CUserModel* m_pInstance;
};

#endif /*defined(__USERMODEL_H__) */
