Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FBAEE020B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZhWe4sDabKlY5DhKPCyXGf5DKAaDuKmV99x2Opp59U=; b=NOAYsGu0J14Jg/
	HfgBRksnIdr6F3d4yAH+4r0/s+a3mUbbCRo8/1afgBrUU3Fx+mQDBLw55AN2vN1N1KLd3KaFhA5TL
	uOnqnQmWy7uAU6gdk2WhcDuSapaVefGgc3aEUF2sSYPJBn+dVMbGIUlKK9M/a1b4NmFkL4E9eJeM4
	OnAUY3dTToaZPPojcHgyYW9+x4+TMvzAuMBCMRac9wtqdDyvkIYdnEzoHHfpimfAq/KR0uYnOPhgZ
	65WlN+5yFAhlJsUOu7ORMDuWgigmJaj/M52eT3/l3yNXAzfYXkA1IuFsFFd9jmpAEP8ZhhBGCAs0F
	tUPNUsn1K1ewuZAbgWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgWOs-006fhk-20;
	Wed, 13 Sep 2023 20:23:50 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgWOo-006fgF-32
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 20:23:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AC2E240009;
	Wed, 13 Sep 2023 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694636623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dRlWZ4ip0P9gSRRVNtyMvezGlxc/WATurc5AdssgGA=;
	b=ow2wxZiMqZilFqKiQdViBBKXgJ10OFn4QutLDJ8h5iKbCLUYsMCpLYwz44g75okO+hVLKP
	fYAPH+Hipn+rJTW6OyvP5lnO3oBKBsUsGvAQ0BEQ0ZfwJwOKn97N+YEPNXgZx+tVi+QEoM
	UaTSLemyUL/EQjpuVLvEgCyBrWG2xCkxiwdjZycMqoB+iord0lk4UQWV5M7DtX7kEnFaHD
	kEfNXSKmxUZyO3fmf798qZoTx2rc8/tti4htwWlIYYKUdSMQrJLoPh/6SWJqWoCZYZrgsW
	a6SKSmbf6HDufOEoQxAp83NCom5LQ0HSbs2RYME0xMhTOK30Q2SNNixNySpdEw==
Date: Wed, 13 Sep 2023 22:23:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, Hans de
 Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
Message-ID: <20230913222338.07d1625b@xps-13>
In-Reply-To: <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
References: <20230913115001.23183-1-brgl@bgdev.pl>
	<20230913115001.23183-3-brgl@bgdev.pl>
	<CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
	<CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_132347_279826_BCD28048 
X-CRM114-Status: GOOD (  16.29  )
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

SGkgQW5keSwKCmxpbnVzLndhbGxlaWpAbGluYXJvLm9yZyB3cm90ZSBvbiBXZWQsIDEzIFNlcCAy
MDIzIDIyOjEyOjQwICswMjAwOgoKPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAxMDowNeKAr1BN
IEFuZHkgU2hldmNoZW5rbwo+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiA+
IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDI6NTDigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZTogIAo+ID4gPgo+ID4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiA+Cj4gPiA+IFVzZSB0aGUg
bmV3LCBsZXNzIGN1bWJlcnNvbWUgaW50ZXJmYWNlIGZvciBzZXR0aW5nIHRoZSBHUElPIGFzCj4g
PiA+IGFjdGl2ZS1oaWdoIHRoYXQgZG9lc24ndCByZXF1aXJlIGZpcnN0IGNoZWNraW5nIHRoZSBj
dXJyZW50IHN0YXRlLiAgCj4gPgo+ID4gLi4uCj4gPiAgCj4gPiA+ICAgICAgICAgICogaGVyZSBm
b3Igb2xkZXIgRFRzIHNvIHdlIGNhbiByZS11c2UgdGhlIGdlbmVyaWMgbmFuZF9ncGlvX3dhaXRy
ZHkoKQo+ID4gPiAgICAgICAgICAqIGhlbHBlciwgYW5kIGJlIGNvbnNpc3RlbnQgd2l0aCB3aGF0
IG90aGVyIGRyaXZlcnMgZG8uCj4gPiA+ICAgICAgICAgICovCj4gPiA+IC0gICAgICAgaWYgKG9m
X21hY2hpbmVfaXNfY29tcGF0aWJsZSgicWksbGI2MCIpICYmCj4gPiA+IC0gICAgICAgICAgIGdw
aW9kX2lzX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKSkKPiA+ID4gLSAgICAgICAgICAgICAg
IGdwaW9kX3RvZ2dsZV9hY3RpdmVfbG93KG5hbmQtPmJ1c3lfZ3Bpbyk7Cj4gPiA+ICsgICAgICAg
aWYgKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgicWksbGI2MCIpKQo+ID4gPiArICAgICAgICAg
ICAgICAgZ3Bpb2Rfc2V0X2FjdGl2ZV9oaWdoKG5hbmQtPmJ1c3lfZ3Bpbyk7ICAKPiA+Cj4gPiBX
aHkgbm90IG1vdmluZyB0aGlzIHF1aXJrIHRvIGdwaW9saWItb2YuYz8gIAo+IAo+IFRoYXQncyBh
IGJldHRlciBpZGVhIGhlcmUgSSB0aGluaywgaXQncyBjbGVhcmx5IGEgcXVpcmsgZm9yIGEKPiBi
dWdneSBkZXZpY2UgdHJlZS4KCkFncmVlZCwgaXQncyBqdXN0IGZvciBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5IHB1cnBvc2VzIGluIGEgc2luZ2xlCmRyaXZlci4gSSBiZWxpZXZlIGl0IHNob3VsZCBz
dGF5IGhlcmUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
