Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD57C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 08:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A2C361ABC
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 08:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A2C361ABC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWDxMpH1pBjJHcsZiMnmBgeSwTUumXZ0v/VX4C9JlDo=; b=ui9mHZnuzQagmz
	6qiJLRs0TIWD6elOd8x36SOBaIEAt9hQgJKsPFFdsSrWLxNLldGOtcHL8xVyjgjLvDwXm3N6fDkyO
	Tx6B3Iq0JVnJO/yle1pyMqRkfIg6Gf5QVXm3FKlFzVIjjZG56ohnpMgjH2ID64zstY5wkmOp6o1SP
	nTEn142MYDN3SBMG/wq0zacQM1tBF0GtwMd3iRcLKqFOt51DeBOeDQGH2K9hqOSDy7HK9M0m8FK0C
	r9CVbGNtr1kvwhKmRLoR8psYKTWht5ErS54hPliKlawGpH8cmn0aYrhrdcg1EgOVA1F9bjge5R15N
	PLMi3w3rSTBoS5PFogdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFXYg-00GTr7-A2; Mon, 16 Aug 2021 08:01:22 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFXYd-00GTql-Dg
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 08:01:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0DD6A240004;
 Mon, 16 Aug 2021 08:01:14 +0000 (UTC)
Date: Mon, 16 Aug 2021 10:01:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Evgeny Novikov <novikov@ispras.ru>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kirill Shilimanov
 <kirill.shilimanov@huawei.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ldv-project@linuxtesting.org"
 <ldv-project@linuxtesting.org>
Subject: Re: [PATCH] mtd: rawnand: mxic: Enable and prepare clocks in probe
Message-ID: <20210816100114.384f01b9@xps13>
In-Reply-To: <CAHp75VcgqZEHBTXpNApGfRkhgjpCvbgj+yxUZbbO+=0DOvZLQg@mail.gmail.com>
References: <20210812113800.12466-1-novikov@ispras.ru>
 <CAHp75VcgqZEHBTXpNApGfRkhgjpCvbgj+yxUZbbO+=0DOvZLQg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_010119_645311_E717675F 
