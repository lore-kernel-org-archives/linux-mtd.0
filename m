Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130ADC33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 08:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B84712084D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 08:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fnVH2FN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B84712084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIMbVKEa1YQm5kvZt72SUTp5teT9ovolKc44+4Eawc4=; b=fnVH2FN+rRDu1V
	sFBQr8Pzgi3e4V7ySNJLfMmERUzw+MPTU8JFi+YKZ0VY4d2Gihz29XHhBpNIRatgRLhSTIWDa+6Wq
	9EV61/dYP2lSCKaD6zYuUPkupNb+R02ElnY0QPNhcnODSLNN5H8wvHEm6Ome9nGku0aroiFTCxEyk
	cv6vh0Yro72pDpH1xjcWsRCm6AZBlzns0R3Zb78oCjTsTQwIg6zlaidCmxFObTUPpD6KUxZNWxl1n
	6sr0d+TSJWwSrJYpEUnB2YyMnZ4/frSheaC+EJnq0NI27hyl+RMGrDtvKMbQ0yyBvMOyhVlN55Wt5
	SuNaNb6RRmccKRpFSFLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irHZg-0002vL-5I; Tue, 14 Jan 2020 08:29:20 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irHZd-0002uu-25
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 08:29:18 +0000
Received: from ig2.spreadtrum.com (shmbx02.spreadtrum.com [10.0.1.204])
 by SHSQR01.spreadtrum.com with ESMTPS id 00E8SNYQ005160
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
 Tue, 14 Jan 2020 16:28:23 +0800 (CST)
 (envelope-from Carson.Li1@unisoc.com)
Received: from SHMBX04.spreadtrum.com (10.0.1.214) by SHMBX02.spreadtrum.com
 (10.0.1.204) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 14 Jan
 2020 16:28:50 +0800
Received: from SHMBX04.spreadtrum.com ([fe80::8532:ef18:9217:26f5]) by
 shmbx04.spreadtrum.com ([fe80::8532:ef18:9217:26f5%13]) with mapi id
 15.00.0847.030; Tue, 14 Jan 2020 16:28:50 +0800
From: =?utf-8?B?5p2O5YKy5YKyIChDYXJzb24gTGkxLzk1NDIp?= <Carson.Li1@unisoc.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Topic: ubifs: read bad node type in ubifs_tnc_read_wbuf
Thread-Index: AQHVyaL3y4TC5HCNzkiSy+TVWaB7mKfpWzQwG5Qm157/I9Tw4A==
Date: Tue, 14 Jan 2020 08:28:49 +0000
Message-ID: <fdd177b5620944d28c3eb350ec00a185@shmbx04.spreadtrum.com>
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
X-MAIL: SHSQR01.spreadtrum.com 00E8SNYQ005160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_002917_435569_507914FE 
X-CRM114-Status: UNSURE (   0.03  )
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

T24gMTQuIEphbnVhciAyMDIwIDAyOjA5OjU0IEFNIFJpY2hhcmQgPHJpY2hhcmRAbm9kLmF0PiB3
cm90ZToNCj4NCj5JcyBpdCBhbHdheXMgREFUQUhEIHdoaWNoIGlzIGJlaW5nIGdhcmJhZ2UgY29s
bGVjdGVkPw0KPg0KSW4gdGhvc2UgdGhyZWUgY2FzZXMsIGl0IGlzIGFsd2F5cyBhIExFQiBiZWlu
ZyBnYXJiYWdlIGNvbGxlY3RlZCBhbmQgdGhlbg0KdXNlZCBhcyBEQVRBSEQuIEkgdGhpbmsgaXQg
bWlnaHQgYmVjYXVzZSBvZiB0aGUgR0NIRCBhbHNvIGhhcyB3YnVmLCBzbyBpdA0KY2FuIG1ha2Ug
dWJpZnNfZ2V0X3didWYgcmV0dXJucyB0cnVlLCB3aGlsZSB0aGUgb3RoZXIgZ29lcyBkaXJlY3Rs
eSB0bw0KZmFsbGlibGVfcmVhZF9ub2RlIGluIHViaWZzX3RuY19sb2NhdGUuDQoNCg0KVGhhbmtz
Lg0KQ2Fyc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIFRoaXMgZW1haWwg
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
