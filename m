Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AEECC6B03
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNncWs3EraYzlXQ/fWRMP9A0gFMjGKCvhB/+F4V3vhY=; b=VR7NaujHtjKsrI
	xRCdaA9oJA8rrf9Kp3UWOSEWzlkbvVFqVQAA73v6x0TMqaOVwoW0yXQy1fm6sToc4OkjoImJNyNtw
	gLeFQ6wytbiACW0Y2MuaTs88maariiyurclctTzyqvSKTo5BhieIpM4rNR2XRHTHUaww6uyVUbRKa
	U8PN20+Bow8OsE8W5+ocucx31AIMgXXH3T4OWaoNX/bQK4DHhBVxh2cbhTYewZuyHIUGINknAVE5y
	tdMAxb4r5G1lNesMxIewo4cUdiYIy/SfZUlay0HsINXEHpirnfN4XPw3vxut0pZnBLcjzY56jEQ89
	w5CzAKZAwfq+bduWw/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYBc-0000000CN69-08YT;
	Tue, 13 Oct 2026 08:48:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYBX-0000000CN4z-0NCG
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 08:48:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E351C653DE;
	Tue, 13 Oct 2026 08:49:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 181EA60362;
	Tue, 13 Oct 2026 08:48:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C672711D70DB5;
	Tue, 13 Oct 2026 10:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791881310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OhT44PlVEOFxx/Urz74a4tJMDTePj5JjWblo67Df0Eg=;
	b=Lv+DzNHgur1CsfADLNUBDSzYO1Kh1Eh0cOqqwK2omkinCgrkYWdS5snKxVxrkgJ8Hxxf9J
	JbjXDHFBZ+SVPeUIDTVYUukXfjU3AY9j8PZV6MWtI0YUaU9Qj3+sMC1iANNNp2tx5l3F7S
	rJdFtqKPQOmx95oUbcX5idb8i8St3FNk6TWED4R96yrz/Ux5r1vhrdaXn7tb/1pw2+0EwN
	RFVk+vC/2aulHMvCbSibATW9wBgkuua2sB4IpDB4OU5vyP4Hs4Uph3o6lAQ8+B0Sz8VYBk
	+JBpv3OrpNp+l4pF/PDcGgxQ4HtLeEVSRjmkA+z2ssPfpiHKVyaw61Xj2AGmiQ==
Message-ID: <60d100d6207660535e0dec5a9ae2a15555c2e181.camel@bootlin.com>
Subject: Re: [PATCH 1/5] spi: spi-mem: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Richard Weinberger	 <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Kees Cook <kees@kernel.org>, Tony Luck	
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, Tanmay Jagdale <tanmay@marvell.com>
Date: Tue, 13 Oct 2026 10:48:22 +0200
In-Reply-To: <87y0c2vvul.fsf@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
		<20261005081141.33688-2-paul.cercueil@bootlin.com>
		<asdVM883VTQy7WvH@sirena.co.uk>
		<5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
	 <87y0c2vvul.fsf@bootlin.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_014835_291777_C1CE56D1 
X-CRM114-Status: GOOD (  28.38  )
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

SGkgTWlxdcOobCwKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxMDozOCArMDIwMCwgTWlx
dWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IE9uIDEzLzEwLzIwMjYgYXQgMTA6MjU6MDcgKzAyLCBQ
YXVsIENlcmN1ZWlsIDxwYXVsLmNlcmN1ZWlsQGJvb3RsaW4uY29tPgo+IHdyb3RlOgo+IAo+ID4g
SGkgTWFyaywKPiA+IAo+ID4gTGUgamV1ZGkgMDggb2N0b2JyZSAyMDI2IMOgIDEwOjMyICswMjAw
LCBNYXJrIEJyb3duIGEgw6ljcml0wqA6Cj4gPiA+IE9uIE1vbiwgT2N0IDA1LCAyMDI2IGF0IDEw
OjExOjM2QU0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPiA+ID4gRnJvbTogVGFubWF5
IEphZ2RhbGUgPHRhbm1heUBtYXJ2ZWxsLmNvbT4KPiA+ID4gPiAKPiA+ID4gPiBBZGQgYSAncGFu
aWNfd3JpdGUnIGZsYWcgdG8gdGhlIGNvbnRyb2xsZXIncyBjYXBhYmlsaXRpZXMgc3RydWN0Lgo+
ID4gPiA+IFdoZW4gc2V0LCB0aGUgU1BJIGNvbnRyb2xsZXIgaW5kaWNhdGVzIHRoYXQgaXQgd2ls
bCBiZSBhYmxlIHRvIHNlbmQKPiA+ID4gPiBjb21tYW5kcyB0byBhIGNvbm5lY3RlZCBOT1Igb3Ig
TkFORCBtZW1vcnkgaW4gdGhlIGNvbnRleHQgb2YgYSBrZXJuZWwKPiA+ID4gPiBwYW5pYywgd2hp
Y2ggbWVhbnMgd2l0aG91dCBzbGVlcGluZyBhbmQgd2l0aG91dCByZWx5aW5nIG9uIElSUXMuCj4g
PiA+IAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4gPiA+IEBAIC0zOTgsNiArMzk4LDMxIEBAIGludCBzcGlf
bWVtX2V4ZWNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwgY29uc3QKPiA+ID4gPiBzdHJ1Y3QKPiA+
ID4gPiBzcGlfbWVtX29wICpvcCkKPiA+ID4gPiDCoAl1OCAqdG1wYnVmOwo+ID4gPiA+IMKgCWlu
dCByZXQ7Cj4gPiA+ID4gwqAKPiA+ID4gPiArCWlmIChvcC0+cGFuaWNfd3JpdGUpIHsKPiA+ID4g
PiArCQlpZiAoIXNwaV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIHBhbmljX3dyaXRl
KSkKPiA+ID4gPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+ICsJCS8qCj4gPiA+ID4g
KwkJICogT25seSBzdXBwb3J0IHBhbmljIHdyaXRlcyBpZiB3ZSdsbCBnbyB0aHJvdWdoCj4gPiA+
ID4gLmV4ZWNfb3AoKS4KPiA+ID4gPiArCQkgKiBUaGUgcmVndWxhciBTUEkgcGF0aCAoc3BpX3N5
bmMoKSwgZXRjLikgZXhwbGljaXRseQo+ID4gPiA+IG1lbnRpb25zCj4gPiA+ID4gKwkJICogdGhh
dCBpdCBjYW4gb25seSBiZSB1c2VkIGZyb20gYSBjb250ZXh0IHRoYXQgbWF5Cj4gPiA+ID4gc2xl
ZXAsCj4gPiA+ID4gd2hpY2gKPiA+ID4gPiArCQkgKiBpcyBub3QgdGhlIGNhc2Ugb24gYSBrZXJu
ZWwgcGFuaWMuCj4gPiA+ID4gKwkJICogSWYgdGhpcyBjaGFuZ2VzIGluIHRoZSBmdXR1cmUsIHRo
aXMgY291bGQgYmUKPiA+ID4gPiByZXdvcmtlZCwKPiA+ID4gPiBidXQKPiA+ID4gPiArCQkgKiBm
b3Igbm93IHRoaXMgd2lsbCBoYXZlIHRvIGRvLgo+ID4gPiA+ICsJCSAqLwo+ID4gPiAKPiA+ID4g
VGhpcyBhbHNvIG5lZWRzIHRvIGVuc3VyZSB0aGF0IHRoZSBxdWV1ZSBpcyBpZGxlIC0gd2UnbGwg
c3RpbGwgZXhlY3V0ZQo+ID4gPiBzcGlfbWVtX2FjY2Vzc19zdGFydCgpIHdoaWNoIGZsdXNoZXMg
dGhlIHF1ZXVlLCBhbmQgd2UndmUgZ290IHJ1bnRpbWUgUE0KPiA+ID4gb3BlcmF0aW9ucyB0aGVy
ZSB3aGljaCBtaWdodCBiZSBhIGJpdCBjaGFsbGVuZ2luZyBpbiBhIHBhbmljIHNpdHVhdGlvbi4K
PiA+IAo+ID4gRG9lcyBpdCB0aG91Z2g/IFRoZSBrZXJuZWwgaXMgcGFuaWNraW5nIHNvIHRoZSBx
dWV1ZSB3b24ndCBiZSBwcm9jZXNzZWQKPiA+IGFueW1vcmUsCj4gPiBpdCBzaG91bGQgYmUgZmlu
ZSB0byBqdXN0IGlnbm9yZSBpdC4KPiA+IAo+ID4gQUNLIGZvciB0aGUgUE0gLSBJIHRoaW5rIGlu
IHRoZSBWMiBJJ2xsIGp1c3QgYmFpbCBpZiB0aGUgY29udHJvbGxlciBoYXMKPiA+IGF1dG8tCj4g
PiBydW50aW1lLVBNIG9uLgo+IAo+IE1heWJlIHBtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSgpPyBJ
ZiBhbHJlYWR5IGFjdGl2ZSBpdCByZXR1cm5zIDEgYW5kCj4geW91IGNhbiBwcm9jZWVkLgoKWWVz
LCBnb29kIGlkZWEuCgpDaGVlcnMsCi1QYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
