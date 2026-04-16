Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286DDF433DD
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 03:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0DT76LsDka9/UPcnLPP17bLDiw6Hyzax0RSZWIen9g=; b=OIa1AYfwRsnC20A59DdP+a98DS
	ql3ctGRkLZakiYKmAXuoW33rUtarLQInUAiaMm6DHSGkI2J04J1Q6hHSYe/7HpyORMapjXAMEcsfM
	8LmNB8jB3qXWbK5GdWs8zt487312E3zorVaLeOpF+Ja8cuUa9zKtLnqsHlNOqYETzV4AMQC2uYq33
	eyVsua+tWiiFB6YKex/5Kqo8dNWalHWAhgYBu9xBwJxxQk5O0yqCqOK2ynpPWICxykqw2jpQibix9
	A13o2LEwyZPYyyXiryaay+aw/7t3ANS2J+jtUOXIBpC19NZvOSIGjaumTvqDW7l5Y8WVsc1LJHjGU
	Yog0SOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDQy-00000001vft-3nE1;
	Thu, 16 Apr 2026 03:30:28 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDQw-00000001vfb-3yzr
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 03:30:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mnRUmTaUCaa7bCXaapnbN9HRan9nBBOenZeQcHiXfDo=;
	b=gwJLA3hTzZAdvI+S9CETY+kbB6QwnluxMqu3yPpBsnhY4anmWUrZw8iPTDFA46uM5jqd4CSfo
	qmp7Z1tipbvnM/3sjBIkNCt69J8uOib1ecFtXc1gmRtiylKLYRKQDc6oFLHljSqqIp/Z33p/wAt
	y1viimoVrzQBJRwRuX53yEg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fx3Jd47jwzpSvW;
	Thu, 16 Apr 2026 11:24:01 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E6C140574;
	Thu, 16 Apr 2026 11:30:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Apr 2026 11:30:14 +0800
Subject: Re: [PATCH v4 2/2] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
To: Dmitry Antipov <dmantipov@yandex.ru>, Richard Weinberger <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>
References: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
 <20260409045629.527019-1-dmantipov@yandex.ru>
 <20260409045629.527019-2-dmantipov@yandex.ru>
 <a8d991e7-7c66-2049-41e1-0a3f07114333@huawei.com>
 <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
 <2cf9ec17854da2ff4bc7c53d3dc12558b9089bf7.camel@yandex.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7b528d03-5f5c-532e-20dc-bcb7dd5cc4a7@huawei.com>
Date: Thu, 16 Apr 2026 11:30:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2cf9ec17854da2ff4bc7c53d3dc12558b9089bf7.camel@yandex.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_203027_202358_0B945D20 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjYvNC8xMCAyMDowMCwgRG1pdHJ5IEFudGlwb3Yg5YaZ6YGTOgo+IE9uIEZyaSwgMjAy
Ni0wNC0xMCBhdCAwNzo1NyArMDIwMCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IAo+PiBE
bWl0cnksIGhvdyBhcmUgeW91IHRlc3RpbmcgdGhlc2UgY2hhbmdlcz8KPiAKPiBCdWlsZCB3aXRo
Ogo+IAo+IENPTkZJR19LQVNBTj15CgpIaSwgRG1pdHJ5CkknbSBwbGVhc3VyZSB3aXRoIENPTkZJ
R19LQVNBTj15LCBhbmQgYSBmc3N0cmVzcyB0ZXN0KD44aCkgZm9yIHViaWZzIGlzIApzdGlsbCBu
ZWVkZWQuCj4gCj4gQ09ORklHX01URF9OQU5EX05BTkRTSU09bQo+IAo+IENPTkZJR19NVERfVUJJ
PW0KPiBDT05GSUdfTVREX1VCSV9XTF9USFJFU0hPTEQ9NDA5Ngo+IENPTkZJR19NVERfVUJJX0JF
Ql9MSU1JVD0yMAo+IENPTkZJR19VQklGU19GUz1tCj4gQ09ORklHX1VCSUZTX0ZTX0FEVkFOQ0VE
X0NPTVBSPXkKPiBDT05GSUdfVUJJRlNfRlNfTFpPPXkKPiBDT05GSUdfVUJJRlNfRlNfWkxJQj15
Cj4gQ09ORklHX1VCSUZTX0ZTX1pTVEQ9eQo+IENPTkZJR19VQklGU19BVElNRV9TVVBQT1JUPXkK
PiBDT05GSUdfVUJJRlNfRlNfWEFUVFI9eQo+IENPTkZJR19VQklGU19GU19TRUNVUklUWT15Cj4g
Q09ORklHX1VCSUZTX0ZTX0FVVEhFTlRJQ0FUSU9OPXkKPiAKPiBhbmQgYm9vdCAoUUVNVSBWTSku
IFRoZW4gdXNlIG5hbmRzaW0gdG8gY3JlYXRlIH41MTJNIHViaWZzIHZvbHVtZToKPiAKPiAjIG1v
ZHByb2JlIG5hbmRzaW0gc2Vjb25kX2lkX2J5dGU9MHhkYyB0aGlyZF9pZF9ieXRlPTB4ODAgZm91
cnRoX2lkX2J5dGU9MHgxZAo+ICMgbW9kcHJvYmUgdWJpIG10ZD0wCj4gIyB1Ymlta3ZvbCAvZGV2
L3ViaTAgLU4gdGVzdCAtbQo+IFNldCB2b2x1bWUgc2l6ZSB0byA1MTc2NDQyODgKPiBWb2x1bWUg
SUQgMCwgc2l6ZSA0MDEyIExFQnMgKDUxNzY0NDI4OCBieXRlcywgNDkzLjYgTWlCKSwgTEVCIHNp
emUgMTI5MDI0IGJ5dGVzICgxMjYuMCBLaUIpLCBkeW5hbWljLCBuYW1lICJ0ZXN0IiwgYWxpZ25t
ZW50IDEKPiAjIG1vdW50IC10IHViaWZzIHViaTA6dGVzdCAvbW50L3ViaWZzCj4gCj4gQW5kIGRv
IGJhc2ljIGNvbnNpc3RlbmN5IGNoZWNrIHdpdGggc29tZXRoaW5nIGxpa2U6Cj4gCj4gIyBjcCAt
YSBbfjM5ME0gc291cmNlIHRyZWVdIC9tbnQvdWJpZnMKPiAjIGRpZmYgLXVyIFt0cmVlXSAvbW50
L3ViaWZzL1tjb3B5IG9mIHRoYXQgdHJlZV0gOyBubyBvdXRwdXQgaG9wZWZ1bGx5IG1lYW5zIE9L
Cj4gIyB1bW91bnQgL21udC91Ymlmcwo+ICMgbW91bnQgLXQgdWJpZnMgdWJpMDp0ZXN0IC9tbnQv
dWJpZnMKPiAjIGRpZmYgLXVyIFt0cmVlXSAvbW50L3ViaWZzL1tjb3B5IG9mIHRoYXQgdHJlZV0g
OyBsaWtld2lzZQo+IAo+IGV0Yy4KPiAKPiBEbWl0cnkKPiAuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
