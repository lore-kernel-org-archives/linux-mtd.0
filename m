Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73467C25B08
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Aug 2022 01:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt3RTqLOXrcorVw9cYs7tgu+5K3ja/q0Ruxban+qYn4=; b=mMqavebvPSaYv48Ow2bTfFsnxs
	FrpUj1uYMqPs6Kkr3WP0czt5+oTI6ltyj3v9umHXPt6CEuHV5zwIqVJviLKfvRbG82bZsXM/2HMgP
	zXL4MNqqsWQDqht9v3yf/mA1gCCu1RflJIb6pL14RP8fJu+rXdOyso5/eAAvEcEqXqg9pfXGUit48
	60Eg+AKzYeqt1XfS1DpzcS3SUFyFmRjNi+QYDFugaaG0q0wEMAsKEVem2KDVAj7hV6wORm32XvuMr
	POE/r7Ku3fqgeWEqA464KNL/DbYEN8NbI9KCShMqHWP4DF5DSFCVPqsedwu0n9Ep0Xr0zxWmN630g
	pU0afKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOUOS-00ADo8-2s; Thu, 18 Aug 2022 01:32:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOUOP-00ADio-Bq
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2022 01:32:18 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M7S1t222PzXdjM;
	Thu, 18 Aug 2022 09:28:02 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 09:32:14 +0800
Subject: Re: [PATCH -next] mtd/ftl: Fix uaf in ftl_remove_dev()
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>, <wangweiyang2@huawei.com>
References: <20220715071119.2321463-1-cuigaosheng1@huawei.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <a2b4dccd-0942-69ff-39ac-a9313f41fed1@huawei.com>
Date: Thu, 18 Aug 2022 09:32:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220715071119.2321463-1-cuigaosheng1@huawei.com>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_183217_578949_60B7A585 
X-CRM114-Status: GOOD (  12.91  )
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

UElORwoK1NogMjAyMi83LzE1IDE1OjExLCBHYW9zaGVuZyBDdWkg0LS1wDoKPiBkZWxfbXRkX2Js
a3RyYW5zX2RldiB3aWxsIHJlY2xhaW0gdGhlIHJlc291cmNlcyBvZiBtdGRfYmxrdHJhbnNfZGV2
LAo+IGFuZCBjYWxsIGtmcmVlKGRldikgaW4gYmxrdHJhbnNfZGV2X3B1dCB0byByZWxlYXNlIHRo
ZSBtZW1vcnkgb2YKPiBtdGRfYmxrdHJhbnNfZGV2LCBzbyB3aGVuIGZ0bF9mcmVlcGFydCByZWNs
YWltcyB0aGUgbWVtb3J5IG9mIG90aGVyCj4gbWVtYmVyIHBvaW50ZXJzIG9mIHRoZSBwYXJ0aXRp
b25fdCwgaXQgd2lsbCB0cmlnZ2VyIHRoZSB1YWYgcHJvYmxlbSwKPiBGaXggaXQgYnkgbW92aW5n
IGZ0bF9mcmVlcGFydCBpbiBmcm9udCBvZiBkZWxfbXRkX2Jsa3RyYW5zX2Rldi4KPgo+IEZpeGVz
OiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikKPiBTaWduZWQtb2ZmLWJ5OiBHYW9z
aGVuZyBDdWkgPGN1aWdhb3NoZW5nMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQv
ZnRsLmMgfCA2ICsrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2Z0bC5jIGIvZHJpdmVycy9t
dGQvZnRsLmMKPiBpbmRleCAyMDAyNzFiZGM3YWEuLmJlYzU2MDcwMDM5ZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9mdGwuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2Z0bC5jCj4gQEAgLTEwMzks
OCArMTAzOSwxMiBAQCBzdGF0aWMgdm9pZCBmdGxfYWRkX210ZChzdHJ1Y3QgbXRkX2Jsa3RyYW5z
X29wcyAqdHIsIHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAgCj4gICBzdGF0aWMgdm9pZCBmdGxf
cmVtb3ZlX2RldihzdHJ1Y3QgbXRkX2Jsa3RyYW5zX2RldiAqZGV2KQo+ICAgewo+ICsJc3RydWN0
IHBhcnRpdGlvbl90ICpwYXJ0aXRpb247Cj4gKwo+ICsJcGFydGl0aW9uID0gY29udGFpbmVyX29m
KGRldiwgc3RydWN0IHBhcnRpdGlvbl90LCBtYmQpOwo+ICsKPiArCWZ0bF9mcmVlcGFydChwYXJ0
aXRpb24pOwo+ICAgCWRlbF9tdGRfYmxrdHJhbnNfZGV2KGRldik7Cj4gLQlmdGxfZnJlZXBhcnQo
KHBhcnRpdGlvbl90ICopZGV2KTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHN0cnVjdCBtdGRfYmxr
dHJhbnNfb3BzIGZ0bF90ciA9IHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
