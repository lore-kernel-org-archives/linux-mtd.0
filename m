Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6fzJRHtzG4vFq67yXJMKdeCUM0Ke34KZg/7x/3zEKY=; b=l7txeDLrld3aUE
	/Wgurp2OvkNLBwv48waL4T8EqNyLFAllovL0Q439W3S3QnxQZgC8PmUa9dgWvWRcgpuPAKRQynAdV
	gCExheGfea/TKZyaIykQhtM6ahVZ3SfhYtWTUUFs+vAq9xV5x3IvpM9vrz0f1kttizc5SVphyhmGQ
	sXOFzdhl5HMJD/+q3iWYfrXuImgaqjZmGwDWkpy6ocJO9wDvdWDWfWPQyteCeKozmTcT3QWW6ZMAC
	96nHswLc9KrxWAKDETAfcloC3Wvcr4ag7rRj5O4DtIskhfqbu6czVLeaMEKHML7f+7oNwJT71sp+a
	3SUHWPpBJpunk8hvJl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzcKr-006PKy-6l; Tue, 21 Dec 2021 10:25:33 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzcKm-006PJe-1Q
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 10:25:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 38D05FF80D;
 Tue, 21 Dec 2021 10:25:21 +0000 (UTC)
Date: Tue, 21 Dec 2021 11:25:20 +0100
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
Message-ID: <20211221112520.3f4d542f@xps13>
In-Reply-To: <20211221101052.rgcikxeh3aygdjgh@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-7-miquel.raynal@bootlin.com>
 <20211220185840.ox5hs44hej6nhkxo@ti.com>
 <20211221105803.1596cf89@xps13>
 <20211221101052.rgcikxeh3aygdjgh@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_022528_397191_1662709E 
