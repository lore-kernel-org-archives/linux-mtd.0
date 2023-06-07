Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D13BC7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7EJhn50u4X8KpX+nC7RctSdX9L2Jsttgkv4ogh+zp4=; b=N7fAFPZIhVN5ZK
	rOLRcnStUIL3U3ughIOSZiFpHv7uBIQckrbtrR01AM4IZYGv+kSbOVdzQ5sqEHd2ykPvF4mGKqAGM
	JT+/WDy1jEts2Zxom2qyPOcUUrTfypn748JJ6WffiWarGkZk1cSXB3QlcYsHhSSANDjRWdDR9oqhG
	Ogo09jdv/508Hb3gr43X6et3/NPj+/yQgm3ATMWdPvYgSdOFTOydrJ2BeXVhYKfCfVmk+ZDB0/bAp
	b87xiGFp6XS0K3clj7GxNjzagxd6gCXOvgLm41gG8NL4gh5GC6PCOmAMz7Qzzw/9wo/wbgPDK6Jmq
	IBM88UIyZqaffhJpsswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6paX-005GxD-0D;
	Wed, 07 Jun 2023 09:36:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6paT-005GvU-1B;
	Wed, 07 Jun 2023 09:36:19 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686130568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHbDoPntY8rQli1Ts2fRuiAoXXD0B+JipbbpnA9vAgs=;
	b=eGQ0NF915O7i6T9mpLNfb9/1dCJ1f5hmxGuZY4UbmVa7sRZxXLsTZ0IY2OAb0Xya0sW4Bw
	fdxadbzR4sNDPT+WXTwCV95HjAqA5pVZoKO/PbQiddvHIlype5TqN2Aeh0UKdgvG23l70A
	SUOVHBz9fz+IDbyGPXPHiphK2KoTUbmUa4zBJA3Z1TWxlq2gjfTF24CsgU2yop6Ay0VBo2
	KrD1jAJjv+2nlYkY86ds4muSAzHsSZ7AuCvGt+BlsPDFYoceJVSbrCzJmrqT2xlciThgQZ
	1hmdVmsEJu+ab3BTfWsMVH8NLEwJSHoUP0ug9pP+tZ85SKqdqsRicafpRZaV7w==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBD1CC0011;
	Wed,  7 Jun 2023 09:36:06 +0000 (UTC)
Date: Wed, 7 Jun 2023 11:36:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Message-ID: <20230607113605.50a992bb@xps-13>
In-Reply-To: <5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
	<20230607095802.3adcd4f9@xps-13>
	<166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
	<08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
	<835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
	<2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
	<5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_023617_667608_0CE56083 
