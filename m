Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02A7C27C52
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNcBENIo9mPqlphqLxs8lmyiFIS49W2A8RN3c1r/Tz8=; b=g1/3qth897GkeN
	yWV7Bk4L1LU5UzZHSxUgOXtDk4G1YFg5ooY1XNeHfJzCMPulY6o9T11K+fOMhtvs2OLjjwiFIpFTe
	5t/tUGZ81RJquqZymAGzJBb2ZCesWHdlSj7+wfh+oWntN/iE/o6r1fdaEZJ6a6JCP6ImASyDxvtVB
	8UPMioyvlFnF8Z0CA9x7emU/ai4grGeuliH3OuNP6wEKL6nFA1YQW/wWf3wu5I/h3nqUeFCkjFRRS
	9cxrR9UmJAnjHR9tPk1Wt2df7/yFfIBNRv5wXGe+BfHoeAidzhD5M6vQrTyXAhWjynmhtIlraF7Vo
	LZN04wfOgs7Yy9bBTRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPEx-00000001cpK-2AS4;
	Tue, 04 Jun 2024 08:09:55 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPEt-00000001cmq-2vt7
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 08:09:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC7FA20008;
	Tue,  4 Jun 2024 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717488588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vmUIZ3RHApQ8liyK5HZsUjHttqDUp4gSBPYlUPRHpE=;
	b=XK+QEUpCNM4bUkE+3p8pLAotZEBwCZxnpuPMbgICJo7MVH6kkbG9TEk89TIn75OWFZhczz
	ppxSR5/WDhJ21ab1qyrUg7vGKMKtw7n2CzrCWsessyX7scaR2vaSptcgwYb6ncbljM2ack
	E6GZnsbHCKJbeo4zlWPsSWFcaGsBs34VMQr1w4t6teyB+kIthDibNGWB2SraHYNhyUcKRM
	r+WkjJuw0XCt8L2CykWUNg9gaz7SE73g1etahqOnXRvf3tm4qTPlejjWf/QQWVC3b49Ury
	mSrIofKPQa0/yno1IL1Mm4uM2i15Pwy+sohj/e3i+o8k2M49zpUk5MLxck0rxw==
Date: Tue, 4 Jun 2024 10:09:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Thorsten Scherer
 <t.scherer@eckelmann.de>, Marek Vasut <marex@denx.de>, Imre Kaloz
 <kaloz@openwrt.org>, Andrew Lunn <andrew@lunn.ch>, Flavio Suligoi
 <f.suligoi@asem.it>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
Message-ID: <20240604100942.3e663d60@xps-13>
In-Reply-To: <20240604074231.1874972-1-mwalle@kernel.org>
References: <20240604074231.1874972-1-mwalle@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_010952_172499_20522BA1 
X-CRM114-Status: GOOD (  26.73  )
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

