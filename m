Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E26C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klSuO3pMtu8O/dvbQ9EkL/3+9oCLKRaa5MM/agkouqI=; b=GeOHx0RCuLxy1K
	6VCyO+RWNf1bYWWXwuWNmJNPrZveMTmBAZAi0kOVnID3fT8FBRbfItisLviWZXxApYhNAFQUgoyow
	LPAjM9juYg9IPSufWp8JhPN8ZaKaY9EywGZqV14J00KBBh2cETXIWBw1mYGQ/a27NCLMfHfncx3Uk
	6VNUVXP0xE7BAIbar3yn+nypSMHiLVkcYpDC0+YoZYfGleK0ZQnWqzQv0sRcu90XRQwet5vNyctPc
	oRjCGGFkI5Eu30/jYV82JbQOURoIVs6xnLZgKfjczRaZ8vF3ngfSWOCMj33W4Rn3c6IT4gFm9g+LX
	Vginsx1iFn+BYLkziTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Q1l-009Rgy-RK; Mon, 03 Jan 2022 16:17:41 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Q1a-009RfJ-8u; Mon, 03 Jan 2022 16:17:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 49201200006;
 Mon,  3 Jan 2022 16:17:23 +0000 (UTC)
Date: Mon, 3 Jan 2022 17:17:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Andrew Jeffery <andrew@aj.id.au>, Potin Lai
 <potin.lai@quantatw.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20220103171721.46c8e697@xps13>
In-Reply-To: <20211231102623.izaqlzjvracbbgmp@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_081730_472769_8D2D5374 
X-CRM114-Status: GOOD (  29.14  )
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

