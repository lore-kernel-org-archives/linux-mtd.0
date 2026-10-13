Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273F8CC6B1A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XMvfvtEvIEuRNHS7PvrFt3nAUXV4B9ZN4mmHxO7i5k=; b=r0Ki49cdhMPJSG
	rFOhc1EPZ+6kFZsebQlHgk3Q6B1dQyNZLq4mZiucWIaM/Vz7B+MV9gQ2PMVxeTCyiekgEF4OwCrrY
	vRU16ZGwxpj+GgUFSIXk5T8rTjOabAmS7y2eVmTr7hM83qpocujd3SW21Xs/TqNChvslZRZYxgO5t
	5u2KeJNvZk0pTYXKjT15+XuvtoUlNuRuRd9GPaWmLk5TQi57cE0qL3z6GJc8PDmCrwLj1JcfFpSrK
	B+enKF5yibzQtuZFgwh4aoD8DtEGnzdtgSc/GhU+ITrFFmh/OitPzF67NUaRO1Y6I5FUEkBCqLX5k
	wD1Aqtcle7+7AExl+ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeVj-0000000DMCf-1Zd5;
	Tue, 13 Oct 2026 15:33:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeVg-0000000DM9Z-0QR8
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 15:33:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B1E5C653F0;
	Tue, 13 Oct 2026 15:34:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7C3260362;
	Tue, 13 Oct 2026 15:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F94111D717C0;
	Tue, 13 Oct 2026 17:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iy3kJahGWq1o0jLOI0ZcDiQpbjtGY/DRzRu+9LbaoPU=;
	b=YrEIUtWcyMlI1VG9RKkd56NP4TO8YW7eVh3aSwTMyE3lDTRJ5SAJvbQ/UD/4yD2Oze7nOb
	QcmmPtPQhECMaQG3JpMoJwlj0qxqYa1THbvd/ZtvFsVyNGkzEQxmk0H2bykmCCx1Gx77pT
	xVu7QNrcu9q+s3tOHkWNDegEBIjbK3P+Z6HS2cO4TaeAwdjeoFL+WUb6jzWfLSD9bYFRGm
	F4yAviaRBCHaaEAlUHEbAidBgsw0wOPW5BiL0WOVEimkMUrw7c4hPPEk2X4N2zvMnv5mx2
	Fh/GkFZV8FHUgDnZYfGW7SZG+DBe2+nYCo2eyf8/IBi+Vc1ECbmhIdSFPYc0Zw==
Message-ID: <4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: sashiko-reviews@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Miquel Raynal	 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
Date: Tue, 13 Oct 2026 17:33:32 +0200
In-Reply-To: <sashiko-outbox-169898@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-2-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169898@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_083348_323194_80CC24B0 
X-CRM114-Status: GOOD (  17.24  )
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

