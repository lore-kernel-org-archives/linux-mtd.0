Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C0ECC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d04wBftPGoYA+JiXsEKo5Tkfzp+tHDjWbcTFiS6iFQ=; b=AIH3MMHLc48bKd
	dMaT7FrzRZkDFAkqlWuS8DxxezypDBTSmdRlslbvCPcDNaEZlmuLgqMj3gYZsLIiad2DoE8OMya6f
	FrbcyRCYe8k5An2PA9GBXfUdEmdjZrx8+6ySB5/Cvfq3A3CkFgvbz/gc5dgZx5Y5axjq1I+MqAJNk
	EJwZavjKF4vnfLHVEjdHBesOsyQ1rMUSkGIRwNjaiZN+kBcUmVh5I5z2xWuiNzJTJ074Q7rjVPh4N
	dQ43uhaJp9JPT44hJ4h0nBPIYF1ghQiIdrF/4pn9Uk6G/ZLS+7ZtgrgaznuZ7tsaT7x0GNi49UQqf
	5THrnfXzdudtXBp+9xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGesn-0000000DRbd-1N9A;
	Tue, 13 Oct 2026 15:57:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGesk-0000000DRaZ-1f1u
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 15:57:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 152DD1A1215;
	Tue, 13 Oct 2026 15:57:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9A4060362;
	Tue, 13 Oct 2026 15:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFBC211D7163B;
	Tue, 13 Oct 2026 17:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791907053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XmDIt57YK7EFzUiQBbov5dyO/IGnGYJ7e2nfQyFl2Xk=;
	b=aA49FrBjEavkaHu0veD8qFOVER3plJoBrfelUdhA6EapWy27npdqBjv/PvTD+WSc9e4OxH
	FqyCZDB/GCgSqWFY0W2XonigdCnd42jHLZ2uoWra2xDXyXJO4PUVkblFs3tKBLgUc3iptw
	asrDi3uu3hsa4fq1bv6yb1p+gt2u66qAwTqZaKDHS3N0h6S1ZKqP5d5zTiTfeuqhftXm6b
	Tuw1MvI+uEgwF3gqJC10yEt53Fi1KhnsSt2mUxxA3Uj9ig/3OdrHt93yt7z9wLmzE2eceI
	Qn1C0OqYxSeBDLpqM6sq1tmqpuV0Pe3gJ31uaN7Qcpf5Dbu74BtJNcBiw3WjIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Mark Brown <broonie@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Kees Cook
 <kees@kernel.org>,  Tony Luck <tony.luck@intel.com>,  "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>,  linux-mtd@lists.infradead.org,  Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham
 <sgoutham@marvell.com>,  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
