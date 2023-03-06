Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF7CC678D4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 13:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1WwBavrayrq5NxPVw0U6tm2wEKbH4hhCwMesVVJbaY=; b=ze+kE3O6JedJC2
	Fzm34RqI2zGYjIdmnHGr6mrVeCKaEu8NcQafzeSxiNKb4vmevhg7jweNoV4xtTmIIUw8sQhJbt3Ly
	+fEhgqD7yWZZou8Utp0Rg0U2d/aOgKDms3qRe941Ug7TKofc+K/YgtPba8sXLjeIZOE170zFso42c
	nzsev3xWdjUVAU1BhtSgmmYGU60VDb4XHwRWEzaC2CME6R5WFnpqR/2h1Hlx4gbz0HHmkCuoAzAMi
	ddoGIEKW+Gt61I9kGOKjwn7CvExNoMbEG+izW82q9pIVYGAObuJyKnZAnuW/+L6r0+AT3sw+IUhLQ
	fAIxGcvIL17GOpl/Laiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB1J-00CvLa-Py; Mon, 06 Mar 2023 13:36:53 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB1D-00CvJK-Ha
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 13:36:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5ACDD4000F;
	Mon,  6 Mar 2023 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678109803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iF0YBiVlEBSoruuFY3hfUFzbyRjcXERp33Lv7AYDmek=;
	b=LqJVz3oTAil4w8eiM18vAt9PX2HVY8WFieF25kuJyTZ51Zg1QI2Ff1VXbPH6/0x8Lf4T74
	gW6IXJfQHNOL6CAOWf7ABrDyIyNUlWaPiFT1mVLU7B0q/x6Ie9Pp04m4S/KT+nFdBiWfzv
	KTuzqFHCdEtygT4oeJQtW4t3yCCh2ciUqowNaQncHnSEtqSTk3kC66imhxuhB/UAU8gRh5
	nmGDuMuG5TX/8Vp4hl57z4hoRZuGF4HCDmGEdESQSk+fr/tddyIsm6gDO1VvcxodCW1PhX
	woCmQELEZJs1lYQufiFSTz/uItrhHPo5IuW4abJ1XG+9nrLBGOznHBKzMQXTOw==
Date: Mon, 6 Mar 2023 14:36:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: Avoid printing error messages on probe deferrals
Message-ID: <20230306143641.3bfe09ee@xps-13>
In-Reply-To: <7a9d652112b2619e3aaa4afd0e24d0ce@walle.cc>
References: <20230301152440.531465-1-miquel.raynal@bootlin.com>
	<7a9d652112b2619e3aaa4afd0e24d0ce@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_053647_786027_6C3FC0A1 
X-CRM114-Status: GOOD (  20.28  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gTW9uLCAwNiBNYXIgMjAyMyAx
NDoxMDoyMiArMDEwMDoKCj4gQW0gMjAyMy0wMy0wMSAxNjoyNCwgc2NocmllYiBNaXF1ZWwgUmF5
bmFsOgo+ID4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIGNvbXBsYWluIGFib3V0IHByb2JlIGVycm9y
cyBpbiBjYXNlIG9mIGRlZmVycmFscy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRk
L210ZGNvcmUuYyB8IDEwICsrKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiBpbmRleCAwZmVhY2I5ZmJkYWMu
LmQxNjNjNjkwNzUwYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiBAQCAtNTE4LDYgKzUxOCw3IEBAIHN0YXRp
YyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ICB7Cj4gPiAgCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IG10ZF9nZXRfb2Zfbm9kZShtdGQpOwo+ID4gIAlzdHJ1
Y3QgbnZtZW1fY29uZmlnIGNvbmZpZyA9IHt9Owo+ID4gKwlpbnQgcmV0Owo+ID4gCj4gPiAgCWNv
bmZpZy5pZCA9IC0xOyAgCj4gCj4ganVzdCBub3RpY2VkIHRoYXQgbWFnaWMgdmFsdWUuIElmIHlv
dSBjYXJlIHJlcGxhY2UgaXQgd2l0aCBOVk1FTV9ERVZJRF9OT05FLgoKTW1taCB5ZWFoLgoKPiAK
PiA+ICAJY29uZmlnLmRldiA9ICZtdGQtPmRldjsKPiA+IEBAIC01MzUsMTIgKzUzNiwxNSBAQCBz
dGF0aWMgaW50IG10ZF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAKPiA+ICAJ
bXRkLT5udm1lbSA9IG52bWVtX3JlZ2lzdGVyKCZjb25maWcpOwo+ID4gIAlpZiAoSVNfRVJSKG10
ZC0+bnZtZW0pKSB7Cj4gPiArCQlyZXQgPSBQVFJfRVJSKG10ZC0+bnZtZW0pOwo+ID4gIAkJLyog
SnVzdCBpZ25vcmUgaWYgdGhlcmUgaXMgbm8gTlZNRU0gc3VwcG9ydCBpbiB0aGUga2VybmVsICov
Cj4gPiAtCQlpZiAoUFRSX0VSUihtdGQtPm52bWVtKSA9PSAtRU9QTk9UU1VQUCkgewo+ID4gKwkJ
aWYgKHJldCA9PSAtRU9QTk9UU1VQUCkgewo+ID4gIAkJCW10ZC0+bnZtZW0gPSBOVUxMOwo+ID4g
IAkJfSBlbHNlIHsKPiA+IC0JCQlkZXZfZXJyKCZtdGQtPmRldiwgIkZhaWxlZCB0byByZWdpc3Rl
ciBOVk1FTSBkZXZpY2VcbiIpOwo+ID4gLQkJCXJldHVybiBQVFJfRVJSKG10ZC0+bnZtZW0pOwo+
ID4gKwkJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgIAo+IAo+IFNpbmNlIHlvdSBoYXZlIGEg
cHJvcGVyICJzdHJ1Y3QgZGV2aWNlIiB0byBvcGVyYXRlIG9uLCB5b3UgY2FuIGFsc28gdXNlCj4g
ZGV2X2Vycl9wcm9iZSgpIHdoaWNoIHRoZSBzYW1lIGJ1dCBhbHNvIHNhdmUgdGhlIHJlYXNvbiBm
b3IgdGhlIGRlZmVycmFsLgoKR29vZCBwb2ludC4gSSdsbCB1cGRhdGUsIHRoYXQgd2lsbCBtYWtl
IHRoaW5ncyBjbGVhcmVyLgoKPiAtbWljaGFlbAo+IAo+ID4gKwkJCQlkZXZfZXJyKCZtdGQtPmRl
diwKPiA+ICsJCQkJCSJGYWlsZWQgdG8gcmVnaXN0ZXIgTlZNRU0gZGV2aWNlICglZClcbiIsIHJl
dCk7Cj4gPiArCQkJcmV0dXJuIHJldDsKPiA+ICAJCX0KPiA+ICAJfSAgCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
