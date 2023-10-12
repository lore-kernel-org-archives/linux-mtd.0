Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD7ECDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 02:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUycrJdkC1NEwZSjggb95kKlnfetSk5jTR/nsPDI+O8=; b=JkXOKg1PKd6AMyQtj2CTtMdbHw
	YcCFzU7GBDIwDAlFHt8DctrnqOE+0ko8kiZ4Q1izRb9gSXtwDMFjUnSgdvgPb9RSWNpDn2Bw/XGVR
	vaNhdfeZHlKrPoZrM/TeWTQVh9KnwgBiAe4oYSJzMTuIyyGtMxOplzHDuoHJv5yu3j9o7sM2rMTwK
	muJggLGGU7sWu8hat9FArc53M8UkYIbc1anY0L4YGyemNFsDM6FYMfAnr8B2WNLQUlV8Qel7GC09E
	u4M6VDfwKP0cR/GYwXv+2+8lwwFVajH7Y8swFb4N6K5BsvJTs6nd9kHgnMoHfGlZa3NSG/lVxmY3P
	LmYEfcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqlGr-00HAmj-2v;
	Thu, 12 Oct 2023 02:17:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqlGo-00HAk5-0b
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 02:17:53 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S5Y8k3TLrzLqZp;
	Thu, 12 Oct 2023 10:13:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 10:17:38 +0800
Subject: Re: [PATCH RFC] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231010142925.545238-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f11c939f-ed03-9c3f-ed9b-4e68aced4c21@huawei.com>
Date: Thu, 12 Oct 2023 10:17:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231010142925.545238-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_191750_625192_F4BE8369 
X-CRM114-Status: GOOD (  21.14  )
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

