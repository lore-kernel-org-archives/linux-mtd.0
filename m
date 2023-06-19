Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851ACEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkVj193AFukAC2jyrgdGVfGPmiPzKnbWyJAtRQVzLAQ=; b=wy/o6upPHvFSb4
	hxkakrPk/YHBM52jQazvlpCxUL+irAiHELnO19fKd/MdjmSAQdR397w8NFkUY6Lb6pFp8DKqpsgFp
	0XtBVvvEv6QUJcs+yUzbwYBVwN8qV1JPTKWwOHt1Axlql+3IEB8QIIUcSSjZwqFjvHMB4ig7K5hAi
	sQBiiQB5AEh5hO7J13l2gc8tniqBo/y88rEoRqF7L/z8ZzAMGzofp2q2o6uNk2RdJWTlbkhmCD2YC
	eVkg4dPbxUGMj9uTJ3vqy0J9u9D++v4rAlW+hrKLu15/biZ+dmlnTxte9ZlhxsnzPmW0zCyUE9yfA
	O2hEDsXv+Fs4gc8+8ctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8r9-007eHc-1D;
	Mon, 19 Jun 2023 06:59:19 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8r5-007eG7-2q
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 06:59:17 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687157950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1KdaauZRk96Ps44rUmpp7eWpG6S5yUxJCxmfYf6qgM=;
	b=ZzcjdfySthabM0zwwHRt1qjl5uHoBJyBFM3a9KGwn4wmcEgpXqz7RoiRfUc3aaoWzPKPLM
	kYCaHQXaMTFzt+56IoAZJ2CIwyeQ8NnBwsm5nt3fxqMlnfJooKNiSkxa9DF2YQIwizBIkp
	ElV4CwsedGEeLQtYM4DK22tQ/JeF8g8agIlgjxqIpaEHJ385URefEz09+mk+5sCg5/tiyG
	KffZMbLAmIy1jrPns2MU3S4Fo61BHOcYDw4lIbRrVlvFnHZF91leRj5UzAAqrS+nK2QIhb
	479hBJsQcBD3cpiGAf7ADVY8WyEEzcDO/dphmff7/pRV6rYIXyPgjerlDkwJbw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0FA5E000D;
	Mon, 19 Jun 2023 06:59:08 +0000 (UTC)
Date: Mon, 19 Jun 2023 08:59:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 02/17] dt-bindings: mtd: Create a file for raw NAND
 chip properties
Message-ID: <20230619085907.70218553@xps-13>
In-Reply-To: <f7218445-77e7-7429-5d81-ee7380a3e045@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<20230606175246.190465-3-miquel.raynal@bootlin.com>
	<f7218445-77e7-7429-5d81-ee7380a3e045@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_235916_397462_EB3A7B4E 
X-CRM114-Status: GOOD (  24.40  )
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

