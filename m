Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E21DC3F2D1
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 01:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1514F24673
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 01:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eVfukcw1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1514F24673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5VyEIZQv9J6O4oMKrEeP6kIVE9Ie71I+f8gKkglXNY=; b=eVfukcw1nF3ZXM
	h3w1VBvbP25Ik5oujXUWP8Qlv+2NYzgSa6blfrudWx3bz1SNBeBxGuV5NsXuA08hHZo7TTNlAWXjz
	asiWBOG3ePbZfrg25fW7y56/8V5SmGZJMOBgqs3vNjOYrAYzhHk37GVK/oDoMvT36xg00/UyhizIa
	HGvF3eo8X+hJ8rhOpdNZ/dwwyJfDsKIahkWOtHgmdgNl1niag4f62Qx4chk7lcRyrK2Ek8Quf1d8x
	OQiOEVNpb5Azgcm0FkWb6GtLIMvS3YmZmF9FF4S/+MW4Fv2P7PtgiioaZap56ohVcbC5Bu+JwTOXz
	B76ZMlJNRBVk9pm2GzMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8wGg-0007Ba-Lf; Tue, 03 Mar 2020 01:22:42 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8wGc-0007Aq-BA
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 01:22:40 +0000
Received: from ig2.spreadtrum.com (shmbx03.spreadtrum.com [10.0.1.208])
 by SHSQR01.spreadtrum.com with ESMTPS id 0231Lpxk019601
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Tue, 3 Mar 2020 09:21:51 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by SHMBX03.spreadtrum.com
 (10.0.1.208) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 3 Mar 2020
 09:21:49 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Tue, 3 Mar 2020 09:21:49 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Hou Tao <houtao1@huawei.com>, Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/JAOmUHIw88Ik/HDzxSCANiTskIAKghsAgAFc6YD//9dEAAARFrMAAK2+roAAEgFJ4P//wsIA//9zlBCAAMwdAP/+gXyQ
Date: Tue, 3 Mar 2020 01:21:49 +0000
Message-ID: <beb38d26a562459ebc46c1578ab7ca82@shmbx04.spreadtrum.com>
References: <e2d34800d72243ed85e8df63bb80f7ab@shmbx04.spreadtrum.com>
 <ae16d475c0d24c1ba6ab18f1e766e928@shmbx04.spreadtrum.com>
 <46e2f6ca11a442f38d476d4346e8034c@shmbx04.spreadtrum.com>
 <733427970.19532.1578872935782.JavaMail.zimbra@nod.at>
 <5077cb7894bc4b95b09389059edf0ddc@shmbx04.spreadtrum.com>
 <1323907091.20398.1578989376426.JavaMail.zimbra@nod.at>
 <51cabef7ce104de097c2556a4a24d8a7@shmbx04.spreadtrum.com>
 <1741454272.21050.1579043778589.JavaMail.zimbra@nod.at>
 <c62bae00e0d741cc9be1752b139c42d6@shmbx04.spreadtrum.com>
 <fda84926-09d1-1fc7-4b78-99e0d04508bc@huawei.com>
 <e6df93725ef24b548eef69afbbfc15f8@shmbx04.spreadtrum.com>
 <6cf2ba81-98ad-c03f-59b9-b871c7979df6@huawei.com>
 <3768e0805ba349f487214bef018f1853@shmbx04.spreadtrum.com>
 <6387af1b-d5a8-a175-6936-1f5f3ab003a4@huawei.com>
 <6a8b67e4baf44534b6c92c80a0edbdd3@shmbx04.spreadtrum.com>
 <43120885-5bc8-9850-6f14-8e2a637cbeaf@huawei.com>
 <0b5d3e537a3f43db86f34cd695906173@shmbx04.spreadtrum.com>
 <6f4b9dff-61d5-a5cb-b7ec-222660e9db7f@huawei.com>
In-Reply-To: <6f4b9dff-61d5-a5cb-b7ec-222660e9db7f@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.1.253]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 0231Lpxk019601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_172238_715622_B0364079 
X-CRM114-Status: UNSURE (  -0.10  )
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

