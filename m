Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD03EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6S+G5Tbv1qwNuvH+WrffpPE0+TNphJis493YmtizUM=; b=sq1Ua5EAZH9Xek
	ja8Tr0jjtbMsR18epxzKbnPDOQdnCeG7wa+cSfghSYJ6JZU10bAqYLVe5LJNUC2SwdphwHBJ6x3Iu
	ALWQy4TOz/T4PkRKz7OuX4rQkR1bKGJ30KZ2p1MJuRQ4rdqFTFpgTTG5O7mb/KzAnKXBe/mwFKNoj
	HFT5PJJQdjOYFeiL7Fb0qIS6oMrXXOCi6cGXg2myzZOjNFlC11cjBdn3hPlNQZQH46zvNZ+ib08Xu
	4SFdoVo4LrUgXz+H1kS3bqW+VDXBgcioLU1tBe00YmATECBuAy54cxbzUweG23BiGVjwKLBelGrHq
	Uqb639fSQ4ucBYnsUxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5iTh-0078xi-Iz; Thu, 15 Dec 2022 07:16:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5iTU-0078oY-Gz; Thu, 15 Dec 2022 07:16:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8CECA24000B;
	Thu, 15 Dec 2022 07:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671088566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjs0BTHy5OYclPFTcRH7p3xakt32ngPq+Fwkx7p7KHI=;
	b=kZsaGY2H83YUuoYv/we8kuEoU3b3UErQPfDWT+qLA0VINHWSV9XEQMNkJePzKpzkWLoJ/z
	3WbhCAIIkOuTeUQ8i5Jyu3ALGQV96TdxtI/+TWV1CMzL8zOTH+xTZa6IvsWNk/NE+YKh18
	79Eb2pMCRkM77kv9Nl55Aoympy71iQZ9kJhZI7iChhCdsxC3vDrNeoHy8CBByCNPbQYtvI
	jAfQdqt9rLUPyHalmRp8QRxk2MDZLMXgRZf8vJ5Z8OFa9KODjBBpgDIgvwPWQcV5a0Ahqv
	1b0/2s6r5kHfQO3DTM5ptACGEjSUhg+A/6tk8DkqTP6cjNq+Byr+k1leq8TvWA==
Date: Thu, 15 Dec 2022 08:16:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221215081604.5385fa56@xps-13>
In-Reply-To: <ecca019d-b0b7-630c-4221-2684cb51634c@denx.de>
References: <20221202150556.14c5ae43@xps-13>
	<2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
	<20221202160030.1b8d0b8a@xps-13>
	<223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
	<20221202164904.08d750df@xps-13>
	<0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
	<20221202174255.2c1cb2ff@xps-13>
	<e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
	<20221202175730.231d75d5@xps-13>
	<7afd364c-33b8-38a9-65a6-015b4360db6b@denx.de>
	<Y43VdPftDbq6cD2L@francesco-nb.int.toradex.com>
	<20221205144917.6514168a@xps-13>
	<ecca019d-b0b7-630c-4221-2684cb51634c@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_231613_039019_64D49294 
X-CRM114-Status: GOOD (  35.08  )
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

