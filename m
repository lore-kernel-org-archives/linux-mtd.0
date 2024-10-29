Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D68D2AB20
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CJCmvgmE/MA4icBtn9+XehICkDIBeL7NoSybOs9OQc=; b=AvsCOPp2HYpqzetuu05ulZkAo1
	kdGqohm4miU3r/C69VXHXP8HSlqnaRDUZFN0MPdI5XNgu13egticL7rY0a9nKo6V41bkM6thf1TY0
	iTpicGFB+kGT2apOHXxanhRKG4pVSrQ4ok2p39Jk8g/GOsWmhZQ74OHLubUJ15gLHA6+AUx31b4a2
	TnUvK9X//eQwgStPZ/cj86pagLF15fpLiE0a2tDusNtu1oE+n5tbMy708ljo8jfeTfwHtNAlhr9sz
	CBepT/Y4LMl1lpaXsfKU7+E8Q+1BIxwOxggrzrYvlGi2p5LQInXMBcW6wCEiKpGoyMHbuwGyMaMza
	pUT2dy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5khP-0000000EHdK-3lAg;
	Tue, 29 Oct 2024 11:47:47 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kFp-0000000EDSr-0sri
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 11:19:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xd72B2G1nz1HLdc;
	Tue, 29 Oct 2024 19:14:42 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C1BC21A016C;
	Tue, 29 Oct 2024 19:19:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 19:19:08 +0800
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Ryder Wang <rydercoding@hotmail.com>, Waqar Hameed
	<waqar.hameed@axis.com>, Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: "kernel@axis.com" <kernel@axis.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
 <MEYP282MB316412B08A32373E5ED9B896BF4B2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <fc567699-59c7-265a-b7c8-7b658cc6fc05@huawei.com>
 <MEYP282MB316491A32BE6F870B093540FBF4B2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6c1295c2-5399-793b-02f4-0e078dc68d0a@huawei.com>
Date: Tue, 29 Oct 2024 19:19:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB316491A32BE6F870B093540FBF4B2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_041917_462944_7F9D0DDB 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xMC8yOSAxNzo1NiwgUnlkZXIgV2FuZyDQtLXAOgo+PiBUaGFua3MgZm9yIHJlcG9y
dGluZyB0aGF0IDotKS4gSSBub3RpY2VkIGl0IGEgcGVyaW9kIHRpbWUgYWdvIHRvbywgYW5kIEkK
Pj4gZm91bmQgJ2MtPnpuZXh0JywgJ2MtPmNuZXh0JyBhbmQgJ3pub2RlLT5jbmV4dCcgd29uJ3Qg
YmUgYWNjZXNzZWQgKGluCj4+IHdyaXRlIG1vZGUpIGJ5IG90aGVyIHRhc2tzLCBiZWNhdXNlIHRo
ZXJlIGlzIG9ubHkgb25lIGZ1bmN0aW9uCj4+IGRvX2NvbW1pdCgpIG1vZGlmeWluZyB0aGVtIGFu
ZCBkb19jb21taXQoKSBjYW4gYmUgZXhlY3V0ZWQgYnkgYXQgbW9zdAo+PiBvbmUgdGFzayBpbiBh
bnkgdGltZS4KPiAKPiBJdCBsb29rcyB0aGUgcmFjZSBjb25kaXRpb24gY2FuIHJlYWxseSBoYXBw
ZW4gaW4gdGhpcyBjYXNlIGZyb20gdGhlIGlzc3VlIHJlcG9ydGVyLgo+IDEuIGRvX2NvbW1pdCAo
dWJpZnNfYmdfdGhyZWFkKTogaXQgY2FuIGZpbmFsbHkgdG91Y2ggdW5wcm90ZWN0ZWQgem5vZGUg
d2hpbGUgY2FsbGluZyB0aGUgZnVuY3Rpb24gd3JpdGVfaW5kZXgoKS4KPiAyLiB1Ymlmc19ldmlj
dF9pbm9kZSAob3RoZXIga2VybmVsIHRocmVhZCB0aGFuIHViaWZzX2JnX3RocmVhZCk6IGl0IGNh
biBmaW5hbGx5IHRvdWNoIHRoZSB6bm9kZSBpbiB0aGUgZnVuY3Rpb24gdG5jX2RlbGV0ZSgpLiBF
dmVuIHRoZXJlIGlzIG11dGV4IHByb3RlY3Rpb24gZm9yIHRuY19kZWxldGUoKSwgYnV0IGl0IGhh
cyBubyBtZWFuaW5nIGJlY2F1c2Ugb2YgZG9fY29tbWl0IChhdCB0aGUgcG9pbnQgMSkgZG9lc24n
dCBoYXZlIHN1Y2ggbXV0ZXggcHJvdGVjdGlvbiB3aGlsZSBjYWxsaW5nIHdyaXRlX2luZGV4KCku
Cj4gLgo+IAoKRW1tLi4sIHRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIGluIHByZXZpb3VzIHNlc3Np
b25zLgpBbGwgZGlydHkgem5vZGVzIGFyZSBnYXRoZXJlZCBieSBmdW5jdGlvbiBnZXRfem5vZGVz
X3RvX2NvbW1pdCgpIHdoaWNoIAppcyBwcm90ZWN0ZWQgYnkgYy0+dG5jX211dGV4LCBhbmQgdGhl
ICdjcGFyZW50JyBtZW1iZXIgaW4gYWxsIGRpcnR5IAp6bm9kZXMgaXMgYXNzaWduZWQgd2l0aCBu
b24tTlVMTC4gVGhlbiBJIHRoaW5rIHRoZSB6bm9kZSBtZW1vcnkgZnJlZWluZyAKcGF0aCAndG5j
X2RlbGV0ZS0+a2ZyZWUoem5vZGUpJyBjYW5ub3QgaGFwcGVuLCBiZWNhdXNlOgoxKSBJZiBhIHpu
b2RlIGlzIGRpcnRpZWQsIGFsbCBpdHMnIGFuY2VzdG9yIHpub2RlcyhhIHBhdGggZnJvbSB6bm9k
ZSB0byAKcm9vdCB6bm9kZSkgbXVzdCBiZSBkaXJ0aWVkLCB3aGljaCBpcyBndWFyYW50ZWVkIGJ5
IFVCSUZTLiBTZWUgCmRpcnR5X2Nvd19ib3R0b21fdXAvbG9va3VwX2xldmVsMF9kaXJ0eS4KMikg
QSBkaXJ0eSB6bm9kZSB3YWl0aW5nIGZvciBjb21taXQgY2Fubm90IGJlIGZyZWVkIGJlZm9yZSB3
cml0ZV9pbmRleCgpIApmaW5pc2hlZCwgd2hpY2ggaXMgZ3VhcmFudGVlZCBieSB0bmNfZGVsZXRl
OgogICBpZiAoem5vZGUtPmNuZXh0KSB7CiAgICAgX19zZXRfYml0KE9CU09MRVRFX1pOT0RFLCAm
em5vZGUtPmZsYWdzKTsKICAgICAuLi4KICAgfSBlbHNlIHsKICAgICBrZnJlZSh6bm9kZSk7CiAg
IH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
