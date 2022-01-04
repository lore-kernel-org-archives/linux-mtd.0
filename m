Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4167C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbJbVaRrRuOX5FhXtS8/lc9z6Z5LSUKXUcHPvD3C+CA=; b=UMqS6qJFxa08Jg
	KU89pn2xMwsrueDJmxubfh41Qm+A2q/7UXPLOGB8juQyjAEXT5i2NASCLw2cssY+uy0+haGhxHJU0
	kSVAU66YKh/wH6tjEgnKnP5No/HtpMOso6lpCpSlG8w99xk1GYSX5P5ONdpqz5jyz3Fh5v6tN1xeV
	k9d0EAfkakBDD5TPMZkXEYJ0awR819RHg8dIiznzAeeX6ilf/ZTowHLMaBp4WbhuPX2U9te+ZF4Un
	Cct6VERrqJisYXoVIlJe/6G06zL7n/9Uy+cPET9cdRkynUCamsrDNG1Vuy9PtqnGc2tJy1YuWC7OE
	/0DmNAxmY0RAPpPHhRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4g3h-00Az42-J4; Tue, 04 Jan 2022 09:24:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4g3d-00Az1m-7i
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 09:24:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E0A671C0002;
 Tue,  4 Jan 2022 09:24:34 +0000 (UTC)
Date: Tue, 4 Jan 2022 10:24:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 06/13] spi: spi-mem: Add an ecc parameter to the
 spi_mem_op structure
Message-ID: <20220104102433.0ad3bb2c@xps13>
In-Reply-To: <20220104100230.1076beed@collabora.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
 <20220104083631.40776-7-miquel.raynal@bootlin.com>
 <20220104100230.1076beed@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_012441_623772_8D3DC0BF 
X-CRM114-Status: GOOD (  27.10  )
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

