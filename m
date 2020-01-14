Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3357C3F68F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 11:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A71224679
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 11:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYUOicz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A71224679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5jd/q7zNlDKBrncKQ+0n8XjWoc/HGPWb3u1pFjT6UA=; b=FYUOicz7KPtoow
	SzWYZ43Rb+TC8Hg3sNfZkpBI4Ku0E+/1Gp5ZdxgKZIgNOj21niTaEL07UQWn4bwM4MTWnuyMi//FH
	Rx4WwEvta4DtYK907Ur9E3PReCEvRpCR120lKdK32Pq4AnPaOl8Lffn5QxDJ2MxIr8/TBqOzBATvK
	Bz1seXZt3SBPlCzD2nrQTeQc8PtdFIkBKmMnjgU/JnnApHaLYlxX5H0qo1miYdo+gHub4NKE4iMpd
	htvcfvsVSz9JuZ8jjTyzJJkxKEsnndW36bPO6V6SaxZVkjbfwYfIXF4vKkgdE+c9p1Mx1+Vt7s6VP
	pyGcsLAABSy+Kbf0pgzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irJxj-0004BF-9e; Tue, 14 Jan 2020 11:02:19 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irJxa-00049n-OQ
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 11:02:17 +0000
Received: from ig2.spreadtrum.com (shmbx02.spreadtrum.com [10.0.1.204])
 by SHSQR01.spreadtrum.com with ESMTPS id 00EB1MLw019954
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Tue, 14 Jan 2020 19:01:22 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by SHMBX02.spreadtrum.com
 (10.0.1.204) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 14 Jan
 2020 19:01:49 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Tue, 14 Jan 2020 19:01:49 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/JAOmUA==
Date: Tue, 14 Jan 2020 11:01:49 +0000
Message-ID: <51cabef7ce104de097c2556a4a24d8a7@shmbx04.spreadtrum.com>
References: <e2d34800d72243ed85e8df63bb80f7ab@shmbx04.spreadtrum.com>
 <ce621148db0e4f9c80f32c348975663a@shmbx04.spreadtrum.com>
 <ae16d475c0d24c1ba6ab18f1e766e928@shmbx04.spreadtrum.com>
 <46e2f6ca11a442f38d476d4346e8034c@shmbx04.spreadtrum.com>
 <733427970.19532.1578872935782.JavaMail.zimbra@nod.at>
 <5077cb7894bc4b95b09389059edf0ddc@shmbx04.spreadtrum.com>
 <1323907091.20398.1578989376426.JavaMail.zimbra@nod.at>
In-Reply-To: <1323907091.20398.1578989376426.JavaMail.zimbra@nod.at>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.1.200]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 00EB1MLw019954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_030211_857918_6F4783EE 
X-CRM114-Status: UNSURE (   1.20  )
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

SGkgUmljaGFyZDoNCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS16YnJhbmNoIHBhc3NlZCB0byB1Ymlm
c190bmNfcmVhZF9ub2RlLS0tLS0tLS0tLS0tLS0tLQ0KPmNyYXNoX2FybT4gdWJpZnNfemJyYW5j
aCBjNjhjZmQ0OA0KPnN0cnVjdCB1Ymlmc196YnJhbmNoIHsNCj4gIGtleSA9IHsNCj4gICAgdTgg
PSAiXDIwM1wwMDNcMDAwXDAwMFwwMDBcMDAwXDAwMCIsDQo+ICAgIHUzMiA9IHs4OTksIDB9LA0K
PiAgICB1NjQgPSB7ODk5fSwNCj4gICAgajMyID0gezg5OSwgMH0NCj4gIH0sDQo+ICB7DQo+ICAg
IHpub2RlID0gMHgwLA0KPiAgICBsZWFmID0gMHgwDQo+ICB9LA0KPiAgbG51bSA9IDU0LCAvL0RB
VEFIRA0KPiAgb2ZmcyA9IDIxMDc0NCwNCj4gIGxlbiA9IDE2MA0KPn0NCj4tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0temJyYW5jaCBmb3VuZCBpbiBUTkMtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPmNyYXNoX2FybT4gdWJpZnNfemJyYW5jaCAgMHhjOGVmOTIzMCBzdHJ1Y3QgdWJpZnNf
emJyYW5jaCB7DQo+ICBrZXkgPSB7DQo+ICAgIHU4ID0gIlwyMDNcMDAzXDAwMFwwMDBcMDAwXDAw
MFwwMDAiLA0KPiAgICB1MzIgPSB7ODk5LCAwfSwNCj4gICAgdTY0ID0gezg5OX0sDQo+ICAgIGoz
MiA9IHs4OTksIDB9DQo+ICB9LA0KPiAgew0KPiAgICB6bm9kZSA9IDB4MCwNCj4gICAgbGVhZiA9
IDB4MA0KPiAgfSwNCj4gIGxudW0gPSAyMjQsIC8vR0NIRA0KPiAgb2ZmcyA9IDIyNjI0MCwNCj4g
IGxlbiA9IDE2MA0KPn0NCg0KPmNyYXNoX2FybT4gdWJpZnNfamhlYWQud2J1Zi5sbnVtIDB4Yzkw
MWIwMDANCj4gd2J1Zi5sbnVtID0gMjI0LCAvL0dDSEQNCj5jcmFzaF9hcm0+IHViaWZzX2poZWFk
LndidWYubG51bSAweGM5MDFiMGEwDQo+ICB3YnVmLmxudW0gPSA1MywvL0JBU0VIRA0KPmNyYXNo
X2FybT4gdWJpZnNfamhlYWQud2J1Zi5sbnVtIDB4YzkwMWIxNDANCj4gIHdidWYubG51bSA9IDU0
LCAvL0RBVEFIRA0KDQpJIGFtIG5vdCBzdXJlIGlmIGkgaGF2ZSBtYWRlIGl0IGNsZWFyLCBtYXli
ZSBmb2xsb3dpbmcgbG9naWMgY2FuIG1ha2UgaXQgY2xlYXJlcjoNCg0KQSAgfCAgICAgICAgICBC
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KdWJpZnNfdG5jX2xvY2F0ZQ0K
ICAgemJyLT5sbnVtID0gNTQgKGZpbmQgaW4gVE5DKQ0KICAgICB1Ymlmc19nZXRfd2J1Zih6YnIt
PmxudW0gPSA1NCkgaXMgdHVyZQ0KICAgICAgICAgIHViaWZzX3RuY19yZWFkX25vZGUNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAtPkdDKGNoYW5nZSB6dC0+bG51bSB0byAyMjQoR0NIRCkgaW4g
X1ROQ18pDQogICAgICAgICAgICAgICAgICAgICAgICAgLT56YnItPmxudW0gPSA1NCBiZWNvbWVz
IERBVEFIRA0KdWJpZnNfZ2V0X3didWYoemJyLT5sbnVtID0gNTQgYXMgdGhlIERBVEFIRCkgaXMg
dHVyZSBhZ2Fpbg0KICAgICB1Ymlmc19yZWFkX25vZGVfd2J1Zg0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KRGF0YSBsYXlzIGluIExFQjU0IGhhdmUgYmVlbiBtb3ZlZCB0byBM
RUIyMjQsIHNvIGVycm9yIGhhcHBlbnMuIGlmIGEgam91cm5hbCBoZWFkIGlzDQpnYXJiYWdlIGNv
bGxlY3RlZCwgaWYgdGhhdCBtZWFucyB0aGVyZSBpcyBhIGNvbW1pdCBoYXMgZmluaXNoZWQ/IEkg
Z3Vlc3MgdGhpcyBzaXR1YXRpb24NCmhhcHBlbnMgd2hlbiBtYWtpbmcgcmVzZXJ2YXRpb24sIHJ1
bnMgY29tbWl0IGZpcnN0IGFuZCB0aGVuIGRvZXMgZ2FyYmFnZSBjb2xsZWN0Lg0KDQpUaGFua3Mu
DQpDYXJzb24uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIFRoaXMgZW1haWwg
KGluY2x1ZGluZyBpdHMgYXR0YWNobWVudHMpIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJz
b24gb3IgZW50aXR5IHRvIHdoaWNoIGl0IGlzIGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5m
b3JtYXRpb24gdGhhdCBpcyBwcml2aWxlZ2VkLCBjb25maWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHBy
b3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIFVuYXV0aG9yaXplZCB1c2UsIGRpc3NlbWluYXRpb24s
IGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5nIG9mIHRoaXMgZW1haWwgb3IgdGhlIGluZm9ybWF0aW9u
IGhlcmVpbiBvciB0YWtpbmcgYW55IGFjdGlvbiBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMg
b2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3JtYXRpb24gaGVyZWluLCBieSBhbnlvbmUgb3RoZXIg
dGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBvciBhbiBlbXBsb3llZSBvciBhZ2VudCByZXNw
b25zaWJsZSBmb3IgZGVsaXZlcmluZyB0aGUgbWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50LCBwbGVhc2UgZG8gbm90IHJlYWQsIGNvcHksIHVzZSBvciBkaXNjbG9zZSBhbnkg
cGFydCBvZiB0aGlzIGUtbWFpbCB0byBvdGhlcnMuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBp
bW1lZGlhdGVseSBhbmQgcGVybWFuZW50bHkgZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0
YWNobWVudHMgaWYgeW91IHJlY2VpdmVkIGl0IGluIGVycm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0
aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSB0aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJl
ZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2VuZGVyIGRvZXMgbm90IGFjY2VwdCBsaWFiaWxpdHkgZm9y
IGFueSBlcnJvcnMgb3Igb21pc3Npb25zLg0K5pys6YKu5Lu25Y+K5YW26ZmE5Lu25YW35pyJ5L+d
5a+G5oCn6LSo77yM5Y+X5rOV5b6L5L+d5oqk5LiN5b6X5rOE6Zyy77yM5LuF5Y+R6YCB57uZ5pys
6YKu5Lu25omA5oyH54m55a6a5pS25Lu25Lq644CC5Lil56aB6Z2e57uP5o6I5p2D5L2/55So44CB
5a6j5Lyg44CB5Y+R5biD5oiW5aSN5Yi25pys6YKu5Lu25oiW5YW25YaF5a6544CC6Iul6Z2e6K+l
54m55a6a5pS25Lu25Lq677yM6K+35Yu/6ZiF6K+744CB5aSN5Yi244CBIOS9v+eUqOaIluaKq+mc
suacrOmCruS7tueahOS7u+S9leWGheWuueOAguiLpeivr+aUtuacrOmCruS7tu+8jOivt+S7juez
u+e7n+S4reawuOS5heaAp+WIoOmZpOacrOmCruS7tuWPiuaJgOaciemZhOS7tu+8jOW5tuS7peWb
nuWkjemCruS7tueahOaWueW8j+WNs+WIu+WRiuefpeWPkeS7tuS6uuOAguaXoOazleS/neivgeS6
kuiBlOe9kemAmuS/oeWPiuaXtuOAgeWuieWFqOOAgeaXoOivr+aIlumYsuavkuOAguWPkeS7tuS6
uuWvueS7u+S9lemUmea8j+Wdh+S4jeaJv+aLhei0o+S7u+OAgg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
