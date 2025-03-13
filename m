Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E350C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O9sx3Ah1QG6XY5PlRa2M/CybAIvAsLtxpGltUTmAMc=; b=eAZnb3I9+HV2lnMxrra7K1K3+t
	xAF9mo+QT2Tz0n/NzUNwShcBH7jWIuqpaG2oIyZWNDK04YRftP8j+Bi3Dlbt0ixEL3IvaMdgpU7hu
	ZUi7nVw06EK7f2Wsfxkd6YOIoM9ZJtGt4dooU0gmHgwFUoHroT25eh5e0ZwV8Ub+DUKV/HCuQOXKk
	cajbazz9vFzFL4wU8ZIh1UJxM1Vh/XfbwATU2BIjiCALbLqJI6Zydt34XF0KeST2WIfbe5Xoy96Pd
	HZ50lpnA87BJJLlM4zRhWx3hHWte1LYWqfRDsdeEc09HXGsRiFePzu5emOgoRJU6wtUbEE2oxbhIP
	oTuL5xEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgG6-0000000Axk2-1mYU;
	Thu, 13 Mar 2025 10:57:50 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgD8-0000000Ax5Y-0V7O
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 10:54:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZD4766KKzzCtLd;
	Thu, 13 Mar 2025 18:51:30 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F8DC1402CC;
	Thu, 13 Mar 2025 18:54:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Mar 2025 18:54:41 +0800
Subject: Re: [PATCH v1 1/1] mtd: mtdpart: Do not supply NULL to printf()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
References: <20250312201649.217555-1-andriy.shevchenko@linux.intel.com>
 <e6616c70-7579-6114-95b0-3c4a94f98aa0@huawei.com>
 <Z9KgxKocER3R1aPN@smile.fi.intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a5d38df2-4679-9bb9-4b01-2cfa184cd1be@huawei.com>
Date: Thu, 13 Mar 2025 18:54:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Z9KgxKocER3R1aPN@smile.fi.intel.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_035446_306477_AF7CD216 
X-CRM114-Status: GOOD (  12.86  )
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

5ZyoIDIwMjUvMy8xMyAxNzowOSwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPiBPbiBUaHUsIE1h
ciAxMywgMjAyNSBhdCAwOToyNDoyMUFNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IOWc
qCAyMDI1LzMvMTMgNDoxNiwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPj4+IENvbXBpbGVyIGlz
IG5vdCBoYXBweSBhYm91dCBOVUxMIGJlaW5nIHN1cHBsaWVkIGFzIHByaW50ZigpIHBhcmFtZXRl
cjoKPj4KPj4gcHJpbnRmIC0+IHByaW50az8gVGhlIHRpdGxlIGhhcyB0aGUgc2FtZSBpc3N1ZS4K
Pj4+Cj4+PiBkcml2ZXJzL210ZC9tdGRwYXJ0LmM6NjkzOjM0OiBlcnJvcjog4oCYJXPigJkgZGly
ZWN0aXZlIGFyZ3VtZW50IGlzIG51bGwgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KPj4+Cj4+
PiBSZXBsYWNlIHRoYXQgd2l0aCAiKG51bGwpIiB0byBmaXggY29tcGlsYXRpb24gZXJyb3IuCj4g
Cj4+IFJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+
IAo+IFRoYW5rIHlvdSEKPiAKPiBCdXQgSSB0aGluayBteSBhcHByb2FjaCBpcyBhIGhhY2ssIHRo
ZSBiZXN0IGlzIHRvIG1vdmUgdGhpcyBtZXNzYWdlIHRvIHRoZQo+IGFmdGVyIHRoZSBmb2xsb3cg
dXAgY29uZGl0aW9uYWwgYW5kIGRyb3AgdGhhdCB0ZXJuYXJ5IGNvbXBsZXRlbHkgYXMgd2UgaGF2
ZQo+IGFscmVhZHkgYW5vdGhlciBkZWJ1ZyBtZXNzYWdlIGJlZm9yZSB0aGF0LiBTbywgdGhlIHBh
cnNlciA9PSBOVUxMIGNhbiBiZQo+IGRlZHVjdGVkIGZyb20gdGhlIGFwcGVhcmFuY2Ugb2YgdGhl
IG9uZSBhbmQgbm90IHRoZSBvdGhlciBvbmUuCj4gCj4gSSdsbCBzZW5kIGEgdjIuCj4gCj4+PiAg
ICAJCQlpZiAoIXBhcnNlciAmJiAhcmVxdWVzdF9tb2R1bGUoIiVzIiwgKnR5cGVzKSkKPj4+ICAg
IAkJCQlwYXJzZXIgPSBtdGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBlcyk7Cj4+PiAgICAJCQlwcl9k
ZWJ1ZygiJXM6IGdvdCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwKPj4+IC0JCQkJcGFyc2Vy
ID8gcGFyc2VyLT5uYW1lIDogTlVMTCk7Cj4+PiArCQkJCXBhcnNlciA/IHBhcnNlci0+bmFtZSA6
ICIobnVsbCkiKTsKPj4+ICAgIAkJCWlmICghcGFyc2VyKQo+Pj4gICAgCQkJCWNvbnRpbnVlOwo+
IAo+IChtb3ZlIGl0IGhlcmUpCgpBZnRlciBsb29raW5nIHRocm91Z2ggOGUyYzk5MmI1OWZjKCJt
dGQ6IG10ZHBhcnQ6IGFkZCBkZWJ1ZyBwcmludHMgdG8gCnBhcnRpdGlvbiBwYXJzZXIuIikgYW5k
IDAxZjljNzI0MGE5MCgibXRkOiBwYXJ0aXRpb25zOiBmYWN0b3Igb3V0IGNvZGUgCmNhbGxpbmcg
cGFyc2VyIiksIEkgdGhpbmsgd2UnZCBiZXR0ZXIga2VlcCB0aGUgZGVidWcgbWVzc2FnZSBiZWZv
cmUgdGhlIApjb25kaXRpb24gJ2lmICghcGFyc2VyKScsIGl0IGlzIHVzZWQgdG8gaW5mb3JtIHVz
IHdoZXRoZXIgd2UgZ2V0IGEgCnBhcnNlciBhbmQgd2hpY2ggbmFtZSBpdCBpcy4gQW5kIHRoZSBk
ZWJ1ZyBtZXNzYWdlIGluIG10ZF9wYXJ0X2RvX3BhcnNlIAppbmZvcm1zIHVzIHRoZSByZXN1bHQg
b2YgdGhlICdwYXJzZXItPnBhcnNlX2ZuJy4KPiAKPj4+ICAgIAkJCXJldCA9IG10ZF9wYXJ0X2Rv
X3BhcnNlKHBhcnNlciwgbWFzdGVyLCAmcHBhcnRzLCBkYXRhKTsKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
