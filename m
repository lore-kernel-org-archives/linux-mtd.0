Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D4AC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbAifBIF+nTVfymGQ1e9U+yb7XbBAf3Rt5g4gqR8JeM=; b=nuTxAVm2JyM3K3
	rpJ7y0CXqBgOlvCelzKxZBWilaXK9PGf7bzzbx1qlNADuuvuOPt5oUfk3+Mmt1pbbMELKG+5MwZqy
	beHAuOU/x8l8yDCe6+OMKphvRR2Z1K/bUwh2aW1R5hINNHpmm8SJ1By26Rf3zKLoQqhF+VDduievt
	obSWHYL6Jg0563DN1kJol2ywAcMDnvJFQA/iHAywuN82obqKUdqhfxK8a9XTwOzf/PpIZABSCaNgh
	PFtBwYSS1EEidEK3e+HFd4XaJUj6UVpfEtjX73mDWZtXkj9iw4eELh16/6Vi2owIu+AbxS9LFXxdD
	e4U9t+vj4iW6ejP3RuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxWzU-001efT-Qn; Wed, 15 Dec 2021 16:18:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWsk-001bWK-KI
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 16:11:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 097411C000F;
 Wed, 15 Dec 2021 16:11:47 +0000 (UTC)
Date: Wed, 15 Dec 2021 17:11:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 04/13] spi: spi-mem: Create a helper to gather all
 the supports_op checks
Message-ID: <20211215171146.2697f6f5@xps13>
In-Reply-To: <20211214195315.f7wr6ao6bdma47cn@ti.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-5-miquel.raynal@bootlin.com>
 <20211214195315.f7wr6ao6bdma47cn@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_081154_978011_A56148FA 
