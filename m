Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A4FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcbEW+5QY1uvZUR0u9KscZhxS1Xg6v0gYbVdSkIGNm4=; b=BUDOMNvP9U0KIR
	78r1l05yy2EHPtCsamOILomZyQVVWR24UOufB7VFKx4Ig0gdyNIE8Qwo9Uq2v88JHJuSBNqmahD2+
	DzHwas/uFM0T4+wApA3AXC+yzJNlKbgIVGHfj5i65ejAzXPdFjKicSKzT8beZaOQ14bYRQbGnMSl1
	iNbnyMekQ3k/juqtXLg9J/+ewM2uTvzoXmW1fzQWGkQxhAadjNmGs/UWOJD1AdHiTKtZzdANTeVhg
	3BzXkuc7m0te4/Q2CvybI/GzzdzUGt0tLRB7o30NvA9hUr6p6QlC8/oRa5dMFq24qKdmTTWjir3Yo
	7UUazNO0a14J0Y5rYdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD1Ue-00Ezud-1E; Thu, 27 Jan 2022 09:55:04 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD1E3-00Evtl-Q3
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 09:37:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 130892000B;
 Thu, 27 Jan 2022 09:37:50 +0000 (UTC)
Date: Thu, 27 Jan 2022 10:37:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 01/13] spi: spi-mem: Introduce a capability structure
Message-ID: <20220127103749.5b195f03@xps13>
In-Reply-To: <YfGHy/MsQhaWCeYM@sirena.org.uk>
References: <20220104083631.40776-2-miquel.raynal@bootlin.com>
 <20220126105333.883267-1-miquel.raynal@bootlin.com>
 <YfF4UhhVFu749ZYK@sirena.org.uk> <20220126183601.42d38e88@xps13>
 <YfGHy/MsQhaWCeYM@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_013756_028985_CAFAB3FE 
X-CRM114-Status: GOOD (  15.18  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIyIDE3
OjQxOjMxICswMDAwOgoKPiBPbiBXZWQsIEphbiAyNiwgMjAyMiBhdCAwNjozNjowMVBNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gPiBJIHdhcyBob3BpbmcgdG8gcmV2aWV3IHRo
aXMgc3R1ZmY/ICBJIHRoaW5rIEkgd2FzIGV4cGVjdGluZyBpdCB0byBiZQo+ID4gPiByZWJhc2Vk
IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cuLi4gIAo+IAo+ID4gU29ycnkgZm9yIHRoZSBtaXN1bmRl
cnN0YW5kaW5nLCBJIHRob3VnaHQgeW91IHdlcmUgZmluZSB3aXRoIHRoZXNlCj4gPiBzcGkgYml0
cyBzbyBJIGRpZG4ndCBwaW5nIHlvdSBiZWZvcmUgYXBwbHlpbmcuIENhbiB5b3UgcmV2aWV3IHRo
ZSB2OQo+ID4gdGhlbj8gVGhlcmUgaXMgbm90aGluZyBkaWZmZXJlbnQgaW4gdGhlIHNlcmllcyBJ
IGFwcGxpZWQuICAKPiAKPiA+IERlcGVuZGluZyBvbiB0aGUgb3V0Y29tZSBJJ2xsIGVpdGhlciBm
aXggaW5saW5lIGlmIHlvdSBhY2sgdGhlIHBhdGNoZXMKPiA+IG9yIGRyb3AgdGhlIHBhdGNoZXMg
ZnJvbSB0aGF0IGJyYW5jaCBhbmQgc2VuZCBhIHYxMCBvdGhlcndpc2UuICAKPiAKPiBJIGRvbid0
IHJlY2FsbCBzZWVpbmcgYW55dGhpbmcgYnV0IEknZCBkcm9wcGVkIHRoZW0gZHVlIHRvIHRoZSBt
ZXJnZQo+IHdpbmRvdywgbGlrZSBJIHNheSBJIHdhcyBleHBlY3RpbmcgYSByZXBvc3QgZm9yIC1y
YzEuICBJJ2xsIHRyeSB0byBmaXNoCj4gdGhlbSBvdXQgYW5kIGhhdmUgYSBsb29rIHRvbW9ycm93
LgoKTm8gd29ycmllcywgSSd2ZSByZS1zZW50IGV4YWN0bHkgdGhlIHBhdGNoZXMgY3VycmVudGx5
IGFwcGxpZWQgb24gdGhlCnNwaS1tZW0tZWNjIGJyYW5jaCAoc28gdGhlIHJlYmFzZWQgb25lcyku
IFRha2UgeW91ciB0aW1lIGZvciByZXZpZXdpbmcKdGhlbSBhbmQgZGVwZW5kaW5nIG9uIGhvdyBp
dCBnb2VzIEkgd2lsbCBpbnRyb2R1Y2UgeW91ciBBY2tzIGlubGluZSBvcgpzZW5kIGEgdjExIGlm
IGl0IGlzIG5lZWRlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
