Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94714C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1h9mbq1pl6aKCnXW384nKokpXueo5JI1DuS4ASe6tw=; b=MoI5XqPgZRndxD
	GQc4Uv7kLNRKRgVY4niovZCB2dzpadSbABgsFDpiAmOC0nRx6RU6yrMzJf2ARfChdJw/TP4Cgkms+
	QOZrRE8xgY1ohKT7peuFv6l7ZjrMSig42vtD03Q0kd2B++ogDgL0cwqc08hiJOpp3NmilC8v75U/c
	95KcwZb/XwMcE84mHOsSXPChnB68znxc1pGoHSiI318Sz6sutgx4ItfY/lmRMWKEFa7yp04EVWed6
	q9bYaVU4ltilLUQIOb4qnluj/Ei03oC6K36JsK4xFQuCBXIvvLvmSY8JtlO1A+iVL/hInF/8o94OR
	eFwvGMNJ38CpAagK8lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njjM4-001vEU-9Y; Wed, 27 Apr 2022 15:13:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njjLr-001vBg-Nq; Wed, 27 Apr 2022 15:13:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBD57FF807;
 Wed, 27 Apr 2022 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651072387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77woMB9sIvE36mfc5Tehmi9aSEDP7KlMxvPibRtT2hY=;
 b=ezWpYA4+8e7y5MyQ8IuWyHLreUzgT/6Y2GMum2gh2jsNxMk4nQbU0HQSmS6K4F/T/OuDdP
 3n+IB8jRO6U7q369DZZsSacWNPgAWWythX5mundXVJtfVO+YI0m72NSy++vE65oqU6pI3k
 5W3wvL2Cm3UheSG7FqcDKo8XRpAgUiXovPMQIaPslimXRusFD6bAaAv1Njl2E8umvnxckZ
 jRswnkAuKSohoiTa6W0NqGWu4fKk77ioHnDSLdpACQxmJ1Dm9PG04Hq3Yqpregl9OpshyF
 vedacIlLlmdEZRe+Ot4/HAO/6F9cs+ibR1UrrBcbMa6s/NOlJKQkD7WhbHuAxw==
Date: Wed, 27 Apr 2022 17:13:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Cai
 Huoqing <cai.huoqing@linux.dev>, Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:NAND FLASH SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND controller
Message-ID: <20220427171302.5d374ea9@xps13>
In-Reply-To: <YmlPlhKTrRXZo/Sx@sirena.org.uk>
References: <20220424032527.673605-1-gch981213@gmail.com>
 <20220427112857.7ddd7fc8@xps13>
 <CAJsYDV+DfBEmWr7D1aO8F=3WMurAg6aEhf5gY86BXOUSyJ2nXA@mail.gmail.com>
 <YmlPlhKTrRXZo/Sx@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_081311_961209_5698A42A 
X-CRM114-Status: GOOD (  14.55  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI3IEFwciAyMDIyIDE1
OjEzOjQyICswMTAwOgoKPiBPbiBXZWQsIEFwciAyNywgMjAyMiBhdCAxMDowNDo1N1BNICswODAw
LCBDaHVhbmhvbmcgR3VvIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMjcsIDIwMjIgYXQgNToyOSBQ
TSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZTogIAo+IAo+
ID4gPiBUaGUgcGF0Y2ggYWN0dWFsbHkgbG9vayBpbmRlcGVuZGVudCwgc28gaWYgaXQncyBmaW5l
IGZvciB5b3UgSSBjYW4gdGFrZQo+ID4gPiB0aGUgdHdvIG10ZCBwYXRjaGVzIGFuZCBsZXQgeW91
IG1lcmdlIHRoZSBzcGkvYmluZGluZyBjaGFuZ2VzLiAgCj4gCj4gPiBPdXQgb2YgY3VyaW9zaXR5
Ogo+ID4gV291bGRuJ3QgdGhhdCBicmVhayB0aGUgYnVpbGQgZm9yIHNwaSBzdWJzeXN0ZW0/IEJl
Y2F1c2UuLi4gIAo+IAo+ID4gPiA+ICByZW5hbWUgZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX2Vj
Yy5oID0+IGluY2x1ZGUvbGludXgvbXRkL25hbmQtZWNjLW10ay5oICgxMDAlKSAgCj4gCj4gPiBU
aGUgc3BpIGRyaXZlciBuZWVkcyB0aGlzIGhlYWRlciBmaWxlIHdoaWNoIGlzIG1vdmVkIGluIHRo
ZSBtdGQgcGF0Y2guICAKCkFoLCB5ZWFoLCByaWdodC4KCj4gQWgsIHRoYXQnbGwgYmUgYW4gaXNz
dWUgaW5kZWVkIC0gaWYgSSBjb3VsZCBnZXQgYSBzaWduZWQgdGFnIHdpdGggdGhlCj4gZGVwZW5k
ZW5jeSBpbiBpdCBJIGNhbiBnbyBhaGVhZCB3aXRoIHRoZSBTUEkgYml0cz8KCk9rLCBJJ2xsIHNo
YXJlIGFuIGltbXV0YWJsZSB0YWcuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