X-CRM114-Status: GOOD (  20.33  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDcgSnVu
IDIwMjMgMTI6MDQ6MjkgKzAzMDA6Cgo+IE9uIDA3LjA2LjIwMjMgMTI6MDgsIEtyenlzenRvZiBL
b3psb3dza2kgd3JvdGU6Cj4gPiBPbiAwNy8wNi8yMDIzIDEwOjU3LCBBcnNlbml5IEtyYXNub3Yg
d3JvdGU6ICAKPiA+Pgo+ID4+Cj4gPj4gT24gMDcuMDYuMjAyMyAxMTo1MywgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZTogIAo+ID4+PiBPbiAwNy8wNi8yMDIzIDEwOjQwLCBBcnNlbml5IEtyYXNu
b3Ygd3JvdGU6ICAKPiA+Pj4+IEhlbGxvIE1pcXVlbCwgCj4gPj4+Pgo+ID4+Pj4gT24gMDcuMDYu
MjAyMyAxMDo1OCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+Pj4+ICAKPiA+Pj4+PiBIaSBBcnNl
bml5LAo+ID4+Pj4+Cj4gPj4+Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1
ZSwgNiBKdW4gMjAyMyAyMjozNTowNyArMDMwMDoKPiA+Pj4+PiAgCj4gPj4+Pj4+IEFkZCBkZXNj
cmlwdGlvbiBvZiAnbmFuZC1yYicgcHJvcGVydHkuIFVzZSAiRml4ZXMiIGJlY2F1c2UgdGhpcyBw
cm9wZXJ0eQo+ID4+Pj4+PiBtdXN0IGJlIHN1cHBvcnRlZCBzaW5jZSB0aGUgYmVnaW5uaW5nLiBG
b3IgdGhpcyBjb250cm9sbGVyICduYW5kLXJiJyBpcwo+ID4+Pj4+PiBzdG9yZWQgaW4gdGhlIGNv
bnRyb2xsZXIgbm9kZSAobm90IGluIGNoaXApLCBiZWNhdXNlIGl0IGhhcyBvbmx5IHNpbmdsZQo+
ID4+Pj4+PiByL2Igd2lyZSBmb3IgYWxsIGNoaXBzLiAgCj4gPj4+Pj4KPiA+Pj4+PiBTb3JyeSBp
ZiBJIG1pc2xlYWQgeW91IGluIHRoZSBmaXJzdCBwbGFjZSwgYnV0IHlvdSBjb3VsZCBkZWZpbml0
ZWx5Cj4gPj4+Pj4gaGF2ZSB0d28gY2hpcHMgYW5kIG9ubHkgb25lIHdpdGggUkIgd2lyZWQuIEl0
IG5lZWRzIHRvIGJlIGRlZmluZWQgaW4KPiA+Pj4+PiB0aGUgY2hpcHMuICAKPiA+Pj4+Cj4gPj4+
PiBPaywgc28gdG8gY2xhcmlmeTogaXMgaXQgb2ssIHRoYXQgaW4gYmluZGluZ3MgdGhpcyBwcm9w
ZXJ0eSB3aWxsIGJlIHBsYWNlZCBpbiB0aGUKPiA+Pj4+IGNoaXAsIGJ1dCBpbiBkcml2ZXIsIGkn
bSB0cnlpbmcgdG8gcmVhZCBpdCBmcm9tIHRoZSBjb250cm9sbGVyIG5vZGUgKHRodXMgIGluCj4g
Pj4+PiBkdHMgZmlsZSBpdCB3aWxsIGJlIGFsc28gaW4gY29udHJvbGxlciBub2RlKT8gIAoKVGhl
IGJpbmRpbmdzIGFuZCB5b3VyIGRyaXZlciBpbnRlcm5hbCByZXByZXNlbnRhdGlvbiBhcmUgdHdv
IGRpZmZlcmVudAp0aGluZ3MuIEFueXdheSwgYXMgbWVudGlvbmVkIGFib3ZlLCB3aXJpbmcgdGhl
IFJCIGxpbmUgdG8gb25lIGRpZSBhbmQKbm90IHRoZSBvdGhlciB3b3VsZCBiZSB2YWxpZCBoYXJk
d2FyZSBkZXNpZ24gYW5kIHdvdWxkIHJlcXVpcmUgdGhlIHJiCnByb3BlcnR5IHRvIGJlIGluIHRo
ZSBjaGlwIG5vZGUuIFBsZWFzZSBwZXJmb3JtIGEgcGVyLWNoaXAgcHJvcGVydHkgcmVhZAppbiB0
aGUgZHJpdmVyIGFzIHdlbGwuCgo+ID4+Pgo+ID4+PiBObywgYmVjYXVzZSBob3cgd291bGQgeW91
ciBEVFMgcGFzcyB2YWxpZGF0aW9uPyBJIHVuZGVyc3RhbmQgeW91IGRpZCBub3QKPiA+Pj4gdGVz
dCB0aGUgYmluZGluZ3MsIGJ1dCB0aGlzIHdpbGwgaW1wcm92ZSwgcmlnaHQ/ICAKPiA+Pgo+ID4+
IE9rLCBpJ2xsIGZvbGxvdyBEVFMgbGF5b3V0IGluIHRoZSBkcml2ZXIsICJ0ZXN0IHRoZSBiaW5k
aW5ncyIgWW91IG1lYW4gIm1ha2UgZHRfYmluZGluZ19jaGVjayI/ICAKPiA+IAo+ID4gWWVzLiBU
aGV5IHdlcmUgc2VudCB3aXRob3V0IHRlc3RpbmcuCj4gPiAKPiA+IEJ1dCBwbGVhc2UgYWxzbyB0
ZXN0IHlvdXIgRFRTIHdpdGggZHRic19jaGVjay4gIAo+IAo+IEdvdCBpdCEKPiAKPiBUaGFua3Ms
IEFyc2VuaXkKPiAKPiA+IAo+ID4gCj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBLcnp5c3p0b2YKPiA+
ICAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
