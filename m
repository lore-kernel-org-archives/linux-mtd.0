Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E257CA9ED2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZYsukxkWueb2gYQVvF3xWt/KM/9Urx5b+6mV/NnOJg=; b=olBVrohnbwTyNl
	gFIxl3+8l8Z1LTycENRYAiJ4r7Vp3ohLgfBIkMw2ie35uF1n9PaKujrStfEIbNM4/feECkGaXWkDG
	ZFf60tbnOHmVHzffwScMVj9XMXjXFyqTDBHO6bQz3yQA6oyvlvP+S7MTfiVeUB/XT7fQbMxP+usga
	bCK2Anud4OB6FLcvQCEPvac7Te2JLlVC1wmR24O0p5gtqZ/wDCWRwppm3YmlqkUoszCjyDAiDMdSZ
	9zILb+l4xZl2Od7FZ3GjJShIA1Uq7HxwhcKXe4gs18g+0bGwsKIMSVO3Aza055cea28l/1J4Lt36l
	cYnWMIkqyPt/N/WmkWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY20-0000000CLVL-2Bgy;
	Tue, 13 Oct 2026 08:38:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY1r-0000000CLTz-3mbX
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 08:38:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7386E1A11F3;
	Tue, 13 Oct 2026 08:38:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45FB760362;
	Tue, 13 Oct 2026 08:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AF9F11D70D49;
	Tue, 13 Oct 2026 10:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791880712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+DQ5XhuQFUkS+jrGMmCGyWuQqerm6QYFmNhdS9TLPcY=;
	b=trUPMfwtL4EghKq6qZ44gN5sKerFIWChpxT7eMzei421yKAA8jTCalYH55cPojq4WVKWeL
	OAcDkrc4BCZl/ZOxsYoICikNTWjQ01XC42ZXnLHMRFhP3+NayydbuwR2Rx3N1RQ3SqD4/J
	gvLxB3lkzGuhnndlMt0uD4c8Xe3JyWY2g2Tn/0hk3a2CeM91j6FnOEbnAzBKr35edyQjvm
	1FpbHmvtr4Pljw38zn2bd8Ub4UTD/PJciOuP3RuqMljoOolfjqii7W+Q2+w3f5voZI/BGC
	rDgxG6SICt2euhCERCy85Izw1Csf6IkcEZCYz4Ap3gqtMdmFcaXiGXQSem28AQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Kees Cook <kees@kernel.org>,  Tony Luck
 <tony.luck@intel.com>,  "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-spi@vger.kernel.org,  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH 1/5] spi: spi-mem: Add support for panic mem writes
