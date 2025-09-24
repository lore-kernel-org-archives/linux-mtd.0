Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606FCAC5A5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tTVgZSYuT1ILPOsQYz5pQiDXE2lFrpY7XS7QrqfJAZw=; b=QQIMQUHiRZDutc
	tQCfySy9PqVH+zcbeSqXSQP16LLslhcd7X+OdQ8l5crWh3QWNOoaY3g0ESWQhv9sacZm7HkH5/S1G
	HK1Nj9AV3VJTjy3SKo91Bg/3nz9wGwKHEx98RmkD2qGr1tyQgQZkvojmD5GDGl+Sq5f3uzSFJsZBV
	5H6MoPo1q8bjm5g/tUv1EDYe08smDit5t328aUpS3oNGO6rYISXBmqKdf327aJVIxukUGluxZ9Pna
	8jQWetIYlqu9ZDC00cl2JOa8B5BDfTFO3ZN84q4/lfpytpRlgxEt0HhIN+LWjFz3eHgVKtmub7mCJ
	oktxRFNkt7edXViPzdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1O55-0000000H7mQ-49pR;
	Wed, 24 Sep 2025 11:54:43 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1O52-0000000H7il-3fiL
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 11:54:42 +0000
Received: from jtjnmail201621.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202509241954300021
        for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2025 19:54:30 +0800
Received: from jtjnmail201621.home.langchao.com (10.100.2.21) by
 jtjnmail201621.home.langchao.com (10.100.2.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 24 Sep 2025 19:54:32 +0800
Received: from jtjnmail201621.home.langchao.com ([fe80::31c7:1db7:6c09:282a])
 by jtjnmail201621.home.langchao.com ([fe80::31c7:1db7:6c09:282a%7]) with mapi
 id 15.01.2507.058; Wed, 24 Sep 2025 19:54:31 +0800
From: =?utf-8?B?SGFycmlzIFNvbmfvvIjlrovlh6/vvIk=?= <songkai01@inspur.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: fs/jffs2/readinode.c: data crc error detected
Thread-Topic: fs/jffs2/readinode.c: data crc error detected
Thread-Index: AdwtSZCt+X1oWjUXQluFwYptURjFXQ==
Date: Wed, 24 Sep 2025 11:54:31 +0000
Message-ID: <61701e45381d4a1ba05d78c470992a42@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.45.253.47]
MIME-Version: 1.0
tUid: 2025924195430fc0faabadcbd8607c32c04bb84a01b17
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_045441_261779_4F038327 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLCANCg0KSW4gZnMvamZmczIvcmVhZC5jLCB3aGVuIGpmZnMyX3JlYWRfZG5vZGUgZGV0
ZWN0cyBhIGRhdGEtQ1JDIGZhaWx1cmUgaXQgaW1tZWRpYXRlbHkgcmV0dXJucyAtRUlPIHRvIHVz
ZXIgc3BhY2UuIEFueSByZWFkIGF0dGVtcHQgdGhhdCB0aGUgYXBwbGljYXRpb24gbWFrZXMgc2hv
cnRseSBhZnRlcndhcmRzIHdpbGwgZmFpbCB3aXRoIHRoZSBzYW1lIGVycm9yLg0KDQppbnQgamZm
czJfcmVhZF9kbm9kZSgpDQp7wqAgwqDCoA0KwqDCoMKgwqAuLi4uLi4NCsKgwqDCoMKgwqAgY3Jj
ID0gY3JjMzIoMCwgcmVhZGJ1ZiwgamUzMl90b19jcHUocmktPmNzaXplKSk7DQrCoMKgwqDCoMKg
IGlmIChjcmMgIT0gamUzMl90b19jcHUocmktPmRhdGFfY3JjKSkgew0KwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwcl93YXJuKCJEYXRhIENSQyAlMDh4ICE9IGNhbGN1bGF0ZWQgQ1JDICUwOHggZm9y
IG5vZGUgYXQgJTA4eFxuIiwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgamUz
Ml90b19jcHUocmktPmRhdGFfY3JjKSwgY3JjLCByZWZfb2Zmc2V0KGZkLT5yYXcpKTsNCsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTzsNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBvdXRfZGVjb21wcmJ1ZjsNCsKgwqDCoMKgwqAgfQ0KwqDCoMKgIC4uLi4uLg0KwqDCoMKgwqDC
oCByZXR1cm4gcmV0Ow0KfQ0KDQpUaGUgc3lzdGVtIG11c3Qgd2FpdCBmb3IgdGhlIGdhcmJhZ2Ug
Y29sbGVjdGlvbiBtZWNoYW5pc20gdG8gaGFuZGxlIHRoZSBpc3N1ZS4gQWZ0ZXIgcHJvY2Vzc2lu
ZywgdGhlIG5vZGUgbWF5IGhhdmUgYmVlbiByb2xsZWQgYmFjayB0byBhbiBlYXJsaWVyICh2YWxp
ZCkgdmVyc2lvbiwgYW5kIG9ubHkgdGhlbiBjYW4gdGhlIGFwcGxpY2F0aW9uIHJlYWQgdGhlIGRh
dGEgc3VjY2Vzc2Z1bGx5Lg0KDQpJbiBzdWNoIGEgc2NlbmFyaW8sIHNpbmNlIHRoZSBub2RlIGlz
IGFscmVhZHkgY29ycnVwdGVkLCB3b3VsZCBpdCBiZSBwb3NzaWJsZSB0byBkaXJlY3RseSBtYXJr
IHRoZSBub2RlIHdpdGggdGhlIENSQyBlcnJvciBhcyBvYnNvbGV0ZShqZmZzMl9tYXJrX25vZGVf
b2Jzb2xldGUgb3IgYSBzaW1pbGFyIGhlbHBlcik/IFRoaXMgd2F5LCB3aGVuIHRoZSBhcHBsaWNh
dGlvbiByZWFkcyBhZ2FpbiwgaXQgY291bGQgaW1tZWRpYXRlbHkgYWNjZXNzIHRoZSBjb3JyZWN0
IGRhdGEgd2l0aG91dMKgIHdhaXRpbmcgZm9yIGJhY2tncm91bmQgZ2FyYmFnZSBjb2xsZWN0aW9u
Lg0KDQpsaWtlIHRoaXM6IA0KDQppbnQgamZmczJfcmVhZF9kbm9kZSgpDQp7wqDCoMKgIA0KwqDC
oMKgwqAuLi4uLi4NCsKgwqDCoMKgwqAgY3JjID0gY3JjMzIoMCwgcmVhZGJ1ZiwgamUzMl90b19j
cHUocmktPmNzaXplKSk7DQrCoMKgwqDCoMKgIGlmIChjcmMgIT0gamUzMl90b19jcHUocmktPmRh
dGFfY3JjKSkgew0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl93YXJuKCJEYXRhIENSQyAlMDh4
ICE9IGNhbGN1bGF0ZWQgQ1JDICUwOHggZm9yIG5vZGUgYXQgJTA4eFxuIiwNCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgamUzMl90b19jcHUocmktPmRhdGFfY3JjKSwgY3JjLCBy
ZWZfb2Zmc2V0KGZkLT5yYXcpKTsNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgamZmczJfbWFya19u
b2RlX29ic29sZXRlKCkNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTzsNCsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZGVjb21wcmJ1ZjsNCsKgwqDCoMKgwqAgfQ0KwqDC
oMKgIC4uLi4uLg0KwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KfQ0KDQpUaGFua3MNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
