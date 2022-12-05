Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EB8C47089
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z17zReopw+5KIyy89k9LxEsupB+6Sntgi3wIwU7rt58=; b=ViCJK6L5WaeXia
	6zSltnFYKEkcUj37wOov3u0ML3489hnfXx2Tk/3EoxLjOUrXIXM/ApqXxtnvM3nwUfVfjvSFHjTlZ
	48lgwF+RyP/rty+48Vt/iv0vw1TGzCD6TDcUDYRw1B4qEcix0UiVs5q9l60QkqbNpJSVVkfKhmxyb
	gG8fOx2M/0sFreuP008cEKMsuoaoSQRmvoBeqlMIA9oRU8CvgVshNmAXth+wqksoMahPlcXg0/mWo
	beTezyjMY89uHJmfi4ZePM4X++2+s63CiaF3+0da/f4JjGbIcnerKGqfOMBowBwvlaN+IIN4mbA05
	SqC7YsUTiRYSFXGvWaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BrA-003fl5-U4; Mon, 05 Dec 2022 13:50:04 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Bqb-003fBl-77; Mon, 05 Dec 2022 13:49:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 877B92001A;
	Mon,  5 Dec 2022 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670248162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vlDqhiuz5BOtb58kV/bXhHdfpCf7hpK9ErgXjz36wI=;
	b=ZbhwzuX1eagbTfBT6a6b3hACbNnAaJ1eqrVSS5OEJbPhEoXPF20h1x03YgnAFqMj/rbas8
	lc1x4b90np8c+lLaaMknk3VYTcP8zZYxuOUlMRXbXtw81TscUvl0i+wwlNXL9ZFRkv9zKp
	fZ3FN1ez0jW6MQd+NoKmCx94JAY5xWQvb3Sp5DUHXdPnNIJWcKQkqx5O7UDqMHOkvaNlrG
	C3yG2FGbHbHaTSnss0lifKE9I4PJdvdxoWi7IPtoV7DdqtjvxU+X/1VVs5WklPItImnchA
	ux+PH9jfTcAMwCB9ZMgpWs9umkLRR7ADIsoubNd2plMtx5Ik5k82dR8JUmQrwA==
