Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C12C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KV822fYK/0H6n94WFmroGTzlCJp537CTzMturXLrJeM=; b=Mm3UuH1CZ/TIFD
	RWGZNPXg0tuSWgiWvSCben40lRv7Vgjlk0hdqWlY9yWawXU9RTrr83SFWU/BjIg/QDeJXLv7wJlG9
	oqB8xYwwN+2Cnb2T2OvAWa50Q9uguzb2A/Xtz+U5Vm4NVAdEssL92oNkTUkE5JGYHJKQvU4rlhvtu
	xbRGJ7PpC/9AjHUZrIiHZwjVHeqIe6nPCzFCU8NRl/vAgWTfx9moE1lHFtM/jwotiBOofQ21JELTL
	19GrovMjTu0X2Tg4ot+azHcJYaLwoonvYo7PtnDPqH+oxtIik6AZijhr/xLkgb8qDBBH5ToXyz45T
	CsqbH50lLT3FOKEU/clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbd2-006E3i-4C; Tue, 21 Dec 2021 09:40:16 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbYZ-006C9r-K5
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 09:35:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 71A42240004;
 Tue, 21 Dec 2021 09:35:33 +0000 (UTC)
Date: Tue, 21 Dec 2021 10:35:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 02/14] spi: spi-mem: Introduce a capability structure
Message-ID: <20211221103531.1fc1c788@xps13>
In-Reply-To: <20211220184323.cfbd5ypintmz2xrq@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-3-miquel.raynal@bootlin.com>
 <20211220184323.cfbd5ypintmz2xrq@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_013539_992621_7238364F 
