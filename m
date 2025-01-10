Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D020E7719D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtbbVy6aX1ji8TyuBCTC2jc58HJfLRAQ3mqyLvUsbs0=; b=MwcwTI8XNAA1Do
	upwJNGs4EAaJDrYnTKqnu1hkXDfI2/gm8vB5FYlC68KdR8fX7Wzza2MFpdapv1R/1QDqpLUZkxQSE
	Xg3p5DzyjcvwHc2O1YKStzrZa0xSkOg5wvhuY3jAJingLDc+o72bZkENbsr4tkw4zJwuPU37DPKYe
	Z9Zbj3lJRzxxAfUU1I4eGpoN/XLqfNBBmFtRw6hj7Pi1mqCkrV69YbQ4qRmq/OZPssLnFnntrWQgN
	XCUY6mZIqcxdRG6Fe+P4RPxdzIPmsKLwYvm4U9IqhP1+LPaxshrTuDw5jDRwt1XG6AQKnps9jIC3r
	dkzW/yU3m+K2+ep/sJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGvM-0000000FvDg-12Na;
	Fri, 10 Jan 2025 15:27:48 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGb6-0000000Fnn8-1lfU;
	Fri, 10 Jan 2025 15:06:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CD1D1BF205;
	Fri, 10 Jan 2025 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736521608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8hqtpx7uSmFFCBt4R+XArsWuILvupPoqhgNSuXM+dY=;
	b=bM3aHv2eZDPIEogkHXuaz90KY+89c/SS6D88M5Wwse/oE9y22gsGc/f1A8uC8lhyczxePx
	Rb00zNoRl/Jqt4Rnx2w8AcwTkm4UgnSaR/HS4gHDeSMDpQTBSITwMoxgl5bMwlfDR7/2Ex
	4678QsL8tSDo270hZROIzDvS4dvPmSaDeww2Q2qXcyFoH/YdmcJiq6OWaXl/7F2wYSL727
	yhpchOJrpNEM7J52JVcWYn19Jz67QyEwTI9gquIRwE3+7wGP8GWRfXVZ+CnsGH511T/Ug0
	dK1IpVJOGgF/Nc85wZftpbWnToLYHGKcXdNY97F3DTjah4672ArjZoy9pk9bKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung <schung@nuvoton.com>,
  Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Raju Rangoju <Raju.Rangoju@amd.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <stlin2@winbond.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-mtd@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  openbmc@lists.ozlabs.org,  linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
In-Reply-To: <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk> (Mark
	Brown's message of "Fri, 10 Jan 2025 14:52:29 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
	<20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
	<ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
	<87tta6ag5b.fsf@bootlin.com>
	<c9043531-c733-4153-a814-79aab387883e@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:06:42 +0100
Message-ID: <87y0zi908t.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_070652_721565_303A8CEE 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

T24gMTAvMDEvMjAyNSBhdCAxNDo1MjoyOSBHTVQsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgSmFuIDEwLCAyMDI1IGF0IDAzOjM3OjUyUE0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDEwLzAxLzIwMjUgYXQgMTI6NDI6NDcgR01ULCBN
YXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4+ID4gVGhpcyBicmVha3Mg
dGhlIGJ1aWxkOgo+Cj4+ID4gL2J1aWxkL3N0YWdlL2xpbnV4L2RyaXZlcnMvc3BpL3NwaS1tZW0u
Yzo1ODA6NTogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhzcGlfbWVtX2NhbGNfb3Bf
ZHVyYXRpb27igJk7IGhhdmUg4oCYdTY0KHN0cnVjdCBzcGlfbWVtX29wICop4oCZIHtha2Eg4oCY
bG9uZyBsb25nIHVuc2lnbmVkIGludChzdHJ1Y3Qgc3BpX21lbV9vcCAqKeKAmX0KPj4gPiAgIDU4
MCB8IHU2NCBzcGlfbWVtX2NhbGNfb3BfZHVyYXRpb24oc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+
Cj4+IENyYXAsIHRoYXQncyBhIGZpeHVwIHRoYXQgbGFuZGVkIGluIHRoZSB3cm9uZyBjb21taXQg
KG10ZDogc3BpbmFuZDoKPj4gRW5oYW5jZSB0aGUgbG9naWMgd2hlbiBwaWNraW5nIGEgdmFyaWFu
dCkuIEknbGwgZml4IGl0Lgo+Cj4gUGxlYXNlIG9ubHkgcmVzZW5kIHRoYXQgcGF0Y2ggLSB0aGUg
cmVzdCBidWlsZHMgYW5kIHRlc3RzIGZpbmUgaW4gbXkgQ0ksCj4gSSdtIGp1c3QgY2hlY2tpbmcg
YSBtZXJnZSBmaXh1cC4KCkFoLCBvb3BzLCBkaWRuJ3Qgc2VlIHRoaXMgaW4gdGltZSBhbmQgcnVz
aGVkIHYzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
