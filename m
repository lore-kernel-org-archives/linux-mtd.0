Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3B0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD6160FE8
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBD6160FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jOwy/7quYGCLg9jtxUd7rIWFuxECR2J9vbVvWt8oVE=; b=V2EqhdqwfJZgW6
	B1Yt/zzjI9hvsOOnqwAZUV6WHWvAajF/bXLedgn6ScHr92lzefSKCUA29WeIjRTDV98cfzOnbWald
	eXbfrVsAfFMNj/De3MNTsEuYh02BE2tcDTWyTxIF3KpLCxN4r8sKABz7Tm3E0N+mBODEqmx8cDJ8r
	bzp6o6SGZypmML0yxTWsD9PGruYARfxdWKqqN3l20Ok5b2aET2ECHe0Kx6ffJxMiFQHuRJ/aqRHeF
	sSB+nVrghzAVOHS7oNJBgSeutWHI5vG2rgnWNutgyfYISahWOX97Em5zRDbThyiiO/G0SGFqfdtgI
	Pt54zu1bWH09KVv4gSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpxM-002tSZ-6l; Fri, 08 Oct 2021 13:30:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpxI-002tQF-FC
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 13:30:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 78EE1FF805;
 Fri,  8 Oct 2021 13:30:28 +0000 (UTC)
Date: Fri, 8 Oct 2021 15:30:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>
Cc: Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211008153026.7a5d8e8b@xps13>
In-Reply-To: <2533161.k3LOHGUjKi@n95hx1g2>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
 <20211008142724.7fbeed6a@xps13> <2533161.k3LOHGUjKi@n95hx1g2>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_063032_667116_5C05ED4E 
X-CRM114-Status: GOOD (  12.87  )
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

SGkgQ2hyaXN0aWFuLAoKY2VnZ2Vyc0BhcnJpLmRlIHdyb3RlIG9uIEZyaSwgOCBPY3QgMjAyMSAx
NToxMzoxNyArMDIwMDoKCj4gT24gRnJpZGF5LCA4IE9jdG9iZXIgMjAyMSwgMTQ6Mjc6MjQgQ0VT
VCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBDb3VsZCBpdCBiZSBw
b3NzaWJsZSB0byBxdWFudGlmeSB0aGUgZXh0cmEgdGltZSBzcGVudCBpbgo+ID4gZGlzYWJsaW5n
L3JlLWVuYWJsaW5nIGNsb2NrcyBqdXN0IGZvciB0aGUgcmVjb3JkPyBTbyBmYXIgdGhpcyBkcml2
ZXIKPiA+IG9ubHkgc3VwcG9ydHMgYSBzaW5nbGUgY2hpcCBhbmQgdGh1cyBmcmVxdWVuY3kgY2hh
bmdlcyBkbyBub3QgaGFwcGVuCj4gPiBmcmVxdWVudGx5IChhIGNvdXBsZSB0aW1lcyBhdCBib290
KSBidXQgaWYgc29tZWRheSB3ZSBpbnRyb2R1Y2Ugc3VwcG9ydAo+ID4gZm9yIHNldmVyYWwgY2hp
cHMgaXQgbWlnaHQgYmVjb21lIHZlcnkgaW1wYWN0aW5nLiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4g
TWlxdcOobAo+ID4gICAKPiAKPiAKPiBrdGltZV90IHN0YXJ0ID0ga3RpbWVfZ2V0KCksIGR1cmF0
aW9uOwo+IF9fZ3BtaV9lbmFibGVfY2xrKHRoaXMsIGZhbHNlKTsKPiBjbGtfc2V0X3JhdGUoci0+
Y2xvY2tbMF0sIGh3LT5jbGtfcmF0ZSk7Cj4gX19ncG1pX2VuYWJsZV9jbGsodGhpcywgdHJ1ZSk7
Cj4gZHVyYXRpb24gPSBrdGltZV9nZXQoKSAtIHN0YXJ0Owo+IHByaW50ayhLRVJOX0VSUiAiJXMo
KSBkdXJhdGlvbiA9ICVsbGQgbnNcbiIsIF9fZnVuY19fLCBrdGltZV90b19ucyhkdXJhdGlvbikp
Owo+IAo+IC0tPiAgIAo+IAo+IGdwbWlfbmZjX2FwcGx5X3RpbWluZ3MoKSBkdXJhdGlvbiA9IDM5
MjUwIG5zCj4gLi4uCj4gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMs
IENoaXAgSUQ6IDB4ZGMKPiBuYW5kOiBNaWNyb24gTVQyOUY0RzA4QUJBREFINAo+IG5hbmQ6IDUx
MiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6
ZTogNjQKPiBncG1pX25mY19hcHBseV90aW1pbmdzKCkgZHVyYXRpb24gPSAzNjc1MCBucwo+IGdw
bWlfbmZjX2FwcGx5X3RpbWluZ3MoKSBkdXJhdGlvbiA9IDE3MDc1MCBucwo+IAo+IE9uIGkuTVg2
VUxMIEAgNzkyTUh6IHRoaXMgdGFrZXMgbGVzcyB0aGFuIDI1MCB1cy4KCk9rIHRoYW5rcyBmb3Ig
dGhlIGZlZWRiYWNrLiBUaGlzIGlzIG5vdCBuZWdsaWdpYmxlIGlmIHdlIHN0YXJ0CnN3aXRjaGlu
ZyBiZXR3ZWVuIGNoaXBzIHdpdGggZGlmZmVyZW50IGZyZXF1ZW5jaWVzIHF1aXRlIHJlZ3VsYXJs
eS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
