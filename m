Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0666C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggU1kOCDQMmfbqOD0vFAWZFb+d8MUNBPZrjR1SVhmW0=; b=JL5fDOrk9zSXS06Z8p68/OfIMx
	/ueTW9Or9szbLo0kBj1emfNrCuIn8TtEA8nDwxDC1dE3JmqGGyaeQlscy7MAzEpLG0gvVLOJXqH4b
	6jDcWIXQQREun1c+QUdbL+6xhLjFaRFUgu59O+z8ZVynO8QgvwnjhsYeQG9KXK3SYmJ4J/w0NnBxH
	3IXqeKGJxqj874ms2cE07f0V0TyEitebhG/Ow0oyWiXSyR6lDS6d+7mot+xlvJ5Tg0tOPtAYJLlER
	2qC02OLQKjj1BQ1k2gX2cGAFgrScCZXiap2EFutzk5T5jPm+4e2wNVzjignXv9uv8NJP4DNHTL/4L
	8eyK+cBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRp9-00FXKG-1Z;
	Mon, 31 Jul 2023 12:16:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRp6-00FXIE-1o
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 12:16:30 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RDxxn3ZpqzVjf2;
	Mon, 31 Jul 2023 20:14:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:16:18 +0800
Subject: Re: [PATCH V2 5/5] mtd: Add several functions to the fail_function
 list
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
 <20230718085119.3885747-6-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <475deeb5-5517-4784-a9e5-409ef16e42c4@huawei.com>
Date: Mon, 31 Jul 2023 20:16:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230718085119.3885747-6-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_051628_799715_D812633A 
X-CRM114-Status: GOOD (  14.75  )
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

1NogMjAyMy83LzE4IDE2OjUxLCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gYWRkIG10ZF9yZWFkKCks
IG10ZF93cml0ZSgpLCBtdGRfZXJhc2UoKSwgbXRkX2Jsb2NrX21hcmtiYWQoKSB0bwo+IGZhaWxf
ZnVuY3Rpb24gbGlzdCBmb3IgdGVzdGluZyBwdXJwb3NlCj4gCgpJdCBjb3VsZCBiZSBiZXR0ZXIg
aWYgeW91IGNhbiBwcm92aWRlIHNvbWUgZXhhbXBsZXMgZm9yIGhvdyB0byB1c2UgdGhlc2UgCmVy
cm9yIGluamVjdGlvbiBpbnRlcmZhY2VzLgoKPiBTaWduZWQtb2ZmLWJ5OiBaaGFvTG9uZyBXYW5n
IDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC9tdGRjb3Jl
LmMgfCA2ICsrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJz
L210ZC9tdGRjb3JlLmMKPiBpbmRleCBlMDBiMTJhYTVlYzkuLmVjZjFjNWU2ODQ3OSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMKPiBAQCAtMzAsNiArMzAsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KPiAg
ICNpbmNsdWRlIDxsaW51eC9udm1lbS1wcm92aWRlci5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3Jv
b3RfZGV2Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9lcnJvci1pbmplY3Rpb24uaD4KPiAgIAo+ICAg
I2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0
aW9ucy5oPgo+IEBAIC0xMzk2LDYgKzEzOTcsNyBAQCBpbnQgbXRkX2VyYXNlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5zdHIpCj4gICAJcmV0dXJuIHJldDsKPiAg
IH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG10ZF9lcmFzZSk7Cj4gK0FMTE9XX0VSUk9SX0lOSkVD
VElPTihtdGRfZXJhc2UsIEVSUk5PKTsKPiAgIAo+ICAgLyoKPiAgICAqIFRoaXMgc3R1ZmYgZm9y
IGVYZWN1dGUtSW4tUGxhY2UuIHBoeXMgaXMgb3B0aW9uYWwgYW5kIG1heSBiZSBzZXQgdG8gTlVM
TC4KPiBAQCAtMTQ5Myw2ICsxNDk1LDcgQEAgaW50IG10ZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbiwgc2l6ZV90ICpyZXRsZW4sCj4gICAJcmV0dXJu
IHJldDsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG10ZF9yZWFkKTsKPiArQUxMT1dfRVJS
T1JfSU5KRUNUSU9OKG10ZF9yZWFkLCBFUlJOTyk7Cj4gICAKPiAgIGludCBtdGRfd3JpdGUoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwgc2l6ZV90ICpyZXRsZW4s
Cj4gICAJICAgICAgY29uc3QgdV9jaGFyICpidWYpCj4gQEAgLTE1MDksNiArMTUxMiw3IEBAIGlu
dCBtdGRfd3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwg
c2l6ZV90ICpyZXRsZW4sCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0xf
R1BMKG10ZF93cml0ZSk7Cj4gK0FMTE9XX0VSUk9SX0lOSkVDVElPTihtdGRfd3JpdGUsIEVSUk5P
KTsKPiAgIAo+ICAgLyoKPiAgICAqIEluIGJsYWNrYm94IGZsaWdodCByZWNvcmRlciBsaWtlIHNj
ZW5hcmlvcyB3ZSB3YW50IHRvIG1ha2Ugc3VjY2Vzc2Z1bCB3cml0ZXMKPiBAQCAtMjMyOSw3ICsy
MzMzLDcgQEAgaW50IG10ZF9ibG9ja19tYXJrYmFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2Zm
X3Qgb2ZzKQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwobXRkX2Js
b2NrX21hcmtiYWQpOwo+IC0KPiArQUxMT1dfRVJST1JfSU5KRUNUSU9OKG10ZF9ibG9ja19tYXJr
YmFkLCBFUlJOTyk7Cj4gICAvKgo+ICAgICogZGVmYXVsdF9tdGRfd3JpdGV2IC0gdGhlIGRlZmF1
bHQgd3JpdGV2IG1ldGhvZAo+ICAgICogQG10ZDogbXRkIGRldmljZSBkZXNjcmlwdGlvbiBvYmpl
Y3QgcG9pbnRlcgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