X-CRM114-Status: GOOD (  31.94  )
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
OjEzOjI1ICswNTMwOgoKPiBPbiAxNy8xMi8yMSAwNToxNlBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gQ3JlYXRlIGEgc3BpX2NvbnRyb2xsZXJfbWVtX2NhcHMgc3RydWN0dXJlIGFuZCBwdXQg
aXQgd2l0aGluIHRoZQo+ID4gc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBzdHJ1Y3R1cmUgYXMgdGhl
c2UgYXJlIGhpZ2hseSByZWxhdGVkLiBTbyBmYXIgdGhlCj4gPiBvbmx5IGZpZWxkIGluIHRoaXMg
c3RydWN0dXJlIGlzIHRoZSBzdXBwb3J0IGZvciBkdHIgb3BlcmF0aW9ucywgYnV0IHNvb24KPiA+
IHdlIHdpbGwgYWRkIGFub3RoZXIgcGFyYW1ldGVyLgo+ID4gCj4gPiBBbHNvIGNyZWF0ZSBhIGhl
bHBlciB0byBwYXJzZSB0aGUgY2FwYWJpbGl0aWVzIGFuZCBjaGVjayBpZiB0aGUKPiA+IHJlcXVl
c3RlZCBjYXBhYmlsaXR5IGhhcyBiZWVuIHNldCBvciBub3QuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+
ICBpbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmggfCAxMyArKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvc3BpL3NwaS1tZW0uaCBiL2luY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaAo+ID4g
aW5kZXggODVlMmZmN2I4NDBkLi4wNDVlY2I3YzZmNTAgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L3NwaS9zcGktbWVtLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0u
aAo+ID4gQEAgLTIyMCw2ICsyMjAsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkICpzcGlfbWVtX2dl
dF9kcnZkYXRhKHN0cnVjdCBzcGlfbWVtICptZW0pCj4gPiAgCXJldHVybiBtZW0tPmRydnByaXY7
Cj4gPiAgfQo+ID4gIAo+ID4gKy8qKgo+ID4gKyAqIHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1f
Y2FwcyAtIFNQSSBtZW1vcnkgY29udHJvbGxlciBjYXBhYmlsaXRpZXMKPiA+ICsgKiBAZHRyOiBT
dXBwb3J0cyBEVFIgb3BlcmF0aW9ucwo+ID4gKyAqLwo+ID4gK3N0cnVjdCBzcGlfY29udHJvbGxl
cl9tZW1fY2FwcyB7Cj4gPiArCWJvb2wgZHRyOyAgCj4gCj4gSSBhc3N1bWUgdGhpcyB3b3VsZCBt
ZWFuIERUUiBpcyBzdXBwb3J0ZWQgb24gX2FsbF8gcGhhc2VzPyBJIGFtIG5vdCBzdXJlIAo+IGlm
IHdlIHdvdWxkIGV2ZXIgbmVlZCB0byBlbmNvZGUgRFRSIHN1cHBvcnQgcGVyLXBoYXNlLCBidXQg
dGhhdCBjYW4gCj4gcHJvYmFibHkgY29tZSBsYXRlci4gT3IgdGhlIGNvbnRyb2xsZXIncyBzdXBw
b3J0c19vcCgpIGhvb2sgY2FuIGRvIHRob3NlIAo+IGNoZWNrcyBiZWZvcmUgY2FsbGluZyBzcGlf
bWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AoKS4KCklmIHdlIGV2ZXIgbmVlZCB0aGlzIHRoZXJlIGlz
IG5vIHByb2JsZW06IHRoZSBpZGVhIGhlcmUgaXMgdG8gcHJvdmlkZSBhCmRlZmF1bHQgKGFuZCBm
b3IgdGhpcyBvbmUgdGhlIG5hbWluZyBpcyByYXRoZXIgZ29vZCA9KSApIGhlbHBlciB0byBkbwpi
YXNpYyBjaGVja3MuIEEgY29udHJvbGxlciBlaXRoZXIgc3VwcG9ydHMgRFRSIG9wcyBvciBub3Qu
IElmIGl0IGRvZXMKbm90IHN1cHBvcnQgdGhlbSwgdGhlbiB0aGlzIGNoZWNrIHdpbGwgZmFpbC4g
QnV0IGxpa2UgdGhlIENhZGVuY2UgU1BJCmNvbnRyb2xsZXIgZHJpdmVyIGRvZXMsIGlmIG9ubHkg
b25lIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24gaXMgbm90CnN1cHBvcnRlZCBieSB0aGUgZHJpdmVy
LCB0aGVuIHRoZSAtPnN1cHBvcnRzX29wKCkgaG9vayBvZiB0aGUgZHJpdmVyCnNob3VsZCBjaGVj
ayB0aGF0IGJlZm9yZWhhbmQgYW5kIHJldHVybiBhbiBlcnJvciBbMV0uCgoKWzFdIGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9zcGkvc3BpLWNh
ZGVuY2UtcXVhZHNwaS5jI0wxMjUzCgo+ID4gK307Cj4gPiArCj4gPiArI2RlZmluZSBzcGlfbWVt
X2NvbnRyb2xsZXJfaXNfY2FwYWJsZShjdGxyLCBjYXApCQlcCj4gPiArCSgoY3RsciktPm1lbV9v
cHMtPmNhcHMgJiYgKGN0bHIpLT5tZW1fb3BzLT5jYXBzLT5jYXApCVwKPiA+ICsKPiA+ICAvKioK
PiA+ICAgKiBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyAtIFNQSSBtZW1vcnkgb3BlcmF0
aW9ucwo+ID4gICAqIEBhZGp1c3Rfb3Bfc2l6ZTogc2hyaW5rIHRoZSBkYXRhIHhmZXIgb2YgYW4g
b3BlcmF0aW9uIHRvIG1hdGNoIGNvbnRyb2xsZXIncwo+ID4gQEAgLTI1Myw2ICsyNjQsNyBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgKnNwaV9tZW1fZ2V0X2RydmRhdGEoc3RydWN0IHNwaV9tZW0gKm1l
bSkKPiA+ICAgKiBAcG9sbF9zdGF0dXM6IHBvbGwgbWVtb3J5IGRldmljZSBzdGF0dXMgdW50aWwg
KHN0YXR1cyAmIG1hc2spID09IG1hdGNoIG9yCj4gPiAgICogICAgICAgICAgICAgICB3aGVuIHRo
ZSB0aW1lb3V0IGhhcyBleHBpcmVkLiBJdCBmaWxscyB0aGUgZGF0YSBidWZmZXIgd2l0aAo+ID4g
ICAqICAgICAgICAgICAgICAgdGhlIGxhc3Qgc3RhdHVzIHZhbHVlLgo+ID4gKyAqIEBjYXBzOiBj
b250cm9sbGVyIGNhcGFiaWxpdGllcyBmb3IgdGhlIGhhbmRsaW5nIG9mIHRoZSBhYm92ZSBvcGVy
YXRpb25zLgo+ID4gICAqCj4gPiAgICogVGhpcyBpbnRlcmZhY2Ugc2hvdWxkIGJlIGltcGxlbWVu
dGVkIGJ5IFNQSSBjb250cm9sbGVycyBwcm92aWRpbmcgYW4KPiA+ICAgKiBoaWdoLWxldmVsIGlu
dGVyZmFjZSB0byBleGVjdXRlIFNQSSBtZW1vcnkgb3BlcmF0aW9uLCB3aGljaCBpcyB1c3VhbGx5
IHRoZQo+ID4gQEAgLTI4Myw2ICsyOTUsNyBAQCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29w
cyB7Cj4gPiAgCQkJICAgdW5zaWduZWQgbG9uZyBpbml0aWFsX2RlbGF5X3VzLAo+ID4gIAkJCSAg
IHVuc2lnbmVkIGxvbmcgcG9sbGluZ19yYXRlX3VzLAo+ID4gIAkJCSAgIHVuc2lnbmVkIGxvbmcg
dGltZW91dF9tcyk7Cj4gPiArCWNvbnN0IHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1fY2FwcyAq
Y2FwczsgIAo+IAo+IEkgZmVlbCBsaWtlIHRoaXMgd291bGQgYmUgYmV0dGVyIHBhc3NlZCBpbiBh
cyBhbiBhcmd1bWVudCB0byB0aGUgCj4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgZnVu
Y3Rpb24uIEJ1dCBJIHNlZSB0aGF0IE1hcmsgYW5kIHlvdSBmZWVsIAo+IGRpZmZlcmVudGx5IHNv
IEkgd29uJ3QgaW5zaXN0IG9uIGl0LgoKQXMgdGhlc2UgcHJvcGVydGllcyBhcmUgc3VwcG9zZXMg
dG8gYmUgbW9yZSBvciBsZXNzIHN0YXRpYyBvdmVyIHRoZQpsaWZldGltZSBvZiB0aGUgY29udHJv
bGxlciB3ZSBhc3N1bWVkIHRoZXJlIHdhcyBubyBuZWVkIGZvciBzb21ldGhpbmcKbW9yZSBkeW5h
bWljLiBBbnl3YXkgdGhpcyBpcyBhIGRlZmF1bHQgaGVscGVyLCBkcml2ZXJzIGFyZSBwbGVhc2Vk
IHRvCmltcGxlbWVudCB0aGVpciBvd24gaWYgbmVlZGVkLiBQbHVzLCBkb2luZyBzbyBwcmV2ZW50
cyB0aGUgbmVlZCBmb3IKaGFja2luZyBpbnRvIGRvemVucyBvZiBkcml2ZXJzLCB3aGljaCBpcyBj
ZXJ0YWlubHkgdGhlIHJlYXNvbiBJCnBlcnNvbmFsbHkgbGlrZSB0aGUgbW9zdCA6cCAKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
