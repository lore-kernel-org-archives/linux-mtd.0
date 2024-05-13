Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0807C25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyoJmwVzBgyniraQjA1xu4SGhrwoeAYK+g9z7SjgQs4=; b=gKFyXFikYp36w/
	eHoQt7aD41OByOY0AUBusAj/iOMDSuz+bIb59LDBMABFDfgaRhoHRus9qXFhj2lcdNmdvH1AxlEKa
	kuLKLHiBUh8lg8PQnA74uWKEGsWw0TUsNKy0tkEExxECMc9eYJj4fHWj1/WmCWcatPIacpmlu2q9/
	Ywk2JgzNI0hYExPUSrton0yJsG96eqf+YCDmhEHj6DTNKF7eaJKIs6BIk3agp6KPPiepeC1lqip9+
	94buxoEUFSIkMLZK8zgH6RzCkLmVXFKzdo29HbxukCe6zLfOLSLA4lY9Kn4hhn3kd03dExX7pvrvu
	x47Umk4fHSM35ObmDziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QWj-0000000C7Yl-0FSW;
	Mon, 13 May 2024 07:55:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QWf-0000000C7XN-0a4q;
	Mon, 13 May 2024 07:55:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 175BDE001E;
	Mon, 13 May 2024 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715586908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ih1uGOfjRAxCt+6sZss4Yfl3azQjSUpDGJBEtOH8mvE=;
	b=f9ac95v6i1XDmaygmdpkS9KIhKeyRRR3rzxuphI0Luyq5ePjJX81Na7xIwxyP9jltiorT5
	o3RQdE4J0iBlv5VwiuDCBnPjk/bdNj4DrgwUQku75ZXXHOqytN8sUi3raDKyJY2X9piWrO
	USUjdu+raME12Enpsa1gnuUglmy0oHkqtHN8/y0e60Dc6F39+3tJfrm18pfdfraCjaA0no
	wIWhvD6hR/8n67SgI2C5gTU3q2ihA6qXYu4+AHgnSzsCbeRsNJjPcWwDwF/qAiUy3BfoR0
	Ch9OAOcKjdSFVA88ufca5XaZyeLXxw6gUY9xSEYupyKwu6Jpav7BN9WR9OV68A==
Date: Mon, 13 May 2024 09:55:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240513095504.37776289@xps-13>
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_005513_333596_69876EC0 
X-CRM114-Status: UNSURE (   8.61  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMTAgTWF5IDIwMjQgMDc6MzA6
MTQgLTA1MDA6Cgo+IEFkZCBhbm90aGVyIGJhdGNoIG9mIHZhcmlvdXMgInNpbXBsZSIgc3lzY29u
IGNvbXBhdGlibGVzIHdoaWNoIHdlcmUKPiB1bmRvY3VtZW50ZWQgb3Igc3RpbGwgZG9jdW1lbnRl
ZCB3aXRoIG9sZCB0ZXh0IGJpbmRpbmdzLiBSZW1vdmUgdGhlIG9sZAo+IHRleHQgYmluZGluZyBk
b2NzIGZvciB0aGUgb25lcyB3aGljaCB3ZXJlIGRvY3VtZW50ZWQuCgouLi4KCj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hdG1lbC1uYW5kLnR4dCAgICB8ICA5IC0tLS0tLQoKSSBkb24n
dCBrbm93IGhvdyB1c2VmdWwgYXJlIHRoZXNlIGNvbXBhdGlibGVzLCBidXQgaWYgSSB0YWtlIHRo
ZSBjYXNlCm9mIGF0bWVsLHNhbWE1ZDMtbmZjLWlvLCBpdCBpcyBvbmx5IGRlc2NyaWJlZCBpbiB0
aGlzIGZpbGUsIHdoaWxlCnNldmVyYWwgRFRTSSByZWZlcmVuY2UgaXQuIEFmdGVyIHRoaXMgY2hh
bmdlIHRoZXkgd2lsbCBubyBsb25nZXIgYmUKcmVmZXJlbmNlZCBhdCBhbGwgYnV0IHN0aWxsIGlu
IHVzZS4gSXMgdGhpcyBpbnRlbmRlZD8gU2hhbGwgdGhlc2UKY29tcGF0aWJsZXMgYmUgdG90YWxs
eSBkcm9wcGVkIGZyb20gdGhlIGRldmljZSB0cmVlcyBhcyB3ZWxsPwoKJCBnaXQgZ3JlcCAtYyBh
dG1lbCxzYW1hNWQzLW5mYy1pbyBhcmNoLwphcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2Ft
YTVkMi5kdHNpOjEKYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL3NhbWE1ZDMuZHRzaToxCmFy
Y2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hNWQ0LmR0c2k6MQphcmNoL2FybS9ib290L2R0
cy9taWNyb2NoaXAvc2FtYTdnNS5kdHNpOjEKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