X-CRM114-Status: GOOD (  21.37  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKCkFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3Jv
dGUgb24gVGh1LCAxMiBBdWcgMjAyMQoxNToxMzoxMCArMDMwMDoKCj4gT24gVGh1cnNkYXksIEF1
Z3VzdCAxMiwgMjAyMSwgRXZnZW55IE5vdmlrb3YgPG5vdmlrb3ZAaXNwcmFzLnJ1PiB3cm90ZToK
PiAKPiA+IEl0IHNlZW1zIHRoYXQgbXhpY19uZmNfcHJvYmUoKSBtaXNzZWQgaW52b2NhdGlvbiBv
Zgo+ID4gbXhpY19uZmNfY2xrX2VuYWJsZSgpLiBUaGUgcGF0Y2ggZml4ZWQgdGhhdC4gSW4gYWRk
aXRpb24sIGVycm9yIGhhbmRsaW5nCj4gPiB3YXMgcmVmaW5lZCBhcHByb3ByaWF0ZWx5LiAgCj4g
Cj4gCj4gTkFLLiBVbnRpbCB5b3UgcHJvdmlkZSBhIGRlZXBlciBhbmFseXNpcywgbGlrZSBob3cg
dGhpcyB3b3JrcyBiZWZvcmUgeW91cgo+IGNoYW5nZS4KPiAKPiAKPiBQbGVhc2UsIGRvbuKAmXQg
YmxpbmRseSBnZW5lcmF0ZSBwYXRjaGVzLCB0aGlzIGNhbiBldmVuIHlvdXIgYm90IGRvLCBqdXN0
Cj4gdGhpbmsgYWJvdXQgZWFjaCBjaGFuZ2UgYW5kIHByZWZlcmFibGUgdGVzdCBvbiB0aGUgcmVh
bCBoYXJkd2FyZS4KPiAKPiBUaGUgYWJvdmUgaXMgdG8gYWxsIHlvdXIgbG92ZWx5IGNvbnRyaWJ1
dGlvbnMuCj4gCj4gCj4gPgo+ID4gRm91bmQgYnkgTGludXggRHJpdmVyIFZlcmlmaWNhdGlvbiBw
cm9qZWN0IChsaW51eHRlc3Rpbmcub3JnKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFdmdlbnkg
Tm92aWtvdiA8bm92aWtvdkBpc3ByYXMucnU+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IEtpcmlsbCBT
aGlsaW1hbm92IDxraXJpbGwuc2hpbGltYW5vdkBodWF3ZWkuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogS2lyaWxsIFNoaWxpbWFub3YgPGtpcmlsbC5zaGlsaW1hbm92QGh1YXdlaS5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9teGljX25hbmQuYyB8IDE2ICsrKysrKysrKysr
Ky0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhpY19uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGljXwo+ID4gbmFuZC5jCj4gPiBpbmRleCBkYTEwNzA5
OTM5OTQuLjM3ZTc1YmY2MGVlNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L214aWNfbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGljX25hbmQuYwo+
ID4gQEAgLTUwOSw5ICs1MDksMTUgQEAgc3RhdGljIGludCBteGljX25mY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlCj4gPiAqcGRldikKPiA+ICAgICAgICAgaWYgKElTX0VSUihuZmMtPnNl
bmRfZGx5X2NsaykpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobmZjLT5zZW5k
X2RseV9jbGspOwo+ID4KPiA+ICsgICAgICAgZXJyID0gbXhpY19uZmNfY2xrX2VuYWJsZShuZmMp
Owo+ID4gKyAgICAgICBpZiAoZXJyKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7CgpB
cyBBbmR5IHNhaWQsIHRoaXMgaXMgbm90IG5lZWRlZC4KCj4gPiArCj4gPiAgICAgICAgIG5mYy0+
cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiA+IC0gICAg
ICAgaWYgKElTX0VSUihuZmMtPnJlZ3MpKQo+ID4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKG5mYy0+cmVncyk7Cj4gPiArICAgICAgIGlmIChJU19FUlIobmZjLT5yZWdzKSkgewo+ID4g
KyAgICAgICAgICAgICAgIGVyciA9IFBUUl9FUlIobmZjLT5yZWdzKTsKPiA+ICsgICAgICAgICAg
ICAgICBnb3RvIGZhaWw7Cj4gPiArICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIG5hbmRfY2hpcCA9
ICZuZmMtPmNoaXA7Cj4gPiAgICAgICAgIG10ZCA9IG5hbmRfdG9fbXRkKG5hbmRfY2hpcCk7Cj4g
PiBAQCAtNTI3LDggKzUzMywxMCBAQCBzdGF0aWMgaW50IG14aWNfbmZjX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UKPiA+ICpwZGV2KQo+ID4gICAgICAgICBuYW5kX2NoaXAtPmNvbnRyb2xs
ZXIgPSAmbmZjLT5jb250cm9sbGVyOwo+ID4KPiA+ICAgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCAwKTsKPiA+IC0gICAgICAgaWYgKGlycSA8IDApCj4gPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIGlycTsKPiA+ICsgICAgICAgaWYgKGlycSA8IDApIHsKPiA+ICsgICAgICAgICAg
ICAgICBlcnIgPSBpcnE7Cj4gPiArICAgICAgICAgICAgICAgZ290byBmYWlsOwoKSG93ZXZlciBz
b21lIHJld29ya2luZyBpcyBuZWVkZWQgaW4gdGhlIGVycm9yIHBhdGguCgpUaGF0IGdvdG8gc3Rh
dGVtZW50IHNob3VsZCBiZSByZW5hbWVkIGFuZCBkZXZtX3JlcXVlc3RfaXJxKCkgc2hvdWxkIG5v
dApqdW1wIHRvIGl0LgoKPiA+ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgbXhpY19uZmNfaHdf
aW5pdChuZmMpOwo+ID4KPiA+IC0tCj4gPiAyLjI2LjIKPiA+Cj4gPiAgCj4gCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
