Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40600C25B08
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Aug 2022 01:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r058nVgABY8XipHJuQ3htc+aOz0FS/tPF4S2zi1z6tk=; b=yIrmORooAZOik3JBDYqXjDXgd8
	Tn4K7ixUU3YxR3kIsfY5d0G3K74ujTjgWm/NJ3gRwSwqOVOVJHo05y25o2v9az0pdcNQZQ/ebTIym
	H+2V4SYBpOh/DNBBW71ByGaB7uiyflxYKivay0XNCeT03WEZbXZIsdbiShLXohS8GNd3bZoEuaSQg
	NIQNFP51XkQpmsrGp+GgT2/zzgJG+maL8+TeNMa8NvvARc8z6P1um6rASZeR/TBUGKnb+l+8X509m
	hfo2TzmsUDnT/euRaQpEKJjevAY5O+TELV+MT9CIxGRscYn5MIZNbZzAzI1Bxky7gv3r/eo5G4zIK
	eAzA7iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOUNi-00ACcG-M3; Thu, 18 Aug 2022 01:31:34 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOUNe-00ACJw-1Z
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2022 01:31:31 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M7S3w1xjzzGpgH;
	Thu, 18 Aug 2022 09:29:48 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 09:31:21 +0800
Subject: Re: [PATCH -next] mtd/ftl: Fix memleak in ftl_add_mtd()
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>, <wangweiyang2@huawei.com>
References: <20220715071105.2321311-1-cuigaosheng1@huawei.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <6733eee6-bfb6-7ee9-1331-2a739520fcd5@huawei.com>
Date: Thu, 18 Aug 2022 09:31:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220715071105.2321311-1-cuigaosheng1@huawei.com>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_183130_295334_837DBF6F 
X-CRM114-Status: GOOD (  11.48  )
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

UElORwoK1NogMjAyMi83LzE1IDE1OjExLCBHYW9zaGVuZyBDdWkg0LS1wDoKPiBXaGVuIGFkZF9t
dGRfYmxrdHJhbnNfZGV2IGZhaWxlZCwgcGFydGl0aW9uJ3MgbWVtb3J5IHdpbGwgYmUgZnJlZWQK
PiBieSBrZnJlZSwgYnV0IHRoZXJlIGFyZSBzb21lIHN0cnVjdHVyZSBtZW1iZXJzIHRoYXQgYXJl
IGFsbG9jYXRlZAo+IGZvciBtZW1vcnkgaW5kZXBlbmRlbnRseSwgc3VjaCBhcyBwYXJ0aXRpb24t
PlZpcnR1YWxCbG9ja01hcCwKPiBwYXJ0aXRpb24tPkVVTkluZm8sIHBhcnRpdGlvbi0+WmZlcklu
Zm8sIGFuZCBwYXJ0aXRpb24tPmJhbV9jYWNoZSwKPiBzbyBrZnJlZShwYXJ0aXRpb24pIG1heSBj
YXVzZSBtZW1vcnkgbGVha3MsIHVzaW5nIGZ0bF9mcmVlcGFydChwYXJ0aXRpb24pCj4gd2lsbCBm
aXggaXQuCj4KPiBGaXhlczogMWRhMTc3ZTRjM2Y0ICgiTGludXgtMi42LjEyLXJjMiIpCj4gU2ln
bmVkLW9mZi1ieTogR2Fvc2hlbmcgQ3VpIDxjdWlnYW9zaGVuZzFAaHVhd2VpLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvbXRkL2Z0bC5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9mdGwuYyBiL2RyaXZlcnMvbXRkL2Z0
bC5jCj4gaW5kZXggZjY1NWQyOTA1MjcwLi4yMDAyNzFiZGM3YWEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvZnRsLmMKPiArKysgYi9kcml2ZXJzL210ZC9mdGwuYwo+IEBAIC0xMDMxLDYgKzEw
MzEsNyBAQCBzdGF0aWMgdm9pZCBmdGxfYWRkX210ZChzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29wcyAq
dHIsIHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAgCQlwYXJ0aXRpb24tPm1iZC5kZXZudW0gPSAt
MTsKPiAgIAkJaWYgKCFhZGRfbXRkX2Jsa3RyYW5zX2RldigmcGFydGl0aW9uLT5tYmQpKQo+ICAg
CQkJcmV0dXJuOwo+ICsJCWZ0bF9mcmVlcGFydChwYXJ0aXRpb24pOwo+ICAgCX0KPiAgIAo+ICAg
CWtmcmVlKHBhcnRpdGlvbik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
