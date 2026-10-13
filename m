Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBBBCC6B10
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gd+v528y+xJy2enj4zCGzUQtyIIjSdBiH2r1ATuzKE=; b=ZCpmGsvMSNPxaq
	Q8UEN51bvy0AyjHOKEUrwBa7S3KsynciY3gfBI7fXFTI0R8sqHB9gDvyBMqanS/UvFpGzjXFXa5P8
	9EA9Pe1QYv6XdZb9jn47Ou5dnBk8kxLI0mnFo/V9Iap8LX9pkaXFWu50y9N97mOrATrOdSF+xUXyC
	vMKxppImlErCuq+9OL+B+Dje85f2bBj1K+4LJ83U/XOHBJtUHSSirdCYgkHWbaouo38ymFkG4eCJl
	mqlAYbWVXmMDOtdQroBQXHjAlP/BoebtL3z/WOQtMot05ZS8lAtKhgBFzjdN1r7NuGAsgG4ri2+jU
	8gxABPsi0YXIHCOHC/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXpC-0000000CKDa-0SFL;
	Tue, 13 Oct 2026 08:25:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXp5-0000000CKBX-38AR
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 08:25:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A01691A1110;
	Tue, 13 Oct 2026 08:25:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C2DC60362;
	Tue, 13 Oct 2026 08:25:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8960211D70602;
	Tue, 13 Oct 2026 10:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791879917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1PoPJ3DJcosvCsZQEhxoej+1PxwmM3Lju5f0jGzpqcg=;
	b=zWbkaoIdGA24lSQPQIulKy6ElH8P0hblH1xcFXJqReF/bVjtFPY8dYt0ohT9Ar9+D1HV8P
	hywsBvv5UNe2z2bWTOpUI+IoVZAKncfeuag19BPcjBp4svZEf/yNLp/dIczlruMYVttW/q
	yZQtIpI0TO3GxcpTHRyj4LoQ8IAx5je/+H8FEU8wt/2/Kuyybqb/ayjNbWHH9suT/xMioJ
	NKmCO6gFEIW8wxAOkCs6sZLybY2jJFn195eQiCN+NiYkqb4YdSjFdzvSel/rq97THJ4u0p
	cG79UxQ9t9+pxCBiCSoe2ggUC2vbq8FEiYA4JvnQLqJozniFKcG9fg95eN63GA==
Message-ID: <5c94b88bf7123e5a32d5c4bd77217e6a40683c83.camel@bootlin.com>
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
Date: Tue, 13 Oct 2026 10:25:07 +0200
In-Reply-To: <asdVM883VTQy7WvH@sirena.co.uk>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
	 <20261005081141.33688-2-paul.cercueil@bootlin.com>
	 <asdVM883VTQy7WvH@sirena.co.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_012527_586113_6CEC338B 
X-CRM114-Status: GOOD (  23.30  )
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