T24gTW9uZGF5LCBNYXJjaCAyLCAyMDIwIDY6MjMgUE0sIEhvdSBUYW88aG91dGFvMUBodWF3ZWku
Y29tPiB3cm90ZToNCg0KPlRoZSBvdGhlciBjYXNlIGlzIHRoZXJlIGlzIHRoZXJlIGlzIEdDIGFu
ZCBqb3VybmFsIGhlYWQgc3dpdGNoIChubyBjb21taXQpIGJldHdlZW4NCj50aGUgcmVsZWFzZSBv
ZiB0bmNfbXV0ZXggYW5kIHRoZSBjYWxsIG9mIHViaWZzX3JlYWRfbm9kZV93YnVmKCksIGFzIGls
bHVzdHJhdGVkIGJ5DQo+dGhlIGZvbGxvd2luZyBzdGFjazoNCg0KPnByb2Nlc3MgQSAgICAgICAg
ICAgICAgICAgICAgICAgcHJvY2VzcyBCDQoNCj5ub2RlIGluIExFQiA1NCBoYXMgYmVlbiBjb21t
aXR0ZWQNCg0KPnViaWZzX3RuY19sb2NhdGUNCj56YnItPmxudW0gPSA1NCAoZmluZCBpbiBUTkMp
DQo+bXV0ZXhfdW5sb2NrKCZ0bmNfbXV0ZXgpDQoNCj4tPkdDIChjaGFuZ2UgenQtPmxudW0gdG8g
MjI0KEdDSEQpIGluIF9UTkNfKQ0KPi0+ZGF0YSBqb3VybmFsIGhlYWQgc3dpdGNoICh6YnItPmxu
dW0gPSA1NCBiZWNvbWVzIERBVEFIRCkNCg0KPnViaWZzX2dldF93YnVmKHpici0+bG51bSA9IDU0
KSBpcyB0cnVlDQo+dWJpZnNfdG5jX3JlYWRfbm9kZQ0KPnViaWZzX2dldF93YnVmKHpici0+bG51
bSA9IDU0IGFzIHRoZSBEQVRBSEQpIGlzIHN0aWxsIHRydWUNCj51Ymlmc19yZWFkX25vZGVfd2J1
Zg0KDQpvaCwgaXQgaXMgdHJ1bHkgYW5vdGhlciBjYXNlIEkgZGlkbid0IHRob3VnaHQgYWJvdXQu
IFRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbiwgYW5kIHlvdXINCnBhdGNoIHdpbGwgcXVpdGUg
cGVyZmVjdGx5IG1ha2Ugc2Vuc2UgZm9yIG1lIG5vdyA6ICkgLg0KDQpUaGFua3MuDQpDYXJzb24N
Cg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIFRoaXMgZW1haWwgKGluY2x1
ZGluZyBpdHMgYXR0YWNobWVudHMpIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3Ig
ZW50aXR5IHRvIHdoaWNoIGl0IGlzIGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRp
b24gdGhhdCBpcyBwcml2aWxlZ2VkLCBjb25maWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHByb3RlY3Rl
ZCBmcm9tIGRpc2Nsb3N1cmUuIFVuYXV0aG9yaXplZCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3Ry
aWJ1dGlvbiBvciBjb3B5aW5nIG9mIHRoaXMgZW1haWwgb3IgdGhlIGluZm9ybWF0aW9uIGhlcmVp
biBvciB0YWtpbmcgYW55IGFjdGlvbiBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhp
cyBlbWFpbCBvciB0aGUgaW5mb3JtYXRpb24gaGVyZWluLCBieSBhbnlvbmUgb3RoZXIgdGhhbiB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBvciBhbiBlbXBsb3llZSBvciBhZ2VudCByZXNwb25zaWJs
ZSBmb3IgZGVsaXZlcmluZyB0aGUgbWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBwbGVhc2UgZG8gbm90IHJlYWQsIGNvcHksIHVzZSBvciBkaXNjbG9zZSBhbnkgcGFydCBv
ZiB0aGlzIGUtbWFpbCB0byBvdGhlcnMuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlh
dGVseSBhbmQgcGVybWFuZW50bHkgZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVu
dHMgaWYgeW91IHJlY2VpdmVkIGl0IGluIGVycm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0aW9ucyBj
YW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSB0aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJlZSBvciB2
aXJ1cy1mcmVlLiBUaGUgc2VuZGVyIGRvZXMgbm90IGFjY2VwdCBsaWFiaWxpdHkgZm9yIGFueSBl
cnJvcnMgb3Igb21pc3Npb25zLg0K5pys6YKu5Lu25Y+K5YW26ZmE5Lu25YW35pyJ5L+d5a+G5oCn
6LSo77yM5Y+X5rOV5b6L5L+d5oqk5LiN5b6X5rOE6Zyy77yM5LuF5Y+R6YCB57uZ5pys6YKu5Lu2
5omA5oyH54m55a6a5pS25Lu25Lq644CC5Lil56aB6Z2e57uP5o6I5p2D5L2/55So44CB5a6j5Lyg
44CB5Y+R5biD5oiW5aSN5Yi25pys6YKu5Lu25oiW5YW25YaF5a6544CC6Iul6Z2e6K+l54m55a6a
5pS25Lu25Lq677yM6K+35Yu/6ZiF6K+744CB5aSN5Yi244CBIOS9v+eUqOaIluaKq+mcsuacrOmC
ruS7tueahOS7u+S9leWGheWuueOAguiLpeivr+aUtuacrOmCruS7tu+8jOivt+S7juezu+e7n+S4
reawuOS5heaAp+WIoOmZpOacrOmCruS7tuWPiuaJgOaciemZhOS7tu+8jOW5tuS7peWbnuWkjemC
ruS7tueahOaWueW8j+WNs+WIu+WRiuefpeWPkeS7tuS6uuOAguaXoOazleS/neivgeS6kuiBlOe9
kemAmuS/oeWPiuaXtuOAgeWuieWFqOOAgeaXoOivr+aIlumYsuavkuOAguWPkeS7tuS6uuWvueS7
u+S9lemUmea8j+Wdh+S4jeaJv+aLhei0o+S7u+OAgg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
