Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A26C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iG5/+c4Gpi4cdv0Mn3HJiA+zRDd5hrffOp33IwbzzxI=; b=spcKqtvO6+AeUJ+AruKEG8vTti
	WaDwEzKe28EcZcgaAm2Xk/Gtn/C5R2zbsZsGAN9mmmB1ReLgI9ECCxUEGbNSYtjK1ApocFrBHOobs
	VCFqoPE/9bROYZW2jBsWodiPskQsra6fJijzFXe38LsqAG+1is7TTUpkwjnC8uQho89DIMalKZSMK
	G48/2QPhtMtQ6Q4XTfWS22j5qzcj5OdG/HS1/DUKykcXsW+i9yUH7d+UR0PeQo6khwrn69nzBvvqn
	IMm33MseBgRNpPmf3/EXw7THax/S4NQaHnwAByNjRR6hs6GoXslJbSaYXUqNFjUVUt8OArjvjQSag
	zejc/CiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQR1D-00FKKf-21;
	Mon, 31 Jul 2023 11:24:55 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQR1A-00FKJM-1D
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 11:24:54 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RDwnD1WZBzLnqM;
	Mon, 31 Jul 2023 19:22:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 19:24:47 +0800
Subject: Re: [PATCH V2 2/5] ubi: Split io_failures into write_failure and
 erase_failure
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
 <20230718085119.3885747-3-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bb696f09-a89c-1c16-0154-961c4dabfed9@huawei.com>
Date: Mon, 31 Jul 2023 19:24:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230718085119.3885747-3-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_042452_818328_79386B97 
X-CRM114-Status: GOOD (  13.70  )
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