X-CRM114-Status: GOOD (  33.39  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDE1
OjQwOjU0ICswNTMwOgoKPiBPbiAyMS8xMi8yMSAxMDo1OEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gSGkgUHJhdHl1c2gsCj4gPiAKPiA+IHAueWFkYXZAdGkuY29tIHdyb3RlIG9uIFR1ZSwg
MjEgRGVjIDIwMjEgMDA6Mjg6NDIgKzA1MzA6Cj4gPiAgIAo+ID4gPiBPbiAxNy8xMi8yMSAwNTox
NlBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+ID4gTm93IHRoYXQgc3BpX21lbV9kZWZh
dWx0X3N1cHBvcnRzX29wKCkgaGFzIGFjY2VzcyB0byB0aGUgc3RhdGljCj4gPiA+ID4gY29udHJv
bGxlciBjYXBhYmlsaXRpZXMgKHJlbGF0ZWQgdG8gbWVtb3J5IG9wZXJhdGlvbnMpLCBhbmQgbm93
IHRoYXQKPiA+ID4gPiB0aGVzZSBjYXBhYmlsaXRpZXMgaGF2ZSBiZWVuIGZpbGxlZCBieSB0aGUg
aW1wYWN0ZWQgY29udHJvbGxlcnMsIHRoZXJlCj4gPiA+ID4gaXMgbm8gbmVlZCBmb3IgYSBzcGVj
aWZpYyBoZWxwZXIgY2hlY2tpbmcgb25seSBEVFIgb3BlcmF0aW9ucywgc28gbGV0J3MKPiA+ID4g
PiBqdXN0IGtpbGwgc3BpX21lbV9kdHJfc3VwcG9ydHNfb3AoKSBhbmQgc2ltcGx5IHVzZQo+ID4g
PiA+IHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpIGluc3RlYWQuCj4gPiA+ID4gCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5j
IHwgIDUgKy0tLS0KPiA+ID4gPiAgZHJpdmVycy9zcGkvc3BpLW1lbS5jICAgICAgICAgICAgIHwg
MTAgLS0tLS0tLS0tLQo+ID4gPiA+ICBkcml2ZXJzL3NwaS9zcGktbXhpYy5jICAgICAgICAgICAg
fCAxMCArLS0tLS0tLS0tCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaCAgICAg
ICB8IDExIC0tLS0tLS0tLS0tCj4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzNCBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLW14aWMuYyBiL2RyaXZlcnMvc3BpL3NwaS1teGljLmMKPiA+ID4gPiBpbmRleCBl
MTM3YjFlYzg1ZDQuLjY3ZDA1ZWU4ZDZhMCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3Nw
aS9zcGktbXhpYy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW14aWMuYwo+ID4gPiA+
IEBAIC0zMzUsOCArMzM1LDYgQEAgc3RhdGljIGludCBteGljX3NwaV9kYXRhX3hmZXIoc3RydWN0
IG14aWNfc3BpICpteGljLCBjb25zdCB2b2lkICp0eGJ1ZiwKPiA+ID4gPiAgc3RhdGljIGJvb2wg
bXhpY19zcGlfbWVtX3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gPiA+ID4gIAkJ
CQkgICAgIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKPiA+ID4gPiAgewo+ID4gPiA+IC0J
Ym9vbCBhbGxfZmFsc2U7Cj4gPiA+ID4gLQo+ID4gPiA+ICAJaWYgKG9wLT5kYXRhLmJ1c3dpZHRo
ID4gOCB8fCBvcC0+YWRkci5idXN3aWR0aCA+IDggfHwKPiA+ID4gPiAgCSAgICBvcC0+ZHVtbXku
YnVzd2lkdGggPiA4IHx8IG9wLT5jbWQuYnVzd2lkdGggPiA4KQo+ID4gPiA+ICAJCXJldHVybiBm
YWxzZTsKPiA+ID4gPiBAQCAtMzQ4LDEzICszNDYsNyBAQCBzdGF0aWMgYm9vbCBteGljX3NwaV9t
ZW1fc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiA+ID4gPiAgCWlmIChvcC0+YWRk
ci5uYnl0ZXMgPiA3KQo+ID4gPiA+ICAJCXJldHVybiBmYWxzZTsKPiA+ID4gPiAgCj4gPiA+ID4g
LQlhbGxfZmFsc2UgPSAhb3AtPmNtZC5kdHIgJiYgIW9wLT5hZGRyLmR0ciAmJiAhb3AtPmR1bW15
LmR0ciAmJgo+ID4gPiA+IC0JCSAgICAhb3AtPmRhdGEuZHRyOwo+ID4gPiA+IC0KPiA+ID4gPiAt
CWlmIChhbGxfZmFsc2UpCj4gPiA+ID4gLQkJcmV0dXJuIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0
c19vcChtZW0sIG9wKTsKPiA+ID4gPiAtCWVsc2UKPiA+ID4gPiAtCQlyZXR1cm4gc3BpX21lbV9k
dHJfc3VwcG9ydHNfb3AobWVtLCBvcCk7Cj4gPiA+ID4gKwlyZXR1cm4gc3BpX21lbV9kZWZhdWx0
X3N1cHBvcnRzX29wKG1lbSwgb3ApOyAgICAKPiA+ID4gCj4gPiA+IERvZXMgdGhpcyBjb250cm9s
bGVyIHN1cHBvcnQgbWl4ZWQgRFRSIG1vZGVzPyBJZiBpdCBkb2Vzbid0IHRoZW4gaXQgCj4gPiA+
IHNob3VsZCByZWplY3QgbWl4ZWQgRFRSIG9wcyBiZWZvcmUgY2FsbGluZyAKPiA+ID4gc3BpX21l
bV9kZWZhdWx0X3N1cHBvcnRzX29wKCkuIEFueXdheSwgdGhlIGN1cnJlbnQgZHJpdmVyIGRvZXNu
J3QgY2hlY2sgCj4gPiA+IGZvciBpdCBlaXRoZXIgc28gdGhpcyBjaGFuZ2UgZG9lcyBub3QgbWFr
ZSBhbnl0aGluZyB3b3JzZSBhdCB0aGUgdmVyeSAKPiA+ID4gbGVhc3QuICAKPiA+IAo+ID4gVGhl
IENhZGVuY2UgU1BJIGRyaXZlciBkb2VzIHNvbWV0aGluZyBsaWtlOgo+ID4gCj4gPiBhbGxfdHJ1
ZSA9IGNtZC5kdHIgJiYgYWRkci5kdHIgLi4uOwo+ID4gYWxsX2ZhbHNlID0gIWNtZC5kdHIgJiYg
IWFkZHIuZHRyIC4uLjsKPiA+IGlmICghYWxsX3RydWUgfHwgIWFsbF9mYWxzZSkKPiA+IAlyZXR1
cm4gZmFsc2U7Cj4gPiAKPiA+IFRoaXMgYmFzaWNhbGx5IHJ1bGVzIG91dCBhbnkgbWl4ZWQgRFRS
IG9wZXJhdGlvbi4KPiA+IAo+ID4gSSBiZWxpZXZlIE1hY3Jvbml4IGNvZGUgaXMgaW5zcGlyZWQg
ZnJvbSB0aGlzIGZ1bmN0aW9uLCBidXQgdGhleQo+ID4gaW50ZW50aW9uYWxseSBkcm9wcGVkIHRo
ZSBhbGxfdHJ1ZSBjaGVjaywgbWFraW5nIHRoZSBzaXR1YXRpb24gYm9vbGVhbjoKPiA+IGVpdGhl
ciB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgRFRSIG9wLCBvciB0aGVyZSBpcyBub25lLiBTbyBJIGJl
bGlldmUKPiA+IHRoaXMgd2FzIGRvbmUgb24gcHVycG9zZSBhbmQgdGhpcyBjb250cm9sbGVyIHN1
cHBvcnRzIG1peGVkIERUUiBvcHMuICAKPiAKPiBJIHNlZSB0aGF0IHlvdXIgb3RoZXIgcGF0Y2hl
cyBpbiB0aGlzIHNlcmllcyB0b3VjaCB0aGlzIGRyaXZlciBzbyB5b3UgCj4gc2hvdWxkIGhhdmUg
dGhlIGRhdGFzaGVldCByaWdodD8gQ2FuIHlvdSBsb29rIGFuZCBzZWUgZm9yIHN1cmUgaWYgaXQg
Cj4gZG9lcz8gSSBhbSBmaW5lIHdpdGggdGhlIHBhdGNoIGFzIGl0IGlzIGJ1dCBpZiB3ZSBjYW4g
bWFrZSB0aGUgY2hlY2sgCj4gc3RyaWN0ZXIgaXQgd291bGQgYmUgbmljZS4KCkFzIGRpc2N1c3Nl
ZCBvbiBJUkMsIEkndmUgY2hlY2tlZCB0aGUgZGF0YXNoZWV0IGFuZCBpbmRlZWQgdGhlCmZvbGxv
d2luZyBtb2RlcyBhcmUgc3VwcG9ydGVkOgoqIDFTLTFELTFECiogMVMtMkQtMkQKKiAxUy00RC00
RAoqIDRTLTRELTRECgpTbyB5ZXMsIGV2ZW4gaWYgdGhlcmUgaXMgbm8gdXNlIG9mIHRoZXNlIG1v
ZGVzIHlldCwgY2VydGFpbiBtaXhlZCBtb2RlcwphcmUgc3VwcG9ydGVkIGJ5IHRoaXMgY29udHJv
bGxlci4KCj4gCj4gPiAgIAo+ID4gPiBSZXZpZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFk
YXZAdGkuY29tPiAgCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
