Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF49AC021AF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 01:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG7hW6n8bNp0so08rSOjj7acttah33qj/vlDIk9KCLA=; b=4/q41du1JKsdYgngQXllP3EmVu
	WFXSAEOaXLmF46EqqvfMXAtS2IkuxAHkRdOEusS0qOTe5ywzQiXlLzVJ59hD3ik1S7xRRky/jrzEA
	EvNXwhWN1ShbXXzbHhFezw5GHhnwsGjOna4s7fq7br790lJyZIuqsejiy+4kT7HNzMjo3AJRIm06H
	LaYuhWIT/eXXMhoXAmnRWNcwWT1T5h3069TXzA5Ua1edzC1X7bp8/pOtTvCQ2tqg0T5KOAZzyyvyK
	woTpe94LcbrlY2WQFvfKJLwyAED3OBIGbuRxRGvCUl0eHfxriwroqmdhHuZnTy+SfPbEZm41IMzA0
	yLNXKPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYov-0000000AWak-0eUY;
	Wed, 19 Feb 2025 01:24:13 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYos-0000000AWaD-2RXR
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 01:24:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YyJW257V1zHr7d;
	Wed, 19 Feb 2025 09:21:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DBB1914022D;
	Wed, 19 Feb 2025 09:24:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Feb 2025 09:24:02 +0800
Subject: Re: [PATCH v3 mtd-utils 3/4] configure.ac: Add a check for execinfo
 and backtrace
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250219003329.2078308-1-festevam@gmail.com>
 <20250219003329.2078308-3-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5ea2d31e-0de3-5a10-b14a-d1320fc52061@huawei.com>
Date: Wed, 19 Feb 2025 09:24:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250219003329.2078308-3-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_172410_778926_D3A24656 
X-CRM114-Status: GOOD (  18.14  )
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

1NogMjAyNS8yLzE5IDg6MzMsIEZhYmlvIEVzdGV2YW0g0LS1wDoKPiBtdXNsIHJlbGllcyBvbiBh
biBleHRlcm5hbCBleGVjaW5mbyBsaWJyYXJ5IHRvIHByb3ZpZGUgYmFja3RyYWNlCj4gZnVuY3Rp
b25hbGl0eS4gSWYgbXVzbCBjYW5ub3QgbGluayB0byBsaWJleGVjaW5mbywgdGhlIGZvbGxvd2lu
ZyBsaW5rCj4gZXJyb3IgaGFwcGVuczoKPiAKPiB8IC93b3JrL2Zlc3RldmFtL29lL3Bva3kvYnVp
bGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC1tdXNsL210ZC11dGlscy8yLjMuMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi94ODZfNjQtcG9reS1saW51eC1tdXNsLy4uLy4uL2xp
YmV4ZWMveDg2XzY0LXBva3ktbGludXgtbXVzbC9nY2MveDg2XzY0LXBva3ktbGludXgtbXVzbC8x
NC4yLjAvbGQ6IHViaWZzLXV0aWxzL2xpYnViaWZzL21rZnNfdWJpZnMtaW8ubzogaW4gZnVuY3Rp
b24gYGR1bXBfc3RhY2snOgo+IHwgL3Vzci9zcmMvZGVidWcvbXRkLXV0aWxzLzIuMy4wL3ViaWZz
LXV0aWxzL2NvbW1vbi9kZWZzLmg6NzE6KC50ZXh0KzB4MjUpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBiYWNrdHJhY2UnCj4gLi4uLgo+IHwgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAx
IGV4aXQgc3RhdHVzCj4gfCBtYWtlOiAqKiogW01ha2VmaWxlOjI5NTk6IG1rZnMudWJpZnNdIEVy
cm9yIDEKPiAKPiBGaXggdGhlIHByb2JsZW0gYnkgY2hlY2tpbmcgZm9yIGJhY2t0cmFjZSBzdXBw
b3J0IGluIGxpYmMgZmlyc3QgYW5kIGlmIG5vdAo+IGZvdW5kLCB0aGVuIGNoZWNrIGZvciBiYWNr
dHJhY2Ugc3VwcG9ydCBpbiB0aGUgZXh0ZXJuYWwgbGliZXhlY2luZm8uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+IFN1Z2dlc3RlZC1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2Ugc2luY2UgdjI6Cj4g
LSBDaGVjayBmb3IgYmFja3RyYWNlIHN1cHBvcnQgaW4gbGliYyBmaXJzdCBhbmQgaWYgbm90Cj4g
Zm91bmQsIHRoZW4gY2hlY2sgbGliZXhlY2luZm8uIChLaGVtKQo+IAo+ICAgY29uZmlndXJlLmFj
IHwgMTEgKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4g
CgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBk
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCj4gaW5kZXggMmE3OWJhODIw
ZmMwLi4yOTY5MDFlNjE3NjAgMTAwNjQ0Cj4gLS0tIGEvY29uZmlndXJlLmFjCj4gKysrIGIvY29u
ZmlndXJlLmFjCj4gQEAgLTIzOCw2ICsyMzgsMTcgQEAgaWYgdGVzdCAieCRuZWVkX2Ntb2NrYSIg
PSAieHllcyI7IHRoZW4KPiAgIAlQS0dfQ0hFQ0tfTU9EVUxFUyhDTU9DS0EsIFtjbW9ja2FdLCBb
XSwgW2Ntb2NrYV9taXNzaW5nPSJ5ZXMiXSkKPiAgIGZpCj4gICAKPiArQUNfQ0hFQ0tfRlVOQyhb
YmFja3RyYWNlXSwgW2hhdmVfYmFja3RyYWNlPXllc10sIFtoYXZlX2JhY2t0cmFjZT1ub10pCj4g
Kwo+ICtpZiB0ZXN0ICJ4JGhhdmVfYmFja3RyYWNlIiA9ICJ4bm8iOyB0aGVuCj4gKyAgICBBQ19D
SEVDS19MSUIoW2V4ZWNpbmZvXSwgW2JhY2t0cmFjZV0sCj4gKyAgICAgICAgW0xJQlM9IiRMSUJT
IC1sZXhlY2luZm8iCj4gKyAgICAgICAgIEFDX0RFRklORShbSEFWRV9CQUNLVFJBQ0VdLCBbMV0s
IFtiYWNrdHJhY2UgaXMgYXZhaWxhYmxlIHZpYSBsaWJleGVjaW5mb10pXSwKPiArICAgICAgICBb
QUNfTVNHX1dBUk4oW2JhY2t0cmFjZSBzdXBwb3J0IG5vdCBmb3VuZF0pXSkKPiArZWxzZQo+ICsg
ICAgQUNfREVGSU5FKFtIQVZFX0JBQ0tUUkFDRV0sIFsxXSwgW2JhY2t0cmFjZSBpcyBhdmFpbGFi
bGUgdmlhIGxpYmNdKQo+ICtmaQo+ICsKPiAgIEFDX0NIRUNLX0hFQURFUlMoW2V4ZWNpbmZvLmhd
KQo+ICAgCj4gICAjIyMjIyBwcm9kdWNlIHN1bW1hcnkgb24gZGVwZW5kZW5jaWVzICMjIyMjCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
