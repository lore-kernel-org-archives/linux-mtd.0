Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E326EC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2024 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lCVLSYLGgyezRaR+pCokZ0JzaFdYOl30JXUepXJj0A=; b=Z88h8z4qEGqXcj
	nfahOhCmhM1siUWTLvon+jNlW8xuqVFr7A5W3JXMmJGXp7sBsSBaC3iEJVIhprV0Ci5878bRAN1gF
	OsP641y6yN0nEntOlLLUgnPIUarIy9daxyfO4FGWU8ewM52EGxNA0T0F9tG+smr6um/LaIXpVBxgQ
	B5hsPfWIuMa3xA13eHVNvEmaUwWi3bPhaXt1lkYIbixP/S7mqno5iS94SkAUAHQck2KBiIdr/nd+Y
	w9OUY1hIt68vYpKTFvBi7Jl9KrTXvsf/Fc6XMPrFUk85zabz6ChHeotyLLLkG3Dg5EEoDSl09ccK4
	eIyaqiiCdoyceurdjBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdMG-0000000FlLx-0KX4;
	Mon, 24 Jun 2024 06:39:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdM9-0000000FlLE-2Lrh;
	Mon, 24 Jun 2024 06:39:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1221C0006;
	Mon, 24 Jun 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719211148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qQNy0cFi+vB5Mfp2npnGPe64P5YepXPolFgKOS6juw=;
	b=Y2dSdUb7L45w0zOH/hMoZ0jqJMRt2RztXSF8cdHFJOQrvsC2d2TrOTWPfcBntkFhwN7H6/
	hRjUcA+3RSAJ94uif8HqhAvbCWQJYiR+SVkX6EFFrYPEr/FW5wId9XKqYNzTH1dx6WDGG0
	EpHqQyHHRgNy3VsxGvF0BTOq9xL4A+TxAGxtKMeEP3applLc9/8N0v4h797ONHvRbmXNoB
	xidj39GDhF0L9I2O/NKLPWLoLxYKqnfunm/ZzhUtmDxgyWbMCW+SkvuckBwxpEg80TiaAu
	EQMC92N1cUsplO1EO00oEc1qOUwmVwAOuZV611xRbhs1I+WiDGN7XvJsNyxmEw==
Date: Mon, 24 Jun 2024 08:39:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li
 <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, Chancel Liu
 <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, Markus Elfring
 <Markus.Elfring@web.de>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
Message-ID: <20240624083900.14e38d82@xps-13>
In-Reply-To: <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
	<20240621103019.783271f4@xps-13>
	<CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_233913_894671_CF3983AE 
X-CRM114-Status: GOOD (  23.41  )
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

SGkgUGlvdHIsCgpwaW90ci53b2p0YXN6Y3p5a0B0aW1lc3lzLmNvbSB3cm90ZSBvbiBGcmksIDIx
IEp1biAyMDI0IDE0OjQ0OjIxICswMjAwOgoKPiBPbiBGcmksIEp1biAyMSwgMjAyNCBhdCAxMDoz
MOKAr0FNIE1pcXVlbCBSYXluYWwKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGkgUGlvdHIsCj4gPgo+ID4gcGlvdHIud29qdGFzemN6eWtAdGltZXN5cy5jb20g
d3JvdGUgb24gVGh1LCAyMCBKdW4gMjAyNCAxOTo1NjozOSArMDIwMDoKPiA+ICAKPiA+ID4gTW92
ZSBhd2F5IGZyb20gcGwwOHggcGxhdGZvcm0gZGF0YSB0b3dhcmRzIGRldmljZSB0cmVlLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBXb2p0YXN6Y3p5ayA8cGlvdHIud29qdGFzemN6
eWtAdGltZXN5cy5jb20+ICAKPiA+Cj4gPiBJIGRvbid0IHNlZSBhbnkgY2hhbmdlIHJlZ2FyZGlu
ZyB0aGUgTkFORCBjb250cm9sbGVyIG5vZGUgaW4gdGhlIGRldmljZQo+ID4gdHJlZSwgaXMgdGhl
cmUgYW55IGRlcGVuZGVuY3kgd2l0aCBvdGhlciBwYXRjaGVzIGZyb20gdGhlIHNhbWUgcGF0Y2hz
ZXQKPiA+IG9yIG1heSBJIGFwcGx5IHRoaXMgZGlyZWN0bHkgdG8gbmFuZC9uZXh0Pwo+ID4KPiA+
IFRoYW5rcywKPiA+IE1pcXXDqGwgIAo+IAo+IFllcywgdGhpcyBwYXRjaCBkZXBlbmRzIG9uICJb
djQsMDQvMTBdIEFSTTogZHRzOiBscGMzMnh4OiBBZGQgbWlzc2luZwo+IGRtYSBhbmQgaTJzIHBy
b3BlcnRpZXMiCj4gd2hpY2ggd2lsbCBiZSBzcGxpdHRlZCBpbnRvIHR3byBvciBtb3JlIHNlcGFy
YXRlIHBhdGNoZXMgcGVyIHJlcXVlc3QKPiBpbiB0aGUgY29tbWVudHMuCj4gSSdkIGxpa2UgdG8g
a2VlcCBkcml2ZXIgY2hhbmdlcyBhbmQgY29ycmVzcG9uZGluZyBjaGFuZ2VzIGluIERUUyBpbgo+
IHRoZSBzYW1lIHBhdGNoCj4gYnV0IEkndmUgbWFkZSBhIHNlcGFyYXRlIHBhdGNoIGZvciBEVFMg
cGVyIHJlcXVlc3QgZnJvbSB2MiBvZiB0aGUgcGF0Y2ggc2V0LgoKVGhlc2UgY2hhbmdlcyB3b24n
dCBiZSBhcHBsaWVkIHRvIHRoZSBzYW1lIHRyaWVzIHNvIHRoZXkgbXVzdCBiZSBzcGxpdC4KClNv
IEkgd2lsbCBub3QgdGFrZSB0aGlzIHBhdGNoIGZvciB0aGUgbmV4dCBtZXJnZSB3aW5kb3cgYW5k
IGluc3RlYWQKd2lsbCB0YWtlIGl0IGZvciB0aGUgb25lIGFmdGVyLCBpZiB0aGUgRFQgcGF0Y2hl
cyBoYXZlIGJlZW4gYXBwbGllZC4KUGxlYXNlIHBpbmcgbWUgYXQgLXJjMSBhZ2FpbiBpZiB0aGUg
RFQgcGF0Y2hlcyBoYXZlIGdvbmUgdGhyb3VnaC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
