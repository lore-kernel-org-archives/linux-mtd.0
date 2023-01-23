Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA2C25B50
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+tC1gWioaqboLtQvmt0ifGOhAPLzXKMgP+napmFTqI=; b=dYxtO7Xdpt5rDm
	IKA2k3PXsHol+yaULqrM8ZYMKiFl3778HgfuoQQcXNk5FbkhN59jrKoHl2R1l0kzihNHeMsUonj76
	olkO7+nwMNr1zXgFPDmfyLIT3fWjVrSIMmBGIkJx/IkBdpKjbttXc5pKOXftA8kqtL55gylEqLdMQ
	jGOxYAu0061SHqtLyJMkQbIg4ZdSTn5uyi3j1ZDjcl20VGvtPM4ed7fyWmyq7g+lPZ+Ual1x4unX0
	McMi29gbFQCdf1DEpSPnViXCei7ooWffVfbvKCUytPq0YHlk8At90I7rgldYjYvGFqLV7KyAmXIoO
	XQLuGfKeb7UGRLcvTOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtss-00Gk9j-JX; Mon, 23 Jan 2023 10:17:02 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtiS-00Gfvg-6c
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 10:06:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 085EA2000E;
	Mon, 23 Jan 2023 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674468371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhTtFs8BJboYc4x/DQh19/JUdYYmebA32b72UFPvV+8=;
	b=gd5ZCEIfDs/KCuZdMOIai+faC4NIaLXfxSDxQ2bgAUUupZuqlZ8SNwfbQfNFLvprPpAidE
	mcA94lxeisWG3dKcdHhZ1jAKFxNm5jimhxM4RRkRgM63ane9cX+jrQX12E6aZURTHw+epq
	DC039cl0/ckPxzVXZ/cJSARCCeN6X4nlMWf4kk/0NBAU37b2eC18SNFV2tiGFIf5tHdPHw
	FYCQwR8zGmTvFN0fQ7x/hcKQAn2xzh+wLMROU0CBNbtbsuypuoPeq6LMrBVTtQTIVNY74F
	EWiA63pgdrOYikAyc19WuqhTpHAXQyM61RYkz8eD45y61fKA41ozhH1wg/XM6A==
Date: Mon, 23 Jan 2023 11:06:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tom Rini <trini@konsulko.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Simon Glass
 <sjg@chromium.org>, u-boot@lists.denx.de, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Marek Vasut <marex@denx.de>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 0/3] fdt: Fix mtparts fixup
Message-ID: <20230123110606.56110e40@xps-13>
In-Reply-To: <20230113193411.GW3787616@bill-the-cat>
References: <20230113184547.487322-1-francesco@dolcini.it>
	<20230113193411.GW3787616@bill-the-cat>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_020616_635254_0E43310D 
X-CRM114-Status: GOOD (  24.88  )
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