5ZyoIDIwMjMvMTAvMTAgMjI6MjksIFpoYW9Mb25nIFdhbmcg5YaZ6YGTOgo+IElmIGJvdGggZmx0
LmtvIGFuZCBnbHVlYmkua28gYXJlIGxvYWRlZCwgdGhlIG5vdGlpZXIgb2YgZnRsCj4gdHJpZ2dl
cnMgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gdHJ5aW5nIHRvIHZpc2l0Cj4g4oCYZ2x1
ZWJpLT5kZXNj4oCZIGluIGdsdWViaV9yZWFkKCkuCj4gCj4gdWJpX2dsdWViaV9pbml0Cj4gICAg
dWJpX3JlZ2lzdGVyX3ZvbHVtZV9ub3RpZmllcgo+ICAgICAgdWJpX2VudW1lcmF0ZV92b2x1bWVz
Cj4gICAgICAgIHViaV9ub3RpZnlfYWxsCj4gICAgICAgICAgZ2x1ZWJpX25vdGlmeSAgICBuYi0+
bm90aWZpZXJfY2FsbCgpCj4gICAgICAgICAgICBnbHVlYmlfY3JlYXRlCj4gICAgICAgICAgICAg
IG10ZF9kZXZpY2VfcmVnaXN0ZXIKPiAgICAgICAgICAgICAgICBtdGRfZGV2aWNlX3BhcnNlX3Jl
Z2lzdGVyCj4gICAgICAgICAgICAgICAgICBhZGRfbXRkX2RldmljZQo+ICAgICAgICAgICAgICAg
ICAgICBibGt0cmFuc19ub3RpZnlfYWRkICAgbm90LT5hZGQoKQo+ICAgICAgICAgICAgICAgICAg
ICAgIGZ0bF9hZGRfbXRkICAgICAgICAgdHItPmFkZF9tdGQoKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgc2Nhbl9oZWFkZXIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWQKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbXRkX3JlYWRfb29iCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGds
dWViaV9yZWFkICAgbXRkLT5yZWFkKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnbHVlYmktPmRlc2MgLSBOVUxMCj4gCj4gRGV0YWlsZWQgcmVwcm9kdWN0aW9uIGluZm9ybWF0
aW9uIGF2YWlsYWJsZSBhdCB0aGUgbGlua1sxXSwKPiAKPiBJbiB0aGUgbm9ybWFsIGNhc2UsIG9i
dGFpbiBnbHVlYmktPmRlc2MgaW4gdGhlIGdsdWViaV9nZXRfZGV2aWNlKCksCj4gYW5kIGFjY2Vz
c2VzIGdsdWViaS0+ZGVzYyBpbiB0aGUgZ2x1ZWJpX3JlYWQoKS4gSG93ZXZlciwKPiBnbHVlYmlf
Z2V0X2RldmljZSgpIGlzIG5vdCBleGVjdXRlZCBpbiBhZHZhbmNlIGluIHRoZQo+IGZ0bF9hZGRf
bXRkKCkgcHJvY2Vzcywgd2hpY2ggbGVhZHMgdG8gbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlLgo+
IAo+IFRoaXMgcGF0Y2ggYXNzdW1lcyB0aGF0IHRoZSBnbHVlYmkgbW9kdWxlIGlzIG5vdCBkZXNp
Z25lZCB0byB3b3JrIHdpdGgKPiB0aGUgZnRsIG1vZHVsZS4gSW4gdGhpcyBjYXNlLCB0aGUgcGF0
Y2ggb25seSBuZWVkcyB0byBwcmV2ZW50IHRoZSBmdGwKPiBub3RpZmllciBvcGVyYXRpb24uCgpX
ZSBjYW4ndCByZWZ1c2UgZnRsIHdoZW4gZ2x1ZWJpIGlzIGxvYWRlZCwgaXQgbG9va3Mgd2VpcmQ6
Cm10ZDAobmFuZCkgLT4gZnRsMAptdGQxKGdsdWViaSkgaGFzIG5vIGZ0bDE/CgpXaGVuIEZUTCBp
cyBsb2FkZWQsIGl0IHNob3VsZCBtYWtlIHN1cmUgZWFjaCBtdGQgZGV2aWNlIGNvcnJlc3BvbmQg
dG8gYSAKYmxvY2sgZGV2aWNlLCBubyBtYXR0ZXIgd2hpY2ggdHlwZSB0aGUgbXRkIGRldmljZSBp
cyhuYW5kIG9yIGdsdWViaSkuCgpTbyBJIHByZWZlciB0aGUgcm9vdCBjYXVzZSBpcyBnbHVlYmkt
PmRlc2MgaXMgbm90IGluaXRpYWxpemVkIGluIApnbHVlYmlfY3JlYXRlLT5tdGRfZGV2aWNlX3Jl
Z2lzdGVyLgoKPiAKPiBBZGQgc29tZSBjb3JyZWN0bmVzcyBjaGVjayBmb3IgZ2x1ZWJpLT5kZXNj
IGluIGdsdWViaV9yZWFkL3dyaXRlL2VyYXNlKCksCj4gSWYgdGhlIHBvaW50ZXIgaXMgaW52YWxp
ZCwgdGhlIC1FSU5WQUwgaXMgcmV0dXJuZWQuCj4gCj4gTGluazogaHR0cHM6Ly9idWd6aWxsYS5r
ZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTc5OTIgWzFdCj4gU2lnbmVkLW9mZi1ieTogWmhh
b0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9t
dGQvdWJpL2dsdWViaS5jIHwgOCArKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvZ2x1ZWJpLmMgYi9kcml2
ZXJzL210ZC91YmkvZ2x1ZWJpLmMKPiBpbmRleCAxYjk4MGQxNWQ5ZmIuLjE4OWVjYzBlYWNkMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvZ2x1ZWJpLmMKPiArKysgYi9kcml2ZXJzL210
ZC91YmkvZ2x1ZWJpLmMKPiBAQCAtMTU3LDYgKzE1Nyw5IEBAIHN0YXRpYyBpbnQgZ2x1ZWJpX3Jl
YWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLAo+ICAgCXN0
cnVjdCBnbHVlYmlfZGV2aWNlICpnbHVlYmk7Cj4gICAKPiAgIAlnbHVlYmkgPSBjb250YWluZXJf
b2YobXRkLCBzdHJ1Y3QgZ2x1ZWJpX2RldmljZSwgbXRkKTsKPiArCWlmIChJU19FUlJfT1JfTlVM
TChnbHVlYmktPmRlc2MpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgIAlsbnVtID0gZGl2
X3U2NF9yZW0oZnJvbSwgbXRkLT5lcmFzZXNpemUsICZvZmZzKTsKPiAgIAlieXRlc19sZWZ0ID0g
bGVuOwo+ICAgCXdoaWxlIChieXRlc19sZWZ0KSB7Cj4gQEAgLTE5Nyw2ICsyMDAsOSBAQCBzdGF0
aWMgaW50IGdsdWViaV93cml0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRvLCBzaXpl
X3QgbGVuLAo+ICAgCXN0cnVjdCBnbHVlYmlfZGV2aWNlICpnbHVlYmk7Cj4gICAKPiAgIAlnbHVl
YmkgPSBjb250YWluZXJfb2YobXRkLCBzdHJ1Y3QgZ2x1ZWJpX2RldmljZSwgbXRkKTsKPiArCWlm
IChJU19FUlJfT1JfTlVMTChnbHVlYmktPmRlc2MpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsK
PiAgIAlsbnVtID0gZGl2X3U2NF9yZW0odG8sIG10ZC0+ZXJhc2VzaXplLCAmb2Zmcyk7Cj4gICAK
PiAgIAlpZiAobGVuICUgbXRkLT53cml0ZXNpemUgfHwgb2ZmcyAlIG10ZC0+d3JpdGVzaXplKQo+
IEBAIC0yNDIsNiArMjQ4LDggQEAgc3RhdGljIGludCBnbHVlYmlfZXJhc2Uoc3RydWN0IG10ZF9p
bmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbnN0cikKPiAgIAlsbnVtID0gbXRkX2Rpdl9i
eV9lYihpbnN0ci0+YWRkciwgbXRkKTsKPiAgIAljb3VudCA9IG10ZF9kaXZfYnlfZWIoaW5zdHIt
PmxlbiwgbXRkKTsKPiAgIAlnbHVlYmkgPSBjb250YWluZXJfb2YobXRkLCBzdHJ1Y3QgZ2x1ZWJp
X2RldmljZSwgbXRkKTsKPiArCWlmIChJU19FUlJfT1JfTlVMTChnbHVlYmktPmRlc2MpKQo+ICsJ
CXJldHVybiAtRUlOVkFMOwo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IGNvdW50IC0gMTsgaSsr
KSB7Cj4gICAJCWVyciA9IHViaV9sZWJfdW5tYXAoZ2x1ZWJpLT5kZXNjLCBsbnVtICsgaSk7Cj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