SGkgTWljaGFlbCwKCm13YWxsZUBrZXJuZWwub3JnIHdyb3RlIG9uIFR1ZSwgIDQgSnVuIDIwMjQg
MDk6NDI6MzEgKzAyMDA6Cgo+IFRoZXNlIGRldmljZXMgYXJlIG1vcmUgbGlrZSBhbiBBVDI1IGNv
bXBhdGlibGUgRUVQUk9NIGluc3RlYWQgb2YKPiBmbGFzaGVzLiBMaWtlIGFuIEVFUFJPTSB0aGUg
dXNlciBkb2Vzbid0IG5lZWQgdG8gZXhwbGljaXRseSBlcmFzZSB0aGUKPiBtZW1vcnksIG5vciBh
cmUgdGhlcmUgc2VjdG9ycyBvciBwYWdlcy4gVGh1cywgaW5zdGVhZCBvZiB0aGUgU1BJLU5PUgo+
IChmbGFzaCkgZHJpdmVyLCBvbmUgc2hvdWxkIGluc3RlYWQgdXNlIHRoZSBhdDI1IEVFUFJPTSBk
cml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5v
cmc+Cj4gQ2M6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+Cj4gQ2M6IFRob3JzdGVuIFNjaGVyZXIgPHQuc2NoZXJlckBlY2tlbG1hbm4uZGU+Cj4gQ2M6
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IENjOiBJbXJlIEthbG96IDxrYWxvekBvcGVu
d3J0Lm9yZz4KPiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+IENjOiBGbGF2aW8g
U3VsaWdvaSA8Zi5zdWxpZ29pQGFzZW0uaXQ+Cj4gLS0tCj4gVGhlIHJlZmVyZW5jZWQgYmluZGlu
ZyBvbmx5IHN1cHBvcnRzIHRoZSB0cnVlIEFUMjUgY29tcGF0aWJsZSBFRVBST01zCj4gd2hlcmUg
eW91IGhhdmUgdG8gc3BlY2lmeSBhZGRpdGlvbmFsIHByb3BlcnRpZXMgbGlrZSBzaXplIGFuZCBw
YWdlIHNpemUKPiBvciBjeXByZXNzIEZSQU0gZGV2aWNlcyB3aGVyZSBhbGwgdGhlIHByb3BlcnRp
ZXMgYXJlIGRpc2NvdmVyZWQgYnkgdGhlCj4gZHJpdmVyLiBJIGRvbid0IGhhdmUgdGhlIGFjdHVh
bCBoYXJkd2FyZSwgdGhlcmVmb3JlIEkgY2FuJ3Qgd29yayBvbiBhCj4gcHJvcGVyIGRyaXZlciBh
bmQgYmluZGluZy4gQnV0IEkgcmVhbGx5IHdhbnQgdG8gZGVwcmVjYXRlIHRoZSB1c2Ugb2YKPiB0
aGVzZSBFRVBST00gbGlrZSBkZXZpY2VzIGluIFNQSS1OT1IuIFNvIGFzIGEgZmlyc3Qgc3RlcCwg
bWFyayB0aGUKPiBkZXZpY2VzIGluIHRoZSBEVCBiaW5kaW5ncyBhcyBkZXByZWNhdGVkLgo+IAo+
IFRoZXJlIGFyZSB0aHJlZSBpbi10cmVlIHVzZXJzIG9mIHRoaXMuIEkgaG9wZSBJJ3ZlIENDZWQg
YWxsIHRoZSByZWxldmFudAo+IHBlb3BsZS4gV2l0aCB0aGUgc3dpdGNoIHRvIHRoZSBhdDI1IGRy
aXZlciBhbHNvIGNvbWVzIGEgdXNlci1zcGFjZQo+IGZhY2luZyBjaGFuZ2U6IHRoZXJlIGlzIG5v
IG1vcmUgTVREIGRldmljZS4gSW5zdGVhZCB0aGVyZSBpcyBhbiAiZWVwcm9tIgo+IGZpbGUgaW4g
L3N5cyBub3csIGp1c3QgbGlrZSBmb3IgZXZlcnkgb3RoZXIgRUVQUk9NLgo+IAo+IE1hcmVrIGFs
cmVhZHkgZXhwcmVzc2VkLCB0aGF0IHRoZSBzcHMxIGR0cyBjYW4gbGlrZWx5IGJlIHJlbW92ZWQK
PiBhbHRvZ2V0aGVyLiBJJ2QgbGlrZSB0byBoZWFyIGZyb20gdGhlIG90aGVyIGJvYXJkIERUUyBt
YWludGFpbmVycyBpZgo+IHRoZXkgc2VlbSBzb21lIHByb2JsZW1zIG1vdmluZyB0byB0aGUgRUVQ
Uk9NIGludGVyZmFjZSAtIG9yIG1heWJlIHRoYXQKPiBkZXZpY2UgaXNuJ3QgdXNlZCBhdCBhbGwg
YW55d2F5LiBTbyBpbiB0aGUgZW5kLCB3ZSBjYW4gaG9wZWZ1bGx5IG1vdmUKPiBhbGwgdGhlIHVz
ZXJzIG92ZXIgdG8gdGhlIGF0MjUgZHJpdmVyLgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCB8IDkgKysrKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1u
b3IueWFtbAo+IGluZGV4IDZlM2FmYjQyOTI2ZS4uMmRjY2I2YjA0OWVhIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGkt
bm9yLnlhbWwKPiBAQCAtMjEsNyArMjEsNiBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICAg
IChtMjVwKDQwfDgwfDE2fDMyfDY0fDEyOCl8XAo+ICAgICAgICAgICAgICAgIG4yNXEoMzJifDA2
NHwxMjhhMTF8MTI4YTEzfDI1NmF8NTEyYXwxNjRrKSkpfFwKPiAgICAgICAgICAgICAgICBhdG1l
bCxhdDI1ZGYoMzIxYXw2NDF8MDgxYSl8XAo+IC0gICAgICAgICAgICAgIGV2ZXJzcGluLG1yMjVo
KDEwfDQwfDEyOHwyNTYpfFwKPiAgICAgICAgICAgICAgICAobXhpY3l8bWFjcm9uaXgpLG14MjVs
KDQwMDVhfDE2MDZlfDY0MDVkfDgwMDV8MTI4MDVkfDI1NjM1ZSl8XAo+ICAgICAgICAgICAgICAg
IChteGljeXxtYWNyb25peCksbXgyNXUoNDAzM3w0MDM1KXxcCj4gICAgICAgICAgICAgICAgKHNw
YW5zaW9uLCk/czI1ZmwoMTI4c3wyNTZzMXw1MTJzfDAwOGt8MDY0a3wxNjRrKXxcCj4gQEAgLTQy
LDYgKzQxLDE0IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgICAgLSBzcGFuc2lvbixzMjVm
czUxMnMKPiAgICAgICAgICAgIC0gY29uc3Q6IGplZGVjLHNwaS1ub3IKPiAgICAgICAgLSBjb25z
dDogamVkZWMsc3BpLW5vcgo+ICsKPiArICAgICAgIyBEZXByZWNhdGVkIGJpbmRpbmdzCj4gKyAg
ICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAtIHBhdHRlcm46ICJeZXZlcnNwaW4sbXIyNWgoMTB8
NDB8MTI4fDI1NikkIgo+ICsgICAgICAgICAgLSBjb25zdDogamVkZWMsc3BpLW5vcgo+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgRGVwcmVjYXRlZCBiaW5kaW5nLCB1c2UgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI1LnlhbWwuCj4gKyAgICAg
ICAgZGVwcmVjYXRlZDogdHJ1ZQo+ICAgICAgZGVzY3JpcHRpb246Cj4gICAgICAgIFNQSSBOT1Ig
Zmxhc2hlcyBjb21wYXRpYmxlIHdpdGggdGhlIEpFREVDIFNGRFAgc3RhbmRhcmQgb3Igd2hpY2gg
bWF5IGJlCj4gICAgICAgIGlkZW50aWZpZWQgd2l0aCB0aGUgUkVBRCBJRCBvcGNvZGUgKDB4OUYp
IGRvIG5vdCBkZXNlcnZlIGEgc3BlY2lmaWMKCk1ha2VzIHNlbnNlLgoKUmV2aWV3ZWQtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
