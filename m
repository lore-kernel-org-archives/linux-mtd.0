Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09537CC6B16
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ck/ds45bgmei61nH/lHRBK5TPFMILVWhvmjtlbWjuto=; b=L4pqGWQUlHmIZL
	CsurhTmJr9QG1iZuPyedqNPoCazsdVoDBFEjq0Cn50tD3u8lMwEh9lh1inPYciI8mxVGeHHUM3To7
	bEKzNTZTgRkR75/6dthGVbioDM75C7ICQUQx3MxtbMn6PVfIDByUqbeNMXUczRmtxLy9cnBkPulPP
	avce51/G65yaLRvzoEK6EgIFR3Fv7KrorqurLKushgwM6XKiVLW+wi7qEu6guitAhO9dbjTdaiqSc
	b6vGsAR+4yHq5UyN8TFSd33YvNWH8DegsLjFRQmqdpFwJFd1Huk4Oy6qU7rcTiLuc4EsYCtjy3uwr
	ONl7FlrgZGaL7S4VODFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGecA-0000000DNrx-0O4k;
	Tue, 13 Oct 2026 15:40:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGec7-0000000DNpa-1tVS
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 15:40:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AEC22C653F1;
	Tue, 13 Oct 2026 15:41:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E07360362;
	Tue, 13 Oct 2026 15:40:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5508411D70CE0;
	Tue, 13 Oct 2026 17:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791906019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YrA4Pi+VskucaUDlqdfjiorhF+qsnusYmhp68e1bar8=;
	b=ZUfIQk8WOmtRYv68v2X1Svgn8saXrU3FyW8wo3VNrYKhWozt7HSaE2y9raP+AiBHnHriZ+
	5wjJO+IACJnGCeJPUmDxM1/N7Upq9R/L2qAUxyyyw7JJ7ByJuGscVwMoPL5epp00726DXy
	gMKSotx+7i46OUfATP85driG1VIghpN24yTX2921LRcaa4CRAPZgt6oqQ2s7ZFHMeUklIC
	zi6M2cvo3vES7s1JuQfPNRv5a7OAT4YliDP+KSgs68/+OP7RoItHQM0XtPCk4spdmQUrqf
	1Fg91kFiZzO4DFt8Vd8NpNMc8y0S6vAY0q0gK3Qh7boX5TGceXrxp/DborLDtQ==
Message-ID: <1c1db1ab1ac89e36b3a81d1a1cadc8b8bddbf614.camel@bootlin.com>
Subject: Re: [PATCH v2 5/7] spi: cadence-xspi: Add irq-less support
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
Date: Tue, 13 Oct 2026 17:40:12 +0200
In-Reply-To: <sashiko-outbox-169916@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-6-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169916@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084027_666078_391F9F01 
X-CRM114-Status: GOOD (  15.45  )
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

