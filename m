Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B518C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vv113Bg3YrQdDVt8eu6apPKRWTwaFAqAtHRJYibvgr0=; b=YLQIINCgyFmhiU
	xFtIfQs37OEfc+7R8x/PnmJW89UAimwuv8UPBK3AqjG86akZrAtdlPHHrmPuCW3zLdXiND+rkJREG
	ZPc0+oFiAjdDH73ndst4zv3gqNwdXb0LeriFtkTUdHODmTd+J4V4XdNR37t/4jwziOkckfzKn9m21
	EoQ6UwlVdYT8wyqhVMCqAqbV/ZR7ax/m/hmE9GDimWDB4ESGhrQb556ayO0Xo3DklweHY8xl3g799
	9P7pDP2kBbANK5menSWD55RtLi5Ydq5caLcSJj2aoGT9qyYxPMHA2GSHlyW+2CWv1e6S85CsDulfi
	uUOctf1CT4rBYBI59gbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySTS-004xWJ-Kx; Tue, 07 Jun 2022 06:13:54 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySTP-004xSg-6C
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 06:13:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9B77160004;
	Tue,  7 Jun 2022 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654582425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMzz6j60B/6ZcgXDNcvKMvG327YtbI6lKJdhb55gzxo=;
	b=oIkJB4jldi4wUPyDkJRMgmnCmSV8cs6m+Rmk5aKcsfUhaZ2CXwPfEjf6VT3qtuCSJz852p
	9Th8yHiVOp1Q9ZC3PAUol1iVMr6GZlgrlItsr73RAHPgoRRtBHZoBAp7caveSld78xyypM
	rTjC3dhheE217vk8zKAKmAM9JVfGp6zyrc2rBaJw6wV9YPIDpOO51SWhHh4/1O25cDxJvS
	LnXfimDdXA7k9dgzxdrv7AtAk+LfVJJxj89FKtd8for0ZW/5DnrsmV5N7iCkrASwTYnK+b
	E0HDzQU2XyyCHpvbmQ191qJx11l5mo5Z2C11hxHqyrZEEJnu/keb1NXq39QCTw==
Date: Tue, 7 Jun 2022 08:13:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-mtd@lists.infradead.org, dev@aboehler.at
Subject: Re: [PATCH] Revert "mtd: rawnand: add support for Toshiba
 TC58NVG0S3HTA00 NAND flash"
Message-ID: <20220607081342.174b9584@xps-13>
In-Reply-To: <20220606192952.34957-1-chunkeey@gmail.com>
References: <20220606155919.23001410@xps-13>
	<20220606192952.34957-1-chunkeey@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_231351_435244_1F8C99AC 
X-CRM114-Status: GOOD (  17.53  )
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

