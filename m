Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40EEDEC43
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbIUB8da9k8NfTjqLFj4dc38dGxOpgudo/bQQG/qxgE=; b=S2tWIU0uwpFNdP
	qEYz81aVd5bSrZ9LwhAz8w+dxf2CRI04xZODfbHvKgnb00ppd77Uh1K8Syo3oOKP4ZfA222A3slCG
	OvA/IEuAcAGhuC2Xn3J3GtIgSd7WHSmLcRO1lXAy+S27/LuB221HnmN5BhKYWz9Iuw8pX5Lp/X2+b
	tf4Tf1oJQxgQRj0Ym71RSQoDffC2SE3O0zkO3g1JTbLttBsJNoujRiaERUMmSJlGquIm+sNk0Ltdt
	4/AcNQO8VMcuKxBgmT8xI/fvUYV/boKzN/p8+GSqqjdCIOSU7PFcalQNXoXKYgD34xcINyI38LSB7
	qP4hQaUD4RQuXmupSvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOZS-005nyE-2p;
	Wed, 13 Sep 2023 12:02:14 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgOZM-005nsg-29
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 12:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1694606510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWLRygrELKKqAaeytnPuS49YfDZXBa1fKuVzJNWsNlU=;
	b=1QIV1/PoaT+FV+H/sxFzRq6rhuLVR+DSOCBfMOd1OZfn+hsdGTHEPg1/oMtHongC2CnBpe
	EqeScdSNy0Xo8ZVuo3CeW8HKKTh2RXsJePltFJv4w2/9KR4xsE92deDseOAqXQUVjOYO0+
	W19vDjwiP4eU4cPbUw31kE7+153Bi84=
Message-ID: <a3c8b1eaba0e7aae190cb5f2ffd8a360fab0251c.camel@crapouillou.net>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
From: Paul Cercueil <paul@crapouillou.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 13 Sep 2023 14:01:47 +0200
In-Reply-To: <20230913115001.23183-3-brgl@bgdev.pl>
References: <20230913115001.23183-1-brgl@bgdev.pl>
	 <20230913115001.23183-3-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_050208_863178_96F2DCAA 
X-CRM114-Status: GOOD (  11.35  )
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

SGksCgpMZSBtZXJjcmVkaSAxMyBzZXB0ZW1icmUgMjAyMyDDoCAxMzo0OSArMDIwMCwgQmFydG9z
eiBHb2xhc3pld3NraSBhCsOpY3JpdMKgOgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiAKPiBVc2UgdGhlIG5ldywgbGVzcyBjdW1i
ZXJzb21lIGludGVyZmFjZSBmb3Igc2V0dGluZyB0aGUgR1BJTyBhcwo+IGFjdGl2ZS1oaWdoIHRo
YXQgZG9lc24ndCByZXF1aXJlIGZpcnN0IGNoZWNraW5nIHRoZSBjdXJyZW50IHN0YXRlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lA
bGluYXJvLm9yZz4KCldvcmtzIGZvciBtZS4KCkFja2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVs
QGNyYXBvdWlsbG91Lm5ldD4KCkNoZWVycywKLVBhdWwKCj4gLS0tCj4gwqBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYyB8IDUgKystLS0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jCj4gYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwo+IGluZGV4IDY3NDgy
MjZiOGJkMS4uYzA1NTEzM2M0NWZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMKPiBAQCAtMzg4LDkgKzM4OCw4IEBAIHN0YXRpYyBp
bnQgaW5nZW5pY19uYW5kX2luaXRfY2hpcChzdHJ1Y3QKPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIGhlcmUgZm9yIG9sZGVyIERUcyBzbyB3ZSBjYW4gcmUtdXNl
IHRoZSBnZW5lcmljCj4gbmFuZF9ncGlvX3dhaXRyZHkoKQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBo
ZWxwZXIsIGFuZCBiZSBjb25zaXN0ZW50IHdpdGggd2hhdCBvdGhlciBkcml2ZXJzIGRvLgo+IMKg
wqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgwqBpZiAob2ZfbWFjaGluZV9pc19jb21w
YXRpYmxlKCJxaSxsYjYwIikgJiYKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpb2RfaXNfYWN0
aXZlX2xvdyhuYW5kLT5idXN5X2dwaW8pKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBncGlvZF90b2dnbGVfYWN0aXZlX2xvdyhuYW5kLT5idXN5X2dwaW8pOwo+ICvCoMKgwqDCoMKg
wqDCoGlmIChvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInFpLGxiNjAiKSkKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3Bpb2Rfc2V0X2FjdGl2ZV9oaWdoKG5hbmQtPmJ1c3lfZ3Bp
byk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgbmFuZC0+d3BfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKGRldiwgIndwIiwKPiBHUElPRF9PVVRfTE9XKTsKPiDCoAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
