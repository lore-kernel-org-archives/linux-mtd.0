Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA91C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seF7l/1uKko1Y9BOIt5T62G5c46DStPgQbthQtGbanI=; b=az/Ue8jATHA54v
	Nl4Z4qlV3LHuokVFTo+PPR28if2V11/dCPDf/PBL2DFWTjHAIO6UmoR2nlHSSUWuUz0ErWJjopZ0M
	tONUR1Z+E91VQ1Mxky8WhDQHHZHgXziHsSUp6DeqVU3WxWKbAH91b3nhYs61C9h1/8aUFf65tNoeX
	rUgmZQ7vmugVsluie/p8f0kkf6Xx7qyly4RGQTGmPV9q8KQ11CG0UDIiQH0WAs6L01HedfUlVYYqc
	i4uHdmQfNeJOXRQHSUzkYepz8LlFRvk4lKZ/aB2i3JerK/7ALxxuOlx/wtybAyedLXaI6Mw/piHBQ
	SoPZFQ4Sjo43cjup1Wuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msgTG-00BB11-IW; Thu, 02 Dec 2021 07:25:34 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msgTD-00BB0S-0v
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 07:25:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DEABCE0008;
 Thu,  2 Dec 2021 07:25:21 +0000 (UTC)
Date: Thu, 2 Dec 2021 08:25:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 2/5] dt-bindings: mtd: spi-nor: Allow external
 properties
Message-ID: <20211202082521.77c2837f@xps13>
In-Reply-To: <YagN1c7/Ltt/mhNp@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-3-miquel.raynal@bootlin.com>
 <YagN1c7/Ltt/mhNp@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_232531_244904_96DBB834 
X-CRM114-Status: GOOD (  23.48  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMSBEZWMgMjAyMSAxODowNTo0
MSAtMDYwMDoKCj4gT24gRnJpLCBOb3YgMjYsIDIwMjEgYXQgMDU6MzQ6NDdQTSArMDEwMCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IFNldHRpbmcgImFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZSIgd2lsbCByZWZ1c2UgYW55IGdlbmVyaWMgU1BJCj4gPiBwcm9wZXJ0eSB3aGlsZSB0aGV5IHNo
b3VsZCBiZSBvZiBjb3Vyc2UgYXV0aG9yaXplZC4gSW4gcHJhY3RpY2UgaXQgbG9va3MKPiA+IGxp
a2UgbWFueSBwZW9wbGUgdXNlZCBjb21wYXRpYmxlcyBkaWZmZXJlbnQgdGhhbiAiamVkZWMsc3Bp
LW5vciIgaW4KPiA+IG9yZGVyIHRvIHdvcmthcm91bmQgdGhpcyBsaW1pdGF0aW9uIGJlY2F1c2Ug
b3RoZXJ3aXNlIG5vIFNQSSBwcm9wZXJ0eQo+ID4gY291bGQgYmUgdXNlZCBpbiB0aGUgZXhhbXBs
ZXMuIFVzZSAidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSIKPiA+IGluc3RlYWQgdG8gYWxs
b3cgZGVmaW5lZCBwcm9wZXJ0aWVzIHRvIGJlIHVzZWQuIEl0IGlzIGxpa2VseSB0aGF0IGF0IHRo
ZQo+ID4gdGltZSBvZiB0aGUgY29udmVyc2lvbiB0byB5YW1sIG9mIHRoZSBqZWRlYyBmaWxlLCB0
aGUgdW5ldmFsdWF0ZWQKPiA+IGtleXdvcmQgd2FzIG5vdCB5ZXQgaW50cm9kdWNlZC4KPiA+IAo+
ID4gRml4ZXM6IDNmZjllZTJhODg5MCAoImR0LWJpbmRpbmdzOiBtdGQ6IHNwaS1ub3I6IENvbnZl
cnQgdG8gRFQgc2NoZW1hIGZvcm1hdCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgfCAyICstCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1u
b3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3Bp
LW5vci55YW1sCj4gPiBpbmRleCBlZDU5MGQ3YzZlMzcuLjgxYmUwNjIwYjI2NCAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5v
ci55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2pl
ZGVjLHNwaS1ub3IueWFtbAo+ID4gQEAgLTg4LDcgKzg4LDcgQEAgcGF0dGVyblByb3BlcnRpZXM6
Cj4gPiAgICAiXm90cCgtWzAtOV0rKT8kIjoKPiA+ICAgICAgdHlwZTogb2JqZWN0Cj4gPiAgCj4g
PiAtYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZSAgCj4gCj4gVGhpcyBoYXMgbm8gZWZmZWN0IHVubGVzcyB5b3UgaGF2ZSByZWZlcmVu
Y2VkIHNvbWUgb3RoZXIgc2NoZW1hIGhlcmUuIAo+IFRoZSBzZXJpZXMgSSByZWZlcmVuY2VkIHdp
bGwgc29sdmUgd2hhdCB5b3VyIHRyeWluZyB0byBzb2x2ZSBJIHRoaW5rLgoKTWF5YmUgdGhpcyBp
cyBub3QgdGhlIHJpZ2h0IGZpeCBpbmRlZWQsIGJ1dCBteSB1bmRlcnN0YW5kaW5nIG9mIGpzb24K
cmVhY2hlcyBpdHMgYm91bmRzIGhlcmUuCgpXaXRob3V0IHRoaXMgY2hhbmdlLCBhbnkgZXhhbXBs
ZSBpbiB0aGlzIGZpbGUgdGhhdCByZWZlcmVuY2VzIGEKc3BpLWNvbnRyb2xsZXIueWFtbCBwcm9w
ZXJ0eSAod2hpY2ggaXMgY29ycmVjdGx5IGRlZmluZWQpIHdpbGwgdGhyb3cgYW4KZXJyb3IuIFRo
ZSBmYWN0IGlzLCBhbGwgdGhlIGV4YW1wbGVzIG91dCB0aGVyZSB3aXRoIGEgc3BpLW5vciBmbGFz
aAp1c2luZyB0aGUgamVkZWMsc3BpLW5vciBjb21wYXRpYmxlICpjYW5ub3QqIGNvbnRhaW4gYW55
CnNwaS1jb250cm9sbGVyLnlhbWwgcHJvcGVydHksIG90aGVyd2lzZSB0aGUgdG9vbGluZyBlcnJv
cnMgb3V0LiBUaGlzIGlzCmEgcmVhbCBpc3N1ZS4KCkkgd2lsbCBnaXZlIFByYXR5dXNoJ3Mgc2Vy
aWVzIGEgdHJ5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