SGkgTWFyaywKCkxlIGpldWRpIDA4IG9jdG9icmUgMjAyNiDDoCAxMDozMiArMDIwMCwgTWFyayBC
cm93biBhIMOpY3JpdMKgOgo+IE9uIE1vbiwgT2N0IDA1LCAyMDI2IGF0IDEwOjExOjM2QU0gKzAy
MDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPiBGcm9tOiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5
QG1hcnZlbGwuY29tPgo+ID4gCj4gPiBBZGQgYSAncGFuaWNfd3JpdGUnIGZsYWcgdG8gdGhlIGNv
bnRyb2xsZXIncyBjYXBhYmlsaXRpZXMgc3RydWN0Lgo+ID4gV2hlbiBzZXQsIHRoZSBTUEkgY29u
dHJvbGxlciBpbmRpY2F0ZXMgdGhhdCBpdCB3aWxsIGJlIGFibGUgdG8gc2VuZAo+ID4gY29tbWFu
ZHMgdG8gYSBjb25uZWN0ZWQgTk9SIG9yIE5BTkQgbWVtb3J5IGluIHRoZSBjb250ZXh0IG9mIGEg
a2VybmVsCj4gPiBwYW5pYywgd2hpY2ggbWVhbnMgd2l0aG91dCBzbGVlcGluZyBhbmQgd2l0aG91
dCByZWx5aW5nIG9uIElSUXMuCj4gCj4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+
ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4gQEAgLTM5OCw2ICszOTgsMzEgQEAgaW50
IHNwaV9tZW1fZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3QKPiA+IHNw
aV9tZW1fb3AgKm9wKQo+ID4gwqAJdTggKnRtcGJ1ZjsKPiA+IMKgCWludCByZXQ7Cj4gPiDCoAo+
ID4gKwlpZiAob3AtPnBhbmljX3dyaXRlKSB7Cj4gPiArCQlpZiAoIXNwaV9tZW1fY29udHJvbGxl
cl9pc19jYXBhYmxlKGN0bHIsIHBhbmljX3dyaXRlKSkKPiA+ICsJCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPiArCQkvKgo+ID4gKwkJICogT25seSBzdXBwb3J0IHBhbmljIHdyaXRlcyBpZiB3ZSds
bCBnbyB0aHJvdWdoCj4gPiAuZXhlY19vcCgpLgo+ID4gKwkJICogVGhlIHJlZ3VsYXIgU1BJIHBh
dGggKHNwaV9zeW5jKCksIGV0Yy4pIGV4cGxpY2l0bHkKPiA+IG1lbnRpb25zCj4gPiArCQkgKiB0
aGF0IGl0IGNhbiBvbmx5IGJlIHVzZWQgZnJvbSBhIGNvbnRleHQgdGhhdCBtYXkgc2xlZXAsCj4g
PiB3aGljaAo+ID4gKwkJICogaXMgbm90IHRoZSBjYXNlIG9uIGEga2VybmVsIHBhbmljLgo+ID4g
KwkJICogSWYgdGhpcyBjaGFuZ2VzIGluIHRoZSBmdXR1cmUsIHRoaXMgY291bGQgYmUgcmV3b3Jr
ZWQsCj4gPiBidXQKPiA+ICsJCSAqIGZvciBub3cgdGhpcyB3aWxsIGhhdmUgdG8gZG8uCj4gPiAr
CQkgKi8KPiAKPiBUaGlzIGFsc28gbmVlZHMgdG8gZW5zdXJlIHRoYXQgdGhlIHF1ZXVlIGlzIGlk
bGUgLSB3ZSdsbCBzdGlsbCBleGVjdXRlCj4gc3BpX21lbV9hY2Nlc3Nfc3RhcnQoKSB3aGljaCBm
bHVzaGVzIHRoZSBxdWV1ZSwgYW5kIHdlJ3ZlIGdvdCBydW50aW1lIFBNCj4gb3BlcmF0aW9ucyB0
aGVyZSB3aGljaCBtaWdodCBiZSBhIGJpdCBjaGFsbGVuZ2luZyBpbiBhIHBhbmljIHNpdHVhdGlv
bi4KCkRvZXMgaXQgdGhvdWdoPyBUaGUga2VybmVsIGlzIHBhbmlja2luZyBzbyB0aGUgcXVldWUg
d29uJ3QgYmUgcHJvY2Vzc2VkIGFueW1vcmUsCml0IHNob3VsZCBiZSBmaW5lIHRvIGp1c3QgaWdu
b3JlIGl0LgoKQUNLIGZvciB0aGUgUE0gLSBJIHRoaW5rIGluIHRoZSBWMiBJJ2xsIGp1c3QgYmFp
bCBpZiB0aGUgY29udHJvbGxlciBoYXMgYXV0by0KcnVudGltZS1QTSBvbi4KCi0tIApQYXVsIENl
cmN1ZWlsLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