SGkgQ2hyaXN0aWFuLAoKY2h1bmtlZXlAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgIDYgSnVuIDIw
MjIgMjE6Mjk6NTIgKzAyMDA6Cgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMzM4MDU1N2ZjN2UyOGQ5
YmNlNzYwN2UxNmQ5OGYxMjNkMzZkYTRjYS4KPiAKPiBJdCB0dXJuZWQgb3V0IHRoaXMgIjQtYnl0
ZSIgSUQgbWlnaHQgaGF2ZSBiZWVuIGFuIGhvbmVzdCBtaXN0YWtlLgo+IFJlZ3JldHRhYmx5LCB0
aGUgY2hpcCBBbmRyZWFzIGhhcyBtaWdodCBiZSBhIGNvdW50ZXJmZWl0IG9yIGlzCj4gZGFtYWdl
ZCBpbiBzb21lIG90aGVyIHdheSBhbmQgc2hvdWxkbid0IGhhdmUgZW5kZWQgdXAgaW4gYSByb3V0
ZXIuCj4gCj4gQW5kcmVhcyByZXBvcnRlZCBoaXMgY2hpcCBpcyByZXR1cm5pbmcganVzdCBmb3Vy
IGJ5dGVzOgo+ICI5OCBmMSA4MCAxNSAwMCAwMCAwMCAwMCIuCj4gCj4gSG93ZXZlciwgYWNjb3Jk
aW5nIHRvIEtpb3hpYS9Ub3NoaWJhJ3MgZGF0YXNoZWV0LCB0aGVyZSBzaG91bGQKPiBoYXZlIGJl
ZW4gYXQgbGVhc3QgYW5vdGhlciBieXRlIHRoYXQgd291bGQgaGF2ZSBjb250YWluZWQgdGhlCj4g
Y29ycmVjdCBPT0Igc2l6ZSB0aGF0IEFuZHJlYXMgbmVlZGVkLgoKTWF5YmUgaGVyZSB3ZSBzaG91
bGQgbWVudGlvbiB0aGUgb3RoZXIgYWx0ZXJuYXRpdmUgYW5kIGV4cGxhaW4gd2h5IHdlCndlbnQg
Zm9yIGFuIGltbWVkaWF0ZSByZXZlcnQgaW5zdGVhZCAoa25vd2luZyB0aGF0IHdlIHduYXQgdG8g
YnV5IHRpbWUKdG8gZXZlbnR1YWxseSBwcm9wZXJseSBmaXggaXQgYW5kIHBvc3NpYmx5IGludmVu
dG9yeSB0aGUgYnJva2VuIGNoaXBzLiAKCj4gVGhhbmtzIHRvIFBldGVyLXZkTCBmb3IgcmVwb3J0
aW5nIHRoaXMgaXNzdWUgYW5kIEhhbm51IE55bWFuCj4gYXMgd2VsbCBhcyBuZWcybGVkIHdobyBk
aWQgdGhlIGRlYnVnZ2luZy4KCk1heWJlIHlvdSBjYW4gcmVmZXIgaGVyZSB0byBPcGVuV1JUIHRv
b2xzIG90aGVyd2lzZSB0aGUgbmFtZXMgZG8gbm90Cm1lYW4gYW55dGhpbmc/Cgo+IENjOiBBbmRy
ZWFzIEI8QzM+PEI2PmhsZXIgPGRldkBhYm9laGxlci5hdD4KCkxvb2tzIGxpa2UgdGhlcmUgaXMg
YW4gaXNzdWUgd2l0aCBBbmRyZWFzJyBuYW1lLCBJIGNhbiBmaXggaXQgaW5saW5lIGlmCnlvdSBk
b24ndCBrbm93IGhvdyB0byBwcm9jZWVkLCBhbmQgaWYgeW91IGdpdmUgbWUgdGhlIHJpZ2h0IGNo
YXJhY3Rlcgp0byBwdXQgdGhlcmUuCgo+IEJ1Z0xpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
d3J0L29wZW53cnQvaXNzdWVzLzk5NjIKCkxpbms6IGlzIGVub3VnaCA6KQoKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gTGFtcGFydGVyIDxjaHVua2VleUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9pZHMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKPiBpbmRleCA4OGMyNDQw
YjQ3ZDguLmRhY2M1NTI5YjNkZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2lkcy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwo+IEBAIC0y
OSw5ICsyOSw2IEBAIHN0cnVjdCBuYW5kX2ZsYXNoX2RldiBuYW5kX2ZsYXNoX2lkc1tdID0gewo+
ICAJeyJUQzU4TlZHMFMzRSAxRyAzLjNWIDgtYml0IiwKPiAgCQl7IC5pZCA9IHsweDk4LCAweGQx
LCAweDkwLCAweDE1LCAweDc2LCAweDE0LCAweDAxLCAweDAwfSB9LAo+ICAJCSAgU1pfMkssIFNa
XzEyOCwgU1pfMTI4SywgMCwgOCwgNjQsIE5BTkRfRUNDX0lORk8oMSwgU1pfNTEyKSwgfSwKPiAt
CXsiVEM1OE5WRzBTM0hUQTAwIDFHIDMuM1YgOC1iaXQiLAo+IC0JCXsgLmlkID0gezB4OTgsIDB4
ZjEsIDB4ODAsIDB4MTV9IH0sCj4gLQkJICBTWl8ySywgU1pfMTI4LCBTWl8xMjhLLCAwLCA0LCAx
MjgsIE5BTkRfRUNDX0lORk8oOCwgU1pfNTEyKSwgfSwKPiAgCXsiVEM1OE5WRzJTMEYgNEcgMy4z
ViA4LWJpdCIsCj4gIAkJeyAuaWQgPSB7MHg5OCwgMHhkYywgMHg5MCwgMHgyNiwgMHg3NiwgMHgx
NSwgMHgwMSwgMHgwOH0gfSwKPiAgCQkgIFNaXzRLLCBTWl81MTIsIFNaXzI1NkssIDAsIDgsIDIy
NCwgTkFORF9FQ0NfSU5GTyg0LCBTWl81MTIpIH0sCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