Date: Mon, 5 Dec 2022 14:49:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221205144917.6514168a@xps-13>
In-Reply-To: <Y43VdPftDbq6cD2L@francesco-nb.int.toradex.com>
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
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_054929_585364_3D05E16B 
X-CRM114-Status: GOOD (  25.35  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gTW9uLCA1IERlYyAy
MDIyIDEyOjI2OjQ0ICswMTAwOgoKPiBPbiBGcmksIERlYyAwMiwgMjAyMiBhdCAwNjowODoyMlBN
ICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiA+IEJ1dCBoZXJlIEkgd291bGQgc2F5IHRoaXMg
aXMgYSBmaXJtd2FyZSBidWcgYW5kIGl0IG1pZ2h0IGhhdmUgdG8gYmUgaGFuZGxlZAo+ID4gbGlr
ZSBhIGZpcm13YXJlIGJ1ZywgaS5lLiB3aXRoIGZpeHVwIGluIHRoZSBwYXJ0aXRpb24gcGFyc2Vy
LiBJIHNlZW0gdG8gYmUKPiA+IGNoYW5naW5nIG15IG9waW5pb24gaGVyZSBhZ2Fpbi4gIAo+IAo+
IEkgd2FzIHRoaW5raW5nIGF0IHRoaXMgb3ZlciB0aGUgd2Vla2VuZCwgYW5kIEkgY2FtZSB0byB0
aGUgZm9sbG93aW5nCj4gaWRlYXM6Cj4gCj4gIC0gd2UgbmVlZCBzb21lIGltcHJvdmVtZW50IG9u
IHRoZSBmaXh1cCB3ZSBhbHJlYWR5IGhhdmUgaW4gdGhlCj4gICAgcGFydGl0aW9uIHBhcnNlci4g
V2UgY2Fubm90IGlnbm9yZSB0aGUgZmR0IHByb2R1Y2VkIGJ5IFUtQm9vdCAtIGFzCj4gICAgYmFk
IGFzIGl0IGlzLgo+ICAtIHRoZSBwcm9wb3NlZCBmaXh1cCBpcyBmaW5lIGZvciB0aGUgaW1tZWRp
YXRlIG5lZWQsIGJ1dCBpdCBpcwo+ICAgIG5vdCBnb2luZyB0byBiZSBlbm91Z2ggdG8gY292ZXIg
dGhlIGdlbmVyYWwgaXNzdWUgd2l0aCB0aGUgVS1Cb290Cj4gICAgZ2VuZXJhdGVkIHBhcnRpdGlv
bnMuIFUtQm9vdCBtaWdodCBrZWVwIGdlbmVyYXRpbmcgcGFydGl0aW9ucyBhcyBkaXJlY3QKPiAg
ICBjaGlsZCBvZiB0aGUgbmFuZCBjb250cm9sbGVyIGV2ZW4gd2hlbiBhIHBhcnRpdGlvbnN7fSBu
b2RlIGlzCj4gICAgYXZhaWxhYmxlLiBJbiB0aGlzIGNhc2UgdGhlIGN1cnJlbnQgcGFyc2VyIGp1
c3QgZmFpbHMgc2luY2UgaXQgbG9va3MKPiAgICBvbmx5IGludG8gaXQgYW5kIGl0IHdpbGwgZmlu
ZCBpdCBlbXB0eS4KPiAgLSB0aGUgY3VycmVudCBVLUJvb3Qgb25seSBoYW5kbGUgcGFydGl0aW9u
c3t9IGFzIGEgZGlyZWN0IGNoaWxkIG9mIHRoZQo+ICAgIG5hbmQtY29udHJvbGxlciwgdGhlIG5h
bmQtY2hpcCBpcyBpZ25vcmVkLiBUaGlzIGlzIG5vdCB0aGUgd2F5IGl0IGlzCj4gICAgc3VwcG9z
ZWQgdG8gd29yay4gVS1Cb290IGNvZGUgd291bGQgbmVlZCB0byBiZSBpbXByb3ZlZC4KCkkndmUg
YmVlbiB0aGlua2luZyBhYm91dCBpdCB0aGlzIHdlZWtlbmQgYXMgd2VsbCBhbmQgdGhlIGN1cnJl
bnQgZml4CndoaWNoICJqdXN0IHNldCIgc19jZWxsIHRvIDEgc2VlbXMgcmlza3kgZm9yIG1lLCBp
dCBpcyB0eXBpY2FsbHkgdGhlCnR5cGUgb2YgcXVpY2sgJiBkaXJ0eSBmaXggdGhhdCBtaWdodCBl
dmVuIGJyZWFrIG90aGVyIGJvYXJkIChub2JvZHkKa25ldyB0aGF0IFUtQm9vdCBjdXJyZW50IGxv
Z2ljIGV4cGVjdGVkICNzaXplLWNlbGxzIHRvIGJlIHNldCBpbiB0aGUKRFQsIHdoYXQgaWYgYW5v
dGhlciAiYnJva2VuIiBEVCBleHBlY3RzIHRoZSBvcHBvc2l0ZS4uLiksIG5vdAptZW50aW9uaW5n
IHBvdGVudGlhbCBpc3N1ZXMgd2l0aCBiaWcgc3RvcmFnZXMgKD4gNEdpQikuCgpBbGwgaW4gYWxs
LCBJIHJlYWxseSB0aGluayB3ZSBzaG91bGQgcmV2ZXJ0IHRoZSBEVCBjaGFuZ2Ugbm93LCByZXZl
cnRpbmcKYXMgbGl0dGxlIHRvIG5vIGRyYXdiYWNrcyBiZXNpZGVzIGEgZHRfYmluZGluZ19jaGVj
ayB3YXJuaW5nIGFuZCBnaXZlcwp1cyB0aW1lIHRvIGRlYWwgd2l0aCBpdCBwcm9wZXJseSAoYm90
aCBpbiBVLUJvb3QgYW5kIExpbnV4KS4KCj4gV2l0aCBhbGwgb2YgdGhhdCBzYWlkIEkgdGhpbmsg
dGhhdCBNaXF1ZWwgaXMgcmlnaHQKPiAKPiA+IFdoZW4gYSBwYXRjaCBicmVha3MgYSBib2FyZCBh
bmQgdGhlcmUgaXMgbm8gc3RyYWlnaHQgZml4LCB5b3UgcmV2ZXJ0Cj4gPiBpdCwgdGhlbiB5b3Ug
dGhpbmsgaGFyZGVyLiBUaGF0J3Mgd2hhdCBJIGFtIHNheWluZy4gVGhpcyBpcyBhIHRlbXBvcmFy
eQo+ID4gc29sdXRpb24uICAKPiAKPiA/Cj4gCj4gRnJhbmNlc2NvCj4gCj4gCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
