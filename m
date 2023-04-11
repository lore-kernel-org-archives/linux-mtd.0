Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F139FC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KReNR11QnL/gkbLGiudS6L73BnA4Jwo8PeTmnt+xhL4=; b=fi/VBEArgemzUR
	7x/lLmXAzCVHwoyPC/6OFFl0k3B4vuxMt6zLesstF7F2kkemf6niaeaCHX4yHvq7rNOxrHF3exX7a
	1E7OG+2Xfp1nRLnnxmZ6QR9Op7EK/eZpwpolKt/0/TEUJMKZdCzfPDj6Ebt3AFpQyP59UzvfneyKi
	SWKo6WKpZEiNrL4IMiAJL0UG7Mg490RGDqrT7R4DKjPWIzCy27ZyzuIxDxGVrq7ySW3cUmoB5AgKu
	igVjl1kX+RHBO8jlXoYiDip4+HyCzYkSYca9AfyCh/gXVaTqyD4KrBfSmqojRgse0mkQTikMHOUyP
	TxRGgQ3Bt95HshNSBF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9FL-00GpOb-0M;
	Tue, 11 Apr 2023 08:20:59 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9FE-00GpJo-2O;
	Tue, 11 Apr 2023 08:20:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 86501C000B;
	Tue, 11 Apr 2023 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681201245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5dxn4NJiE3B4l0ky6etbuCAHmNrCsdSn8aiPhVJqzK0=;
	b=ZsU8dYwTOc46TPHSbq5p16/9AQmMS/uUngPw/Ep3ffxRbxNAvDSBCBvcAy2pJthLsUo170
	Rj2p9Mc9u19gW1370eOx7JvIAabcDATJDumAn+o4DLCQe7iYje0L16LYJobe4Ma8iY4S2M
	hVT2XlKE7FDCpaVqWTtgFMG9mm77zh0cU7Io21vdLB2MKPq3F4zr/E7ECZswWoUCh/54s9
	LxOZOxezaGsD/cMwwjzDu8L5qQzOGwesAiCNFf9eRpldZFKNpdmxXMmy52npYKIeX+l3mz
	4g3Xo/1Q9fGa3R74wYDYHo17n1DEYEktLz9cH0XxSNGHCrcLqbBdY32P+qBBmQ==
Date: Tue, 11 Apr 2023 10:20:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>, Vignesh
 Raghavendra <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
 Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, linux-amlogic@lists.infradead.org, Chuanhong
 Guo <gch981213@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Heiko
 Stuebner <heiko@sntech.de>, Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Yang
 Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de, Arnd Bergmann
 <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, ye xingchen
 <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>, Roger Quadros
 <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Stephen Boyd <sboyd@kernel.org>, Valentin
 Korenblit <vkorenblit@sequans.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org, Kyungmin
 Park <kyungmin.park@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback
 returning void
Message-ID: <20230411102025.6b2fdc9e@xps-13>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
	<20230407101043.299f5e22@xps-13>
	<20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012053_088667_D96793A4 