SGVsbG8sCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBGcmksIDMxIERlYyAyMDIxIDE1OjU2OjI1
ICswNTMwOgoKPiBIaSBQYXRyaWNrLAo+IAo+IE9uIDMwLzEyLzIxIDA5OjI5QU0sIFBhdHJpY2sg
V2lsbGlhbXMgd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAyOSwgMjAyMSBhdCAxMTowNDoxM1BNICsw
NTMwLCBQcmF0eXVzaCBZYWRhdiB3cm90ZTogIAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDI5
LzEyLzIxIDA4OjMzQU0sIFBhdHJpY2sgV2lsbGlhbXMgd3JvdGU6ICAKPiA+ICAgIAo+ID4gPiBU
aGUgcGF0Y2ggaXRzZWxmIGxvb2tzIGZpbmUgdG8gbWUgYnV0IHdlIG5vIGxvbmdlciB3YW50IHRv
IG1haW50YWluIAo+ID4gPiBkcml2ZXJzIHVuZGVyIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJv
bGxlcnMvLiBUaGV5IHNob3VsZCBiZSBtb3ZlZCB0byAKPiA+ID4gaW1wbGVtZW50IHRoZSBTUEkg
TUVNIEFQSSAodW5kZXIgZHJpdmVycy9zcGkvKS4gIAo+ID4gCj4gPiBJcyB0aGUgbGludXgtYXNw
ZWVkIGNvbW11bml0eSBhd2FyZSBvZiB0aGlzPyAgQXJlIHlvdSBzYXlpbmcgeW91IGRvbid0IHdh
bnQgdG8KPiA+IHRha2UgZml4ZXMgZm9yIHRoZWlyIGRyaXZlciBpbnRvIHRoZSBNVEQgdHJlZT8g
IENhbiBpdCBiZSBwdWxsZWQgaW50byB0aGUgQXNwZWVkCj4gPiB0cmVlPyAgCj4gCj4gSSBhbSBm
aW5lIHdpdGggdGFraW5nIGluIGJ1ZyBmaXhlcyBidXQgbm8gbG9uZ2VyIHdhbnQgdG8gdGFrZSBp
biBhbnkgbmV3IAo+IGZlYXR1cmVzLiBNeSBtYWluIGludGVudGlvbiB3YXMgdG8gbnVkZ2UgeW91
IHRvIGNvbnZlcnQgaXQgdG8gU1BJIE1FTSAKPiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhpcyBp
cyBhIGJ1ZyBmaXggb3IgYSBuZXcgZmVhdHVyZSwgYmVjYXVzZSAKPiBldmVudHVhbGx5IHdlIHdh
bnQgdG8gZ2V0IHJpZCBvZiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzLyBhbmQgCj4g
dGhlIEFQSSB0aGF0IGNvbWVzIGFsb25nIHdpdGggaXQuCgpJIHRvdGFsbHkgYWdyZWUgd2l0aCBQ
cmF0eXVzaCBoZXJlLCB3ZSBubyBsb25nZXIgd2FudCB0byBzdXBwb3J0IHRoZQpzcGktbm9yIGNv
bnRyb2xsZXIgQVBJIHNvIGlmLCBhcyB5b3Ugc2F5LCB0aGVyZSBhcmUgYm9hcmRzIGZhaWxpbmcK
aW4gdGhlIGZpZWxkLCBpdCBtZWFucyB0aGVyZSBhcmUgc3RpbGwgdXNlcnMgYW5kIHRoZXNlIHVz
ZXJzIG11c3QgYmUKd2FybmVkIHRoYXQgYXQgc29tZSBwb2ludCB3ZSBtaWdodCBkaXNjb250aW51
ZSB0aGUgc3VwcG9ydCBvZiB0aGVzZQpkcml2ZXJzIGlmIGl0IGJlY29tZXMgdG9vIHBhaW5mdWwu
Cgo+IEFzIGZvciB5b3VyIHBhdGNoLCBJIGNlcnRhaW5seSBkb24ndCB3YW50IGl0IHRvIGdvIHZp
YSB0aGUgYXNwZWVkIHRyZWUuCgpEZWZpbml0ZWx5LCBuby4KCj4gSXQgc2hvdWxkIGdvIHZpYSB0
aGUgTVREIHRyZWUgb3Igbm90IGF0IGFsbC4gSSBhbSBub3QgcXVpdGUgc3VyZSBpZiB0aGlzIAo+
IGNvdW50cyBhcyBhIGJ1ZyBmaXggb3IgYSBuZXcgZmVhdHVyZSB0aG91Z2guCj4gCj4gPiAgIAo+
ID4gPiBDb3VsZCB5b3UgcGxlYXNlIHZvbHVudGVlciB0byBkbyB0aGUgY29udmVyc2lvbiBmb3Ig
dGhpcyBkcml2ZXI/ICAKPiA+IAo+ID4gSSdtIG5vdCBwZXJzb25hbGx5IGdvaW5nIHRvIGJlIGFi
bGUgdG8gZ2V0IHRvIGl0IGZvciBhdCBsZWFzdCB0aGUgbmV4dCAzIG1vbnRocy4KPiA+IAo+ID4g
SXQgbG9va3MgbGlrZSB3ZSBkb24ndCBoYXZlIGEgZGVkaWNhdGVkIG1haW50YWluZXIgZm9yIHRo
aXMgZHJpdmVyIG90aGVyIHRoYW4KPiA+IEpvZWwgYnkgbmF0dXJlIG9mIGhpbSBiZWluZyBsaXN0
ZWQgYXMgdGhlIG1haW50YWluZXIgb2YgIkFSTS9BU1BFRUQgTUFDSElORQo+ID4gU1VQUE9SVCIu
ICBJJ20gbm90IHN1cmUgaWYgQXNwZWVkIHRoZW1zZWx2ZXMgYXJlIHBsYW5uaW5nIG9uIGRvaW5n
IHRoZSBuZWNlc3NhcnkKPiA+IHJlZmFjdG9yaW5nIGhlcmUuCj4gPiAKPiA+IAo+ID4gSm9lbCwg
YXJlIHlvdSBhd2FyZSBvZiB0aGlzIGRyaXZlciB1c2luZyBhIGRlcHJlY2F0ZWQgaW1wbGVtZW50
YXRpb24/ICBXZXJlCj4gPiB0aGVyZSBhbnlvbmUgcGxhbm5pbmcgdG8gZG8gdGhlIHJld29ya3Mg
dGhhdCB5b3UgYXJlIGF3YXJlIG9mPyAgSSdkIGxpa2UgdG8gZ2V0Cj4gPiB0aGlzIGZpeCBhdCBs
ZWFzdCBpbnRvIHRoZSBPcGVuQk1DIGtlcm5lbCB0cmVlIGJlY2F1c2UgSSdtIHNlZWluZyB0aGlz
IGZhaWwgaW4KPiA+IHRoZSByZWFsIHdvcmxkLiAgCj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
