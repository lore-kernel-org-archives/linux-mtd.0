Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3CDC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/og89XGs6day78/Wz1+oWGVQjyuU+Bsj1UjSmcHLrlU=; b=BpB1HtAhNa9lcZ
	hIOdXRLWQaofR/qZlcqE8cXu7BSbLU0Y5aJtMAaqYesvsFBqfT7F8IzAVFr3U4P9SOdvMIwJJbSpt
	HjXfDSxmdZco9+7RTIPY6fVFLjtj2suHNfCkXPsRKyZ/W/5h7FaOOxNLK1jTnSCRSVllr8QuEMD0p
	EqmMzYxiHl/Whgb57TWWxgzZH/AfMhwSAEW7P2Ikzx1vKu6ZyLHBtK5dbPsc+6LYKEbTbgc+3KfP0
	Pgd0lTBqR5bwa/Bbh9hzxZ+A0esdqJEtaq/jkxIrp9jXPZ0+skLj1XUhwPNes/2F9zJD7hs13T10O
	lEnIzpHpbabzwdl+yfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdoy-0097Ff-Na; Mon, 16 May 2022 16:43:48 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdoO-0096rM-Sp
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 16:43:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6579760004;
 Mon, 16 May 2022 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652719386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0iV/a6Ib38YBJ+tsMjvV/v6P/KYjuhqVAUWfGIXMCG8=;
 b=SLJwzD1nBkFyKO84RbgQ7W+kj73nor3EbLFUOBxtaV7+rGIDGox1Dk3xXF5eYy0QG7lPxC
 i1cIFNxyGEswajhhWx6qQLT8z7xC71eOEDGT3D6AcEFB34344PFLkDQT3IktUalyXQo1Ty
 vwbzOlBv0LvNs1YKvRofb4HlES9OW1wcWitEAK2u6ATLGkeh2h4VPdni7iO8u6yqwyCn/A
 mDNAbVEvYd0I53SW2UZiOX9vNj1vRzEZPg1CEfby3zBFZcWWxvhzfI3oJXdl4g559h3Wjb
 supYD9jw1aX9QVf+0b80to7C9kPvfahqN0lGnltr5P5V2fJMeYDsPJLiPK4wOw==
Date: Mon, 16 May 2022 18:43:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Milan Stevanovic
 <milan.stevanovic@se.com>, Jimmy Lalande <jimmy.lalande@se.com>, Pascal
 Eberhard <pascal.eberhard@se.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v4 0/2] mtd: rawnand: renesas: Runtime PM use
Message-ID: <20220516184301.7f0288de@xps-13>
In-Reply-To: <20220513104957.257721-1-miquel.raynal@bootlin.com>
References: <20220513104957.257721-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_094313_164783_BCC075FB 
X-CRM114-Status: GOOD (  17.37  )
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

SGksCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTMgTWF5IDIwMjIg
MTI6NDk6NTUgKzAyMDA6Cgo+IFRoZXJlIHdhcyBhIHNtYWxsIG1pc3Rha2Ugd2hlbiBmaXJzdCBp
bnRyb2R1Y2luZyB0aGlzIGNvbnRyb2xsZXIgZHJpdmVyOgo+IHRoZSBwb3dlci1kb21haW4gcHJv
cGVydHkgd2FzIG1pc3NpbmcgaW4gdGhlIGRldmljZSB0cmVlIGJlY2F1c2UgdGhlcmUKPiB3YXMg
b25seSBvbmUgY29udHJvbGxlciBzdXBwb3J0ZWQgYXQgdGhpcyB0aW1lIChVQVJUKSBhbmQgdGhp
cyBpcyBhCj4gU3lub3BzaXMgSVAgd2hpY2ggZGlkIG5vdCBzdXBwb3J0IHBvd2VyIGRvbWFpbnMu
IFRoZSBpZGVhIGlzIHRvIGFsd2F5cwo+IHVzZSB0aGVzZSBwb3dlciBkb21haW5zIHdoZW4gYXZh
aWxhYmxlLCBzbyBsZXQncyBhZGQgaXQgdG8gdGhlIGJpbmRpbmdzLAo+IHRoZSBEVCBhbmQgdXNl
IGl0IGZyb20gdGhlIGRyaXZlciB0aHJvdWdoIHRoZSBydW50aW1wZSBQTSBBUEkgaW5zdGVhZCBv
Zgo+IGRvaW5nIHJhdyBjbGsgQVBJIGNhbGxzLgo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gKiBVc2Ug
cG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGluc3RlYWQgb2YgcG1fcnVudGltZV9nZXRfc3lu
YygpLgo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gKiBNb3ZlZCB0aGUgcG1fcnVudGltZSBjYWxscyBl
YXJsaWVyIGluIHRoZSBwcm9iZSB0byBhdm9pZCBwb3NzaWJsZQo+ICAgcmVnaXN0ZXIgYWNjZXNz
ZXMgd2hpbGUgdGhlIGNsb2NrcyBoYXZlIG5vdCB5ZXQgYmVlbiBlbmFibGVkLgo+ICAKPiBDaGFu
Z2VzIGluIHYyOgo+ICogRHJvcHBlZCB0aGUgRFQgcGF0Y2ggbWVyZ2VkIGJ5IEdlZXJ0Lgo+ICog
VXNlZCBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkgaW5zdGVhZCBvZiBwbV9ydW50aW1lX2VuYWJs
ZSgpIGFuZAo+ICAgZHJvcHBlZCB0aGUgcG1fcnVudGltZV9kaXNhYmxlKCkgY2FsbHMuCj4gKiBV
c2VkIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSBpbnN0ZWFkIG9mIHBtX3J1bnRpbWVfZ2V0
X3N5bmMoKS4KPiAqIENvbGxlY3RlZCB0aGUgdGFncyBvbiB0aGUgYmluZGluZ3MuCj4gCj4gTWlx
dWVsIFJheW5hbCAoMik6Cj4gICBkdC1iaW5kaW5nczogbXRkOiByZW5lc2FzOiBGaXggdGhlIE5B
TkQgY29udHJvbGxlciBkZXNjcmlwdGlvbgo+ICAgbXRkOiByYXduYW5kOiByZW5lc2FzOiBVc2Ug
cnVudGltZSBQTSBpbnN0ZWFkIG9mIHRoZSByYXcgY2xvY2sgQVBJCj4gCj4gIC4uLi9iaW5kaW5n
cy9tdGQvcmVuZXNhcy1uYW5kYy55YW1sICAgICAgICAgICB8ICA1ICsrCj4gIC4uLi9tdGQvbmFu
ZC9yYXcvcmVuZXNhcy1uYW5kLWNvbnRyb2xsZXIuYyAgICB8IDUxICsrKysrKysrKy0tLS0tLS0t
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkK
PiAKClNlcmllcyBhcHBsaWVkIG9uIG5hbmQvbmV4dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