SGkgS3J6eXN6dG9mLAoKa3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMTkgSnVuIDIwMjMg
MDg6Mjg6MjggKzAyMDA6Cgo+IE9uIDA2LzA2LzIwMjMgMTk6NTIsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiBJbiBhbiBlZmZvcnQgdG8gY29uc3RyYWluIGFzIG11Y2ggYXMgd2UgY2FuIHRoZSBl
eGlzdGluZyBiaW5kaW5nLCB3ZQo+ID4gd2FudCB0byBhZGQgInVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UiIGluIGFsbCB0aGUgTkFORCBjaGlwCj4gPiBkZXNjcmlwdGlvbnMgcGFydCBvZiBO
QU5EIGNvbnRyb2xsZXIgYmluZGluZ3MuIEJ1dCBpbiBvcmRlciB0byBkbyB0aGF0Cj4gPiBwcm9w
ZXJseSwgd2UgYWxzbyBuZWVkIHRvIHJlZmVyZW5jZSBhIGZpbGUgd2hpY2ggY29udGFpbnMgYWxs
IHRoZQo+ID4gImFsbG93ZWQiIHByb3BlcnRpZXMuIFJpZ2h0IG5vdyB0aGlzIGZpbGUgaXMgbmFu
ZC1jaGlwLnlhbWwgYnV0IGluCj4gPiBwcmFjdGljZSByYXcgTkFORCBjb250cm9sbGVycyBtYXkg
dXNlIGFkZGl0aW9uYWwgcHJvcGVydGllcyBpbiB0aGVpcgo+ID4gTkFORCBjaGlwIGNoaWxkcmVu
IG5vZGUuIFRoZXNlIHByb3BlcnRpZXMgYXJlIGxpc3RlZCB1bmRlcgo+ID4gbmFuZC1jb250cm9s
bGVyLnlhbWwsIHdoaWNoIG1ha2VzIHRoZSAidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzIiBjaGVja3MK
PiA+IGZhaWwgd2hpbGUgdGhlIGRlc2NyaXB0aW9uIGFyZSB2YWxpZC4gV2UgbmVlZCB0byBtb3Zl
IHRoZXNlIE5BTkQgY2hpcAo+ID4gcmVsYXRlZCBwcm9wZXJ0aWVzIGludG8gYW5vdGhlciBmaWxl
LCBiZWNhdXNlIHdlIGRvIG5vdCB3YW50IHRvIHBvbGx1dGUKPiA+IG5hbmQtY2hpcC55YW1sIHdo
aWNoIGlzIGFsc28gcmVmZXJlbmNlZCBieSBlZy4gU1BJLU5BTkQgZGV2aWNlcy4KPiA+IAo+ID4g
TGV0J3MgY3JlYXRlIGEgcmF3LW5hbmQtY2hpcC55YW1sIGZpbGUgdG8gcmVmZXJlbmNlIGFsbCB0
aGUgcHJvcGVydGllcyBhCj4gPiByYXcgTkFORCBjaGlwIGRlc2NyaXB0aW9uIGNhbiBjb250YWlu
LiBUaGUgY2hhaW4gb2YgaW5oZXJpdGFuY2UgYmVjb21lczoKPiA+ICAgbmFuZC1jb250cm9sbGVy
LnlhbWwgPC0gcmF3LW5hbmQtY2hpcC55YW1sCj4gPiAgIHJhdy1uYW5kLWNoaXAueWFtbCAgIDwt
IG5hbmQtY2hpcC55YW1sCj4gPiAgIHNwaS1uYW5kLnlhbWwgICAgICAgIDwtIG5hbmQtY2hpcC55
YW1sICAKPiAKPiAuLi4KPiAKPiA+IC0gIFRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGVzZSBwYXJh
bWV0ZXJzIGlzIGltcGxlbWVudGF0aW9uLWRlZmluZWQsIHNvCj4gPiAtICBub3QgYWxsIGltcGxl
bWVudGF0aW9ucyBtdXN0IHN1cHBvcnQgYWxsIHBvc3NpYmxlCj4gPiAtICBjb21iaW5hdGlvbnMu
IEhvd2V2ZXIsIGltcGxlbWVudGF0aW9ucyBhcmUgZW5jb3VyYWdlZCB0byBmdXJ0aGVyCj4gPiAt
ICBzcGVjaWZ5IHRoZSB2YWx1ZShzKSB0aGV5IHN1cHBvcnQuCj4gPiAtCj4gPiAgcHJvcGVydGll
czoKPiA+ICAgICRub2RlbmFtZToKPiA+ICAgICAgcGF0dGVybjogIl5uYW5kLWNvbnRyb2xsZXIo
QC4qKT8iCj4gPiBAQCAtNTEsNzkgKzQxLDggQEAgcHJvcGVydGllczoKPiA+ICAKPiA+ICBwYXR0
ZXJuUHJvcGVydGllczoKPiA+ICAgICJebmFuZEBbYS1mMC05XSQiOgo+ID4gLSAgICAkcmVmOiAi
bmFuZC1jaGlwLnlhbWwjIiAgCj4gCj4gWW91IHdvcmsgb24gc29tZSBvbGQgdHJlZSwganVkZ2lu
ZyBieSBlbWFpbCBhZGRyZXNzZXMgeW91IENDIGFuZCBieQo+IHRoaXMuIEkgd291bGQgZXhwZWN0
IGhlcmUgY3VycmVudCBuZXh0LCBidXQgdGhpcyBpcyBldmVuIHByZSB2Ni40LXJjMSEKPiBXb3Jr
aW5nIG9uIHNvbWV0aGluZyBvbGRlciB0aGFuIGN1cnJlbnQgbWFzdGVyIGJyYW5jaCBkb3NzIG5v
dCBtYWtlIGFueQo+IHNlbnNlLgoKVGhpcyBpcyByZWFsbHkgYmFzZWQgb24gdjYuNC1yYzEsIEkg
dGhpbmsgUm9iJ3MgdG9vbGluZyBpcyBhcHBseWluZyB0aGUKcGF0Y2hlcyBhZ2FpbnN0IC1yYzEg
c28gSSB0cnkgdG8ga2VlcCB0aGUgcm9ib3RzIGhhcHB5IGJ5IHBpY2tpbmcgdGhhdAp0YWcgYXMg
YmFzZS4gSSBrbm93IHlvdSBhcmUgcmVtb3ZpbmcgdGhlIHF1b3RlcyBzbyBJIHdlbnQgdGhyb3Vn
aCBteQpzZXJpZXMgYW5kIGRyb3BwZWQgdGhlbSBmcm9tIGFsbCB0aGUgZmlsZXMgd2hpY2ggbm93
IHJlZmVyZW5jZQpyYXctbmFuZC1jaGlwLnlhbWwsIGJ1dCBvZiBjb3Vyc2UgSSBtaXNzZWQgdGhh
dCBvbmUsIEkgYW0gc29ycnksIEkgd2lsbApkcm9wIHRoZSBxdW90ZXMgaGVyZSBhcyB3ZWxsLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