In-Reply-To: <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
	(Paul Cercueil's message of "Tue, 13 Oct 2026 10:25:07 +0200")
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
	<20261005081141.33688-2-paul.cercueil@bootlin.com>
	<asdVM883VTQy7WvH@sirena.co.uk>
	<5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 10:38:26 +0200
Message-ID: <87y0c2vvul.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_013836_104614_3692A237 
X-CRM114-Status: GOOD (  21.86  )
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

T24gMTMvMTAvMjAyNiBhdCAxMDoyNTowNyArMDIsIFBhdWwgQ2VyY3VlaWwgPHBhdWwuY2VyY3Vl
aWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBNYXJrLAo+Cj4gTGUgamV1ZGkgMDggb2N0b2Jy
ZSAyMDI2IMOgIDEwOjMyICswMjAwLCBNYXJrIEJyb3duIGEgw6ljcml0wqA6Cj4+IE9uIE1vbiwg
T2N0IDA1LCAyMDI2IGF0IDEwOjExOjM2QU0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4+
ID4gRnJvbTogVGFubWF5IEphZ2RhbGUgPHRhbm1heUBtYXJ2ZWxsLmNvbT4KPj4gPiAKPj4gPiBB
ZGQgYSAncGFuaWNfd3JpdGUnIGZsYWcgdG8gdGhlIGNvbnRyb2xsZXIncyBjYXBhYmlsaXRpZXMg
c3RydWN0Lgo+PiA+IFdoZW4gc2V0LCB0aGUgU1BJIGNvbnRyb2xsZXIgaW5kaWNhdGVzIHRoYXQg
aXQgd2lsbCBiZSBhYmxlIHRvIHNlbmQKPj4gPiBjb21tYW5kcyB0byBhIGNvbm5lY3RlZCBOT1Ig
b3IgTkFORCBtZW1vcnkgaW4gdGhlIGNvbnRleHQgb2YgYSBrZXJuZWwKPj4gPiBwYW5pYywgd2hp
Y2ggbWVhbnMgd2l0aG91dCBzbGVlcGluZyBhbmQgd2l0aG91dCByZWx5aW5nIG9uIElSUXMuCj4+
IAo+PiA+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+PiA+ICsrKyBiL2RyaXZlcnMvc3Bp
L3NwaS1tZW0uYwo+PiA+IEBAIC0zOTgsNiArMzk4LDMxIEBAIGludCBzcGlfbWVtX2V4ZWNfb3Ao
c3RydWN0IHNwaV9tZW0gKm1lbSwgY29uc3Qgc3RydWN0Cj4+ID4gc3BpX21lbV9vcCAqb3ApCj4+
ID4gwqAJdTggKnRtcGJ1ZjsKPj4gPiDCoAlpbnQgcmV0Owo+PiA+IMKgCj4+ID4gKwlpZiAob3At
PnBhbmljX3dyaXRlKSB7Cj4+ID4gKwkJaWYgKCFzcGlfbWVtX2NvbnRyb2xsZXJfaXNfY2FwYWJs
ZShjdGxyLCBwYW5pY193cml0ZSkpCj4+ID4gKwkJCXJldHVybiAtRU9QTk9UU1VQUDsKPj4gPiAr
CQkvKgo+PiA+ICsJCSAqIE9ubHkgc3VwcG9ydCBwYW5pYyB3cml0ZXMgaWYgd2UnbGwgZ28gdGhy
b3VnaAo+PiA+IC5leGVjX29wKCkuCj4+ID4gKwkJICogVGhlIHJlZ3VsYXIgU1BJIHBhdGggKHNw
aV9zeW5jKCksIGV0Yy4pIGV4cGxpY2l0bHkKPj4gPiBtZW50aW9ucwo+PiA+ICsJCSAqIHRoYXQg
aXQgY2FuIG9ubHkgYmUgdXNlZCBmcm9tIGEgY29udGV4dCB0aGF0IG1heSBzbGVlcCwKPj4gPiB3
aGljaAo+PiA+ICsJCSAqIGlzIG5vdCB0aGUgY2FzZSBvbiBhIGtlcm5lbCBwYW5pYy4KPj4gPiAr
CQkgKiBJZiB0aGlzIGNoYW5nZXMgaW4gdGhlIGZ1dHVyZSwgdGhpcyBjb3VsZCBiZSByZXdvcmtl
ZCwKPj4gPiBidXQKPj4gPiArCQkgKiBmb3Igbm93IHRoaXMgd2lsbCBoYXZlIHRvIGRvLgo+PiA+
ICsJCSAqLwo+PiAKPj4gVGhpcyBhbHNvIG5lZWRzIHRvIGVuc3VyZSB0aGF0IHRoZSBxdWV1ZSBp
cyBpZGxlIC0gd2UnbGwgc3RpbGwgZXhlY3V0ZQo+PiBzcGlfbWVtX2FjY2Vzc19zdGFydCgpIHdo
aWNoIGZsdXNoZXMgdGhlIHF1ZXVlLCBhbmQgd2UndmUgZ290IHJ1bnRpbWUgUE0KPj4gb3BlcmF0
aW9ucyB0aGVyZSB3aGljaCBtaWdodCBiZSBhIGJpdCBjaGFsbGVuZ2luZyBpbiBhIHBhbmljIHNp
dHVhdGlvbi4KPgo+IERvZXMgaXQgdGhvdWdoPyBUaGUga2VybmVsIGlzIHBhbmlja2luZyBzbyB0
aGUgcXVldWUgd29uJ3QgYmUgcHJvY2Vzc2VkIGFueW1vcmUsCj4gaXQgc2hvdWxkIGJlIGZpbmUg
dG8ganVzdCBpZ25vcmUgaXQuCj4KPiBBQ0sgZm9yIHRoZSBQTSAtIEkgdGhpbmsgaW4gdGhlIFYy
IEknbGwganVzdCBiYWlsIGlmIHRoZSBjb250cm9sbGVyIGhhcyBhdXRvLQo+IHJ1bnRpbWUtUE0g
b24uCgpNYXliZSBwbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoKT8gSWYgYWxyZWFkeSBhY3RpdmUg
aXQgcmV0dXJucyAxIGFuZAp5b3UgY2FuIHByb2NlZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
