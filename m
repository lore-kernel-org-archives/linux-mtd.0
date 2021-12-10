Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHJotUhxiyj99uif+JxDCaMHqLV7v6bZzeTrl7LMzZE=; b=PlIUXlwTumO8iz
	GQtNLu6cjwdH8GvQU8jWVYlT2H/vGUxRATMcgiu4m3jV3t4yv+nGk8w1K96HcZNNc3Udd0IR4lEfT
	tlQucfv+zYNs9iGS8ZV1s876lk3oxbIsOxbGfb2unoztBk1FB39+224EkmRUHpXUj65cpkoWqlvW8
	WzkLTxlaUbAwMO3VUpLhmi4fUDmdVSqf/8PWObL/JZztFeFH4bwnzu87rAUptnzlkZcEMkOyAzTzO
	P+G+KUUEggexnDVmR55WmMTywtwdsh1XRufsVk5eaJ86qrhKT5ZDAGpQozsrgcx0dA5xsPu2EjWuS
	tyNQWh/2EDmpjVwWFLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjUh-002mNP-PW; Fri, 10 Dec 2021 17:15:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjUc-002mKw-GE
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 17:15:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 85A12FF805;
 Fri, 10 Dec 2021 17:15:27 +0000 (UTC)
Date: Fri, 10 Dec 2021 18:15:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v4 05/12] spi: spi-mem: Export the
 spi_mem_generic_supports_op() helper
Message-ID: <20211210181525.0f6e0038@xps13>
In-Reply-To: <20211210172717.01fabb05@collabora.com>
References: <20211209174046.535229-1-miquel.raynal@bootlin.com>
 <20211209174046.535229-6-miquel.raynal@bootlin.com>
 <20211210172717.01fabb05@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_091534_732840_F05189CF 
X-CRM114-Status: GOOD (  26.26  )
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

SGkgQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBGcmksIDEw
IERlYyAyMDIxIDE3OjI3OjE3ICswMTAwOgoKPiBPbiBUaHUsICA5IERlYyAyMDIxIDE4OjQwOjM5
ICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gCj4gPiBUaGUgY29tYmluYXRpb24gb2YgY2hlY2tzIGFnYWluc3QgdGhlIG51bWJlciBvZiBz
dXBwb3J0ZWQgb3BlcmF0aW9ucyBpcwo+ID4gZ29pbmcgdG8gaW5jcmVhc2UgZXhwb25lbnRpYWxs
eSBlYWNoIHRpbWUgd2UgYWRkIGEgbmV3IHBhcmFtZXRlci4gU28gZmFyCj4gPiB3ZSBvbmx5IGhh
ZCBhIGR0ciBwYXJhbWV0ZXIuIE5vdyB3ZSBhcmUgaW50cm9kdWNpbmcgYW4gRUNDIHBhcmFtZXRl
ci4gV2UKPiA+IG5lZWQgdG8gbWFrZSB0aGlzIGhlbHBlciBhdmFpbGFibGUgZm9yIGRyaXZlcnMg
d2l0aCBzcGVjaWZpYyBuZWVkcywKPiA+IGluc3RlYWQgb2YgY3JlYXRpbmcgYW5vdGhlciBzZXQg
b2YgaGVscGVycyBlYWNoIHRpbWUgd2Ugd2FudCB0byBjaGVjawo+ID4gc29tZXRoaW5nIG5ldy4g
SW4gdGhlIGZ1dHVyZSBpZiB3ZSBzZWUgdGhhdCBtYW55IGRpZmZlcmVudCBkcml2ZXJzIHVzZQo+
ID4gdGhlIHNhbWUgcGFyYW1ldGVyIHZhbHVlcywgd2UgbWlnaHQgYmUgdGVtcHRlZCB0byBjcmVh
dGUgYSBzcGVjaWZpYwo+ID4gaGVscGVyIGZvciB0aGF0LiBCdXQgZm9yIG5vdywgbGV0J3MganVz
dCBtYWtlIHRoZSBnZW5lcmljIG9uZSBhdmFpbGFibGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgfCAgNyArKysrLS0tCj4gPiAgaW5jbHVkZS9saW51
eC9zcGkvc3BpLW1lbS5oIHwgMTMgKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3BpL3NwaS1tZW0uYyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4gaW5kZXggOWUw
NmNkOTE4MjczLi40OGI1NTM5NTE3OGYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGkt
bWVtLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ID4gQEAgLTE2MCw5ICsxNjAs
OSBAQCBzdGF0aWMgYm9vbCBzcGlfbWVtX2NoZWNrX2J1c3dpZHRoKHN0cnVjdCBzcGlfbWVtICpt
ZW0sCj4gPiAgCXJldHVybiB0cnVlOwo+ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMgYm9vbCBzcGlf
bWVtX2dlbmVyaWNfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiA+IC0JCQkJCWNv
bnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCwKPiA+IC0JCQkJCWJvb2wgZHRyLCBib29sIGVjYykK
PiA+ICtib29sIHNwaV9tZW1fZ2VuZXJpY19zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVt
LAo+ID4gKwkJCQkgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wLAo+ID4gKwkJCQkgYm9vbCBk
dHIsIGJvb2wgZWNjKSAgCj4gCj4gTG9va3MgbGlrZSB5b3UncmUgcmVwbGFjaW5nIGEgbWFpbnRl
bmFuY2UgYnVyZGVuIGJ5IGFub3RoZXIuIEV2ZXJ5IHRpbWUKPiB5b3UnbGwgYWRkIGEgbmV3IGNh
cGFiaWxpdHksIHlvdSdsbCBoYXZlIHRvIHBhdGNoIGFsbCB0aGUgd3JhcHBlcnMgYW5kCj4gdGhl
IGRyaXZlcnMgdXNpbmcgdGhpcyBnZW5lcmljIGZ1bmN0aW9uIHRvIHBhc3MgdGhlIGV4dHJhIHBh
cmFtZXRlci4KPiBIb3cgYWJvdXQgcGFzc2luZyBhCj4gCj4gCXN0cnVjdCBzcGlfbWVtX2NvbnRy
b2xsZXJfY2FwcyB7Cj4gCQlib29sIGR0cjsKPiAJCWJvb2wgZWNjOwo+IAl9OwoKT2ggeWVhaCBn
b29kIGlkZWEsIEkgbGlrZSB0aGUgc3RydWN0dXJlIG1vcmUgdGhhbiB0aGUgYml0ZmllbGQuCgo+
IG9yIG1ha2luZyB0aGUgY2FwcyBhIGJpdG1hc2ssIHN1Y2ggdGhhdCBuZXh0IHRpbWUgeW91IGFk
ZCBhIG5ldyBjYXAsIHlvdQo+IGNhbiBqdXN0IGFzc3VtZSBhbGwgZHJpdmVycyBoYXZlIGl0IHNl
dCB0byAwIGJ5IGRlZmF1bHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