In-Reply-To: <4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
	(Paul Cercueil's message of "Tue, 13 Oct 2026 17:33:32 +0200")
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	<20261013141350.189996-2-paul.cercueil@bootlin.com>
	<sashiko-outbox-169898@kernel.org>
	<4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 17:57:26 +0200
Message-ID: <87wlrlvbix.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_085738_572306_8EDF9F42 
X-CRM114-Status: GOOD (  10.96  )
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

SGkgUGF1bCwKCk9uIDEzLzEwLzIwMjYgYXQgMTc6MzM6MzIgKzAyLCBQYXVsIENlcmN1ZWlsIDxw
YXVsLmNlcmN1ZWlsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgU2FzaGlrbywKCjotKQoKPj4g
PiAtCQlyZXQgPSBzcGlfbWVtX2FjY2Vzc19zdGFydChtZW0pOwo+PiA+ICsJCWlmICghb3AtPnBh
bmljX3dyaXRlKQo+PiA+ICsJCQlyZXQgPSBzcGlfbWVtX2FjY2Vzc19zdGFydChtZW0pOwo+PiA+
ICsJCWVsc2UgaWYgKGN0bHItPmF1dG9fcnVudGltZV9wbSkKPj4gPiArCQkJcmV0ID0gcG1fcnVu
dGltZV9nZXRfaWZfYWN0aXZlKGN0bHItPmRldi5wYXJlbnQpOwo+PiA+IMKgCQlpZiAocmV0KQo+
PiA+IMKgCQkJcmV0dXJuIHJldDsKPj4gCj4+IFtTZXZlcml0eTogSGlnaF0KPj4gSXMgaXQgc2Fm
ZSB0byBjYWxsIHBtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSgpIGhlcmUgZHVyaW5nIGEga2VybmVs
IHBhbmljPwo+PiAKPj4gcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKCkgcmVsaWVzIG9uIHBtX3J1
bnRpbWVfZ2V0X2NvbmRpdGlvbmFsKCksIHdoaWNoCj4+IHVuY29uZGl0aW9uYWxseSBhY3F1aXJl
cyBkZXYtPnBvd2VyLmxvY2sgdmlhIHNwaW5fbG9ja19pcnFzYXZlKCkuIEluIGEgcGFuaWMKPj4g
Y29udGV4dCB3aXRoIE5NSXMgb3IgSVJRcyBkaXNhYmxlZCwgdHJ5aW5nIHRvIGFjcXVpcmUgYSBz
cGlubG9jayB0aGF0IG1heSBiZQo+PiBoZWxkIGJ5IGEgaGFsdGVkIENQVSBjYXVzZXMgYW4gaW5m
aW5pdGUgc3Bpbi4gT24gUFJFRU1QVF9SVCwKPj4gc3Bpbl9sb2NrX2lycXNhdmUoKQo+PiBtYXBz
IHRvIGEgc2xlZXBpbmcgcnRfbXV0ZXgsIHdoaWNoIGlzIHN0cmljdGx5IGZvcmJpZGRlbiBpbiBh
dG9taWMgY29udGV4dC4KPgo+IEFDSywgSSdsbCBqdXN0IGRyb3AgcG1fcnVudGltZV9nZXRfaWZf
YWN0aXZlKCkgaGVyZSwgYW5kIHJlc3RvcmUgdGhlIHJldHVybiAtCj4gRU9QTk9UU1VQUCB0aGF0
IHdhcyBpbiB2MSB3aGVuIGN0bHItPmF1dG9fcnVudGltZV9wbSBpcyBzZXQuCgpUaGlzIGlzIHRy
aWNreSBidXQgYXV0b21hdGljYWxseSBydWxlcyBvdXQgYWJvdXQgMS82dGggb2YgdGhlCmNvbnRy
b2xsZXJzICg0NSBjb250cm9sbGVycyBzZXQgdGhpcyBib29sZWFuIG91dCBvZiArMzAwKS4gSSBk
b24ndCBsaWtlCml0IG11Y2guIEkgZ3Vlc3MgaXQgZGVzZXJ2ZXMgYSBjb21tZW50IGluIGNhc2Ug
c29tZW9uZSBldmVyIHdhbnRzIHRvCmVuYWJsZSB0aGlzIGZlYXR1cmUgb24gdGhlaXIgYXV0by1S
UE0tZW5hYmxlZCBjb250cm9sbGVyLCB0byB1bmRlcnN0YW5kCndoeSB0aGlzIGlzIG5vdCBwb3Nz
aWJsZS4gTXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCB0aGUgcnVudGltZSBQTSBsYXllcgpsYWNrcyBp
dHMgb3duIHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCBhIHBhbmljIGlzLiBXZSBzaG91bGQsIEkgYmVs
aWV2ZSwgYmUKYWJsZSB0byBxdWVyeSB0aGUgdXNhZ2VfY291bnQgb2YgYSBjb250cm9sbGVyIHdp
dGhvdXQgdGFraW5nIHRoZSBsb2NrCmR1cmluZyBhIHBhbmljIHdyaXRlLgoKTmV2ZXJ0aGVsZXNz
LCBsZXQncyBtb3ZlIGZvcndhcmQgYW5kIHJldHVybiBhbiBlcnJvciBmb3Igbm93LgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