SGkgVG9tLAoKdHJpbmlAa29uc3Vsa28uY29tIHdyb3RlIG9uIEZyaSwgMTMgSmFuIDIwMjMgMTQ6
MzQ6MTEgLTA1MDA6Cgo+IE9uIEZyaSwgSmFuIDEzLCAyMDIzIGF0IDA3OjQ1OjQ0UE0gKzAxMDAs
IEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOgo+IAo+ID4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkg
PGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPgo+ID4gCj4gPiBSZWNlbnRseSB3ZSBoYWQg
YSBib290IHJlZ3Jlc3Npb24gb24gY29saWJyaS1pbXg3IGJlY2F1c2Ugb2YgYSBjbGVhbnVwIGNo
YW5nZQo+ID4gb24gTGludXggaW14Ny5kdHNpIHNldHRpbmcgbmFuZCBjb250cm9sbGVyIG5vZGUg
I3NpemUtY2VsbHMgZnJvbSAxIHRvIDAuCj4gPiAKPiA+IEJlY2F1c2Ugb2YgdGhhdCBMaW51eCBw
YXJ0aXRpb24gcGFyc2VyIHdhcyBubyBsb25nZXIgYWJsZSB0byBwcm9wZXJseQo+ID4gcGFyc2Ug
dGhlIE9GIHBhcnRpdGlvbnMgbGVhZGluZyB0byBhIGJvb3QgZmFpbHVyZSwgdGhlIGFib3ZlIGNo
YW5nZSB3YXMKPiA+IHJldmVydGVkIGluIHRoZSBtZWFudGltZSBhcyBhbiBpbW1lZGlhdGUgd29y
a2Fyb3VuZCwgYnV0IHNvbWUgaW1wcm92ZW1lbnQKPiA+IGlzIHJlcXVpcmVkIG9uIGJvdGggTGlu
dXggYW5kIFUtQm9vdC4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgaW1wcm92ZSB0aGUgVS1Cb290IHBh
cnQgb2YgaXQsICNzaXplLWNlbGwgaXMgc2V0IHRvIDEgd2hlbgo+ID4gaXQgaGFzIGFuIGludmFs
aWQgdmFsdWUuIFRoaXMgaGFzIHRoZSBsaW1pdGF0aW9uIHRvIHdvcmsgb25seSB3aXRoIGRldmlj
ZXMKPiA+IHNtYWxsZXIgdGhhbiA0R2lCLiBJbiBnZW5lcmFsIHRoZSBzdWdnZXN0aW9uIGZyb20g
dGhlIExpbnV4IE1URCBtYWludGFpbmVyIHdvdWxkCj4gPiBiZSB0byBqdXN0IGRlcHJlY2F0ZSB1
c2luZyB0aGlzIFUtQm9vdCBmdW5jdGlvbiBhbmQgcGFzcyB0aGUgTVREIHBhcnRpdGlvbnMKPiA+
IGZyb20gdGhlIGNvbW1hbmQgbGluZSwgdW5sZXNzIHRoZXkgYXJlIHN0YXRpY2FsbHkgZGVmaW5l
ZCBpbiB0aGUgRFRTIGZpbGUKPiA+IGluIHRoZSBmaXJzdCBwbGFjZS4KPiA+IAo+ID4gVGhpcyBz
ZXJpZXMgdGhlcmVmb3JlIGNvbnZlcnQgY29saWJyaS1pbXg2dWxsIGFuZCBjb2xpYnJpLWlteDcg
dG8gcGFzcyB0aGUKPiA+IHBhcnRpdGlvbiBsaXN0IGZyb20gdGhlIGNvbW1hbmQgbGluZSBpbnN0
ZWFkIG9mIGZpeGluZyB1cCB0aGUgRFQuCj4gPiAKPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIyMTIwMjA3MTkwMC4xMTQzOTUwLTEtZnJhbmNlc2NvQGRvbGNpbmkuaXQv
Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWTRkZ0JUR05XcE02U1FYSUBm
cmFuY2VzY28tbmIuaW50LnRvcmFkZXguY29tLyAgCj4gCj4gTXkgaGlnaGVyIGxldmVsIHF1ZXN0
aW9uIC8gY29uY2VybiBoZXJlIGlzLCBpcyB1c2luZyBvbmUgb2YgdGhlIGR0cwo+IHBhcnRpdGlv
biBzY2hlbWVzIHN0aWxsIHZhbGlkIC8gcHJlZmVycmVkLCBvciBzaG91bGQgZXZlcnlvbmUgbm93
IGhhdmUKPiByZXZlcnRlZCB0byBwYXNzaW5nIHZpYSB0aGUga2VybmVsIGNvbW1hbmQgbGluZT8g
IElmIGRldmljZSB0cmVlIHN0aWxsLAo+IGlzIG10ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlv
bnMueWFtbCB0aGUgb25lIHRvIGZvbGxvdyBvciBzb21ldGhpbmcKPiBlbHNlPwoKSSBkb24ndCB0
aGluayB3ZSBjYW4gInByZWZlciIgb25lIG1vZGUgb3ZlciB0aGUgb3RoZXIgYmV0d2VlbiBjbWRs
aW5lCmFuZCBEVFMuIEJvdGggc2hvdWxkIHdvcmsgcHJldHR5IHdlbGwuIE9mIGNvdXJzZSBvbiB0
aGUgY21kbGluZSB5b3UgY2FuCm9ubHkgZGVmaW5lIGZpeGVkIHBhcnRpdGlvbnMgYW5kIG1hbnkg
ZGV2aWNlcyByZXF1aXJlIG1vcmUgYWR2YW5jZWQKcGFyc2Vycywgd2hpY2ggYXJlIG9ubHkgYXZh
aWxhYmxlIHRocm91Z2ggRFRTLCBidXQgZm9yIHNpbXBsZQpwYXJ0aXRpb25zLCBpdCB3b3JrcyB0
b3RhbGx5IG9rYXkuCgpUaGUgb25seSB0aGluZyB0aGF0IEkgd291bGQgbGlrZSB0byBhdm9pZCBp
cyB0aGUgbmVlZCB0byB3cml0ZSBjb2RlIGluCnRoZSBib290bG9hZGVycyB0byB0d2VhayB0aGUg
RkRUIGluIG9yZGVyIHRvIGFkZCBwYXJ0aXRpb25zLiBUaGF0IGlzCmNsZWFybHkgbm90IG5lZWRl
ZCwgZXJyb3IgcHJvbmUsIGFuZCBkbyBub3QgZm9sbG93IGV2b2x1dGlvbiBvZiB0aGUKInN0YW5k
YXJkIiwgYXMgd2UganVzdCBkaXNjb3ZlcmVkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
