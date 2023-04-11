Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399F5C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HCbpDEnTnpjX+8sPp7NoiTP1ZXGVD7bCEAOBeIF3T0=; b=hQ+LPYcCHBPWnb
	f/hPP4CA+1ZOwSYVzWasDdxAv6ocb29kUTnGsS/F1sX0SEHP6OFZIHvmYK6jCUuVxYHBsSXxc2UIc
	yhLufoOwTijxR+SBDtgIkBUQAnz3ncIq+aLcGls4tVc/jjdRos4dXDpXiUeCShY4L1lf+3+MCbnH4
	nMF0/wUTjNIoHGcw/SLYlS4sV8RnwUPBldCF6N59EgOiKzkjuAKiVkncHb2KgIw+xHYlD8+Cl1SUP
	1N4xCg0jTd4M/kgGu6dBaFdlThGeRhhMZSuNRAiOqrTh1q5cBE6SK1/XcEjLZ2Y5GVmllHbQHDDdA
	XD1zH6e3P0OEKfSMOMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEHM-0008ww-06;
	Tue, 11 Apr 2023 13:43:24 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEHG-0008vi-2z;
	Tue, 11 Apr 2023 13:43:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9447D60012;
	Tue, 11 Apr 2023 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681220595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YG/a/d5U809a62Azy9i6h0lXlFjsDlTWJ9pqm8OP5bU=;
	b=hHX8UiCAZtL5szZpK25h+QcFJybRGblg1lJQbRfyMx4JhQP74URDH1PKlY0KtXD3u0AO2m
	+ojA1YL+HugJT1SJVxxR1NYpviqZqbbpow2rLTyNqPi0WoFB5rz7YxXiVuAr4g5gmsiyxL
	8xeH9vyYgmP34C7BrjUOpRtzFxvVV8P2UmIaJD4/UQDa583WTuDsx7Ds98idmyBl2HFpp3
	zvTwQvoQEzuSkPafSJjtVuXbFV4hd7FtG06jKqZ6fcBnTEJrP4zP/9kNobxXCtGcqWgOlE
	Ef+hIJk5W9JQ94A7C/XGwiY1NyrQCIQ80fZuj6vDKRBjxmLd8EqRkNBiqztvTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Valentin Korenblit <vkorenblit@sequans.com>,
	Wang Weiyang <wangweiyang2@huawei.com>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Han Xu <han.xu@nxp.com>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefan Agner <stefan@agner.ch>,
	Lucas Stach <dev@lynxeye.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	=?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3] mtd: nand: Convert to platform remove callback returning void
Date: Tue, 11 Apr 2023 15:43:04 +0200
Message-Id: <20230411134305.445759-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411113816.3472237-1-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ec185b18c22323cb0cde0319fa90b3e467b1ed2d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_064319_227861_A6C5D091 
X-CRM114-Status: GOOD (  13.66  )
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

T24gVHVlLCAyMDIzLTA0LTExIGF0IDExOjM4OjE2IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZv
cm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9y
cyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4g
cmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzICht
b3N0bHkpIGlnbm9yZWQKPiBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBs
ZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEKPiBxdWVzdCB0byBtYWtlIHRoZSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMKPiBxdWVz
dCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFk
eSByZXR1cm5zCj4gdm9pZC4KPiAKPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZlciBmcm9t
IGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2FsbGJhY2sgdG8gdGhlIHZv
aWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gQWNrZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9y
LmFtYmFydXNAbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5m
ZXJyZUBtaWNyb2NoaXAuY29tPiAjIGF0bWVsCj4gUmV2aWV3ZWQtYnk6IFBhdWwgQ2VyY3VlaWwg
PHBhdWxAY3JhcG91aWxsb3UubmV0PiAjIGluZ2VuaWMKPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPiAjIGluZ2VuaWMKPiBBY2tlZC1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4g
IyBpbnRlbAo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVu
c3RpbmdsQGdvb2dsZW1haWwuY29tPiAjIG1lc29uCj4gQWNrZWQtYnk6IFJvZ2VyIFF1YWRyb3Mg
PHJvZ2VycUBrZXJuZWwub3JnPiAjIG9tYXBfZWxtCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+ICMgcmVuZXNhcwo+IFJldmlld2VkLWJ5
OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiAjIHJvY2tjaGlwCj4gQWNrZWQtYnk6
IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+ICMgc3VueGkKPiBBY2tl
ZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4gIyB0ZWdyYQo+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