SGkgU2FzaGlrbywKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxNDozMyArMDAwMCwgc2Fz
aGlrby1ib3RAa2VybmVsLm9yZyBhIMOpY3JpdMKgOgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250
cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDQgcG90ZW50aWFsIGlzc3VlKHMpCj4g
dG8gY29uc2lkZXI6Cj4gLSBbSGlnaF0gc3BpOiBjYWRlbmNlLXhzcGk6IDFtcyBwb2xsaW5nIHRp
bWVvdXQgaXMgdG9vIHNob3J0IGZvciBsYXJnZSBTVElHCj4gdHJhbnNmZXJzCj4gLSBbSGlnaF0g
c3BpOiBjYWRlbmNlLXhzcGk6IHN0YWxlIGNvbXBsZXRpb24gc3RhdGUgYWZ0ZXIgZWFybHkgYWJv
cnQgb3IKPiBkb3VibGUtY29tcGxldGlvbgo+IC0gW0hpZ2hdIHNwaTogY2FkZW5jZS14c3BpOiBt
aXNzaW5nIFNETUEgZXJyb3IgY2hlY2sgaW4gcG9sbGluZyBtb2RlCj4gLSBbSGlnaF0gc3BpOiBj
YWRlbmNlLXhzcGk6IHNwdXJpb3VzIGNvbXBsZXRpb25zIGZyb20gdW5jbGVhcmVkIHBvbGxpbmcg
c3RhdHVzCj4gLS0KPiAKPiBjb21taXQgMTZlYmFiOTE0MjNjZTkzOWY4NTJjNDg2MDdiNTE4ZjI5
NjM0YjUzOAo+IEF1dGhvcjogVGFubWF5IEphZ2RhbGUgPHRhbm1heUBtYXJ2ZWxsLmNvbT4KPiAK
PiBzcGk6IGNhZGVuY2UteHNwaTogQWRkIGlycS1sZXNzIHN1cHBvcnQKPiAKPiBNYWtlIHRoZSBp
bnRlcnJ1cHQgbGluZSBvcHRpb25hbC4gSWYgbm90IHByb3ZpZGVkLCB0aGUgZHJpdmVyIHdpbGwK
PiBpbnN0ZWFkIHJlc29ydCB0byBwb2xsaW5nIHJlZ2lzdGVycy4KPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5j
ZS14c3BpLmMKPiA+IGluZGV4IDA5NWJmNjQwYjM3OWEuLjE4NWRmZmRhNTRiYmQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMKPiA+ICsrKyBiL2RyaXZlcnMv
c3BpL3NwaS1jYWRlbmNlLXhzcGkuYwo+ID4gQEAgLTM2NSw2ICszNjUsMzkgQEAgc3RhdGljIGlu
dCBjZG5zX3hzcGlfd2FpdF9mb3JfY29udHJvbGxlcl9pZGxlKHN0cnVjdAo+ID4gY2Ruc194c3Bp
X2RldiAqY2Ruc194c3BpKQo+ID4gwqAJCQkJCcKgIDEwMCwgMTAwMCk7Cj4gPiDCoH0KPiA+IMKg
Cj4gPiArc3RhdGljIGJvb2wgY2Ruc194c3BpX2lzX3N0aWdfcmVhZHkoc3RydWN0IGNkbnNfeHNw
aV9kZXYgKmNkbnNfeHNwaSwgYm9vbAo+ID4gc2xlZXApCj4gPiArewo+ID4gKwl1MzIgY3RybF9z
dGF0Owo+ID4gKwo+ID4gKwlyZXR1cm4gIXJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0Cj4gPiAr
CQkoY2Ruc194c3BpLT5pb2Jhc2UgKyBDRE5TX1hTUElfQ1RSTF9TVEFUVVNfUkVHLAo+ID4gKwkJ
Y3RybF9zdGF0LAo+ID4gKwkJKChjdHJsX3N0YXQgJiBCSVQoMykpID09IDApLAo+ID4gKwkJc2xl
ZXAgPyBNUlZMX1hTUElfUE9MTF9ERUxBWV9VUyA6IDAsCj4gPiArCQlzbGVlcCA/IE1SVkxfWFNQ
SV9QT0xMX1RJTUVPVVRfVVMgOiAwKTsKPiAKPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gRG9lcyB0aGlz
IHBvbGxpbmcgbG9vcCBsZWF2ZSB0aGUgQ0ROU19YU1BJX1NUSUdfRE9ORSBiaXQgdW5jbGVhcmVk
IGluCj4gSU5UUl9TVEFUVVNfUkVHPwo+IAo+IElmIGEgc2hhcmVkIElSUSBmaXJlcyBsYXRlciwg
Y2Ruc194c3BpX2lycV9oYW5kbGVyKCkgd2lsbCBzZWUgdGhlIHVuY2xlYXJlZAo+IENETlNfWFNQ
SV9TVElHX0RPTkUgYml0IGFuZCBjYWxsIGNvbXBsZXRlKCZjZG5zX3hzcGktPmNtZF9jb21wbGV0
ZSkuIFRoaXMgY2FuCj4gY29ycnVwdCB0aGUgY29tcGxldGlvbiBjb3VudGVyIGFuZCBjYXVzZSBz
dWJzZXF1ZW50IGNvbW1hbmRzIHRvIHByZW1hdHVyZWx5Cj4gcmV0dXJuIGZyb20gd2FpdF9mb3Jf
Y29tcGxldGlvbigpLgoKV2hldGhlciBvciBub3QgdGhpcyBpcyB0cnVlLCBpdCBpcyBpcnJlbGV2
YW50IGZvciB0aGlzIHBhdGNoc2V0LCB0aGlzIGNvZGUgaXMKanVzdCBiZWluZyBtb3ZlZCBhcm91
bmQgdGhlIGRyaXZlciB3aXRob3V0IGNoYW5nZXMuCgpDaGVlcnMsCi1QYXVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
