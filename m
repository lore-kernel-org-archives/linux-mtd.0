Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9109CC4BA36
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 01:19:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F085208E4
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 01:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dc8UmQaH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F085208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPIDDDoU+V50jwORM2KG8ROW02AcncYCEHWo2bpA5HU=; b=dc8UmQaHfWDg/D
	WggD9x+cJIQJFoEk2n3qJ8hGyQwEVTj9G81K5f90xVMLZsjRCaPCp7vHABtghzrPOjOrI0oNK2vs9
	ETIFYJPxFe+rml7AcnovZrwV1VCatES6uDoUDC/f2IhzxlofLilFSvsTca/9VtETJU2534KA+vKDK
	uSD8eUsUblJMKI4r4BYKGG+yDLjooL+Ax93SBckM/n49gDIca86hIKi9klAH1hXCvrhjd1Kv2PPwQ
	ofqdwUA9AwygHjVwdOld701RXsgDgofmOvqrCdcsKC/mHxh9hPK83NhfmlQ4TJbF3cd6S2J9QxLzf
	QKk7N93YmZQqvxVABlJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j77p6-0003lY-A3; Thu, 27 Feb 2020 01:18:44 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j77p1-0003kd-Nk
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 01:18:41 +0000
Received: from ig2.spreadtrum.com (shmbx03.spreadtrum.com [10.0.1.208])
 by SHSQR01.spreadtrum.com with ESMTPS id 01R1I9bU044681
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Thu, 27 Feb 2020 09:18:09 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by SHMBX03.spreadtrum.com
 (10.0.1.208) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 27 Feb
 2020 09:18:09 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Thu, 27 Feb 2020 09:18:08 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Hou Tao <houtao1@huawei.com>, Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/JAOmUHIw88Ik/HDzxSCANiTskIAKghsAgAFc6YA=
Date: Thu, 27 Feb 2020 01:18:08 +0000
Message-ID: <e6df93725ef24b548eef69afbbfc15f8@shmbx04.spreadtrum.com>
References: <e2d34800d72243ed85e8df63bb80f7ab@shmbx04.spreadtrum.com>
 <ce621148db0e4f9c80f32c348975663a@shmbx04.spreadtrum.com>
 <ae16d475c0d24c1ba6ab18f1e766e928@shmbx04.spreadtrum.com>
 <46e2f6ca11a442f38d476d4346e8034c@shmbx04.spreadtrum.com>
 <733427970.19532.1578872935782.JavaMail.zimbra@nod.at>
 <5077cb7894bc4b95b09389059edf0ddc@shmbx04.spreadtrum.com>
 <1323907091.20398.1578989376426.JavaMail.zimbra@nod.at>
 <51cabef7ce104de097c2556a4a24d8a7@shmbx04.spreadtrum.com>
 <1741454272.21050.1579043778589.JavaMail.zimbra@nod.at>
 <c62bae00e0d741cc9be1752b139c42d6@shmbx04.spreadtrum.com>
 <fda84926-09d1-1fc7-4b78-99e0d04508bc@huawei.com>