X-CRM114-Status: GOOD (  30.10  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFNhdCwgOCBB
cHIgMjAyMyAyMDo1MzozMiArMDIwMDoKCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBw
bGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBtYW55IGRyaXZlciBh
dXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcg
YnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQg
aXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291
cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0IHRvIG1ha2UgdGhl
IHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcwo+
IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBh
bHJlYWR5IHJldHVybnMKPiB2b2lkLgo+IAo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVy
IGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBjYWxsYmFjayB0byB0
aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KPiAKPiBBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8
bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgo+IFJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWls
IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IFJldmlld2VkLWJ5OiBNYXJ0
aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IEFj
a2VkLWJ5OiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiBSZXZpZXdlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBBY2tlZC1ieTogSmVybmVqIFNr
cmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KPiBBY2tlZC1ieTogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IAo+IEhleSBNaXF1ZWws
Cj4gCj4gT24gRnJpLCBBcHIgMDcsIDIwMjMgYXQgMTA6MTA6NDNBTSArMDIwMCwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPiA+IEkndmUgbG9va2VkIGF0IHRoZSBkaWZmZXJlbnQgcGF0Y2hlcywgdGhl
eSBsb29rIGdvb2QgdG8gbWUgYnV0IGFzIHRoZXkKPiA+IGFyZSBhbGwgdHJpdmlhbCBhbmQgZXhh
Y3RseSBpZGVudGljYWwsIHdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgdGhpcwo+ID4gYWdhaW4gYWxs
IHNxdWFzaGVkIGluIGEgc2luZ2xlIHBhdGNoPyBBIHN1YnN5c3RlbS13aWRlIGNvbnZlcnNpb24g
c2VlbXMKPiA+IGFwcHJvcHJpYXRlLiBJbiBhbGwgY2FzZXMgSSBwbGFuIHRvIHRha2UgdGhpcyBm
b3IgdGhlIG5leHQgbWVyZ2UKPiA+IHdpbmRvdy4gIAo+IAo+IEkgc2xpZ2h0bHkgcHJlZmVyIHRo
ZW0gc2VwYXJhdGVseSwgYmVjYXVzZSBJIGxpa2Ugc21hbGwgcGF0Y2hlcyBhbmQKPiBiZWNhdXNl
IHRoZSBBY2tzIGFuZCBSZXZpZXdzIG9ubHkgYXBwbHkgdG8gdGhlIGluZGl2aWR1YWwgZHJpdmVy
cy4KPiBCdXQgSSBkb24ndCBtaW5kIHNlcmlvdXNseSwgc28gaGVyZSBjb21lcyB0aGUgc2VyaWVz
IHNxdWFzaGVkIGludG8gb25lLgoKRm9yIGFueSBub24gdHJpdmlhbCBjaGFuZ2UsIEkgd291bGQg
ZGVmaW5pdGVseSBkbyB0aGF0IGFzIHdlbGwuCgpUaGUgdGhpbmcgaXMsIGJ5IGNvbGxlY3Rpbmcg
dGhlIHRhZ3Mgd2l0aCBiNCwgeW91IGxvc3QgYWxsIHRoZSBBY2tzIGFuZApSZXZpZXdzIHRhcmdl
dHMsIHdoaWxlIHdlIGNvdWxkIHByZXZlbnQgdGhpcywgc2VlIGJlbG93LgoKPiBXaGlsZSBnb2lu
ZyB0aHJvdWdoIHRoZSBjaGFuZ2VkLCBwcm9iYWJseSB0aGUgczNjMjR4eCBkcml2ZXIgKHdoaWNo
Cj4gaXNuJ3QgZXhhY3RseSBpZGVudGljYWwgdG8gdGhlIG90aGVyIGNoYW5nZXMpIGNvdWxkIGJl
bmVmaXQgZnJvbSBhbgo+IGFkZGl0aW9uYWwgY2hhbmdlIHRocm93aW5nIG91dCB0aGUgZWFybHkg
ZXhpdCAod2hpY2gtLS1JIGd1ZXNzLS0tY2Fubm90Cj4gYmUgaGl0KS4KClllcywgSSBiZWxpZXZl
IHRoZSAnaW5mbyA9PSBOVUxMJyBjb25kaXRpb24gaXMgdXNlbGVzcywgZmVlbCBmcmVlIHRvCmRy
b3AgaXQgaW4gYSBzZWNvbmQgcGF0Y2ggaWYgeW91IHdpc2guCgo+IEJUVywgSSBjb25zdHJ1Y3Rl
ZCB0aGUgbGlzdHMgb2YgYWNrcy9yZXZpZXdzIG15c2VsZiBhbmQgZm91bmQgdGhlIHNhbWUKPiBz
ZXQuIEhvd2V2ZXIgYjQgd2FpbGVkIGFib3V0IGVhY2ggcGF0Y2ggY2xhaW1pbmc6Cj4gCj4gCSAg
ICDinJcgQkFEU0lHOiBES0lNL2luZnJhZGVhZC5vcmcKCk5vIGlkZWEgd2hhdCB0aGlzIG1lYW5z
LCBhbnkgcG9pbnRlcj8KCj4gQW5kIGl0IGRpZG4ndCBsaWtlIHlvdSBwcm9kdWNpbmcgdGhlIHRh
Z3MsIHNheWluZzoKPiAKPiAJTk9URTogc29tZSB0cmFpbGVycyBpZ25vcmVkIGR1ZSB0byBmcm9t
L2VtYWlsIG1pc21hdGNoZXM6Cj4gCSAgICAhIFRyYWlsZXI6IEFja2VkLWJ5OiBSb2dlciBRdWFk
cm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiAJICAgICBNc2cgRnJvbTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAJICAgIFsuLi5dCgpXZWxsLCB5ZXMsIEkgZG9u
J3QgZXhwZWN0IGI0IHRvIHJlYWQgcGxhaW4gZW5nbGlzaCB3aGVuIEkgc2F5ICJJCmNvbGxlY3Rl
ZCB0aGVtIGZvciB5b3UiIF5eIEJ1dCBhdCBsZWFzdCBteSBsaXN0IGhhZCBhICcjIDxhcmVhPicg
c3VmZml4CmZvciBlYWNoIG9mIHRoZSBBY2tlZCBhbmQgUmV2aWV3ZWQgY2hhbmdlcywgd2hpY2gg
aXMgbm93IG1pc3NpbmcuIEkKZG9uJ3Qga25vdyAgaG93IHVzZWZ1bCB0aGV5IGFjdHVhbGx5IGFy
ZSwgYnV0IGl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlCmluZm9ybWF0aW9uIHdhcyBsb3N0IGJldHdl
ZW4gdjEgYW5kIHYyPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