SGkgTWFyZWsgJiBGcmFuY2VzY28sCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIE1vbiwgNSBEZWMg
MjAyMiAxNzoyNToxMSArMDEwMDoKCj4gT24gMTIvNS8yMiAxNDo0OSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiA+IEhpIEZyYW5jZXNjbywgIAo+IAo+IEhpLAo+IAo+ID4gZnJhbmNlc2NvQGRvbGNp
bmkuaXQgd3JvdGUgb24gTW9uLCA1IERlYyAyMDIyIDEyOjI2OjQ0ICswMTAwOgo+ID4gICAKPiA+
PiBPbiBGcmksIERlYyAwMiwgMjAyMiBhdCAwNjowODoyMlBNICswMTAwLCBNYXJlayBWYXN1dCB3
cm90ZTogIAo+ID4+PiBCdXQgaGVyZSBJIHdvdWxkIHNheSB0aGlzIGlzIGEgZmlybXdhcmUgYnVn
IGFuZCBpdCBtaWdodCBoYXZlIHRvIGJlIGhhbmRsZWQKPiA+Pj4gbGlrZSBhIGZpcm13YXJlIGJ1
ZywgaS5lLiB3aXRoIGZpeHVwIGluIHRoZSBwYXJ0aXRpb24gcGFyc2VyLiBJIHNlZW0gdG8gYmUK
PiA+Pj4gY2hhbmdpbmcgbXkgb3BpbmlvbiBoZXJlIGFnYWluLiAgCj4gPj4KPiA+PiBJIHdhcyB0
aGlua2luZyBhdCB0aGlzIG92ZXIgdGhlIHdlZWtlbmQsIGFuZCBJIGNhbWUgdG8gdGhlIGZvbGxv
d2luZwo+ID4+IGlkZWFzOgo+ID4+Cj4gPj4gICAtIHdlIG5lZWQgc29tZSBpbXByb3ZlbWVudCBv
biB0aGUgZml4dXAgd2UgYWxyZWFkeSBoYXZlIGluIHRoZQo+ID4+ICAgICBwYXJ0aXRpb24gcGFy
c2VyLiBXZSBjYW5ub3QgaWdub3JlIHRoZSBmZHQgcHJvZHVjZWQgYnkgVS1Cb290IC0gYXMKPiA+
PiAgICAgYmFkIGFzIGl0IGlzLgo+ID4+ICAgLSB0aGUgcHJvcG9zZWQgZml4dXAgaXMgZmluZSBm
b3IgdGhlIGltbWVkaWF0ZSBuZWVkLCBidXQgaXQgaXMKPiA+PiAgICAgbm90IGdvaW5nIHRvIGJl
IGVub3VnaCB0byBjb3ZlciB0aGUgZ2VuZXJhbCBpc3N1ZSB3aXRoIHRoZSBVLUJvb3QKPiA+PiAg
ICAgZ2VuZXJhdGVkIHBhcnRpdGlvbnMuIFUtQm9vdCBtaWdodCBrZWVwIGdlbmVyYXRpbmcgcGFy
dGl0aW9ucyBhcyBkaXJlY3QKPiA+PiAgICAgY2hpbGQgb2YgdGhlIG5hbmQgY29udHJvbGxlciBl
dmVuIHdoZW4gYSBwYXJ0aXRpb25ze30gbm9kZSBpcwo+ID4+ICAgICBhdmFpbGFibGUuIEluIHRo
aXMgY2FzZSB0aGUgY3VycmVudCBwYXJzZXIganVzdCBmYWlscyBzaW5jZSBpdCBsb29rcwo+ID4+
ICAgICBvbmx5IGludG8gaXQgYW5kIGl0IHdpbGwgZmluZCBpdCBlbXB0eS4KPiA+PiAgIC0gdGhl
IGN1cnJlbnQgVS1Cb290IG9ubHkgaGFuZGxlIHBhcnRpdGlvbnN7fSBhcyBhIGRpcmVjdCBjaGls
ZCBvZiB0aGUKPiA+PiAgICAgbmFuZC1jb250cm9sbGVyLCB0aGUgbmFuZC1jaGlwIGlzIGlnbm9y
ZWQuIFRoaXMgaXMgbm90IHRoZSB3YXkgaXQgaXMKPiA+PiAgICAgc3VwcG9zZWQgdG8gd29yay4g
VS1Cb290IGNvZGUgd291bGQgbmVlZCB0byBiZSBpbXByb3ZlZC4gIAo+ID4gCj4gPiBJJ3ZlIGJl
ZW4gdGhpbmtpbmcgYWJvdXQgaXQgdGhpcyB3ZWVrZW5kIGFzIHdlbGwgYW5kIHRoZSBjdXJyZW50
IGZpeAo+ID4gd2hpY2ggImp1c3Qgc2V0IiBzX2NlbGwgdG8gMSBzZWVtcyByaXNreSBmb3IgbWUs
IGl0IGlzIHR5cGljYWxseSB0aGUKPiA+IHR5cGUgb2YgcXVpY2sgJiBkaXJ0eSBmaXggdGhhdCBt
aWdodCBldmVuIGJyZWFrIG90aGVyIGJvYXJkIChub2JvZHkKPiA+IGtuZXcgdGhhdCBVLUJvb3Qg
Y3VycmVudCBsb2dpYyBleHBlY3RlZCAjc2l6ZS1jZWxscyB0byBiZSBzZXQgaW4gdGhlCj4gPiBE
VCwgd2hhdCBpZiBhbm90aGVyICJicm9rZW4iIERUIGV4cGVjdHMgdGhlIG9wcG9zaXRlLi4uKSAg
Cj4gCj4gVGhlbiB3aXRoIHRoZSBjdXJyZW50IGNvbmZpZ3VyYXRpb24sIHN1Y2ggYnJva2VuIERU
IHdvdWxkIG5vdCB3b3JrLCBzaW5jZSBjdXJyZW50IERUIGRvZXMgc2V0ICNzaXplLWNlbGxzPTwx
PiAod3JvbmdseSkuCj4gCj4gPiAsIG5vdAo+ID4gbWVudGlvbmluZyBwb3RlbnRpYWwgaXNzdWVz
IHdpdGggYmlnIHN0b3JhZ2VzICg+IDRHaUIpLgo+ID4gCj4gPiBBbGwgaW4gYWxsLCBJIHJlYWxs
eSB0aGluayB3ZSBzaG91bGQgcmV2ZXJ0IHRoZSBEVCBjaGFuZ2Ugbm93LCByZXZlcnRpbmcKPiA+
IGFzIGxpdHRsZSB0byBubyBkcmF3YmFja3MgYmVzaWRlcyBhIGR0X2JpbmRpbmdfY2hlY2sgd2Fy
bmluZyBhbmQgZ2l2ZXMKPiA+IHVzIHRpbWUgdG8gZGVhbCB3aXRoIGl0IHByb3Blcmx5IChib3Ro
IGluIFUtQm9vdCBhbmQgTGludXgpLiAgCj4gCj4gSSBhbSByZWFsbHkgbm90IGhhcHB5IHdpdGgg
dGhpcywgYnV0IGlmIHRoYXQncyBtYXJrZWQgYXMgaW50ZXJtZWRpYXRlIGZpeCwgZ28gZm9yIGl0
Lgo+IAo+IEhvdyBkbyB3ZSBkZWFsIHdpdGggdGhpcyBpbiB0aGUgbG9uZyBydW4gaG93ZXZlcj8g
UGFyc2VyLXNpZGUgZml4IGxpa2UgdGhpcyBvbmUsIG1heWJlIHdpdGggYmV0dGVyIGhldXJpc3Rp
Y3MgPwoKWWVzdGVyZGF5IHdoaWxlIHRhbGtpbmcgYWJvdXQgYW4gQUNQSSBtaXMtZGVzY3JpcHRp
b24gd2hpY2ggbmVlZGVkCmZpeGluZywgSSByZWFsaXplZCBmaXhpbmcgdXAgd2hhdCB0aGUgZmly
bXdhcmUgcHJvdmlkZXMgdG8gTGludXggc2hvdWxkCnByZWZlcmFibHkgYmUgaGFuZGxlZCBhcyBl
YXJseSBhcyBwb3NzaWJsZS4gU28gbXkgZmlyc3QgZmlyc3QgaWRlYSB3YXMKdG8gYXZvaWQgdXNp
bmcgdGhlIGJyb2tlbiAiZml4dXAgbXRkcGFydHMiIGZ1bmN0aW9uIGluIFUtQm9vdCBhbmQgSSBh
bQpzdGlsbCBjb252aW5jZWQgdGhpcyBpcyB3aGF0IHdlIHNob3VsZCBkbyBpbiBwcmlvcml0eS4g
SG93ZXZlciwgYXMKcmlnaHRseSBwb2ludGVkIGluIHRoaXMgdGhyZWFkLCB3ZSBuZWVkIHRvIHRh
a2UgY2FyZSBhYm91dCB0aGUgY2FzZQp3aGVyZSBzb21lb25lIHdvdWxkIHVzZSBhIG5ld2VyIERU
IChsZXQncyBzYXksIHdpdGggdGhlIHJldmVydGVkIGNoYW5nZWQKcmV2ZXJ0ZWQgYWdhaW4pIHdp
dGggYW4gb2xkIFUtQm9vdC4gSSBhbSBzdGlsbCBhZ2FpbnN0IHBpZ2d5IGhhY2tzIGluCnRoZSBn
ZW5lcmljIG9mcGFydC5jIGRyaXZlciwgYnV0IHdoYXQgd2UgY291bGQgZG8gaG93ZXZlciBpcyBh
IERUCmZpeHVwIGluIHRoZSBpbml0X21hY2hpbmUgKG9yIHRoZSBkdF9maXh1cCkgaG9vayBmb3Ig
aW14NyBDb2xpYnJpLCB2ZXJ5Cm11Y2ggbGlrZSB0aGlzOgpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gvYXJtL21hY2gtbXZlYnUvYm9hcmQtdjcuYyNM
MTExClBsdXMgYSB3YXJuaW5nIHRoZXJlIHNheWluZyAieW91ciBkdCBpcyBicm9rZW4sIHVwZGF0
ZSB5b3VyIGZpcm13YXJlIi4KClNvIG5leHQgdGltZSBzb21lb25lIHN0dW1ibGVzIHVwb24gdGhp
cyBpc3N1ZSwgd2UgY2FuIHRlbGwgdGhlbSAiZml4CnlvdXIgYm9vdGxvYWRlciIsIGFuZCBhcHBs
eSB0aGUgc2FtZSBoYWNrIGluIHRoZWlyIGJvYXJkIGZhbWlseSAodGhlcmUKYXJlIHRocmVlIG9y
IGZvdXIgSUlSQyB3aGljaCBtaWdodCBiZSBjb25jZXJuZWQgc29tZSBkYXkpLgoKVGhhdCB3b3Vs
ZCBmaXggYWxsIGNhc2VzIGFuZCBvbmx5IGhhdmUgYW4gaW1wYWN0IG9uIHRoZSBhZmZlY3RlZCBi
b2FyZHMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