SGVsbG8gQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBUdWUs
IDQgSmFuIDIwMjIgMTA6MDI6MzAgKzAxMDA6Cgo+IE9uIFR1ZSwgIDQgSmFuIDIwMjIgMDk6MzY6
MjQgKzAxMDAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiAKPiA+IFNvb24gdGhlIFNQSS1OQU5EIGNvcmUgd2lsbCBuZWVkIGEgd2F5IHRvIHJlcXVl
c3QgYSBTUEkgY29udHJvbGxlciB0bwo+ID4gZW5hYmxlIEVDQyBzdXBwb3J0IGZvciBhIGdpdmVu
IG9wZXJhdGlvbi4gVGhpcyBpcyBiZWNhdXNlIG9mIHRoZQo+ID4gcGlwZWxpbmVkIGludGVncmF0
aW9uIG9mIGNlcnRhaW4gRUNDIGVuZ2luZXMsIHdoaWNoIGFyZSBkaXJlY3RseSBtYW5hZ2VkCj4g
PiBieSB0aGUgU1BJIGNvbnRyb2xsZXIgaXRzZWxmLgo+ID4gCj4gPiBJbnRyb2R1Y2UgYSBzcGlf
bWVtX29wIGFkZGl0aW9uYWwgZmllbGQgZm9yIHRoaXMgcHVycG9zZTogZWNjLgo+ID4gCj4gPiBT
byBmYXIgdGhpcyBmaWVsZCBpcyBsZWZ0IHVuc2V0IGFuZCBjaGVja2VkIHRvIGJlIGZhbHNlIGJ5
IGFsbAo+ID4gdGhlIFNQSSBjb250cm9sbGVyIGRyaXZlcnMgaW4gdGhlaXIgLT5zdXBwb3J0c19v
cCgpIGhvb2ssIGFzIHRoZXkgYWxsCj4gPiBjYWxsIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19v
cCgpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgo+ID4gQWNrZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvc3BpL3NwaS1tZW0uYyAgICAgICB8IDUgKysrKysKPiA+
ICBpbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmggfCA1ICsrKysrCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktbWVtLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+IGluZGV4IGVkOTY2ZDgxMjllYi4u
ZjM4YWMzMTk2MWM5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gPiAr
KysgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+IEBAIC0xNzgsNiArMTc4LDExIEBAIGJvb2wg
c3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gPiAgCQkJ
cmV0dXJuIGZhbHNlOwo+ID4gIAl9Cj4gPiAgCj4gPiArCWlmIChvcC0+ZGF0YS5lY2MpIHsKPiA+
ICsJCWlmICghc3BpX21lbV9jb250cm9sbGVyX2lzX2NhcGFibGUoY3RsciwgZWNjKSkKPiA+ICsJ
CQlyZXR1cm4gZmFsc2U7Cj4gPiArCX0gIAo+IAo+IE5pdDoKPiAKPiAJaWYgKG9wLT5kYXRhLmVj
YyAmJgo+IAkgICAgIXNwaV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIGVjYykpCj4g
CQlyZXR1cm4gZmFsc2U7Cj4gCgpBY3R1YWxseSBJIHdhbnRlZCBvbiBwdXJwb3NlIHRvIGRpc3Rp
bmd1aXNoIHRoZSBkaWZmZXJlbnQgY2hlY2tzOgoKaWYgKGR0cikgewoJZG8gc29tZXRoaW5nIGhl
cmU7Cn0KCmlmIChlY2MpIHsKCWRvIHNvbWV0aGluZyBlbHNlOwp9CgpyZXR1cm47CgphbmQgaW4g
b3JkZXIgdG8ga2VlcCB0aGVtIHRpZHkgSSB1c2VkIGluZGVwZW5kZW50IGlmIHN0YXRlbWVudHMg
d2l0aGluCmVhY2ggb2YgdGhlc2UgOikKCj4gPiArCj4gPiAgCXJldHVybiBzcGlfbWVtX2NoZWNr
X2J1c3dpZHRoKG1lbSwgb3ApOwo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChzcGlfbWVt
X2RlZmF1bHRfc3VwcG9ydHNfb3ApOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3Bp
L3NwaS1tZW0uaCBiL2luY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaAo+ID4gaW5kZXggNGExYmZl
Njg5ODcyLi4wNTEwNTBiNDAzMDkgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NwaS9z
cGktbWVtLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaAo+ID4gQEAgLTg5
LDYgKzg5LDcgQEAgZW51bSBzcGlfbWVtX2RhdGFfZGlyIHsKPiA+ICAgKiBAZHVtbXkuZHRyOiB3
aGV0aGVyIHRoZSBkdW1teSBieXRlcyBzaG91bGQgYmUgc2VudCBpbiBEVFIgbW9kZSBvciBub3QK
PiA+ICAgKiBAZGF0YS5idXN3aWR0aDogbnVtYmVyIG9mIElPIGxhbmVzIHVzZWQgdG8gc2VuZC9y
ZWNlaXZlIHRoZSBkYXRhCj4gPiAgICogQGRhdGEuZHRyOiB3aGV0aGVyIHRoZSBkYXRhIHNob3Vs
ZCBiZSBzZW50IGluIERUUiBtb2RlIG9yIG5vdAo+ID4gKyAqIEBkYXRhLmVjYzogd2hldGhlciBl
cnJvciBjb3JyZWN0aW9uIGlzIHJlcXVpcmVkIG9yIG5vdAo+ID4gICAqIEBkYXRhLmRpcjogZGly
ZWN0aW9uIG9mIHRoZSB0cmFuc2Zlcgo+ID4gICAqIEBkYXRhLm5ieXRlczogbnVtYmVyIG9mIGRh
dGEgYnl0ZXMgdG8gc2VuZC9yZWNlaXZlLiBDYW4gYmUgemVybyBpZiB0aGUKPiA+ICAgKgkJIG9w
ZXJhdGlvbiBkb2VzIG5vdCBpbnZvbHZlIHRyYW5zZmVycmluZyBkYXRhCj4gPiBAQCAtMTE5LDYg
KzEyMCw3IEBAIHN0cnVjdCBzcGlfbWVtX29wIHsKPiA+ICAJc3RydWN0IHsKPiA+ICAJCXU4IGJ1
c3dpZHRoOwo+ID4gIAkJdTggZHRyIDogMTsKPiA+ICsJCXU4IGVjYyA6IDE7Cj4gPiAgCQllbnVt
IHNwaV9tZW1fZGF0YV9kaXIgZGlyOwo+ID4gIAkJdW5zaWduZWQgaW50IG5ieXRlczsKPiA+ICAJ
CXVuaW9uIHsKPiA+IEBAIC0xMjYsNiArMTI4LDcgQEAgc3RydWN0IHNwaV9tZW1fb3Agewo+ID4g
IAkJCWNvbnN0IHZvaWQgKm91dDsKPiA+ICAJCX0gYnVmOwo+ID4gIAl9IGRhdGE7Cj4gPiArCj4g
PiAgfTsKPiA+ICAKPiA+ICAjZGVmaW5lIFNQSV9NRU1fT1AoX19jbWQsIF9fYWRkciwgX19kdW1t
eSwgX19kYXRhKQkJXAo+ID4gQEAgLTI4OCw5ICsyOTEsMTEgQEAgc3RydWN0IHNwaV9jb250cm9s
bGVyX21lbV9vcHMgewo+ID4gIC8qKgo+ID4gICAqIHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1f
Y2FwcyAtIFNQSSBtZW1vcnkgY29udHJvbGxlciBjYXBhYmlsaXRpZXMKPiA+ICAgKiBAZHRyOiBT
dXBwb3J0cyBEVFIgb3BlcmF0aW9ucwo+ID4gKyAqIEBlY2M6IFN1cHBvcnRzIG9wZXJhdGlvbnMg
d2l0aCBlcnJvciBjb3JyZWN0aW9uCj4gPiAgICovCj4gPiAgc3RydWN0IHNwaV9jb250cm9sbGVy
X21lbV9jYXBzIHsKPiA+ICAJYm9vbCBkdHI7Cj4gPiArCWJvb2wgZWNjOwo+ID4gIH07Cj4gPiAg
Cj4gPiAgI2RlZmluZSBzcGlfbWVtX2NvbnRyb2xsZXJfaXNfY2FwYWJsZShjdGxyLCBjYXApCVwg
IAo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
