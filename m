Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1766C02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBpGqUG2VL1D9DLqyJ0kgsFO46iKbZCH1Sj0+wxjIWs=; b=K1k+OT6r0Sbk4ivcIGFc8EFVpt
	q0rvVY5S6ap5JP81XeinwP7WI7mYo9mq8WGkV4wy2UOiYZaCg7ZLsU1EPrCSlAgAhqVfpLaAsOuuF
	1II70lWPK2PZ30/URPIuMd4LZMgdGSjh/JmaUxBcTvV1qLWTt8YGjqfgZlusv1WfKOnaw2oJaZ87l
	wQ6P3hNFN30DBfYpkWKzT0st7SH4vd3+iFEx/euuNOzHVBrYofZASXZHRQbaqwwqv4DjyE0THdrkZ
	xWTtC3bR16ZZvLafZSQo+z2Qy75CRV/kCeWGT1hpsvCm2vKRwNWgfa8j+vCTBlJ/B6TJ8tSDP2oQv
	jJ0Xmlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKSU-00000007eqc-3BXt;
	Tue, 18 Feb 2025 10:04:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKDg-00000007arf-3Fn4
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 09:48:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YxvlK6BLtzhZsZ;
	Tue, 18 Feb 2025 17:45:17 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 035CB180088;
	Tue, 18 Feb 2025 17:48:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 17:48:40 +0800
Subject: Re: [PATCH mtd-utils 4/5] configure.ac: Add a check for execinfo and
 backtrace
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218001512.1862030-1-festevam@gmail.com>
 <20250218001512.1862030-4-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2bdc04b3-05c8-42f4-682b-e46a1a1a10c1@huawei.com>
Date: Tue, 18 Feb 2025 17:48:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218001512.1862030-4-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_014848_988855_45712D06 
X-CRM114-Status: GOOD (  17.09  )
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

1NogMjAyNS8yLzE4IDg6MTUsIEZhYmlvIEVzdGV2YW0g0LS1wDoKPiBtdXNsIHJlbGllcyBvbiBh
biBleHRlbmFsIGV4ZWNpbmZvIGxpYnJhcnkgdG8gcHJvdmlkZSBiYWNrdHJhY2UKPiBmdW5jdGlv
bmFsaXR5Lgo+IAo+IEFkZCBzdXBwb3J0IGZvciBpdC4KPiAKPiB8IC93b3JrL2Zlc3RldmFtL29l
L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC1tdXNsL210ZC11dGlscy8y
LjMuMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi94ODZfNjQtcG9reS1saW51eC1tdXNs
Ly4uLy4uL2xpYmV4ZWMveDg2XzY0LXBva3ktbGludXgtbXVzbC9nY2MveDg2XzY0LXBva3ktbGlu
dXgtbXVzbC8xNC4yLjAvbGQ6IHViaWZzLXV0aWxzL2xpYnViaWZzL21rZnNfdWJpZnMtaW8ubzog
aW4gZnVuY3Rpb24gYGR1bXBfc3RhY2snOgo+IHwgL3Vzci9zcmMvZGVidWcvbXRkLXV0aWxzLzIu
My4wL3ViaWZzLXV0aWxzL2NvbW1vbi9kZWZzLmg6NzE6KC50ZXh0KzB4MjUpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBiYWNrdHJhY2UnCj4gLi4uLgo+IHwgY29sbGVjdDI6IGVycm9yOiBsZCBy
ZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4gfCBtYWtlOiAqKiogW01ha2VmaWxlOjI5NTk6IG1rZnMu
dWJpZnNdIEVycm9yIDEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZh
bUBnbWFpbC5jb20+Cj4gLS0tCj4gICBjb25maWd1cmUuYWMgfCAxICsKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKPiBpbmRleCAyYTc5YmE4MjBmYzAuLjY1YWZiMjQ1ZDg5YyAxMDA2NDQKPiAtLS0g
YS9jb25maWd1cmUuYWMKPiArKysgYi9jb25maWd1cmUuYWMKPiBAQCAtMjM4LDYgKzIzOCw3IEBA
IGlmIHRlc3QgIngkbmVlZF9jbW9ja2EiID0gInh5ZXMiOyB0aGVuCj4gICAJUEtHX0NIRUNLX01P
RFVMRVMoQ01PQ0tBLCBbY21vY2thXSwgW10sIFtjbW9ja2FfbWlzc2luZz0ieWVzIl0pCj4gICBm
aQo+ICAgCj4gK0FDX0NIRUNLX0xJQihbZXhlY2luZm9dLCBbYmFja3RyYWNlXSkKPiAgIEFDX0NI
RUNLX0hFQURFUlMoW2V4ZWNpbmZvLmhdKQoKSGkgRmFiaW8sCkknbSBub3Qgc3VyZSB3aGljaCBs
aWIgaXMgZGVwZW5kZWQgZm9yIGV4ZWNpbmZvIGJ5IG11c2wuIFdlIGRvbid0IGRlcGVuZCAKYW55
IGxpYnMgZm9yIG90aGVyIGNvbW1vbiBjb21waWxlcnMsIG90aGVyd2lzZSB3ZSBjb3VsZCBnZXQg
Zm9sbG93aW5nIAptZXNzZ2FncyBmb3IgZG9pbmcgY29uZmlndXJlOgogIGNoZWNraW5nIGZvciBz
eXMvcmFuZG9tLmguLi4geWVzCmNoZWNraW5nIGZvciBiYWNrdHJhY2UgaW4gLWxleGVjaW5mby4u
LiBubyAgIyBJbiBmYWN0IGJhY2t0cmFjZSBpcyAKc3VwcG9ydGVkLCBidXQgdGhlIG1lc3NhZ2Ug
dGVsbHMgdXMgbm90LgpjaGVja2luZyBleGVjaW5mby5oIHVzYWJpbGl0eS4uLiB5ZXMKY2hlY2tp
bmcgZXhlY2luZm8uaCBwcmVzZW5jZS4uLiB5ZXMKPiAgIAo+ICAgIyMjIyMgcHJvZHVjZSBzdW1t
YXJ5IG9uIGRlcGVuZGVuY2llcyAjIyMjIwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
