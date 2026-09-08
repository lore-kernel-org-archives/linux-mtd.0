Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DC3C79F9E
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2E7OJWw4xM7FIkJvVRWvnzYNYO9lPlHI8zEqXZSyHKM=; b=S5mYdXfvRu4TDz
	OYww1ytuoVqz9sItTAt4bO5ea97uxfRJBis2Cp97f+2rp7cF1Ju0a5Pyh0XUYCC3nBZj/Dako0vbt
	jLDi4BvhusoNIBZ5Ptb5lIzDT13+0q1m38FWHhFGnCnIjbH7qCKmeZynZUsy+RQTQ4yelzNzG6bvi
	sWkedUjLrfZf5VjZ1CAdw62dTVgmyFS60VLhVTDnN+joL04P3DxYsCckY0YIOK2EiIG2A8dZily1D
	oR5BcdujjR+QQy7cpbrs8h/HWUvkh92dSN24ddfiE1p409Hzn3FCrJiNd5GbQ89AVxrC6tYqEoXmM
	PqlYbtrCGQfaEnkXqkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zjF-00000009qMm-3wcR;
	Tue, 08 Sep 2026 17:35:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zjF-00000009qMV-09GX
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 17:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C765E43BB7
	for <linux-mtd@lists.infradead.org>; Tue,  8 Sep 2026 17:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1C11F00ADE
	for <linux-mtd@lists.infradead.org>; Tue,  8 Sep 2026 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888928;
	bh=zvjd/OzBfuPYT7BKbdMoiUi8iXO0iBXgZckMkZOu3PU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qwshzapm39uXq2bVZZ9GfIJxkRheR3vOmylHbJtw3OxtcIqEw4JoMA7w+Tw/kgH4O
	 1rCS4JS58AFDBjVvowhwlytP979SDLVjwHHeX8h/SjjynwzRGtIxITSyRESG7cOEvl
	 3HtdMPZIJMUxw/VSwULMfZECLECqDa8XTzdlotHHLNl7Z18J9S91ysKJU/+rsSE3st
	 zRG2A5Weif3rhmhHI0XD5iRES+YAIJcQ2wJO4+SOoBi8ErXXYJ7STnxRAwRPBCYu0W
	 desQfa5d0YO4aFUsg16AnAqsoQKwbyDEOsvhbUJ1x0nYUQ/eNxL3zzmcUyeTMJuXyv
	 Si2cRn1tsxNWA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso4257935e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 10:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjEVThDGTSXJSXLHbWC+YcM2PbV2BVnKcnzOZaDZkuPbVG61BmidxnH6o3wXXl7Ps6VcGJoQdKADE=@lists.infradead.org
X-Gm-Message-State: AFuF++nzx9J22dXccKWpcAAVSHdB3tkimderAFyHpDIPDgKhoyea+tSF
	R/SNg5KBvqkokz/tamsBDO09Lt33YaLkAgptXximb0mc5vow1oXAKNTxeWbSbVfW+v3hQcGGvE2
	axGrNEXq1TTt3e8p+0a4IPirw/SUwy48=
X-Received: by 2002:a05:6512:3b2a:b0:5b6:1870:268a with SMTP id
 2adb3069b0e04-5b6187043cbmr4987140e87.59.1788888927352; Tue, 08 Sep 2026
 10:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-7-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-7-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:35:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPYmOre6_kZfftmOaWyNdDSTTNxsJn8PsnwA=KqoYXkg@mail.gmail.com>
X-Gm-Features: AcwNN1Vy2Xn3FP6S0HerShzZSl6E63lIl1BsiI7kBkdVTNwbpJho60d2kWzYdwE
Message-ID: <CAD++jLnPYmOre6_kZfftmOaWyNdDSTTNxsJn8PsnwA=KqoYXkg@mail.gmail.com>
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Paul Walmsley <paul@pwsan.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Helge Deller <deller@gmx.de>, 
	Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCA1OjI54oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+
IFRoZSBvbWFwMjR4eCBTb0MgcGxhdGZvcm0gd2FzIHVzZWQgaW4gdGhlIE5va2lhIE44MDAgYW5k
IE44MTAgdGFibGV0cwo+IHJlbGVhc2VkIG9uIDIwMDcgYW5kIHdhcyBhbW9uZyB0aGUgZmlyc3Qg
QVJNdjYgQ1BVcyBpbiBwcm9kdWN0cyB0aGF0Cj4gbWFkZSBpdCBpbnRvIHByb2R1Y3RzLgo+Cj4g
VW5mb3J0dW5hdGVseSB0aGUgZWFybHkgQVJNMTEzNnIwIENQVSBjb3JlcyBoYWQgYSBudW1iZXIg
b2YgcXVpcmtzIHRoYXQKPiBjYXVzZWQgYSBkaXNwcm9wb3J0aW9uYXRlIGFtb3VudCBvZiB3b3Jr
IHRvIGtlZXAgdGhlbSBjb21wYXRpYmxlIHdpdGgKPiBsYXRlciBBUk12NksvdjcvdjggaW1wbGVt
ZW50YXRpb25zLgo+Cj4gRHJvcCB0aGUgc3VwcG9ydCBmb3IgdGhpcyBTb0MgaW4gb3JkZXIgdG8g
YWxsb3cgcmVtb3ZpbmcgQVJNMTEzNnIwLgo+Cj4gQ2M6IEFhcm8gS29za2luZW4gPGFhcm8ua29z
a2luZW5AaWtpLmZpPgo+IENjOiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZv
Pgo+IENjOiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+IENjOiBSb2dlciBR
dWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiBDYzogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9t
aWRlLmNvbT4KPiBDYzogUGF1bCBXYWxtc2xleSA8cGF1bEBwd3Nhbi5jb20+Cj4gQ2M6IEhlcmJl
cnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiBDYzogIkRhdmlkIFMuIE1pbGxl
ciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNo
ZWhhYkBrZXJuZWwub3JnPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1
bmcuY29tPgo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+Cj4gQ2M6IFRlcm8gS3Jp
c3RvIDxrcmlzdG9Aa2VybmVsLm9yZz4KPiBDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwu
b3JnPgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1vbWFwQHZnZXIua2VybmVs
Lm9yZwo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzog
bGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpTaW5jZSBBYXJvIHNheXMgaXQgY2FuIGdv
LCBpdCBjYW4gZ28uCgpJZiB0aGUgbjgwMCBoYWQgYSBQb3N0bWFya2V0T1MgcG9ydCB0aGluZ3Mg
d291bGQgYmUgZGlmZmVyZW50LApidXQgaXQgZG9lcyBub3QuCgpZb3VycywKTGludXMgV2FsbGVp
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
