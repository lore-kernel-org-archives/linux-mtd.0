Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FD9C5478C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Feb 2024 01:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bCFSRL4+1AXDRrU5v6IombYENAz+X+ldeTL8np5sPI=; b=UXOFhY5kK+BzjrRfmJEstKeRC2
	c0RbdFlnnw/C6bMIfCk8RpIAbkQe6G+wiUrZ1kp3AORVz7UiKPX9LbR1NYBMOO/aJHPUvt0yC1fWi
	50LpD/pA1dLxp+xRkmO8VeI7Kc+p8R1hoFeRebSXJCWKQoIhkJANwkub2ONl1NpU0jBLTql9OowOw
	5d3OadAANvrvRTMOcKGkN9eBcRO2+ARNzugtlinbXw1Nv5kPf2iFpQ+PtraaYV34klHcuHdk9gjcC
	/P4jeJZrt051v6beYdrBaY/KZYS5B/4nMERgnN8hGs2HgwerhqxXyeWCWbX4CZ7OJvS3QYgof6r2e
	C8Rxd0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf90q-00000007ahD-18iL;
	Wed, 28 Feb 2024 01:45:36 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf90j-00000007af2-2OSG
	for linux-mtd@lists.infradead.org;
	Wed, 28 Feb 2024 01:45:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tkxr0701Pz1b15m;
	Wed, 28 Feb 2024 09:40:16 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id CD0EF18002F;
	Wed, 28 Feb 2024 09:45:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 09:45:14 +0800
Subject: Re: [PATCH v2] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8ae44e8e-fc3d-28bd-5d1e-e900ce53529f@huawei.com>
Date: Wed, 28 Feb 2024 09:45:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_174529_792343_01EA703A 
X-CRM114-Status: GOOD (  15.99  )
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

1NogMjAyNC8yLzI4IDg6NDYsIERhbmllbCBHb2xsZSDQtLXAOgo+IEEgY29tcGlsZXIgd2Fybmlu
ZyByZWxhdGVkIHRvIHNpemVvZihpbnQpICE9IDggd2hlbiBjYWxsaW5nIGRvX2RpdigpCj4gaXMg
dHJpZ2dlcmVkIHdoZW4gYnVpbGRpbmcgb24gMzItYml0IHBsYXRmb3Jtcy4KPiBBZGRyZXNzIHRo
aXMgYnkgdXNpbmcgaW50ZWdlciB0eXBlcyBoYXZpbmcgYSB3ZWxsLWRlZmluZWQgc2l6ZS4KPiAK
PiBGaXhlczogM2NlNDg1ODAzZGExICgibXRkOiB1Ymk6IHByb3ZpZGUgTlZNRU0gbGF5ZXIgb3Zl
ciBVQkkgdm9sdW1lcyIpCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFr
cm90b3BpYS5vcmc+Cj4gLS0tCj4gdjI6IHVzZSBzaXplX3QgZm9yICdieXRlc19sZWZ0JyB2YXJp
YWJsZSB0byBtYXRjaCBwYXJhbWV0ZXIgdHlwZQo+IAo+ICAgZHJpdmVycy9tdGQvdWJpL252bWVt
LmMgfCA1ICsrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jIGIvZHJpdmVy
cy9tdGQvdWJpL252bWVtLmMKPiBpbmRleCBiN2E5M2M0OTVkMTcyLi5lNjhiODU4OWM0Mjc5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jCj4gKysrIGIvZHJpdmVycy9tdGQv
dWJpL252bWVtLmMKPiBAQCAtMjMsOSArMjMsMTIgQEAgc3RydWN0IHViaV9udm1lbSB7Cj4gICBz
dGF0aWMgaW50IHViaV9udm1lbV9yZWdfcmVhZCh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgZnJv
bSwKPiAgIAkJCSAgICAgIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQo+ICAgewo+IC0JaW50IGVy
ciA9IDAsIGxudW0gPSBmcm9tLCBvZmZzLCBieXRlc19sZWZ0ID0gYnl0ZXMsIHRvX3JlYWQ7Cj4g
ICAJc3RydWN0IHViaV9udm1lbSAqdW52ID0gcHJpdjsKPiAgIAlzdHJ1Y3QgdWJpX3ZvbHVtZV9k
ZXNjICpkZXNjOwo+ICsJc2l6ZV90IGJ5dGVzX2xlZnQgPSBieXRlczsKPiArCXVpbnQzMl90IG9m
ZnMsIHRvX3JlYWQ7ClRoZXJlIHN0aWxsIGV4aXN0IGEgdHlwZSB0cnVuY2F0aW9uIGFzc2lnbm1l
bnQgJ3RvX3JlYWQgPSBieXRlc19sZWZ0JyAKYmVsb3csIGFsdGhvdWdoIGl0J3Mgc2FmZSBpbiBs
b2dpYy4KPiArCXVpbnQ2NF90IGxudW0gPSBmcm9tOwo+ICsJaW50IGVyciA9IDA7Cj4gICAKPiAg
IAlkZXNjID0gdWJpX29wZW5fdm9sdW1lKHVudi0+dWJpX251bSwgdW52LT52b2xfaWQsIFVCSV9S
RUFET05MWSk7Cj4gICAJaWYgKElTX0VSUihkZXNjKSkKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
