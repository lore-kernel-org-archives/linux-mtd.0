Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149E2C47422
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jan 2024 06:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M35hjtCjkat1HGK//MJBEIjBFP4QRcGpLtePIW7V94A=; b=fZASkN8AIZNGvi
	vRJRmgC7/UlCKlkpZYpyk7Lrbd7lRAE89waBqkpIxk2Nog91e8c0Buz6S/TkUDYn4/i78pTq5jE8E
	yoW9JejhY/AkYdOboGbIZ0uuwEGmLyd/PPqKaOkpRtDBH/7bRAI40kcfApxS+EyYr/TrhFPCPZl1Y
	+JO2nG10e36gQNmFTTskxj5nXgrzck/AxHu2z/NWp2x8uGNJ7xlPyWY664PvLngSNFPYbfal5Kixr
	Pav3UqXebGrTPb2LPQyusg3DKcG1fUIMw77J7g2fyQyoa7gMcWFR2sV17kBtOQkI9I3qaRwrirVvX
	IP4v3w1qw/1KR73TkC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFYl-00000003Dxm-1A4w;
	Fri, 26 Jan 2024 06:19:27 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTFYh-00000003Dx6-1scr;
	Fri, 26 Jan 2024 06:19:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D16D640003;
	Fri, 26 Jan 2024 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706249957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzlhwUVFx4zm9tXJ7XTM/+LMgA8bFcm+1XMzEx3pfK8=;
	b=pv3WnWWRevCdcz+4tJnzojyH43cxQwuwHltR1pkR5YfxXJLK+s8UaDRxRYg9Mib8Ik0lna
	H3zikgpegGs8JHYOzUlyEKYmfzghrt+N4PbLuHnmj1CCzGhaAzdvp1FD6PEk7yfiKjJ5kM
	vxfowimCa4XC+rV22Bz42T6TEZSuY5+Mp2xfl2Um0zba9uNSKs/WyictHKXICFBA6v8XTz
	gc366KELLfnOLB5Us9BWj19qFVBcIgImsmueHcEzq9wA7KFMHL1z3n3oL5BRxU99jLJHwR
	vHKTsvary9tD5gYSzrx144o2pnJ3ysQq47yLED+ZPei1Osr6Y+ul80jOJWs90g==
Date: Fri, 26 Jan 2024 07:19:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin
 <joel.peshkin@broadcom.com>, Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan
 Beygelman <dan.beygelman@broadcom.com>, William Zhang
 <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, Kursad
 Oney <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
Message-ID: <20240126071913.699c3795@xps-13>
In-Reply-To: <CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-11-dregan@broadcom.com>
	<20240124184027.712b1e47@xps-13>
	<CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_221923_952520_7F380E18 