1NogMjAyMy83LzE4IDE2OjUxLCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gVGhlIGVtdWxhdGVfaW9f
ZmFpbHVyZXMgZGVidWdmcyBlbnRyeSBjb250cm9scyBib3RoIHdyaXRlCj4gZmFpbHVyZSBhbmQg
ZXJhc2UgZmFpbHVyZS4gVGhpcyBwYXRjaCBzcGxpdCBpb19mYWlsdXJlcwo+IHRvIHdyaXRlX2Zh
aWx1cmUgYW5kIGVyYXNlX2ZhaWx1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhhb0xvbmcgV2Fu
ZyA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2Rl
YnVnLmMgfCAxMyArKysrKysrKystLS0tCj4gICBkcml2ZXJzL210ZC91YmkvZGVidWcuaCB8IDE0
ICsrKysrKysrLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvZGVidWcuYyBi
L2RyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5jCj4gaW5kZXggOWNhNTg0ZGEzMmM2Li43ODI2YmM4MTY2
ZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2RlYnVnLmMKPiArKysgYi9kcml2ZXJz
L210ZC91YmkvZGVidWcuYwo+IEBAIC0xNCw3ICsxNCw4IEBACj4gICAKPiAgICNpZmRlZiBDT05G
SUdfTVREX1VCSV9GQVVMVF9JTkpFQ1RJT04KPiAgIHN0YXRpYyBERUNMQVJFX0ZBVUxUX0FUVFIo
ZmF1bHRfYml0ZmxpcHNfYXR0cik7Cj4gLXN0YXRpYyBERUNMQVJFX0ZBVUxUX0FUVFIoZmF1bHRf
aW9fZmFpbHVyZXNfYXR0cik7Cj4gK3N0YXRpYyBERUNMQVJFX0ZBVUxUX0FUVFIoZmF1bHRfd3Jp
dGVfZmFpbHVyZV9hdHRyKTsKPiArc3RhdGljIERFQ0xBUkVfRkFVTFRfQVRUUihmYXVsdF9lcmFz
ZV9mYWlsdXJlX2F0dHIpOwo+ICAgc3RhdGljIERFQ0xBUkVfRkFVTFRfQVRUUihmYXVsdF9wb3dl
cl9jdXRfYXR0cik7Cj4gICAKPiAgICNkZWZpbmUgRkFJTF9BQ1RJT04obmFtZSwgZmF1bHRfYXR0
cikJCQlcCj4gQEAgLTI0LDcgKzI1LDggQEAgYm9vbCBzaG91bGRfZmFpbF8jI25hbWUodm9pZCkJ
CQkJXAo+ICAgfQo+ICAgCj4gICBGQUlMX0FDVElPTihiaXRmbGlwcywJCWZhdWx0X2JpdGZsaXBz
X2F0dHIpCj4gLUZBSUxfQUNUSU9OKGlvX2ZhaWx1cmVzLAlmYXVsdF9pb19mYWlsdXJlc19hdHRy
KQo+ICtGQUlMX0FDVElPTih3cml0ZV9mYWlsdXJlLAlmYXVsdF93cml0ZV9mYWlsdXJlX2F0dHIp
Cj4gK0ZBSUxfQUNUSU9OKGVyYXNlX2ZhaWx1cmUsCWZhdWx0X2VyYXNlX2ZhaWx1cmVfYXR0cikK
PiAgIEZBSUxfQUNUSU9OKHBvd2VyX2N1dCwJCWZhdWx0X3Bvd2VyX2N1dF9hdHRyKQo+ICAgI2Vu
ZGlmCj4gICAKPiBAQCAtMjQ1LDggKzI0NywxMSBAQCBzdGF0aWMgdm9pZCBkZnNfY3JlYXRlX2Zh
dWx0X2VudHJ5KHN0cnVjdCBkZW50cnkgKnBhcmVudCkKPiAgIAlmYXVsdF9jcmVhdGVfZGVidWdm
c19hdHRyKCJlbXVsYXRlX2JpdGZsaXBzIiwgZGlyLAo+ICAgCQkJCSAgJmZhdWx0X2JpdGZsaXBz
X2F0dHIpOwo+ICAgCj4gLQlmYXVsdF9jcmVhdGVfZGVidWdmc19hdHRyKCJlbXVsYXRlX2lvX2Zh
aWx1cmVzIiwgZGlyLAo+IC0JCQkJICAmZmF1bHRfaW9fZmFpbHVyZXNfYXR0cik7Cj4gKwlmYXVs
dF9jcmVhdGVfZGVidWdmc19hdHRyKCJlbXVsYXRlX3dyaXRlX2ZhaWx1cmUiLCBkaXIsCj4gKwkJ
CQkgICZmYXVsdF93cml0ZV9mYWlsdXJlX2F0dHIpOwo+ICsKPiArCWZhdWx0X2NyZWF0ZV9kZWJ1
Z2ZzX2F0dHIoImVtdWxhdGVfZXJhc2VfZmFpbHVyZSIsIGRpciwKPiArCQkJCSAgJmZhdWx0X2Vy
YXNlX2ZhaWx1cmVfYXR0cik7Cj4gICAKPiAgIAlmYXVsdF9jcmVhdGVfZGVidWdmc19hdHRyKCJl
bXVsYXRlX3Bvd2VyX2N1dCIsIGRpciwKPiAgIAkJCQkgICZmYXVsdF9wb3dlcl9jdXRfYXR0cik7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5oIGIvZHJpdmVycy9tdGQvdWJp
L2RlYnVnLmgKPiBpbmRleCBmYzQyMzRjOWE5MGEuLjZiYzY5OGIzOGUzNSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC91YmkvZGVidWcuaAo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5o
Cj4gQEAgLTkyLDEwICs5MiwxMiBAQCBzdGF0aWMgaW5saW5lIGludCB1YmlfZGJnX2VyYXNlX2Zh
aWx1cmUoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSkKPiAgIC8qIEVtdWxhdGUgYml0LWZs
aXBzICovCj4gICAjZGVmaW5lIE1BU0tfQklURkxJUFMJCSgxIDw8IDMpCj4gICAvKiBFbXVsYXRl
cyAtRUlPIGR1cmluZyB3cml0ZS9lcmFzZSAqLwo+IC0jZGVmaW5lIE1BU0tfSU9fRkFJTFVSRQkJ
KDEgPDwgNCkKPiArI2RlZmluZSBNQVNLX1dSSVRFX0ZBSUxVUkUJKDEgPDwgNCkKPiArI2RlZmlu
ZSBNQVNLX0VSQVNFX0ZBSUxVUkUJKDEgPDwgNSkKPiAgIAo+ICAgZXh0ZXJuIGJvb2wgc2hvdWxk
X2ZhaWxfYml0ZmxpcHModm9pZCk7Cj4gLWV4dGVybiBib29sIHNob3VsZF9mYWlsX2lvX2ZhaWx1
cmVzKHZvaWQpOwo+ICtleHRlcm4gYm9vbCBzaG91bGRfZmFpbF93cml0ZV9mYWlsdXJlKHZvaWQp
Owo+ICtleHRlcm4gYm9vbCBzaG91bGRfZmFpbF9lcmFzZV9mYWlsdXJlKHZvaWQpOwo+ICAgZXh0
ZXJuIGJvb2wgc2hvdWxkX2ZhaWxfcG93ZXJfY3V0KHZvaWQpOwo+ICAgCj4gICBzdGF0aWMgaW5s
aW5lIGJvb2wgdWJpX2RiZ19mYWlsX2JpdGZsaXAoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnVi
aSkKPiBAQCAtMTA3LDE1ICsxMDksMTUgQEAgc3RhdGljIGlubGluZSBib29sIHViaV9kYmdfZmFp
bF9iaXRmbGlwKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICAKPiAgIHN0YXRpYyBp
bmxpbmUgYm9vbCB1YmlfZGJnX2ZhaWxfd3JpdGUoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnVi
aSkKPiAgIHsKPiAtCWlmICh1YmktPmRiZy5lbXVsYXRlX2ZhaWx1cmVzICYgTUFTS19JT19GQUlM
VVJFKQo+IC0JCXJldHVybiBzaG91bGRfZmFpbF9pb19mYWlsdXJlcygpOwo+ICsJaWYgKHViaS0+
ZGJnLmVtdWxhdGVfZmFpbHVyZXMgJiBNQVNLX1dSSVRFX0ZBSUxVUkUpCj4gKwkJcmV0dXJuIHNo
b3VsZF9mYWlsX3dyaXRlX2ZhaWx1cmUoKTsKPiAgIAlyZXR1cm4gZmFsc2U7Cj4gICB9Cj4gICAK
PiAgIHN0YXRpYyBpbmxpbmUgYm9vbCB1YmlfZGJnX2ZhaWxfZXJhc2UoY29uc3Qgc3RydWN0IHVi
aV9kZXZpY2UgKnViaSkKPiAgIHsKPiAtCWlmICh1YmktPmRiZy5lbXVsYXRlX2ZhaWx1cmVzICYg
TUFTS19JT19GQUlMVVJFKQo+IC0JCXJldHVybiBzaG91bGRfZmFpbF9pb19mYWlsdXJlcygpOwo+
ICsJaWYgKHViaS0+ZGJnLmVtdWxhdGVfZmFpbHVyZXMgJiBNQVNLX0VSQVNFX0ZBSUxVUkUpCj4g
KwkJcmV0dXJuIHNob3VsZF9mYWlsX2VyYXNlX2ZhaWx1cmUoKTsKPiAgIAlyZXR1cm4gZmFsc2U7
Cj4gICB9Cj4gICAKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
