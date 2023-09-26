Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACA2E7D26D
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZfku0/rnj+QrM2WdQ8jci8evRQCgmQKvUBTuHqiAXE=; b=Uchl5li92Z/bve
	XAJSG7dFzY1ei5FZXZ0tqvyj1e3F3kxu8sDhAE993S0pcrKtp4QYhaXtA94aAcDuC2WWFK9B1YUIz
	dbkHlyVQ+09U2nuNboLAzQFeWWhjUXFb0OrXNlYrj3j4geHFtihdEJQlGvIlQa8rKjd9zOEy4vzwc
	CSScq/820upc5RMWZKZLY8gA1GNGhcTwMFzCSeRiqIeY63tlf90RDWkN5VzAc2la/Kg2wHmDp8M3r
	PG6ScPt2H7llTAwS0KYpiyArR9oO9HIEeveiVza+bxKNf/AVdzlpVzZ0UgMxjTDLE27pGAM0i8gW7
	JbTfHz5fqrmL9mGG3aKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Bd-00FwjL-2N;
	Tue, 26 Sep 2023 09:16:57 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Ba-00Fwi1-2T
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 09:16:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD6F340004;
	Tue, 26 Sep 2023 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695719809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62i6jKle2TrQicZgJBk/autmG/K7qzxoSj1CVO2zc+w=;
	b=LEwU4lFeHRNnHHEVD100Q7J4C1swRhuGuU9sigjtpACm+bhaLpArGlAqMfJspzhIFeBUcQ
	Fy0WS340DGTFyJUi/5F11vXu7qXVai/0vdRLqMjDus8oOWW6TsnYmI6JLOYYJrkTxUVyN+
	L/Doi05uXxgBshAo9saucTBogZODomazcwPZrv4yilbcs0gpHDXCh0FieUi+yPF/X9EyRo
	0TBaCFbp+RRBEiA0PizTbjdhxhpH6kR/E4qpYgsgoYeBrFEr5Klv1FRX+1n4wtzAZ1Q9BE
	MgEn1anNzShjL0OKx7LrlOdmM4sFqwLAZmIFGnUPPyO/jcAmrCJVni9GjFAQfA==
Date: Tue, 26 Sep 2023 11:16:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko
 <andy@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mips@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to
 gpiolib-of.c
Message-ID: <20230926111643.58ee4587@xps-13>
In-Reply-To: <20230926090623.35595-1-brgl@bgdev.pl>
References: <20230926090623.35595-1-brgl@bgdev.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_021655_115257_72355F04 
X-CRM114-Status: GOOD (  20.85  )
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

SGkgQmFydG9zeiwKCmJyZ2xAYmdkZXYucGwgd3JvdGUgb24gVHVlLCAyNiBTZXAgMjAyMyAxMTow
NjoyMyArMDIwMDoKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pl
d3NraUBsaW5hcm8ub3JnPgo+IAo+IFdlIGhhdmUgYSBzcGVjaWFsIHBsYWNlIGZvciBPRiBwb2xh
cml0eSBxdWlya3MgaW4gZ3Bpb2xpYi1vZi5jLiBMZXQncwo+IG1vdmUgdGhpcyBvdmVyIHRoZXJl
IHNvIHRoYXQgaXQgZG9lc24ndCBwb2xsdXRlIHRoZSBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+
IC0tLQo+IFRoaXMgaXMgYW4gYWx0ZXJuYXRpdmUgdG8gdGhlIHByZXZpb3VzIHBhdGNoIHRoYXQg
aW5zdGVhZCBvZiByZXBsYWNpbmcKPiBvbmUgYWN0aXZlLWxvdyBzZXR0ZXIgd2l0aCBhbm90aGVy
LCBqdXN0IG1vdmVzIHRoZSBxdWlyayBvdmVyIHRvCj4gZ3Bpb2xpYi1vZi5jCj4gCj4gIGRyaXZl
cnMvZ3Bpby9ncGlvbGliLW9mLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysr
Cj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jIHwgMTIg
LS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYyBiL2Ry
aXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMKPiBpbmRleCA1NTE1ZjMyY2YxOWIuLjU4YzBiYmU5ZDU2
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jCj4gKysrIGIvZHJpdmVy
cy9ncGlvL2dwaW9saWItb2YuYwo+IEBAIC0xOTIsNiArMTkyLDE1IEBAIHN0YXRpYyB2b2lkIG9m
X2dwaW9fdHJ5X2ZpeHVwX3BvbGFyaXR5KGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4g
IAkJICovCj4gIAkJeyAiaGltYXgsaHg4MzU3IiwJImdwaW9zLXJlc2V0IiwJZmFsc2UgfSwKPiAg
CQl7ICJoaW1heCxoeDgzNjkiLAkiZ3Bpb3MtcmVzZXQiLAlmYWxzZSB9LAo+ICsJCS8qCj4gKwkJ
ICogVGhlIHJiLWdwaW9zIHNlbWFudGljcyB3YXMgdW5kb2N1bWVudGVkIGFuZCBxaSxsYjYwIChh
bG9uZyB3aXRoCj4gKwkJICogdGhlIGluZ2VuaWMgZHJpdmVyKSBnb3QgaXQgd3JvbmcuIFRoZSBh
Y3RpdmUgc3RhdGUgZW5jb2RlcyB0aGUKPiArCQkgKiBOQU5EIHJlYWR5IHN0YXRlLCB3aGljaCBp
cyBoaWdoIGxldmVsLiBTaW5jZSB0aGVyZSdzIG5vIHNpZ25hbAo+ICsJCSAqIGludmVydGVyIG9u
IHRoaXMgYm9hcmQsIGl0IHNob3VsZCBiZSBhY3RpdmUtaGlnaC4gTGV0J3MgZml4IHRoYXQKPiAr
CQkgKiBoZXJlIGZvciBvbGRlciBEVHMgc28gd2UgY2FuIHJlLXVzZSB0aGUgZ2VuZXJpYyBuYW5k
X2dwaW9fd2FpdHJkeSgpCj4gKwkJICogaGVscGVyLCBhbmQgYmUgY29uc2lzdGVudCB3aXRoIHdo
YXQgb3RoZXIgZHJpdmVycyBkby4KPiArCQkgKi8KPiArCQl7ICJxaSxsYjYwIiwJCSJyYi1ncGlv
cyIsCXRydWUgfSwKCkkgZGlkbid0IGtub3cgYWJvdXQgc3VjaCBhIGxpc3QsIGludGVyZXN0aW5n
LiBCZXR0ZXIgYmUgYXdhcmUgd2hlbgpkZWJ1Z2dpbmcgOikKCklJUkMgTGludXMgd2FzIGZpbmUs
IHNvIGlmIFBhdWwgYWxzbyBhZ3JlZXMgSSBndWVzcyB0aGlzIGlzIGJldHRlcgp0YWtpbmcgdGhy
b3VnaCB0aGUgZ3BpbyB0cmVlPyBJIGRvbid0IGhhdmUgYW55IGluZ2VuaWMgcmVsYXRlZCBjaGFu
Z2VzCnF1ZXVlZCByaWdodCBub3cgc28gZmVlbCBmcmVlIHRvIHRha2UgaXQuCgpBY2tlZC1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