X-CRM114-Status: GOOD (  27.16  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBXZWQsIDE1IERlYyAyMDIxIDAx
OjIzOjE3ICswNTMwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMTQvMTIvMjEgMTI6NDFQTSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IFNvIGZhciB3ZSBjaGVjayB0aGUgc3VwcG9ydCBmb3I6Cj4g
PiAtIHJlZ3VsYXIgb3BlcmF0aW9ucwo+ID4gLSBkdHIgb3BlcmF0aW9ucwo+ID4gU29vbiwgd2Ug
d2lsbCBhbHNvIG5lZWQgdG8gY2hlY2sgdGhlIHN1cHBvcnQgZm9yIEVDQyBvcGVyYXRpb25zLgo+
ID4gCj4gPiBBcyB0aGUgY29tYmluYXRvcmlhbCB3aWxsIGluY3JlYXNlIGV4cG9uZW50aWFsbHks
IGxldCdzIGdhdGhlciBhbGwgdGhlCj4gPiBjaGVja3MgaW4gYSBzaW5nbGUgZ2VuZXJpYyBmdW5j
dGlvbiB3aGljaCB0YWtlcyBhIGNhcGFiaWxpdGllcyBzdHJ1Y3R1cmUKPiA+IGFzIGlucHV0LiBU
aGlzIG5ldyBoZWxwZXIgaXMgc3VwcG9zZWQgdG8gYmUgY2FsbGVkIGJ5IHRoZSBjdXJyZW50bHkK
PiA+IGV4cG9ydGVkIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIHJlcGVhdGluZyBhIHNpbWlsYXIgaW1w
bGVtZW50YXRpb24uICAKPiAKPiBOaWNlISBJIHRoaW5rIHRoaXMgaXMgYSB2ZXJ5IGdvb2QgaWRl
YS4KClRoYW5rcyEKCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3NwaS9zcGktbWVt
LmMgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPiAgaW5j
bHVkZS9saW51eC9zcGkvc3BpLW1lbS5oIHwgIDggKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktbWVtLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+IGluZGV4
IDM3ZjQ0NDNjZTlhMC4uNGM2OTQ0ZDdiMTc0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zcGkv
c3BpLW1lbS5jCj4gPiArKysgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+IEBAIC0xNjAsMjYg
KzE2MCw0MiBAQCBzdGF0aWMgYm9vbCBzcGlfbWVtX2NoZWNrX2J1c3dpZHRoKHN0cnVjdCBzcGlf
bWVtICptZW0sCj4gPiAgCXJldHVybiB0cnVlOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgYm9v
bCBzcGlfbWVtX2dlbmVyaWNfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiA+ICsJ
CQkJCWNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCwKPiA+ICsJCQkJCXN0cnVjdCBzcGlfbWVt
X2NvbnRyb2xsZXJfY2FwcyAqY2FwcykKPiA+ICt7Cj4gPiArCWlmICghY2Fwcy0+ZHRyKSB7ICAK
PiAKPiBOaXRwaWNrOiBQbGVhc2UgdHVybiB0aGUgb3JkZXIgb2YgdGhlIGlmLWVsc2UgYXJvdW5k
Ogo+IAo+ICAgaWYgKGNhcHMtPmR0cikKPiAgICAgLi4uCj4gICBlbHNlCj4gICAgIC4uLgoKWXVw
Cgo+IAo+ID4gKwkJaWYgKG9wLT5jbWQuZHRyIHx8IG9wLT5hZGRyLmR0ciB8fAo+ID4gKwkJICAg
IG9wLT5kdW1teS5kdHIgfHwgb3AtPmRhdGEuZHRyKQo+ID4gKwkJCXJldHVybiBmYWxzZTsKPiA+
ICsKPiA+ICsJCWlmIChvcC0+Y21kLm5ieXRlcyAhPSAxKQo+ID4gKwkJCXJldHVybiBmYWxzZTsK
PiA+ICsJfSBlbHNlIHsKPiA+ICsJCWlmIChvcC0+Y21kLm5ieXRlcyAhPSAyKQo+ID4gKwkJCXJl
dHVybiBmYWxzZTsKPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gc3BpX21lbV9jaGVja19idXN3
aWR0aChtZW0sIG9wKTsKPiA+ICt9Cj4gPiArCj4gPiAgYm9vbCBzcGlfbWVtX2R0cl9zdXBwb3J0
c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+ID4gIAkJCSAgICAgY29uc3Qgc3RydWN0IHNwaV9t
ZW1fb3AgKm9wKQo+ID4gIHsKPiA+IC0JaWYgKG9wLT5jbWQubmJ5dGVzICE9IDIpCj4gPiAtCQly
ZXR1cm4gZmFsc2U7Cj4gPiArCXN0cnVjdCBzcGlfbWVtX2NvbnRyb2xsZXJfY2FwcyBjYXBzID0g
ewo+ID4gKwkJLmR0ciA9IHRydWUsCj4gPiArCX07Cj4gPiAgCj4gPiAtCXJldHVybiBzcGlfbWVt
X2NoZWNrX2J1c3dpZHRoKG1lbSwgb3ApOwo+ID4gKwlyZXR1cm4gc3BpX21lbV9nZW5lcmljX3N1
cHBvcnRzX29wKG1lbSwgb3AsICZjYXBzKTsKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwo
c3BpX21lbV9kdHJfc3VwcG9ydHNfb3ApOwo+ID4gIAo+ID4gIGJvb2wgc3BpX21lbV9kZWZhdWx0
X3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gPiAgCQkJCSBjb25zdCBzdHJ1Y3Qg
c3BpX21lbV9vcCAqb3ApICAKPiAKPiBJIGtub3cgdGhpcyB3b3VsZCByZXF1aXJlIGEgbGl0dGxl
IGJpdCBtb3JlIHdvcmsgZnJvbSB5b3UsIGJ1dCBjYW4gd2UgCj4gbWFrZSBzcGlfbWVtX2RlZmF1
bHRfc3VwcG9ydHNfb3AoKSBhY2NlcHQgdGhlIGNhcHMgYXMgYSBwYXJhbWV0ZXI/IEFuZCAKPiBk
cm9wIHNwaV9tZW1fZHRyX3N1cHBvcnRzX29wKCkgd2hpbGUgd2UgYXJlIGF0IGl0PyBUaGlzIHdv
dWxkIGJlIGEgbG90IAo+IG5lYXRlciBJIHRoaW5rIHNpbmNlIHdlIHdvbid0IGhhdmUgbG90cyBv
ZiB3cmFwcGVyIGZ1bmN0aW9ucyBseWluZyAKPiBhcm91bmQuCgpGb2xsb3dpbmcgQm9yaXMnIHJl
dmlldyBJIHBsYW5uZWQgdG8ga2lsbCBzcGlfbWVtX2R0cl9zdXBwb3J0c19vcCgpLiBJCm1pZ2h0
IGFzIHdlbGwgdXBkYXRlIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpIHNvIHRoYXQgY29u
dHJvbGxlcnMKY2FuIHByb3ZpZGUgdGhlaXIgc3RhdGljIGNhcGFjaXRpZXMgaWYgYW55LgoKPiA+
ICB7Cj4gPiAtCWlmIChvcC0+Y21kLmR0ciB8fCBvcC0+YWRkci5kdHIgfHwgb3AtPmR1bW15LmR0
ciB8fCBvcC0+ZGF0YS5kdHIpCj4gPiAtCQlyZXR1cm4gZmFsc2U7Cj4gPiArCXN0cnVjdCBzcGlf
bWVtX2NvbnRyb2xsZXJfY2FwcyBjYXBzID0ge307Cj4gPiAgCj4gPiAtCWlmIChvcC0+Y21kLm5i
eXRlcyAhPSAxKQo+ID4gLQkJcmV0dXJuIGZhbHNlOwo+ID4gLQo+ID4gLQlyZXR1cm4gc3BpX21l
bV9jaGVja19idXN3aWR0aChtZW0sIG9wKTsKPiA+ICsJcmV0dXJuIHNwaV9tZW1fZ2VuZXJpY19z
dXBwb3J0c19vcChtZW0sIG9wLCAmY2Fwcyk7Cj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0xfR1BM
KHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCk7Cj4gPiAgCj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9zcGkvc3BpLW1lbS5oIGIvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oCj4g
PiBpbmRleCA4NWUyZmY3Yjg0MGQuLmYzNjVlZmNmYjcxOSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvc3BpL3NwaS1tZW0uaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1l
bS5oCj4gPiBAQCAtMjIwLDYgKzIyMCwxNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKnNwaV9tZW1f
Z2V0X2RydmRhdGEoc3RydWN0IHNwaV9tZW0gKm1lbSkKPiA+ICAJcmV0dXJuIG1lbS0+ZHJ2cHJp
djsKPiA+ICB9Cj4gPiAgCj4gPiArLyoqCj4gPiArICogc3RydWN0IHNwaV9tZW1fY29udHJvbGxl
cl9jYXBzIC0gU1BJIG1lbW9yeSBjb250cm9sbGVyIGNhcGFiaWxpdGllcwo+ID4gKyAqIEBkdHI6
IFN1cHBvcnRzIERUUiBvcGVyYXRpb25zCj4gPiArICovCj4gPiArc3RydWN0IHNwaV9tZW1fY29u
dHJvbGxlcl9jYXBzIHsKPiA+ICsJYm9vbCBkdHI7Cj4gPiArfTsKPiA+ICsKPiA+ICAvKioKPiA+
ICAgKiBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyAtIFNQSSBtZW1vcnkgb3BlcmF0aW9u
cwo+ID4gICAqIEBhZGp1c3Rfb3Bfc2l6ZTogc2hyaW5rIHRoZSBkYXRhIHhmZXIgb2YgYW4gb3Bl
cmF0aW9uIHRvIG1hdGNoIGNvbnRyb2xsZXIncwo+ID4gLS0gCj4gPiAyLjI3LjAKPiA+ICAgCj4g
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
