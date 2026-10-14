Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E986CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJeVIvYKuBo4CBvZAa/4VV/6n29qfpZsSeTEqyZUcI8=; b=eUYrOyIUn3HYbW
	3f498Np1XjWYUENjUb3Upc4Dqkt/OXP3si+M6bewEN2gcDfyCQ0iyQcIClECEnNk4HE8kX3mfEphR
	ZPl/F7PaqrrPFzIkzWs/Y5HqpzFBg+74ajfBPBSn3tJGzzK+Xy6fXVZs+FULgRaCev/lNJfIonqbg
	FtZecmImyA3MQ+3daLTsGsZWbn8Q5QZmANkulDfBeUszpoQ0+smRlEAFamOy9AkqnYy0tDVjEbKFm
	XWNTEue08/XriS7dByhjurdKKT3qevhDlHuFoSOhpsyOMjVAhzXfPmhr/JeiiAsPoLR/WMAihPG/3
	eO0Jn31wXOsV/d17iO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuIN-0000000Eska-2rNx;
	Wed, 14 Oct 2026 08:25:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuIH-0000000Esiq-3uh6
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 08:25:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2827C4E41206;
	Wed, 14 Oct 2026 08:24:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDFC560368;
	Wed, 14 Oct 2026 08:24:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 580D410328AD7;
	Wed, 14 Oct 2026 10:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791966296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=71Unaai47oG9YWYzUALaY8suroh2hCKw55TRbaM+FLs=;
	b=vT5EQd1MnqSBdw1Q7dPnBerAu3+c0LwJ5E1sTPFCAz/lrxhWfp0OghOLqG/V0lTbA/Q86g
	ogJQYwENzzJ8G3wmxtpYlwhZZD0E1Qq5v/YJ6Cypn0DfQLxB2IE2IF/TOwxzzUeYC8MI2S
	STWXHN0eRen4GTraP/AcqTOPi0KD4oZ0YkeeW+YdHnXZukhQNe/6qwnVuyIZdvetF0ajVX
	kaaqD7qZ8Se0ZAbWXSqAE1sLs2wVb0RL1H+X23Qp4CjFH8aIHdXqvBphuAA5htbP4y2crq
	jepoS3URyqUY70n1NZGwNU9GT5U7kF3/oy/pU6xkhR4z//ZQvDrQc2PZ8YtQHA==
Message-ID: <73139fed463dc3c32ccccfddb84d0f500066401f.camel@bootlin.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Richard Weinberger	 <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown	 <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli"
	 <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, Bharat Bhushan	
 <bbhushan2@marvell.com>, Sunil Kovvuri Goutham <sgoutham@marvell.com>, 
 Tanmay Jagdale <tanmay@marvell.com>
Date: Wed, 14 Oct 2026 10:24:45 +0200
In-Reply-To: <87wlrlvbix.fsf@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
		<20261013141350.189996-2-paul.cercueil@bootlin.com>
		<sashiko-outbox-169898@kernel.org>
		<4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
	 <87wlrlvbix.fsf@bootlin.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_012503_128995_ADF0CEDA 
X-CRM114-Status: GOOD (  18.13  )
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

SGkgTWlxdcOobCwKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxNzo1NyArMDIwMCwgTWlx
dWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IEhpIFBhdWwsCj4gCj4gT24gMTMvMTAvMjAyNiBhdCAx
NzozMzozMiArMDIsIFBhdWwgQ2VyY3VlaWwgPHBhdWwuY2VyY3VlaWxAYm9vdGxpbi5jb20+Cj4g
d3JvdGU6Cj4gCj4gPiBIaSBTYXNoaWtvLAo+IAo+IDotKQo+IAo+ID4gPiA+IC0JCXJldCA9IHNw
aV9tZW1fYWNjZXNzX3N0YXJ0KG1lbSk7Cj4gPiA+ID4gKwkJaWYgKCFvcC0+cGFuaWNfd3JpdGUp
Cj4gPiA+ID4gKwkJCXJldCA9IHNwaV9tZW1fYWNjZXNzX3N0YXJ0KG1lbSk7Cj4gPiA+ID4gKwkJ
ZWxzZSBpZiAoY3Rsci0+YXV0b19ydW50aW1lX3BtKQo+ID4gPiA+ICsJCQlyZXQgPSBwbV9ydW50
aW1lX2dldF9pZl9hY3RpdmUoY3Rsci0KPiA+ID4gPiA+ZGV2LnBhcmVudCk7Cj4gPiA+ID4gwqAJ
CWlmIChyZXQpCj4gPiA+ID4gwqAJCQlyZXR1cm4gcmV0Owo+ID4gPiAKPiA+ID4gW1NldmVyaXR5
OiBIaWdoXQo+ID4gPiBJcyBpdCBzYWZlIHRvIGNhbGwgcG1fcnVudGltZV9nZXRfaWZfYWN0aXZl
KCkgaGVyZSBkdXJpbmcgYSBrZXJuZWwgcGFuaWM/Cj4gPiA+IAo+ID4gPiBwbV9ydW50aW1lX2dl
dF9pZl9hY3RpdmUoKSByZWxpZXMgb24gcG1fcnVudGltZV9nZXRfY29uZGl0aW9uYWwoKSwgd2hp
Y2gKPiA+ID4gdW5jb25kaXRpb25hbGx5IGFjcXVpcmVzIGRldi0+cG93ZXIubG9jayB2aWEgc3Bp
bl9sb2NrX2lycXNhdmUoKS4gSW4gYQo+ID4gPiBwYW5pYwo+ID4gPiBjb250ZXh0IHdpdGggTk1J
cyBvciBJUlFzIGRpc2FibGVkLCB0cnlpbmcgdG8gYWNxdWlyZSBhIHNwaW5sb2NrIHRoYXQgbWF5
Cj4gPiA+IGJlCj4gPiA+IGhlbGQgYnkgYSBoYWx0ZWQgQ1BVIGNhdXNlcyBhbiBpbmZpbml0ZSBz
cGluLiBPbiBQUkVFTVBUX1JULAo+ID4gPiBzcGluX2xvY2tfaXJxc2F2ZSgpCj4gPiA+IG1hcHMg
dG8gYSBzbGVlcGluZyBydF9tdXRleCwgd2hpY2ggaXMgc3RyaWN0bHkgZm9yYmlkZGVuIGluIGF0
b21pYwo+ID4gPiBjb250ZXh0Lgo+ID4gCj4gPiBBQ0ssIEknbGwganVzdCBkcm9wIHBtX3J1bnRp
bWVfZ2V0X2lmX2FjdGl2ZSgpIGhlcmUsIGFuZCByZXN0b3JlIHRoZSByZXR1cm4KPiA+IC0KPiA+
IEVPUE5PVFNVUFAgdGhhdCB3YXMgaW4gdjEgd2hlbiBjdGxyLT5hdXRvX3J1bnRpbWVfcG0gaXMg
c2V0Lgo+IAo+IFRoaXMgaXMgdHJpY2t5IGJ1dCBhdXRvbWF0aWNhbGx5IHJ1bGVzIG91dCBhYm91
dCAxLzZ0aCBvZiB0aGUKPiBjb250cm9sbGVycyAoNDUgY29udHJvbGxlcnMgc2V0IHRoaXMgYm9v
bGVhbiBvdXQgb2YgKzMwMCkuIEkgZG9uJ3QgbGlrZQo+IGl0IG11Y2guIEkgZ3Vlc3MgaXQgZGVz
ZXJ2ZXMgYSBjb21tZW50IGluIGNhc2Ugc29tZW9uZSBldmVyIHdhbnRzIHRvCj4gZW5hYmxlIHRo
aXMgZmVhdHVyZSBvbiB0aGVpciBhdXRvLVJQTS1lbmFibGVkIGNvbnRyb2xsZXIsIHRvIHVuZGVy
c3RhbmQKPiB3aHkgdGhpcyBpcyBub3QgcG9zc2libGUuIE15IGd1dCBmZWVsaW5nIGlzIHRoYXQg
dGhlIHJ1bnRpbWUgUE0gbGF5ZXIKPiBsYWNrcyBpdHMgb3duIHVuZGVyc3RhbmRpbmcgb2Ygd2hh
dCBhIHBhbmljIGlzLiBXZSBzaG91bGQsIEkgYmVsaWV2ZSwgYmUKPiBhYmxlIHRvIHF1ZXJ5IHRo
ZSB1c2FnZV9jb3VudCBvZiBhIGNvbnRyb2xsZXIgd2l0aG91dCB0YWtpbmcgdGhlIGxvY2sKPiBk
dXJpbmcgYSBwYW5pYyB3cml0ZS4KPiAKPiBOZXZlcnRoZWxlc3MsIGxldCdzIG1vdmUgZm9yd2Fy
ZCBhbmQgcmV0dXJuIGFuIGVycm9yIGZvciBub3cuCgpJIGd1ZXNzIEkgY2FuIHVzZSBwbV9ydW50
aW1lX2FjdGl2ZSgpIHRoZW4/CgpDaGVlcnMsCi1QYXVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
