Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD9C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYrBdpMsCcSvtiUqv1KXLQVxgEn51g5t/+fXs8kJSJY=; b=KsyzMzfifwaJV3
	QBZ+f1wDSZjm2a2qC/5IAU2n/YrO3Ebezez37SihfBxmUe8cw8LOgXc5j7CJ1PZzqfDyrp6kEUpVG
	s1YTP0rwQowPktiWntJSChL9yqQ8/esX1Fse7fmypYH8XTQ2Ac+bx6chrjjc5Zf5l7Dl/qmvHa7ei
	KepW3lVc/Y3d7PBFmZdur1DDnAvE6zjyPtX3+fRXvs/zClnvA1BSjwRNT3w0AeDGnRkAXjfEKaOSP
	OJE9vdGd7AroVtawx1+mftm/j/85nmhStsGrfSPXS0kv6RpxkKEs5qtdJfbWsuE4kcisJkVtjhUtm
	XuRocasGv5dXFxsekJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShBe-004Wm8-0z;
	Wed, 24 Jan 2024 17:37:18 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShBa-004WkZ-2u;
	Wed, 24 Jan 2024 17:37:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A1FE40004;
	Wed, 24 Jan 2024 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706117831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/BxeLszBNs63fVi69FVb8KqYEuY2QieBZcGTh/0vEI=;
	b=HIZ2SCf4+7ftfgx4u1xCkua32iokQNJ47AhhJaVPBQFeB822hQ7YXyCjJFpFXzgNokY+W/
	Q6G7aSePGb7embqemWmm3LHXoVmlj4VCawnBg8j4Xere/BdIHtHbb7rsejhFpxU2HmXrm2
	pb+brT4jNMn/wglyIHUGG/+5wWQVyPfnwA0fKG7gD2BkZzsBCwUyoG5WJ4gobOxjEtvjxm
	9uWaB8XedUejmplB022E9J9Pqx8yoGiUjB7OlmfdYAcSlC1L/UfHsQYvxxP9kC+kK2MsPM
	yUR3IGzNSwWXTqlpNpGVmDSsGyGLR6i7tdprJynKRENVVxL92ZSv14KjE2jQFQ==
Date: Wed, 24 Jan 2024 18:37:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 09/10] mtd: rawnand: brcmnand: update log level
 messages
Message-ID: <20240124183706.0af8fb90@xps-13>
In-Reply-To: <20240124030458.98408-10-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-10-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_093715_203499_CD096478 
X-CRM114-Status: GOOD (  18.62  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQg
MTk6MDQ6NTcgLTA4MDA6Cgo+IFVwZGF0ZSBsb2cgbGV2ZWwgbWVzc2FnZXMgc28gdGhhdCBtb3Jl
IGNyaXRpY2FsIG1lc3NhZ2VzCj4gY2FuIGJlIHNlZW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNvbS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdpbGxpYW0gWmhh
bmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6IE5v
bmUKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkZWQgdG8gcGF0Y2ggc2VyaWVzCj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA2ICsrKy0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IDZiNWQ3NmVmZjBl
Yy4uYTRlMzExYjY3OThjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jCj4gQEAgLTExNDMsNyArMTE0Myw3IEBAIHN0YXRpYyBpbnQgYmNtbmFuZF9jdHJsX3Bv
bGxfc3RhdHVzKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0LAo+ICAJaWYgKCh2YWwgJiBtYXNr
KSA9PSBleHBlY3RlZF92YWwpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0JZGV2X3dhcm4oY3RybC0+
ZGV2LCAidGltZW91dCBvbiBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgJXggZ290ICV4KVxuIiwKPiAr
CWRldl9lcnIoY3RybC0+ZGV2LCAidGltZW91dCBvbiBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgJXgg
Z290ICV4KVxuIiwKCkkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBidXQgaWYgeW91IHdhbnQuCgo+ICAJ
CSBleHBlY3RlZF92YWwsIHZhbCAmIG1hc2spOwo+ICAKPiAgCXJldHVybiAtRVRJTUVET1VUOwo+
IEBAIC0yMTk2LDcgKzIxOTYsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JlYWQoc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAkJCQlyZXR1cm4gZXJyOwo+
ICAJCX0KPiAgCj4gLQkJZGV2X2RiZyhjdHJsLT5kZXYsICJ1bmNvcnJlY3RhYmxlIGVycm9yIGF0
IDB4JWxseFxuIiwKPiArCQlkZXZfZXJyKGN0cmwtPmRldiwgInVuY29ycmVjdGFibGUgZXJyb3Ig
YXQgMHglbGx4XG4iLAoKVXBwZXIgbGF5ZXIgd2lsbCBjb21wbGFpbiwgeW91IGNhbiBrZWVwIHRo
aXMgYXQgdGhlIGRlYnVnIGxldmVsLgoKPiAgCQkJKHVuc2lnbmVkIGxvbmcgbG9uZyllcnJfYWRk
cik7Cj4gIAkJbXRkLT5lY2Nfc3RhdHMuZmFpbGVkKys7Cj4gIAkJLyogTkFORCBsYXllciBleHBl
Y3RzIHplcm8gb24gRUNDIGVycm9ycyAqLwo+IEBAIC0yMjExLDcgKzIyMTEsNyBAQCBzdGF0aWMg
aW50IGJyY21uYW5kX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsCj4gIAkJCWVyciA9IGJyY21uYW5kX3JlYWRfYnlfcGlvKG10ZCwgY2hpcCwgYWRkciwg
dHJhbnMsIGJ1ZiwKPiAgCQkJCQkJICAgb29iLCAmZXJyX2FkZHIpOwo+ICAKPiAtCQlkZXZfZGJn
KGN0cmwtPmRldiwgImNvcnJlY3RlZCBlcnJvciBhdCAweCVsbHhcbiIsCj4gKwkJZGV2X2luZm8o
Y3RybC0+ZGV2LCAiY29ycmVjdGVkIGVycm9yIGF0IDB4JWxseFxuIiwKCkRlZmluaXRlbHkgbm90
ISBXYXkgdG9vIHZlcmJvc2UuIFBsZWFzZSBrZWVwIHRoaXMgb25lIGFzIGl0IGlzLgoKPiAgCQkJ
KHVuc2lnbmVkIGxvbmcgbG9uZyllcnJfYWRkcik7Cj4gIAkJbXRkLT5lY2Nfc3RhdHMuY29ycmVj
dGVkICs9IGNvcnJlY3RlZDsKPiAgCQkvKiBBbHdheXMgZXhjZWVkIHRoZSBzb2Z0d2FyZS1pbXBv
c2VkIHRocmVzaG9sZCAqLwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
