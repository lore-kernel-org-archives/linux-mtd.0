Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D2AE77173
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 06:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqOg036uIgMYyI3wOlDwyUskWNZIYh6xstFjQbDux48=; b=mGoKYf4SNTmiodU89pugJ/+xG1
	Pku+7iBOctkNn3Q8dZqtD+0lIlTCtrx+1IhlQ1NoRG6qJu5SdtGM0EbDClcDe1Y9PJsaT2pmCKxyA
	5ow+//63un/vKbe+JchLP8YY5v0mfFTGDtkHTI+VyJK2Zoda2LFvudYeQhwu9gM3d2OGWH+H+nO7C
	D3zwLySxnlCSNMHB+y3L0EwauP5r4XqYFrwAyX0S6P44Z8u4XVk8exDqzJThfJwHqrgfqcDjz5xWi
	2cIzsh+lOpv+OL9O2W/zav/vgvBDm//nOZw+IH9yoCws/eOBj0ZdqSpn9SGd4RtRTT/PEnNpFO9pB
	xtADWE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXFg-00000006adU-1lLr;
	Mon, 09 Dec 2024 06:28:16 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXFd-00000006acv-1RUp
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 06:28:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Y6Bfx3G3dz1V5hn;
	Mon,  9 Dec 2024 14:24:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A236140123;
	Mon,  9 Dec 2024 14:28:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 14:27:59 +0800
Subject: Re: [PATCH] mtdchar: fix integer overflow in read/write ioctls
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
 <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
 <6b4f7a14-297f-4fc7-bc4b-a9e7d822fb23@stanley.mountain>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fabbceb3-90a3-2cc8-c664-e53fcd504393@huawei.com>
Date: Mon, 9 Dec 2024 14:27:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6b4f7a14-297f-4fc7-bc4b-a9e7d822fb23@stanley.mountain>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_222813_544329_A0E2DB3F 
X-CRM114-Status: GOOD (  16.69  )
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

5ZyoIDIwMjQvMTIvOCAxOjA1LCBEYW4gQ2FycGVudGVyIOWGmemBkzoKPiBPbiBTYXQsIERlYyAw
NywgMjAyNCBhdCAxMjoxNzozM1BNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IOWcqCAy
MDI0LzEyLzcgNDoyNiwgRGFuIENhcnBlbnRlciDlhpnpgZM6Cj4+PiBUaGUgInJlcS5zdGFydCIg
YW5kICJyZXEubGVuIiB2YXJpYWJsZXMgYXJlIHU2NCB2YWx1ZXMgdGhhdCBjb21lIGZyb20gdGhl
Cj4+PiB1c2VyIGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24uICBXZSBtYXNrIGF3YXkgdGhl
IGhpZ2ggMzIgYml0cyBvZgo+Pj4gInJlcS5sZW4iIHNvIHRoYXQncyBjYXBwZWQgYXQgVTMyX01B
WCBidXQgdGhlICJyZXEuc3RhcnQiIHZhcmlhYmxlIGNhbiBnbwo+Pj4gdXAgdG8gVTY0X01BWC4K
Pj4+Cj4+PiBVc2UgY2hlY2tfYWRkX292ZXJmbG93KCkgdG8gZml4IHRoaXMgYnVnLgo+Pj4KPj4+
IEZpeGVzOiA2NDIwYWMwYWY5NWQgKCJtdGRjaGFyOiBwcmV2ZW50IHVuYm91bmRlZCBhbGxvY2F0
aW9uIGluIE1FTVdSSVRFIGlvY3RsIikKPj4KPj4gSGksIERhbi4gV2h5IHRoaXMgZml4IHRhZz8g
SSB0aGluayB0aGUgYWRkaW5nIHJlc3VsdCgncmVxLnN0YXJ0JyBhbmQKPj4gJ3JlcS5sZW4nKSBj
b3VsZCBiZSBvdmVyZmxvdyB0b28gYmVmb3JlIHRoaXMgY29tbWl0Lgo+Pgo+IAo+IEkndmUgbG9v
a2VkIGF0IHRoaXMgYWdhaW4sIGFuZCBJIHN0aWxsIGRvbid0IHNlZSB0aGUgYnVnIGJlZm9yZSB0
aGUKPiBjb21taXQuICBTZWNvbmRseSwgY29tbWl0IGExZWRhODY0YzA0YyAoIm10ZGNoYXI6IHBy
ZXZlbnQgaW50ZWdlcgo+IG92ZXJmbG93IGluIGEgc2FmZXR5IGNoZWNrIikgaXMgbWlzc2luZyBh
IEZpeGVzIHRhZyBidXQgdGhlIG1lc3NhZ2Ugc2F5cwo+IHRoYXQgaXQncyB0aGlzIGNvbW1pdCB3
aGljaCBpbnRyb2R1Y2VkIHRoZSBidWcuCgpBaCwgSSBzZWUuIFRoZXJlIGlzIG5vdCBhbiBhZGRp
dGlvbiBvcGVyYXRpb24gZm9yICdyZXEuc3RhcnQnIGFuZCAKJ3JlcS5sZW4nIHVudGlsIGNvbW1p
dCA2NDIwYWMwYWY5NWQoIm10ZGNoYXI6IHByZXZlbnQgdW5ib3VuZGVkIAphbGxvY2F0aW9uIGlu
IE1FTVdSSVRFIGlvY3RsIikgYW5kIDA5NWJiNmU0NGViMSgibXRkY2hhcjogYWRkIE1FTVJFQUQg
CmlvY3RsIiksIHNvIEkgZ3Vlc3MgdGhlIHRoZXJlIHNob3VsZCBiZSB0d28gZml4IHRhZ3M/Cj4g
Cj4gV2hpY2ggY29tbWl0IHNob3VsZCBnZXQgdGhlIGZpeGVzIHRhZz8KPiAKPiBJIHNob3VsZCBo
YXZlIGFkZGVkIGEgQ0MgdG8gdGhlIHN0YWJsZSB0cmVlIHRob3VnaC4gIEkgZGlkIHRoYXQgY29y
cmVjdGx5Cj4gaW4gYW4gZWFybGllciBkcmFmdCBvZiB0aGlzIHBhdGNoIGJ1dCBJIG1lc3NlZCB1
cCBpbiB0aGlzIHZlcnNpb24uIDovCj4gCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCj4gCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
