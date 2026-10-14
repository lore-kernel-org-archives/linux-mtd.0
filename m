Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C4ECC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19ypLE8HGDJnb8QRVYD+lTRnV0RVg5gwkpd6NqRioDo=; b=U0J3IIBV9fns94
	ILyshXcZijNGuyYro4wPN57xQuXU0wnEAo9vUqP425NTSMn28O8Nmf6+wT9VtUp5C0UH+S1IW8jL9
	qVoDdhEnlhzoGhEL/5WctISPGD/9j9AU/IH6V9S3uo+Tb3dTzgovII9KiPiaLjP8DhXYP9DszTMOb
	GDGmgwT3+xUnR8YhPfxDtZ98HvvGWLmW8cuu+s03Md2A6hpWHhaK6fzosbFBHJVbjIl2UuPc4t/r+
	Bh3pZKpFrVN1BNRDlX0rdI5xTfqxqiia22NgIqR4nQ8Dmlme9jfanNEl/SbDWVR4+LZs1kWw01o/m
	t3ZR33RLDJT+Nt8pwCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGula-0000000Ex8q-3qAW;
	Wed, 14 Oct 2026 08:55:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGulR-0000000Ex83-0xlK
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 08:55:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C97B91A1225;
	Wed, 14 Oct 2026 08:55:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 907C660368;
	Wed, 14 Oct 2026 08:55:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5E78103286A7;
	Wed, 14 Oct 2026 10:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791968104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p1ESfnGJs632WJQwDweeEKBejwXJXmPDIvvHT8ekolo=;
	b=qoM3nBbU7T4hs5LrPD56Yg1Uidle/RVUP5cbW/a7PJaA/jWSyc/z7YKUWKWt3fQOv3ylNJ
	auQl7PxshL80uMOhPny71WP06UzMVP7OQcgCSTwD1yU+n9Fi27Z5ZgLoeXdn7VqTF5vk2+
	FygxKKNluMWd3wOEYeb6lhQFt9vaVgzNtPKhHVY1AMPdnjoeVqExQ+MflejRCiSEB6WRoI
	kUpWs9RNjd2F/eMl+xgDJ2s4rpfZmhpnW1npRj1zRO0VvOmuppfpf7Gjyz0aLkz12mGnSb
	q6udCSuHkCKUPy3B/meWQxZcLSCu8cO5dspyR1wT5MAJRz7i4k6ZM42eDD0+Xg==
Message-ID: <74b2030cb64f8c25f95d51894d3296f180a34e01.camel@bootlin.com>
Subject: Re: [PATCH 1/5] spi: spi-mem: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger	 <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Kees Cook <kees@kernel.org>, Tony Luck	
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, Tanmay Jagdale <tanmay@marvell.com>
Date: Wed, 14 Oct 2026 10:54:56 +0200
In-Reply-To: <629a4f32-2efe-4212-ac1f-f64c487caa63@sirena.org.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
	 <20261005081141.33688-2-paul.cercueil@bootlin.com>
	 <asdVM883VTQy7WvH@sirena.co.uk>
	 <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
	 <eb16cf0a-6b7e-4ea3-89c5-61ba0729492d@sirena.org.uk>
	 <0d2f1d4149cd136ace8c1f08dc48ea7f25c5975c.camel@bootlin.com>
	 <629a4f32-2efe-4212-ac1f-f64c487caa63@sirena.org.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_015509_432828_77A71783 
X-CRM114-Status: GOOD (  14.18  )
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

SGkgTWFyaywKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxNzowMCArMDEwMCwgTWFyayBC
cm93biBhIMOpY3JpdMKgOgo+IE9uIFR1ZSwgT2N0IDEzLCAyMDI2IGF0IDAxOjAwOjUwUE0gKzAy
MDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPiBMZSBtYXJkaSAxMyBvY3RvYnJlIDIwMjYgw6Ag
MTE6NDIgKzAxMDAsIE1hcmsgQnJvd24gYSDDqWNyaXTCoDoKPiAKPiA+ID4gRG8gdGhlIG90aGVy
IENQVXMga25vdyB0aGV5J3JlIHBhbmljaW5nIHlldCwgYW5kIHdoYXQgc3RhdGUgaXMgdGhlCj4g
PiA+IGhhcmR3YXJlIGluP8KgIEknbSBhIGJpdCBuZXJ2b3VzIGFib3V0IGFzc3VtaW5nIHBhbmlj
IGdvdCB0aGluZ3MgaW50byBhCj4gPiA+IGdvb2Qgc3RhdGUuCj4gCj4gPiBUaGUgb3RoZXIgQ1BV
cyBhcmUgc3RvcHBlZCwgeWVzLiBBdCB0aGF0IHBvaW50IHRoZXJlJ3Mgbm8gU01QLCBubwo+ID4g
cHJlZW1wdGlvbiwgbm8KPiA+IElSUXMsIG5vIHRpbWUgYWNjb3VudGluZy4KPiAKPiBNeSB3b3Jy
eSBpcyB3aGF0IGhhcHBlbnMgaWYgd2UgZGlkbid0IGFjdHVhbGx5IG1hbmFnZSB0byBzdG9wIHRo
ZSBvdGhlcgo+IENQVXMgLSBpbiB0aGVvcnkgd2UndmUgc2h1dCBldmVyeXRoaW5nIGRvd24sIGJ1
dCBJJ3ZlIGJlZW4gYnVybmVkIGJ5IHRoZQo+IGJ1ZyBiZWluZyBJUElzIGJyZWFraW5nLsKgIFBl
cmhhcHMgaXQncyBqdXN0IG5vdCB3b3J0aCB3b3JyeWluZyBhYm91dC4KCk15IHVuZGVyc3RhbmRp
bmcgaXMgdGhhdCB0aGUgcGFuaWMgaGFuZGxlcnMgYXJlIHdyaXR0ZW4gd2l0aCB0aGUgYXNzdW1w
dGlvbiB0aGF0CmV2ZXJ5dGhpbmcgaXMgc3RvcHBlZCwgaXQncyB1cCB0byB0aGUgY2FsbGluZyBj
b2RlIHRvIGVuc3VyZSB0aGF0IGl0IGlzIHRydWUuCgotUGF1bAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
