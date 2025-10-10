Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1896CAC5BB
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nnCkMa3I702od84E1zHFXgekV8lKvIM5+mbgfVF1fQ=; b=H5BJ39uo+1Z0cV
	UFAqtdwJnLIXoLndZ34J+lavQwAFMFkBMauEJfRa+U3VxsP/DFwebalWaD3h6slKGnTi7YZGimyyq
	3fWo8zRPAmtgrHnFQwJery25WGOpyXpbu0ycCFV+T5Y7Hd4kB7vqhjXgZ7V3ik65ZZH7Vi2oIAbGE
	j0Mog3fQh73ex+t4TfvROIt6RCHMRVM8/AsYFUBqlE5Uj1K9vmEkpad4exY1w5Ch5ewg0HTuOh3+0
	RDg36JjsItzEgnqqdRgPS/EqdDC7hymhtePWBhhNiQO0mCCKfbKvYyLi6B+xsdzEFvAIgXF21L7YS
	pFIYrZcrl/RwQSB3yjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AGX-00000008Fl9-1nvt;
	Fri, 10 Oct 2025 10:22:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AGT-00000008FkW-46eq;
	Fri, 10 Oct 2025 10:22:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87F4CC08CC7;
	Fri, 10 Oct 2025 10:21:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28C3B60667;
	Fri, 10 Oct 2025 10:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 581C7102F220E;
	Fri, 10 Oct 2025 12:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LVAJyNJ/atriVmfO2odOrzCoxOhZwl6Ix4PMrqVToYk=;
	b=ksoo2ILUKZ/ObF21JtYOUO92T+BCdn2ME3maRCv+7sMurv6VEfraalOYLbpMQ0EjylyjBy
	WSTKA30jtDXWGYPIHWrBKYrwe3m2XDMq7maal7YBMI7cz9ycXn+pxMlr1VGgRR0nRjsly7
	hXK69PIxeuPJ5mH29t35/QtLoAmMV59TS8V4pJzoJuZZdJrGk7Jz/dFwIcKYDD9gTG+alr
	K2GnEemfK10+4rzRvNMtk9M68xllsp32Vh4XDqhEcyXBCSLGq0GZuWFrWO050Th0dh5yy4
	ajEW4kvqmx7w7KzVSpcPZ6XJ+yZjmVuxZovTWslvdn0E2RMkY9G0HBHXrk3VGQ==
Message-ID: <00f6ec33-bd86-4f57-8011-1c067e9321b4@bootlin.com>
Date: Fri, 10 Oct 2025 12:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
 <82bcd40f-7e94-43ca-99c9-234458011b9b@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <82bcd40f-7e94-43ca-99c9-234458011b9b@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_032222_208937_480A3259 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMTAvMTAvMjAyNSDDoCAxMDo0NywgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdMKgOgo+
IE9uIDEwLzEwLzIwMjUgMTA6NDAsIFJpY2hhcmQgR2Vub3VkIHdyb3RlOgo+PiBUaGUgSDYxNiBo
YXMgYSBOQU5EIGNvbnRyb2xsZXIgcXVpdGUgc2ltaWxhciB0byB0aGUgQTEwL0EyMyBvbmVzLCBi
dXQKPj4gd2l0aCBzb21lIHJlZ2lzdGVyIGRpZmZlcmVuY2VzLCBtb3JlIGNsb2NrcyAoZm9yIEVD
QyBhbmQgTUJVUyksIG1vcmUgRUNDCj4+IHN0cmVuZ3Rocywgc28gdGhpcyByZXF1aXJlcyBhIG5l
dyBjb21wYXRpYmxlIHN0cmluZy4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBOQU5EIGNvbnRy
b2xsZXIgbm9kZSBhbmQgcGlucyBpbiB0aGUgZGV2aWNlIHRyZWUuCj4gCj4gCj4gUGxlYXNlIGRv
IG5vdCB1c2UgIlRoaXMgY29tbWl0L3BhdGNoL2NoYW5nZSIsIGJ1dCBpbXBlcmF0aXZlIG1vb2Qu
IFNlZQo+IGxvbmdlciBleHBsYW5hdGlvbiBoZXJlOgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjE2L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1w
YXRjaGVzLnJzdCNMOTQKWW91J3JlIHJpZ2h0LCBJJ2xsIHJlZm9ybXVsYXRlIHRoYXQuCgoKPiAK
Pj4KPj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGJvb3Rs
aW4uY29tPgo+PiAtLS0KPiAKPiBDb25mdXNpbmcgb3JkZXIgb2YgcGF0Y2hlcy4gRHJpdmVyIGNv
ZGUgY2Fubm90IGRlcGVuZCBvbiBEVFMuCj4gCj4gU2VlIHN1Ym1pdHRpbmcgcGF0Y2hlcyBpbiBE
VC4gSXQgaXMgVkVSWSBleHBsaWNpdCBhYm91dCBpdC4gUGxlYXNlIGFsc28KPiByZWFkIG1haW50
YWluZXIgc29jIHByb2ZpbGUuCkluZGVlZCwgaXQncyBxdWl0ZSBleHBsaWNpdCBpbgpEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdApTb3JyeSBm
b3IgdGhhdC4KCkJ1dCBJIGRvbid0IGtub3cgd2hhdCB5b3UgYXJlIHJlZmVycmluZyB0byBhcyAi
bWFpbnRhaW5lciBzb2MgcHJvZmlsZSIKSSBndWVzcyBzb2MgaGVyZSBkb2Vzbid0IHN0YW5kIGZv
ciBzeXN0ZW0gb24gY2hpcCA6KQoKVGhhbmtzIQoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6
dG9mCgoKLS0gClJpY2hhcmQgR2Vub3VkLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
