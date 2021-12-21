Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C84C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgSGgkETiFDLJklD/anXPUhcgG+68ijIH1dCCKPpJ2s=; b=IP7NUR9FCy/kWK
	PtDSF2xW/6b0OnBhW5zWrLmXVLh0YBAOn59c9qaixO/G+AR7RbxBjs+5PIp2H2vxXeWi0Ax8qKrRJ
	vjO0KlJiQFFrKJJfGFytt+Pgr2Ci83sKPdsSC0AQZ/4iYWdtVihlOmiZCYCjSImr7Rj7FqNvPJRzj
	Y9WhA2CqFFIShxLQ6OWwy2uHSuGgy6qgXca6eJ8VI92bTOntl1/WiHASofc2Jx3Csmwu8BVZEntMT
	ar9Q393TDcrKBFkAgfAkzCuPoxvg5ifFzT+capqebhDj/H1HZg/Bp+DVOEdxmILfD+Z53Lh4t4z8i
	ks8hnOiHjnrqJyiYpeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbuN-006Ic2-Hh; Tue, 21 Dec 2021 09:58:11 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbuJ-006IZm-N7
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 09:58:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3659D24000F;
 Tue, 21 Dec 2021 09:58:04 +0000 (UTC)
Date: Tue, 21 Dec 2021 10:58:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 06/14] spi: spi-mem: Kill the
 spi_mem_dtr_supports_op() helper
Message-ID: <20211221105803.1596cf89@xps13>
In-Reply-To: <20211220185840.ox5hs44hej6nhkxo@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-7-miquel.raynal@bootlin.com>
 <20211220185840.ox5hs44hej6nhkxo@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_015807_915019_49C6CAEB 
