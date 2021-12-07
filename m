Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D02EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NP6jSZqKrIcP/J8n9FZXX73cX5+OzrBivvykh6/iFNQ=; b=K7fhRlP7s0CeiF
	dZgI3v7SNIJ3qRHCgKr83vWz0hGmEHbPtczPSEb3C6jbGuyN42P4VyfNPnzPyEKsQRGqfcTX/Bt03
	Ge5UIESBINe0Gz1BMyCQuK4wm5HBFtH6S1umYQSrSkB2bDa6tmJea2vW7hX7hJQ8ckw2kSAgvLjt/
	0n9xsGzA0Of53/+Ny65P7YlLj0iyRFjJGgcQNqUrHEHsbaBEbdk/gsqIMuOFkxwdg7vbCvC0XH/AF
	tJy0RTZCm+YwWMPArvM9iY1M4qyx5KzC42DMQ0o+XeG6/4X3uvg5MnRBtmQDcoJuw+17bnqtOPZji
	g89IlZyREstU5/zKGl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muY6R-008BO4-94; Tue, 07 Dec 2021 10:53:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muY6M-008BJJ-3S
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 10:53:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F1644FF807;
 Tue,  7 Dec 2021 10:53:32 +0000 (UTC)
Date: Tue, 7 Dec 2021 11:53:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Xiangsheng Hou
 <Xiangsheng.Hou@mediatek.com>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 17/22] mtd: spinand: Create direct mapping
 descriptors for ECC operations
Message-ID: <20211207115332.09cab65f@xps13>
In-Reply-To: <20211207104627.7bbad94d@collabora.com>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
 <20211207093422.166934-18-miquel.raynal@bootlin.com>
 <20211207104627.7bbad94d@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_025338_322006_E33232C5 
X-CRM114-Status: GOOD (  20.50  )
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

SGkgQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBUdWUsIDcg
RGVjIDIwMjEgMTA6NDY6MjcgKzAxMDA6Cgo+IE9uIFR1ZSwgIDcgRGVjIDIwMjEgMTA6MzQ6MTcg
KzAxMDAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiAKPiA+ICAvKioKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgg
Yi9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPiA+IGluZGV4IDg1ZTJmZjdiODQwZC4uM2Jl
NTk0YmUyNGMwIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oCj4g
PiArKysgYi9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPiA+IEBAIC05NCw2ICs5NCw3IEBA
IGVudW0gc3BpX21lbV9kYXRhX2RpciB7Cj4gPiAgICoJCSBvcGVyYXRpb24gZG9lcyBub3QgaW52
b2x2ZSB0cmFuc2ZlcnJpbmcgZGF0YQo+ID4gICAqIEBkYXRhLmJ1Zi5pbjogaW5wdXQgYnVmZmVy
IChtdXN0IGJlIERNQS1hYmxlKQo+ID4gICAqIEBkYXRhLmJ1Zi5vdXQ6IG91dHB1dCBidWZmZXIg
KG11c3QgYmUgRE1BLWFibGUpCj4gPiArICogQGVjY19lbjogZXJyb3IgY29ycmVjdGlvbiBpcyBy
ZXF1aXJlZAo+ID4gICAqLwo+ID4gIHN0cnVjdCBzcGlfbWVtX29wIHsKPiA+ICAJc3RydWN0IHsK
PiA+IEBAIC0xMjYsNiArMTI3LDggQEAgc3RydWN0IHNwaV9tZW1fb3Agewo+ID4gIAkJCWNvbnN0
IHZvaWQgKm91dDsKPiA+ICAJCX0gYnVmOwo+ID4gIAl9IGRhdGE7Cj4gPiArCj4gPiArCWJvb2wg
ZWNjX2VuOwo+ID4gIH07ICAKPiAKPiBJIHJlYWxseSB0aGluayB0aGlzIHNob3VsZCBiZSBpbiBp
dCdzIG93biBjb21taXQuCgpPaCBjcmFwLCBJIGZvcmdvdCBhYm91dCB0aGF0LgoKPiBBbmQgeW91
IG5lZWQgdG8gbWFrZQo+IHN1cmUgYWxsIGV4aXN0aW5nIGRyaXZlcnMgcmVqZWN0IG9wZXJhdGlv
biB0aGF0IGhhdmUgZWNjX2VuIHNldCB0bwo+IHRydWUgKHRoYXQgc2hvdWxkbid0IGJlIHRvbyBj
b21wbGljYXRlZCBzaW5jZSBtb3N0IG9mIHRoZW0gdXNlIGdlbmVyaWMKPiBoZWxwZXJzIHRvIGRv
IHRoZSBjaGVjaykuCgpZZXMsIEkgY2FuIGFkZCB0aGlzIGNoZWNrIGFzIHdlbGwuCgpJIHdpbGwg
cHJvcG9zZSBhIGZpcnN0IHBhdGNoIGNyZWF0aW5nIGEgc3BpLW1lbSBoZWxwZXIgdG8gZG8gZ2Vu
ZXJpYwpjaGVja3MsIGdpdmVuIGEgbnVtYmVyIG9mIGFkZGl0aW9uYWwgcGFyYW1ldGVycyAoZHRy
LCBlY2MpLiBUaGUgY3VycmVudApoZWxwZXJzIHdpbGwgY2FsbCB0aGlzIGdlbmVyaWMgZnVuY3Rp
b24gZGVwZW5kaW5nIG9uIHdoYXQgdGhleSBjaGVjawooc3VwcG9ydCBmb3IgZHRyIG9yIG5vdCku
IFRoZW4gSSB3aWxsIGV4cG9ydCB0aGlzIGdlbmVyaWMgaGVscGVyIGFuZApsZXQgdGhlIGRyaXZl
cnMgdXNlIGl0IGRpcmVjdGx5IGlmIG5lZWRlZCwgaW4gb3JkZXIgdG8gYXZvaWQgdGhlCmV4cGxv
c2lvbiBvZiBoZWxwZXJzIGluIHRoZSBjb3JlIHRvIGNoZWNrIGFsbCB0aGUgcG9zc2libGUgY29t
YmluYXRpb25zLgoKSSdsbCBjZXJ0YWlubHkgcHJvcG9zZSBhIHY0IGp1c3Qgd2l0aCB0aGVzZSBw
YXRjaGVzIGFuZCB0aGVuIGFwcGx5IHRoZW0Kd2l0aGluIHRoZSB2MyBpZiBldmVyeW9uZSBhZ3Jl
ZXMgd2l0aCB0aGUgcmVzdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
