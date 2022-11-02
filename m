Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DDFC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNKkySOWBLYqYZou0k5XWPDEw56RVjjiFNCJLmZJXMI=; b=Eku5jZbymkjAu9
	YbkNoqsdU5M8H2f8p7jxwVHyGgQj9guyHWwuVKm+aEDzvSZJ5LzAT0bdB79xyj5jEtLrv/cMBBiG9
	HgdUv/6Owvi6Qt+bfIedobIRGUyEIZcvw8kXWFg3xyDVAgB0+Y7MqgvCF5I39JchkUaWMsmR4FMaG
	tiHIp+xmcX31FvsCY2eA8Ocb29RUATSkQhox8OKO3IAs2aIJhHCNFjAk5AaG9ySfQ2q8/Ux3Elhmw
	8SHQ84NE5yn1C3BabgbCxK1wzS8YTqBzUdzfxYu8/auejP4Cn7YAHqI/k+ZKgH19ghq1tNvPq+fb1
	LkIIqwUXMknfwf5S7fJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGwj-00CGtK-Bg; Wed, 02 Nov 2022 16:50:33 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGwV-00CGma-GM; Wed, 02 Nov 2022 16:50:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9836CC0007;
	Wed,  2 Nov 2022 16:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667407813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsyW8KhbSSKVe049F+rFznlD/CrHS6a/awk5KKcwAxk=;
	b=FJGlgULNNF8yfAiVsxOge3rp3zqT+bPsVZ/NcJIQVVEPrGHJ0G3ANYjBVm1V8jurCI5z9/
	BaiUyUX5xKTM4MDUnpDdvqwfzCwjq0CQ12+3n4kJSKSEn+JZHXOBbrsXioyZanq4PfYESK
	+f7mld3Tgp86shRYUpMVDsoPr99xeYtu9GDpwELKZCVkinaj14W2hp8rL9O2y0koiy0rjN
	3sdCsiuuaVQ4kNjaKXbXMVHfIUyXdDKlrNapg3MOMdC7OLth4arERUsWd0Ft8KGsGbMW6N
	GcesQ5HwTRPYgk/OF34RqNPM8fHoJcLWkEkOic8aKn6t0QMcBOcNZmfyKTkfpw==
Date: Wed, 2 Nov 2022 17:50:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar
 Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected
 node name
Message-ID: <20221102175007.4a4db2c9@xps-13>
In-Reply-To: <20221031205442.GA3307775-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
	<20221028235933.934850-6-miquel.raynal@bootlin.com>
	<20221031205442.GA3307775-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_095019_882462_36B9EF2A 
X-CRM114-Status: GOOD (  21.29  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMzEgT2N0IDIwMjIgMTU6NTQ6
NDIgLTA1MDA6Cgo+IE9uIFNhdCwgT2N0IDI5LCAyMDIyIGF0IDAxOjU5OjI2QU0gKzAyMDAsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBUaGUgY2hpcCBub2RlIG5hbWUgaW4gdGhpcyBkcml2ZXIg
aXMgZXhwZWN0ZWQgdG8gYmUgZGlmZmVyZW50IGFuZCBzaG91bGQKPiA+IGJlIHByZWZpeGVkIHdp
dGggb25lbmFuZCBpbnN0ZWFkIG9mIHRoZSByZWd1bGFyICJmbGFzaCIgc3RyaW5nLCBzbwo+ID4g
bWVudGlvbiBpdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1vbmVuYW5kLnlhbWwgfCAzICsrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1vbmVuYW5kLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGdwbWMtb25lbmFuZC55YW1sCj4gPiBp
bmRleCBhOTUzZjczOTdjNDAuLjhhNzlhZDMwMDIxNiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1vbmVuYW5kLnlhbWwKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1vbmVuYW5k
LnlhbWwKPiA+IEBAIC0xNSw2ICsxNSw5IEBAIGRlc2NyaXB0aW9uOgo+ID4gICAgYXMgY2hpbGQg
bm9kZXMgb2YgdGhlIEdQTUMgY29udHJvbGxlci4KPiA+ICAKPiA+ICBwcm9wZXJ0aWVzOgo+ID4g
KyAgJG5vZGVuYW1lOgo+ID4gKyAgICBwYXR0ZXJuOiAiXm9uZW5hbmRAWzAtOV0sWzAsOV0kIiAg
Cj4gCj4gSSBkb24ndCB0aGluayBpdCBpcyB3b3J0aCBlbmZvcmNpbmcgbm9kZSBuYW1lcyB0aGF0
IHdlIAo+IGhhdmVuJ3QgZGVmaW5lZCBpbiB0aGUgc3BlYy4gV291bGRuJ3QgJ25hbmQtY29udHJv
bGxlcicgYmUgYXBwcm9wcmlhdGU/CgpBY3R1YWxseSBJJ3ZlIGFkZGVkIHRoaXMgcGF0dGVybiBo
ZXJlIGJlY2F1c2UgdGhlcmUgYXJlIHNldmVyYWwgdXNlcnMgaW4KdGhlIGFybS9ib290L2R0cy8g
ZGlyZWN0b3J5IHdoaWNoIHVzZSBpdCwgYW5kIHRoZSBleGFtcGxlIGJlbG93IGluIHRoaXMKZmls
ZSBhbHNvIHVzZXMgb25lbmFuZEB4eHguCgpJIGNhbiBlaXRoZXIgZml4IHRoZSBleGFtcGxlIHRv
IHVzZSBuYW5kLWNvbnRyb2xsZXIgb3IgYWRkIHRoaXMgcGF0dGVybgooSSBndWVzcyAiZGVwcmVj
YXRlZDogdHJ1ZSIgd291bGQgbm90IG1lYW4gYW55dGhpbmc/KS4gV2hhdCBkbyB5b3UKcHJlZmVy
PwoKSWYgd2UgZGVjaWRlIHRvIHN3aXRjaCB0byB0aGUgbmFuZC1jb250cm9sbGVyQCBuYW1lLCBz
aGFsbCBJIGNoYW5nZSB0aGUKRFRTIGFzIHdlbGw/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