X-CRM114-Status: GOOD (  27.98  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIFRodSwgMjUgSmFuIDIwMjQg
MTE6NDc6NDYgLTA4MDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4gT24gV2VkLCBKYW4gMjQsIDIwMjQg
YXQgOTo0MOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
b3RlOgo+ID4KPiA+IEhpIERhdmlkLAo+ID4KPiA+IGRyZWdhbkBicm9hZGNvbS5jb20gd3JvdGUg
b24gVHVlLCAyMyBKYW4gMjAyNCAxOTowNDo1OCAtMDgwMDoKPiA+ICAKPiA+ID4gQWxsb3cgc2V0
dGluZ3MgZm9yIG9uLWRpZSBlY2Mgc3VjaCB0aGF0IGlmIG9uLWRpZSBFQ0MgaXMgc2VsZWN0ZWQK
PiA+ID4gZG9uJ3QgZXJyb3Igb3V0IGJ1dCByZXF1aXJlIEVDQyBzdHJhcCBzZXR0aW5nIG9mIHpl
cm8KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNv
bS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJy
b2FkY29tLmNvbT4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiA+ID4gLS0t
Cj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+IC0gQWRkZWQgdG8gcGF0Y2ggc2VyaWVzCj4gPiA+
IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDE0
ICsrKysrKysrKystLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCj4gPiA+IGluZGV4IGE0ZTMxMWI2Nzk4Yy4uNDI1MjZmMzI1MGM5IDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ID4gQEAg
LTI3MjcsOSArMjcyNywxMSBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3Qg
YnJjbW5hbmRfaG9zdCAqaG9zdCkKPiA+ID4gICAgICAgY2ZnLT5ibGtfYWRyX2J5dGVzID0gZ2V0
X2Jsa19hZHJfYnl0ZXMobXRkLT5zaXplLCBtdGQtPndyaXRlc2l6ZSk7Cj4gPiA+Cj4gPiA+ICAg
ICAgIGlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgIT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05f
SE9TVCkgewo+ID4gPiAtICAgICAgICAgICAgIGRldl9lcnIoY3RybC0+ZGV2LCAib25seSBIVyBF
Q0Mgc3VwcG9ydGVkOyBzZWxlY3RlZDogJWRcbiIsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICBjaGlwLT5lY2MuZW5naW5lX3R5cGUpOwo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ID4gPiArICAgICAgICAgICAgIGlmIChjaGlwLT5lY2Muc3RyZW5ndGgpIHsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoY3RybC0+ZGV2LCAiRVJST1IhISEgSFcgRUND
IG11c3QgYmUgc2V0IHRvIHplcm8gZm9yIG5vbi1oYXJkd2FyZSBFQ0M7IHNlbGVjdGVkOiAlZFxu
IiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpcC0+ZWNjLnN0cmVuZ3Ro
KTsgIAo+ID4KPiA+IENhbiB5b3UgdXNlIGEgbW9yZSBmb3JtYWwgc3RyaW5nPyBBbHNvIGNsYXJp
ZnkgaXQgYmVjYXVzZSBJIGRvbid0Cj4gPiByZWFsbHkgdW5kZXJzdGFuZCB3aGF0IGl0IGxlYWRz
IHRvLiAgCj4gCj4gSG93IGFib3V0Ogo+IAo+IGRldl9lcnIoY3RybC0+ZGV2LCAiSFcgRUNDIHNl
dCB0byAlZCwgbXVzdCBiZSB6ZXJvIGZvciBvbi1kaWUgRUNDXG4iLAoKQWN0dWFsbHkgSSBhbSB3
b25kZXJpbmcgaG93IGxlZ2l0aW1hdGUgdGhpcyBpcy4gSnVzdCBkb24ndCBlbmFibGUgdGhlCm9u
IGhvc3QgRUNDIGVuZ2luZSBpZiBpdCdzIG5vdCBpbiB1c2UuIE5vIG5lZWQgdG8gY2hlY2sgdGhl
IGNvcmUncwpjaG9pY2UuCgo+IAo+ID4gIAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPiAgICAgICB9Cj4gPiA+Cj4g
PiA+ICAgICAgIGlmIChjaGlwLT5lY2MuYWxnbyA9PSBOQU5EX0VDQ19BTEdPX1VOS05PV04pIHsK
PiA+ID4gQEAgLTI3OTcsNyArMjc5OSwxMSBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2Rl
dihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiA+ID4gICAgICAgaWYgKHJldCkKPiA+ID4g
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPgo+ID4gPiAtICAgICBicmNtbmFuZF9zZXRf
ZWNjX2VuYWJsZWQoaG9zdCwgMSk7Cj4gPiA+ICsgICAgIGlmIChjaGlwLT5lY2MuZW5naW5lX3R5
cGUgPT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fRElFKSB7Cj4gPiA+ICsgICAgICAgICAgICAg
ZGV2X2RiZyhjdHJsLT5kZXYsICJEaXNhYmxlIEhXIEVDQyBmb3Igb24tZGllIEVDQ1xuIik7ICAK
PiA+Cj4gPiBOb3QgbmVlZGVkLiAgCj4gCj4gV2lsbCByZW1vdmUuCj4gCj4gPiAgCj4gPiA+ICsg
ICAgICAgICAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3QsIDApOwo+ID4gPiArICAg
ICB9IGVsc2UKPiA+ID4gKyAgICAgICAgICAgICBicmNtbmFuZF9zZXRfZWNjX2VuYWJsZWQoaG9z
dCwgMSk7ICAKPiA+Cj4gPiBTdHlsZSBpcyB3cm9uZywgYnV0IG90aGVyd2lzZSBJIHRoaW5rIEVD
QyBzaG91bGQgYmUga2VwdCBkaXNhYmxlZCB3aGlsZQo+ID4gbm90IGluIGFjdGl2ZSB1c2UsIHNv
IEkgYW0gYSBiaXQgc3VycHJpc2VkIGJ5IHRoaXMgbGluZS4gIAo+IAo+IFRoaXMgaXMgYSBkb3Vi
bGUgY2hlY2sgdG8gdHVybiBvbi9vZmYgb3VyIGhhcmR3YXJlIEVDQy4KCkkgZXhwZWN0IHRoZSBl
bmdpbmUgdG8gYmUgYWx3YXlzIGRpc2FibGVkLiBFbmFibGUgaXQgb25seSB3aGVuIHlvdQpuZWVk
IChtYXkgcmVxdWlyZSBhbiBhZGRpdGlvbmFsIHBhdGNoIGJlZm9yZSB0aGlzIG9uZSkuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