SGkgU2FzaGlrbywKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxNDoyMyArMDAwMCwgc2Fz
aGlrby1ib3RAa2VybmVsLm9yZyBhIMOpY3JpdMKgOgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250
cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlzc3VlKHMpCj4g
dG8gY29uc2lkZXI6Cj4gLSBbSGlnaF0gc3BpOiBzcGktbWVtOiBpbnZlcnRlZCBwbV9ydW50aW1l
X2dldF9pZl9hY3RpdmUoKSByZXR1cm4gY2hlY2sKPiAtIFtIaWdoXSBzcGk6IHNwaS1tZW06IGZh
bGxiYWNrIHBhdGggZGVhZGxvY2tzIGR1cmluZyBwYW5pY193cml0ZSBvbiAtCj4gRU9QTk9UU1VQ
UAo+IC0gW0hpZ2hdIHNwaTogZGVhZGxvY2sgaW4gcGFuaWMgY29udGV4dCBmcm9tIHBtX3J1bnRp
bWVfZ2V0X2lmX2FjdGl2ZSgpCj4gLS0KPiAKPiBjb21taXQgM2Q4MDFmZmI5ODQ2OGJkNGI2MWQy
MDQ4MDE0MGNlOGRiYmNmNGFlMgo+IEF1dGhvcjogVGFubWF5IEphZ2RhbGUgPHRhbm1heUBtYXJ2
ZWxsLmNvbT4KPiAKPiBzcGk6IHNwaS1tZW06IEFkZCBzdXBwb3J0IGZvciBwYW5pYyBtZW0gd3Jp
dGVzCj4gCj4gQWRkIGEgJ3BhbmljX3dyaXRlJyBmbGFnIHRvIHRoZSBjb250cm9sbGVyJ3MgY2Fw
YWJpbGl0aWVzIHN0cnVjdC4KPiBXaGVuIHNldCwgdGhlIFNQSSBjb250cm9sbGVyIGluZGljYXRl
cyB0aGF0IGl0IHdpbGwgYmUgYWJsZSB0byBzZW5kCj4gY29tbWFuZHMgdG8gYSBjb25uZWN0ZWQg
Tk9SIG9yIE5BTkQgbWVtb3J5IGluIHRoZSBjb250ZXh0IG9mIGEga2VybmVsCj4gcGFuaWMsIHdo
aWNoIG1lYW5zIHdpdGhvdXQgc2xlZXBpbmcgYW5kIHdpdGhvdXQgcmVseWluZyBvbiBJUlFzLgo+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYyBiL2RyaXZlcnMvc3BpL3Nw
aS1tZW0uYwo+ID4gaW5kZXggYjk0NjgwYjYwYWY5NS4uM2I2ZmE0NGU0NTUwNCAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1l
bS5jCj4gCj4gWyAuLi4gXQo+IAo+ID4gQEAgLTQyMCw3ICs0NDUsMTAgQEAgaW50IHNwaV9tZW1f
ZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3QKPiA+IHNwaV9tZW1fb3Ag
Km9wKQo+ID4gwqAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiA+IMKgCj4gPiDCoAlpZiAoY3Rsci0+
bWVtX29wcyAmJiBjdGxyLT5tZW1fb3BzLT5leGVjX29wICYmCj4gPiAhc3BpX2dldF9jc2dwaW9k
KG1lbS0+c3BpLCAwKSkgewo+ID4gLQkJcmV0ID0gc3BpX21lbV9hY2Nlc3Nfc3RhcnQobWVtKTsK
PiA+ICsJCWlmICghb3AtPnBhbmljX3dyaXRlKQo+ID4gKwkJCXJldCA9IHNwaV9tZW1fYWNjZXNz
X3N0YXJ0KG1lbSk7Cj4gPiArCQllbHNlIGlmIChjdGxyLT5hdXRvX3J1bnRpbWVfcG0pCj4gPiAr
CQkJcmV0ID0gcG1fcnVudGltZV9nZXRfaWZfYWN0aXZlKGN0bHItPmRldi5wYXJlbnQpOwo+ID4g
wqAJCWlmIChyZXQpCj4gPiDCoAkJCXJldHVybiByZXQ7Cj4gCj4gW1NldmVyaXR5OiBIaWdoXQo+
IElzIGl0IHNhZmUgdG8gY2FsbCBwbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoKSBoZXJlIGR1cmlu
ZyBhIGtlcm5lbCBwYW5pYz8KPiAKPiBwbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoKSByZWxpZXMg
b24gcG1fcnVudGltZV9nZXRfY29uZGl0aW9uYWwoKSwgd2hpY2gKPiB1bmNvbmRpdGlvbmFsbHkg
YWNxdWlyZXMgZGV2LT5wb3dlci5sb2NrIHZpYSBzcGluX2xvY2tfaXJxc2F2ZSgpLiBJbiBhIHBh
bmljCj4gY29udGV4dCB3aXRoIE5NSXMgb3IgSVJRcyBkaXNhYmxlZCwgdHJ5aW5nIHRvIGFjcXVp
cmUgYSBzcGlubG9jayB0aGF0IG1heSBiZQo+IGhlbGQgYnkgYSBoYWx0ZWQgQ1BVIGNhdXNlcyBh
biBpbmZpbml0ZSBzcGluLiBPbiBQUkVFTVBUX1JULAo+IHNwaW5fbG9ja19pcnFzYXZlKCkKPiBt
YXBzIHRvIGEgc2xlZXBpbmcgcnRfbXV0ZXgsIHdoaWNoIGlzIHN0cmljdGx5IGZvcmJpZGRlbiBp
biBhdG9taWMgY29udGV4dC4KCkFDSywgSSdsbCBqdXN0IGRyb3AgcG1fcnVudGltZV9nZXRfaWZf
YWN0aXZlKCkgaGVyZSwgYW5kIHJlc3RvcmUgdGhlIHJldHVybiAtCkVPUE5PVFNVUFAgdGhhdCB3
YXMgaW4gdjEgd2hlbiBjdGxyLT5hdXRvX3J1bnRpbWVfcG0gaXMgc2V0LgoKPiBbU2V2ZXJpdHk6
IEhpZ2hdCj4gSWYgdGhlIGNvbnRyb2xsZXIncyBleGVjX29wIGltcGxlbWVudGF0aW9uIGR5bmFt
aWNhbGx5IHJldHVybnMgLUVPUE5PVFNVUFAKPiBkdXJpbmcgYSBwYW5pYyB3cml0ZSwgY291bGQg
dGhpcyBmYWxsYmFjayBwYXRoIGNhdXNlIGEgZGVhZGxvY2s/CgpHb29kIHBvaW50LCBkZWFyIGJv
dC4gV2UgZG8gbm90IHdhbnQgdG8gZ28gdG8gdGhlIGZhbGxiYWNrIGNvZGUuCgpDaGVlcnMsCi1Q
YXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