In-Reply-To: <fda84926-09d1-1fc7-4b78-99e0d04508bc@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.1.253]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 01R1I9bU044681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_171840_080156_87DA0C11 
X-CRM114-Status: UNSURE (   2.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgdGFvLA0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KPmRpZmYgLS1naXQgYS9mcy91Ymlmcy90
bmMuYyBiL2ZzL3ViaWZzL3RuYy5jDQo+aW5kZXggZThlN2IwZTk1MzJlLi5hZjM1YzFmZjFhYjQg
MTAwNjQ0DQo+LS0tIGEvZnMvdWJpZnMvdG5jLmMNCj4rKysgYi9mcy91Ymlmcy90bmMuYw0KPkBA
IC0xNDc4LDcgKzE0NzgsMTYgQEAgaW50IHViaWZzX3RuY19sb2NhdGUoc3RydWN0IHViaWZzX2lu
Zm8gKmMsIGNvbnN0IHVuaW9uIHViaWZzX2tleSAqa2V5LA0KPiBtdXRleF91bmxvY2soJmMtPnRu
Y19tdXRleCk7DQoNCj4gaWYgKHViaWZzX2dldF93YnVmKGMsIHpici5sbnVtKSkgew0KPi0vKiBX
ZSBkbyBub3QgR0Mgam91cm5hbCBoZWFkcyAqLw0KPisvKg0KPisgKiBXZSBkbyBub3QgR0Mgam91
cm5hbCBoZWFkcy4gSG93ZXZlciBpZiB6YnIubG51bQ0KPisgKiBpcyBHQydlZCwgZnJlZWQgYW5k
IHRoZW4gcmV1c2VkIGFzIEdDIGpvdXJuYWwgaGVhZCwNCj4rICogd2UgYWxzbyBuZWVkIHRvIHBy
b3RlY3Qgbm9kZSByZWFkaW5nIGJ5IHRuY19tdXRleC4NCj4rICovDQo+K2lmIChtYXliZV9sZWJf
Z2NlZChjLCB6YnIubG51bSwgZ2Nfc2VxMSkpIHsNCj4rc2FmZWx5ID0gMTsNCj4rZ290byBhZ2Fp
bjsNCj4rfQ0KPisNCj4gZXJyID0gdWJpZnNfdG5jX3JlYWRfbm9kZShjLCAmemJyLCBub2RlKTsN
Cj4gcmV0dXJuIGVycjsNCj4gfQ0KPi0tDQoNCkJ1dCBJIGhhdmUgYSBxdWVzdGlvbiBhYm91dCB5
b3VyIHBhdGNoIGlmIGl0IGNhbiBmaXggdGhlIHByb2JsZW0gd2hlbiBpdCBoYXBwZW5zDQpsaWtl
IGJlbG93LiBUaGUgTEVCIG1pZ2h0IGJlIEdDZWQgaW4gdWJpZnNfdG5jX3JlYWRfbm9kZSwgYW5k
IHRoZXJlIGlzIGFsc28gYQ0KdWJpZnNfZ2V0X3didWYuDQoNCj4+PiBCeSB0aGUgd2F5LCB0aGVy
ZSBpcyBhbm90aGVyIHRpbWluZyB0aGUgTEVCIG1pZ2h0IGJlIGdhcmJhZ2UgY29sbGVjdGVkOg0K
Pj4+PiAgICAgQSAgICAgIHwgICAgICAgICAgICAgIEINCj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+Pj4gdWJpZnNfdG5jX2xvY2F0ZQ0KPj4+PiAgIHpici0+bG51bSA9IDU0IChmaW5kIGluIFRO
QykNCj4+Pj4gICAgIHViaWZzX2dldF93YnVmKHpici0+bG51bSA9IDU0KSBpcyB0dXJlDQo+Pj4+
ICAgICAgICAgIHViaWZzX3RuY19yZWFkX25vZGUNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgLT5HQyhjaGFuZ2UgenQtPmxudW0gdG8gMjI0KEdDSEQpIGluIF9UTkNfKQ0KPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAtPnpici0+bG51bSA9IDU0IGJlY29tZXMgREFUQUhEDQo+Pj4+
ICAgICAgICAgICAgIHViaWZzX2dldF93YnVmKHpici0+bG51bSA9IDU0IGFzIHRoZSBEQVRBSEQp
IGlzIHR1cmUgYWdhaW4NCj4+Pj4gICAgICAgICAgICAgdWJpZnNfcmVhZF9ub2RlX3didWYNCj4+
Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KDQpUaGFua3MuDQpDYXJzb24NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCiBUaGlzIGVtYWlsIChpbmNsdWRpbmcgaXRzIGF0dGFjaG1l
bnRzKSBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29uIG9yIGVudGl0eSB0byB3aGljaCBp
dCBpcyBhZGRyZXNzZWQgYW5kIG1heSBjb250YWluIGluZm9ybWF0aW9uIHRoYXQgaXMgcHJpdmls
ZWdlZCwgY29uZmlkZW50aWFsIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJl
LiBVbmF1dGhvcml6ZWQgdXNlLCBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24gb3IgY29weWlu
ZyBvZiB0aGlzIGVtYWlsIG9yIHRoZSBpbmZvcm1hdGlvbiBoZXJlaW4gb3IgdGFraW5nIGFueSBh
Y3Rpb24gaW4gcmVsaWFuY2Ugb24gdGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgb3IgdGhlIGlu
Zm9ybWF0aW9uIGhlcmVpbiwgYnkgYW55b25lIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lw
aWVudCwgb3IgYW4gZW1wbG95ZWUgb3IgYWdlbnQgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJpbmcg
dGhlIG1lc3NhZ2UgdG8gdGhlIGludGVuZGVkIHJlY2lwaWVudCwgaXMgc3RyaWN0bHkgcHJvaGli
aXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGRvIG5v
dCByZWFkLCBjb3B5LCB1c2Ugb3IgZGlzY2xvc2UgYW55IHBhcnQgb2YgdGhpcyBlLW1haWwgdG8g
b3RoZXJzLiBQbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIHBlcm1hbmVu
dGx5IGRlbGV0ZSB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGlmIHlvdSByZWNlaXZl
ZCBpdCBpbiBlcnJvci4gSW50ZXJuZXQgY29tbXVuaWNhdGlvbnMgY2Fubm90IGJlIGd1YXJhbnRl
ZWQgdG8gYmUgdGltZWx5LCBzZWN1cmUsIGVycm9yLWZyZWUgb3IgdmlydXMtZnJlZS4gVGhlIHNl
bmRlciBkb2VzIG5vdCBhY2NlcHQgbGlhYmlsaXR5IGZvciBhbnkgZXJyb3JzIG9yIG9taXNzaW9u
cy4NCuacrOmCruS7tuWPiuWFtumZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOWPl+azleW+i+S/
neaKpOS4jeW+l+azhOmcsu+8jOS7heWPkemAgee7meacrOmCruS7tuaJgOaMh+eJueWumuaUtuS7
tuS6uuOAguS4peemgemdnue7j+aOiOadg+S9v+eUqOOAgeWuo+S8oOOAgeWPkeW4g+aIluWkjeWI
tuacrOmCruS7tuaIluWFtuWGheWuueOAguiLpemdnuivpeeJueWumuaUtuS7tuS6uu+8jOivt+WL
v+mYheivu+OAgeWkjeWItuOAgSDkvb/nlKjmiJbmiqvpnLLmnKzpgq7ku7bnmoTku7vkvZXlhoXl
rrnjgILoi6Xor6/mlLbmnKzpgq7ku7bvvIzor7fku47ns7vnu5/kuK3msLjkuYXmgKfliKDpmaTm
nKzpgq7ku7blj4rmiYDmnInpmYTku7bvvIzlubbku6Xlm57lpI3pgq7ku7bnmoTmlrnlvI/ljbPl
iLvlkYrnn6Xlj5Hku7bkurrjgILml6Dms5Xkv53or4HkupLogZTnvZHpgJrkv6Hlj4rml7bjgIHl
ronlhajjgIHml6Dor6/miJbpmLLmr5LjgILlj5Hku7bkurrlr7nku7vkvZXplJnmvI/lnYfkuI3m
ib/mi4XotKPku7vjgIINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
