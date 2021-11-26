Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C903C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPF9Q8XZlgh3rZb74SYPP6fqm6pmfeZMLzCgsNKPlQk=; b=ktjyyQrH2jmPlV
	9JfRRBFsbcwLojEOGy8lJwZoTHhpHLkoS6JfhERd1PrdhlISWC11Gi+715vvG0U8SErXKGgDQNYZf
	57M5OWRAt3h6/a7KTUYdC4iQjPqjv7wPXjOlNS0dDgzspHDqIEOJLGhY0+Fpj4OSi8FcBzj3CBpNi
	MJr1ZNGqGNeAXOGlPAsu6OgFDRQP5OR4zRSgwPakIjl1mAh7LmMLZ8UI9Ukxkallh6IX0BdCLJpDF
	exDhzQkLAmY/1YLLkZsus6FBbEgpktpvFt2MiantZIllVGMnIxoVAnEfCJmQo7ZHgW0ULCf7F+/I5
	QauL1rK61ePPp4mjp1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqbwY-00Ai3J-My; Fri, 26 Nov 2021 14:11:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqbwV-00Ai1l-0D
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 14:11:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0AEA6FF807;
 Fri, 26 Nov 2021 14:10:59 +0000 (UTC)
Date: Fri, 26 Nov 2021 15:10:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, Xiangsheng Hou
 <Xiangsheng.Hou@mediatek.com>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Boris Brezillon <bbrezillon@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 00/20] External ECC engines & Macronix support
Message-ID: <20211126151059.10c19ec7@xps13>
In-Reply-To: <YaDjDhOhpHMdxiqA@sirena.org.uk>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <YaDjDhOhpHMdxiqA@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_061111_210648_34FB4836 
X-CRM114-Status: GOOD (  10.74  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBGcmksIDI2IE5vdiAyMDIxIDEz
OjM3OjE4ICswMDAwOgoKPiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCAxMjozOTowNFBNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gQXMgYSBmaXJzdCBleGFtcGxlLCBNYWNyb25p
eCBFQ0MgZW5naW5lIGNhbiBiZSB1c2VkIGFzIGFuCj4gPiBleHRlcm5hbCBlbmdpbmUgKHRha2Vz
IHRoZSBkYXRhLCBwcm9jZWVkcyB0byB0aGUgY2FsY3VsYXRpb25zLCB3cml0ZXMKPiA+IGJhY2sg
dGhlIEVDQyBieXRlcykgb3IgYXMgYSBwaXBlbGluZWQgZW5naW5lIGRvaW5nIG9uLXRoZS1mbHkK
PiA+IGNhbGN1bGF0aW9ucyAod2hpY2ggaXMgdmVyeSBjb21tb24gaW4gdGhlIHJhdyBOQU5EIHdv
cmxkKS4gIAo+IAo+IFRoZSBTUEkgYml0cyBvZiB0aGlzIGxvb2sgZmluZSAobW9zdCBvZiB0aGUg
c21hcnRzIGFyZSBpbiB0aGUgTVRECj4gY29kZSEpLCB3aGF0J3MgdGhlIHBsYW4gZm9yIGdldHRp
bmcgdGhpcyBtZXJnZWQ/CgpHcmVhdCEgVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpJZiB5b3Ug
YWNrbm93bGVkZ2UgdGhlIFNQSSBiaXRzIEkgYmVsaWV2ZSBJIGNhbiBjYXJyeSB0aGUgZW50aXJl
IHNlcmllcwp0aHJvdWdoIHRoZSBNVEQgdHJlZS4gSWYgeW91IGZlYXIgY29uZmxpY3RzIGFuZCBu
ZWVkIGFuIGltbXV0YWJsZSB0YWcgSQpjYW4gYWxzbyBkbyB0aGF0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
