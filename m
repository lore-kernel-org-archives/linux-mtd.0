Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D7C76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkD08yUVHfitBGfpZHpElv/DCwxNSSDVx/A3xxvOuYQ=; b=dY6ZgzPLV7jdCA
	ZT+XADcL/f93Q9TJwrVIbvX4xaIeaqA9uV6cNPJnzSXJDmFbAU+Fn2Cvt7pg341LfLLnDEHGSaYnJ
	mR/arMHz+oRQmZ/Ou2Wr1lipEF8LPyzlfHylAzgP5uBntpZkggJBSmHEhJL2mlJizosCBXxiKgMgY
	IRpuiPfCWIw1Uwjmep0sxWsWIlwjLqplNk16uMk1ENEV/jFc+Ev+kYv/n5oIrIxVxs75HFKRvEIur
	JeI+VTOqi1fkHTr9JvSRUvNpu2GOcyB/wkP22wA9OTHKHX7DyYwakfeaSKxrYCSeGAptXFz3uBdq0
	ZfjhcG215dfUCll5m+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhBf-009SBD-13;
	Fri, 07 Apr 2023 08:11:11 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhBZ-009S8w-2Y;
	Fri, 07 Apr 2023 08:11:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D70776000C;
	Fri,  7 Apr 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680855059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k62lE0Z84brwUbN0RTewMQPHSeeiOVUlnJEgkCzQsvo=;
	b=R9CLiy5G5LdE9BO36N204fuspyAxiiF7TmcabLrbwrQPeoEl5Pn0pcw2pa9LFURAj+yhqS
	Ku6ulo+yoPDqo0ywa6hZxIhfMa2hfrKY6oIoCe+v26HM6BlIqcgn8p8u0WJDFU+gYVyAOT
	iWOVTokLobBTMlDhc5L2oqSRq3pJIdqQ+s5IqSFwu1iEWL1rH1J0xX63ZpwsrUgxYtF5VC
	JMA7zniKULdwaW97f/g6p4Ec2AzETlg0EBYuF+OIU67+xs5aqnBUa8bo0FWsfGskdfArda
	sO7wxwa4nSLUU/oHmfv/0zUTbea+upPaTGkKYKQ1Sq0BSBr1Ah5yUIuIzPRbHA==
Date: Fri, 7 Apr 2023 10:10:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Yang Yingliang <yangyingliang@huawei.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Valentin Korenblit
 <vkorenblit@sequans.com>, Wang Weiyang <wangweiyang2@huawei.com>, Pali
 =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Marek =?UTF-8?B?QmVow7pu?=
 <kabel@kernel.org>, Han Xu <han.xu@nxp.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Liang Yang <liang.yang@amlogic.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Phil Edworthy
 <phil.edworthy@renesas.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Roger Quadros <rogerq@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Manivannan Sadhasivam
 <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus
 Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Miaoqian Lin <linmq006@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Jack Wang <jinpu.wang@ionos.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach
 <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Jerome
 Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/49] mtd: nand: Convert to platform remove callback
 returning void
Message-ID: <20230407101043.299f5e22@xps-13>
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_011106_135204_BF8CB17C 
X-CRM114-Status: GOOD (  15.19  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFNhdCwgIDEg
QXByIDIwMjMgMTg6MTg6NDkgKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IHRoaXMgc2VyaWVzIGFkYXB0
cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL210ZC9uYW5kIHRvIHVzZSB0aGUK
PiAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJlZCB0byB0aGUgdHJhZGl0aW9uYWwgLnJl
bW92ZSgpIGNhbGxiYWNrCj4gLnJlbW92ZV9uZXcoKSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlz
IGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2ZXIgY29yZQo+IGRvZXNuJ3QgKGFuZCBjYW5u
b3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBUaGUgb25seSBlZmZlY3Qgb2YgYQo+
IG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMgdGhhdCB0aGUgZHJpdmVyIGNv
cmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUKPiBkZXZpY2UgaXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFu
IGVhcmx5IHJldHVybiBmcm9tIC5yZW1vdmUoKSB1c3VhbGx5IHlpZWxkcyBhCj4gcmVzb3VyY2Ug
bGVhay4KPiAKPiBCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lk
IGRyaXZlciBhdXRob3JzIGNhbm5vdAo+IHJlYXNvbmFibHkgYXNzdW1lIGFueSBtb3JlIHRoYXQg
dGhlcmUgaXMgc29tZSBraW5kIG9mIGNsZWFudXAgbGF0ZXIuCj4gCj4gQXMgYWxsIGRyaXZlcnMg
YWxyZWFkeSByZXR1cm4gMCBpbiB0aGVpciAucmVtb3ZlIGNhbGxiYWNrLCB0aGV5IGNhbiBiZQo+
IGNvbnZlcnRlZCB0cml2aWFsbHkuCgpJJ3ZlIGxvb2tlZCBhdCB0aGUgZGlmZmVyZW50IHBhdGNo
ZXMsIHRoZXkgbG9vayBnb29kIHRvIG1lIGJ1dCBhcyB0aGV5CmFyZSBhbGwgdHJpdmlhbCBhbmQg
ZXhhY3RseSBpZGVudGljYWwsIHdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgdGhpcwphZ2FpbiBhbGwg
c3F1YXNoZWQgaW4gYSBzaW5nbGUgcGF0Y2g/IEEgc3Vic3lzdGVtLXdpZGUgY29udmVyc2lvbiBz
ZWVtcwphcHByb3ByaWF0ZS4gSW4gYWxsIGNhc2VzIEkgcGxhbiB0byB0YWtlIHRoaXMgZm9yIHRo
ZSBuZXh0IG1lcmdlCndpbmRvdy4KCkkndmUgY29sbGVjdGVkIHRoZSB0YWdzIHJlY2VpdmVkIHNv
IGZhciBpZiB5b3Ugd2FudDoKCkFja2VkLWJ5OiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJl
QG1pY3JvY2hpcC5jb20+ICMgYXRtZWwKUmV2aWV3ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxA
Y3JhcG91aWxsb3UubmV0PiAjIGluZ2VuaWMKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4gIyBpbmdlbmljCkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiAjIGludGVsClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPiAjIG1lc29uCkFja2VkLWJ5OiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVs
Lm9yZz4gIyBvbWFwClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPiAjIHJlbmVzYXMKUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlr
b0BzbnRlY2guZGU+ICMgcm9ja2NoaXAKQWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BnbWFpbC5jb20+ICMgc3VueGkKQWNrZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVk
aW5nQG52aWRpYS5jb20+ICMgdGVncmEKCkJUVywgdGhhbmtzIHRvIGFsbCBvZiB5b3Ugd2hvIHJl
dmlld2VkIGFuZCBhbnN3ZXJlZCB0byB0aGlzIHRocmVhZCEKVGhpcyBpcyBoaWdobHkgYXBwcmVj
aWF0ZWQuIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