X-CRM114-Status: GOOD (  22.06  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDAw
OjI4OjQyICswNTMwOgoKPiBPbiAxNy8xMi8yMSAwNToxNlBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gTm93IHRoYXQgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgaGFzIGFjY2VzcyB0
byB0aGUgc3RhdGljCj4gPiBjb250cm9sbGVyIGNhcGFiaWxpdGllcyAocmVsYXRlZCB0byBtZW1v
cnkgb3BlcmF0aW9ucyksIGFuZCBub3cgdGhhdAo+ID4gdGhlc2UgY2FwYWJpbGl0aWVzIGhhdmUg
YmVlbiBmaWxsZWQgYnkgdGhlIGltcGFjdGVkIGNvbnRyb2xsZXJzLCB0aGVyZQo+ID4gaXMgbm8g
bmVlZCBmb3IgYSBzcGVjaWZpYyBoZWxwZXIgY2hlY2tpbmcgb25seSBEVFIgb3BlcmF0aW9ucywg
c28gbGV0J3MKPiA+IGp1c3Qga2lsbCBzcGlfbWVtX2R0cl9zdXBwb3J0c19vcCgpIGFuZCBzaW1w
bHkgdXNlCj4gPiBzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AoKSBpbnN0ZWFkLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIHwgIDUgKy0t
LS0KPiA+ICBkcml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgICAgICAgfCAxMCAtLS0tLS0tLS0t
Cj4gPiAgZHJpdmVycy9zcGkvc3BpLW14aWMuYyAgICAgICAgICAgIHwgMTAgKy0tLS0tLS0tLQo+
ID4gIGluY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaCAgICAgICB8IDExIC0tLS0tLS0tLS0tCj4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW14aWMuYyBiL2RyaXZlcnMvc3BpL3Nw
aS1teGljLmMKPiA+IGluZGV4IGUxMzdiMWVjODVkNC4uNjdkMDVlZThkNmEwIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9zcGkvc3BpLW14aWMuYwo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW14
aWMuYwo+ID4gQEAgLTMzNSw4ICszMzUsNiBAQCBzdGF0aWMgaW50IG14aWNfc3BpX2RhdGFfeGZl
cihzdHJ1Y3QgbXhpY19zcGkgKm14aWMsIGNvbnN0IHZvaWQgKnR4YnVmLAo+ID4gIHN0YXRpYyBi
b29sIG14aWNfc3BpX21lbV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+ID4gIAkJ
CQkgICAgIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKPiA+ICB7Cj4gPiAtCWJvb2wgYWxs
X2ZhbHNlOwo+ID4gLQo+ID4gIAlpZiAob3AtPmRhdGEuYnVzd2lkdGggPiA4IHx8IG9wLT5hZGRy
LmJ1c3dpZHRoID4gOCB8fAo+ID4gIAkgICAgb3AtPmR1bW15LmJ1c3dpZHRoID4gOCB8fCBvcC0+
Y21kLmJ1c3dpZHRoID4gOCkKPiA+ICAJCXJldHVybiBmYWxzZTsKPiA+IEBAIC0zNDgsMTMgKzM0
Niw3IEBAIHN0YXRpYyBib29sIG14aWNfc3BpX21lbV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21l
bSAqbWVtLAo+ID4gIAlpZiAob3AtPmFkZHIubmJ5dGVzID4gNykKPiA+ICAJCXJldHVybiBmYWxz
ZTsKPiA+ICAKPiA+IC0JYWxsX2ZhbHNlID0gIW9wLT5jbWQuZHRyICYmICFvcC0+YWRkci5kdHIg
JiYgIW9wLT5kdW1teS5kdHIgJiYKPiA+IC0JCSAgICAhb3AtPmRhdGEuZHRyOwo+ID4gLQo+ID4g
LQlpZiAoYWxsX2ZhbHNlKQo+ID4gLQkJcmV0dXJuIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19v
cChtZW0sIG9wKTsKPiA+IC0JZWxzZQo+ID4gLQkJcmV0dXJuIHNwaV9tZW1fZHRyX3N1cHBvcnRz
X29wKG1lbSwgb3ApOwo+ID4gKwlyZXR1cm4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKG1l
bSwgb3ApOyAgCj4gCj4gRG9lcyB0aGlzIGNvbnRyb2xsZXIgc3VwcG9ydCBtaXhlZCBEVFIgbW9k
ZXM/IElmIGl0IGRvZXNuJ3QgdGhlbiBpdCAKPiBzaG91bGQgcmVqZWN0IG1peGVkIERUUiBvcHMg
YmVmb3JlIGNhbGxpbmcgCj4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkuIEFueXdheSwg
dGhlIGN1cnJlbnQgZHJpdmVyIGRvZXNuJ3QgY2hlY2sgCj4gZm9yIGl0IGVpdGhlciBzbyB0aGlz
IGNoYW5nZSBkb2VzIG5vdCBtYWtlIGFueXRoaW5nIHdvcnNlIGF0IHRoZSB2ZXJ5IAo+IGxlYXN0
LgoKVGhlIENhZGVuY2UgU1BJIGRyaXZlciBkb2VzIHNvbWV0aGluZyBsaWtlOgoKYWxsX3RydWUg
PSBjbWQuZHRyICYmIGFkZHIuZHRyIC4uLjsKYWxsX2ZhbHNlID0gIWNtZC5kdHIgJiYgIWFkZHIu
ZHRyIC4uLjsKaWYgKCFhbGxfdHJ1ZSB8fCAhYWxsX2ZhbHNlKQoJcmV0dXJuIGZhbHNlOwoKVGhp
cyBiYXNpY2FsbHkgcnVsZXMgb3V0IGFueSBtaXhlZCBEVFIgb3BlcmF0aW9uLgoKSSBiZWxpZXZl
IE1hY3Jvbml4IGNvZGUgaXMgaW5zcGlyZWQgZnJvbSB0aGlzIGZ1bmN0aW9uLCBidXQgdGhleQpp
bnRlbnRpb25hbGx5IGRyb3BwZWQgdGhlIGFsbF90cnVlIGNoZWNrLCBtYWtpbmcgdGhlIHNpdHVh
dGlvbiBib29sZWFuOgplaXRoZXIgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIERUUiBvcCwgb3IgdGhl
cmUgaXMgbm9uZS4gU28gSSBiZWxpZXZlCnRoaXMgd2FzIGRvbmUgb24gcHVycG9zZSBhbmQgdGhp
cyBjb250cm9sbGVyIHN1cHBvcnRzIG1peGVkIERUUiBvcHMuCgo+IFJldmlld2VkLWJ5OiBQcmF0
eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
