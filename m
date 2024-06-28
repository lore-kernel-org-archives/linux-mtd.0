Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1821C41513
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwQK8+bDTgX9Ps+ZjmtwUiPohT2ouSie/pygjA7EwCA=; b=r75709haTpeB5N
	jB9Dh1kAszVRxrcmNzqrhKd9ysreTfsXEFu9uf6KJYmscShnnmFdS4fG24Lkmn6kWjjlBuJ0ORHOX
	fJZrzih1JvyqsDDzAn3gGDlyDSkL/mpeBLZ+8X7J45mTI8DQ8i4D6KeqB6jsmsqnARnt5fPWTrlC7
	X9W02PFkGZqYD4h0xvBCIcSNCbmfEDK/dQanMErzc2crTCq+5oK6R1RbLa88CIrOGqtVa150Fe+sc
	lCcYS019u2euM+Baz9Vl2/xtw78fDbLUGyuYC9+3FdrEDyw2U9F6T6vnmTe6f+mvAEuK8ueDv3KnS
	uuDIjnDAiLb2or2JkVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6IO-0000000Cvts-2e3f;
	Fri, 28 Jun 2024 07:45:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6IL-0000000Cvsn-0Gt9
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 07:45:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CAD4FF806;
	Fri, 28 Jun 2024 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719560713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EnuubegvOe+sUBWqClTh59X4+t4oNOFvsmld2Nx+GdI=;
	b=JL+7kUq13ClciI3OamkaMysFgmgNGEERBYxpXrO2adYuf/gUI3RIrOFzYRPtZwceRkde3m
	JHmKlgnnbe2cIq7Wcr/Q7mIGRpCvTOh87V74s+zQGTgHnEkqjU76kVAEsydKOV7mZ2mOgh
	TQJ4lMMJOZJKfOR1aRzqHSY1FfdN2OWuwaMCu2NV5xLO2xlAhpbgn+JqmHpt38v3F69kvW
	p5AyenYDHk7oEEiwkzeksDztOHaEZ6mq6ZT5L7fSQS7YVR9uJNvs18PFcupXBPauDjWhIo
	/3c8fw/OhM6b0Z4SXnpXhYR4q4WBb7LbkZW5AD08BKwG3xE4Elvz2yPmoribMg==
Date: Fri, 28 Jun 2024 09:45:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Stefan Agner
 <stefan@agner.ch>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arch: m68k: Add definitions for flash NFC
 support
Message-ID: <20240628094511.75cc9c78@xps-13>
In-Reply-To: <20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
References: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
	<20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_004521_404637_4C4208D1 
X-CRM114-Status: GOOD (  15.48  )
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

SGkgSmVhbi1NaWNoZWwgJiBHZWVydCwKCmplYW5taWNoZWwuaGF1dGJvaXNAeW9zZWxpLm9yZyB3
cm90ZSBvbiBUaHUsIDI3IEp1biAyMDI0IDE4OjA1OjI4ICswMjAwOgoKPiBBZGQgYSBmZXcgZGVm
aW5pdGlvbnMsIGFzIHRoZSBiYXNlIGFkZHJlc3MgZm9yIHRoZSBORkMgZm9yIHRoZSBNNTQ0MXgu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmVhbi1NaWNoZWwgSGF1dGJvaXMgPGplYW5taWNoZWwuaGF1
dGJvaXNAeW9zZWxpLm9yZz4KPiAtLS0KPiAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNp
bS5oIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNpbS5oIGIvYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL201NDQxeHNpbS5oCj4gaW5kZXggZjQ4Y2Y2M2JkNzgyLi5kNGVlMWVhYjdj
NGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNpbS5oCj4gKysr
IGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNpbS5oCj4gQEAgLTk5LDYgKzk5LDcgQEAK
PiAgI2RlZmluZSBNQ0ZJTlQyX1BJVDEJCTE0Cj4gICNkZWZpbmUgTUNGSU5UMl9QSVQyCQkxNQo+
ICAjZGVmaW5lIE1DRklOVDJfUElUMwkJMTYKPiArI2RlZmluZSBNQ0ZJTlQyX05GQwkJMjUKPiAg
I2RlZmluZSBNQ0ZJTlQyX1JUQwkJMjYKPiAgCj4gIC8qCj4gQEAgLTMzMyw0ICszMzQsMTAgQEAK
PiAgI2RlZmluZSBNQ0ZfSVJRX0JPRkYxCQkoTUNGSU5UMV9WRUNCQVNFICsgTUNGSU5UMV9GTEVY
Q0FOMV9CT0ZGKQo+ICAjZGVmaW5lIE1DRl9JUlFfRVJSMQkJKE1DRklOVDFfVkVDQkFTRSArIE1D
RklOVDFfRkxFWENBTjFfRVJSKQo+ICAKPiArLyoKPiArICogRmxhc2ggbW9kdWxlCj4gKyAqLwo+
ICsjZGVmaW5lIE1DRl9ORkNfQkFTRQkJMHhmYzBmYzAwMAo+ICsjZGVmaW5lIE1DRl9ORkNfU0la
RQkJKDB4ZmMwZmZmM2IgLSAweGZjMGZjMDAwKQo+ICsjZGVmaW5lIE1DRl9ORkNfSVNSCQkoTUNG
SU5UMl9WRUNCQVNFICsgTUNGSU5UMl9ORkMpCgpJJ20gc29ycnkgYnV0IHRoaXMgZmVlbHMgcmVh
bGx5IGJhY2t3YXJkcy4gUGxhdGZvcm0gZGF0YSBhcyBDCnN0cnVjdHVyZXMgYXJlIGFscmVhZHkg
bGVnYWN5LCBidXQgZGVmaW5pbmcgdGhlc2UgaW5mb3JtYXRpb24gaW4Kc29tZSBhcmNoIGhlYWRl
cnMgYW5kIHVzaW5nIHRoZW0gZGlyZWN0bHkgZnJvbSBkcml2ZXJzIHJlYWxseSBzZWVtcwpldmVu
ICJ3cm9uZ2VyIiB0byBtZS4gV2hhdCdzIHRoZSBtaWQvbG9uZyB0ZXJtIHBsYW4gZm9yIHRoaXM/
IElmIHRoZQpwbGF0Zm9ybXMgYXJlIHN0aWxsIGluIHVzZSB0b2RheSBhbmQgbmVlZCB0byBiZSBt
YWludGFpbmVkLCB3aHkgbm90CmZpbmFsbHkgZW5hYmxpbmcgZGV2aWNlIHRyZWUgc3VwcG9ydD8g
SSBrbm93IGl0J3MgaGFyZGVyIHRvIGRvIHRoYW4gdG8Kc2F5LCBidXQgSSdkIGxpa2Ugc29tZSBy
ZWFsbHkgZ29vZCBleHBsYW5hdGlvbiBvbiB3aHkgd2Ugc2hvdWxkIGFjY2VwdAp0byBkbyB0aGlz
IGluIDIwMjQgYmVjYXVzZSBpdCBmZWVscyByYXRoZXIgaW5hZGVxdWF0ZS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
