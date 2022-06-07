Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2PR6DGjjOVUbUDtl6J25gO5dPCrP7+/9WP+RGvynBk=; b=Kun4LkQayOeQdU
	GrVClypqElOgj85U1BmlxxHW47ghX9npFgwnrrW7Mrmx6bJMEeNTL1uJGqFFLO/dXzm7qxti/aLvC
	eFZ3ErhBM0W/3nu2ORSdw32LCsSqgSGI0ptQOA4OJgtQ2l9XhxBIISLEQe8Mdeq12aUESZHE6+sCw
	220suNWnIq3+b9UDsdBM/99rkr+T5clC/exwT02iU26o0tlQWuqWxQVk++aIoeG2hlNRpzz3Be/hJ
	w4EhYJxNEZkLTRf/JPRqPnaotk7GUvBprocW4xZApOfH62BONhdq6LCvV4/gBgbgjC2BBBa4crmR4
	RzkVOa27wp1qG9LXfZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySUP-004xry-0c; Tue, 07 Jun 2022 06:14:53 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySUC-004xmw-Um; Tue, 07 Jun 2022 06:14:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F2A8460002;
	Tue,  7 Jun 2022 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654582479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAl13gIrMdZEVaeo5B+t0x+duX92xCWkgPyT9LAbqj0=;
	b=bFy25l4z9M+rJ9AL9pN4FHFs22rP7+xvOVBmlbjws9MGxEAN1L88rCsmYHT3DsAqS4w0io
	JBOR2a3j9mWEvFrf/yC1XyYzXLCyHo9mk6DfITKQ/HPno0ledGTevM/E/BRqSgKVTK0gln
	z0GfUpRxWSiH3NOLC19ouGhMTznv8tfaNz0X3OifKDSYvyEVPKwA1N9mzmOEjWbH+xkVMi
	hSSUITQBwCVdBqa9R+3lyF6TpoScreO2QEzLHL1A9QGBQWR4cx9ofINZ0OIXTLqb5oKrM+
	sCtCvXpCvyPQHCRvdNKR1MWUIhoB1tfUunSjZpbhLxm2zpADN0MuRKDCx8jUmQ==
Date: Tue, 7 Jun 2022 08:14:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Richard
 Weinberger <richard@nod.at>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Claudiu Beznea
 <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/14] mtd: rawnand: atmel: Warn about failure to
 unregister mtd device
Message-ID: <20220607081436.1d17f26b@xps-13>
In-Reply-To: <20220606193721.w2cjrnhtsvrkvumf@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
	<20220603210758.148493-9-u.kleine-koenig@pengutronix.de>
	<20220606151620.0282cece@xps-13>
	<20220606193721.w2cjrnhtsvrkvumf@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_231441_185391_6DE7C0A7 
X-CRM114-Status: GOOD (  18.74  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIE1vbiwgNiBK
dW4gMjAyMiAyMTozNzoyMSArMDIwMDoKCj4gT24gTW9uLCBKdW4gMDYsIDIwMjIgYXQgMDM6MTY6
MjBQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFV3ZSwKPiA+IAo+ID4gdS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIEZyaSwgIDMgSnVuIDIwMjIgMjM6
MDc6NTIgKzAyMDA6Cj4gPiAgIAo+ID4gPiBUaGUgTGludXggZGV2aWNlIGNvcmUgZG9lc24ndCBp
bnRlbmQgcmVtb3ZlIGNhbGxiYWNrcyB0byBmYWlsLiBJZiBhbgo+ID4gPiBlcnJvciBjb2RlIGlz
IHJldHVybmVkIHRoZSBkZXZpY2UgaXMgcmVtb3ZlZCBhbnlob3cuIFNvIHdhaWwgbG91ZGx5IGlm
Cj4gPiA+IHRoZSBhdG1lbCBzcGVjaWZpYyByZW1vdmUgY2FsbGJhY2sgZmFpbHMgYW5kIHJldHVy
biAwIGFueWhvdyB0byBzdXBwcmVzcwo+ID4gPiB0aGUgZ2VuZXJpYyAoYW5kIGxpdHRsZSBoZWxw
ZnVsKSBlcnJvciBtZXNzYWdlIGJ5IHRoZSBkZXZpY2UgY29yZS4KPiA+ID4gCj4gPiA+IEFsc28g
Y2hlY2sgdGhlIHJlbW92ZSBjYWxsYmFjayB0byBhY3R1YWxseSBleGlzdCBiZWZvcmUgY2FsbGlu
ZyBpdC4gVGhhdAo+ID4gPiBtaWdodCBoYXBwZW4gaWYgbmMtPmNhcHMtPm9wcyBwb2ludHMgdG8g
YXRtZWxfbmFuZF9jb250cm9sbGVyX29wcy4gIAo+ID4gCj4gPiBJIGJlbGlldmUgeW91IGdvdCBt
aXNsZWFkIGJ5IGdyZXBwaW5nIHRoZSBjb2RlIGJlY2F1c2UgdGhlcmUgaXM6Cj4gPiAKPiA+ICog
c3RydWN0IG5hbmRfY29udHJvbGxlcl9vcHMgYXRtZWxfbmFuZF9jb250cm9sbGVyX29wcyAgCj4g
PiAgIC0+IHRoaXMgaXMgYSBOQU5ELXdpZGUgY29udHJvbGxlciBvcHMgc3RydWN0dXJlICAKPiA+
IAo+ID4gKiBzdHJ1Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyX29wcyBhdG1lbF88c210Zz5fbmNf
b3BzICAKPiA+ICAgLT4gdGhpcyBpcyBhIGRyaXZlciBzcGVjaWZpYyBzdHJ1Y3R1cmUgdG8gcHJv
dmlkZSBkaWZmZXJlbnQgIAo+ID4gICAgICByZWdpc3RyYXRpb24gaGVscGVycy4KPiA+IAo+ID4g
VGhlIGxhdHRlciBhbHdheXMgcHJvdmlkZSBhIHByb2JlIGFuZCBhIHJlbW92ZSBpbXBsZW1lbnRh
dGlvbiwgc28gSQo+ID4gYmVsaWV2ZSB0aGUgYWRkaXRpb24gaWYgdGhlICJpZiAobmMtPmNhcHMt
Pm9wcy0+cmVtb3ZlKSIgY2hlY2sgaXMgbm90Cj4gPiByZWxldmFudCwgdW5sZXNzIEkgbWlzc2Vk
IHNvbWV0aGluZy4gIAo+IAo+IFlvdSdyZSByaWdodC4gSSBhc3N1bWUgaXQncyBlYXNpZXN0IGZv
ciB5b3UgaWYgSSBzZW5kIGEgdjIgd2l0aCBhbGwgMTQKPiBwYXRjaGVzPyBJZiB5b3UgY29uc2lk
ZXIgdGhpcyBhIHdhc3RlIG9mIGJ5dGVzLCBwbGVhc2UgYWR2aXNlLiBUaGUKPiBwYXRjaGVzIGFy
ZSBpbmRlcGVuZGFudCwgc28gaXQgd291bGQgd29yayBpZiB5b3UgcGljayB1cCAxLTcgKyA5LTE0
LAo+IHRvby4gVGhlbiBJJ2QgcmVzZW5kIGEgZml4ZWQgcGF0Y2ggOCBpbmRpdmlkdWFsbHkuCgpQ
bGVhc2UganVzdCByZXNlbmQgcGF0Y2ggOCwgSSdsbCBoYW5kbGUgaXQuCgo+IAo+IEJlc3QgcmVn
YXJkcwo+IFV3ZQo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
