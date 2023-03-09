Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB498C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 11:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze8kGU4d3ITGm8w4Jai+4uEaW4rmTZdwYX0rNXyfpxo=; b=1IdIsV32zeGkBJ
	2G7Vosd1NgMvx2wQkzN09W+t1Eq/ty6iNGLjaJBmK0h/4/Ldx4HjKRHqd2hIhf95vgQgIvUEmC5hB
	k062sDQb74JlcmO9/ai8Mx9Hq7/7FmSWzZlRbBfJGYtFNT3OKsvgZkJ3jtJfqP1nPrlQbYKUASXtf
	J8HO/PreJtXTcZgxrmC3wFepiRfg+N0fZlNXZ50NrFuL44rJI5/sxhZNpcXq7EZ/3b2DXm4vCgnvp
	xGOI3c1f0n78YxS48VCWwysZ36fBm42AjFz84H0X1WLHyWp1Jwe/3SOJ/+9FzTDV6DvU9md9I1Sn5
	j3BKTEuajOx08WlSAfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paErn-009hf8-Ug; Thu, 09 Mar 2023 11:55:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEYR-009YtT-2D; Thu, 09 Mar 2023 11:35:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0D53E1C000A;
	Thu,  9 Mar 2023 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678361721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkCJYe4xTl1nq4LBH2Nzf6GB3+OQQsqPo2Fge4ocTUs=;
	b=hiIMPBEnM9/0A6RUHYRZqxFHogmol9ukA6pSF9yyH7WStCrXbZROuFrMCgPWYlCuvRnkhD
	gSVPsluMhNKX56RZrjnI61iTpBTA4waKAQ6JqeRqsvyo/IWOPAl/QL51nSDgAxSyu94yKy
	PIn9wIRH2IZFlmKfSzqKCR71LaKiGkrD/HSgaRQb245/oFmYH13le2EXgsHsrIH75UqLz3
	Z11W3tJOxR+vBh6gHjbD5FbyG6FnNCzR4oHH8uG2wNHJnoqWJ9ZmEH7DlYcnZLCUcl1gLD
	mNnKh0EMvdHeQcM3phRrh+OldNLWfiXLDIRmHeLX33lUlMygrtc3mKklFPVC1A==
Date: Thu, 9 Mar 2023 12:35:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3] nvmem: add explicit config option to read OF fixed
 cells
Message-ID: <20230309123513.43b7134f@xps-13>
In-Reply-To: <20230309112028.19215-1-zajec5@gmail.com>
References: <20230309112028.19215-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_033527_421225_618592BE 
X-CRM114-Status: GOOD (  18.10  )
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

SGkgUmFmYcWCLAoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5o
IGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gaW5kZXggMDI2MmI4NjE5NGViLi5i
M2MxNGNlODdhNjUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gQEAgLTczLDYgKzczLDcg
QEAgc3RydWN0IG52bWVtX2NlbGxfaW5mbyB7Cj4gICAqIEBvd25lcjoJUG9pbnRlciB0byBleHBv
cnRlciBtb2R1bGUuIFVzZWQgZm9yIHJlZmNvdW50aW5nLgo+ICAgKiBAY2VsbHM6CU9wdGlvbmFs
IGFycmF5IG9mIHByZS1kZWZpbmVkIE5WTUVNIGNlbGxzLgo+ICAgKiBAbmNlbGxzOglOdW1iZXIg
b2YgZWxlbWVudHMgaW4gY2VsbHMuCj4gKyAqIEB1c2VfZml4ZWRfb2ZfY2VsbHM6CVJlYWQgZml4
ZWQgTlZNRU0gY2VsbHMgZnJvbSBPRi4KCkknbSBzdGlsbCB1bmhhcHB5IHdpdGggdGhlIG5hbWlu
ZywgZXNwZWNpYWxseSBzaW5jZSB5b3UgZXhwbGFpbmVkIGluCm1vcmUgZGV0YWlscyB0aGUgd2hv
bGUgcGxhbiB3aGljaCBpbnZvbHZlcyB1c2luZyBhIGNvbnRhaW5lciB0byBwdXQKdGhlc2UgZml4
ZWQgY2VsbHMgZnJvbSBub3cgb24uIEluIGJvdGggY2FzZXMgeW91IGV4dHJhY3QgY2VsbHMgZnJv
bQpmaXhlZCBPRiBub2RlcyBidXQgdGhpcyBib29sZWFuIG5lZWRzIHRvIGJlIHNldCB0byB0cnVl
IGluIG9uZQpjYXNlLCBhbmQgZmFsc2UgaW4gdGhlIG90aGVyLCB3aGljaCB3b3VsZCBub3QgbWFr
ZSBzZW5zZS4KCkFsc28sIHJlZ2FyZGluZyB0aGUgYmluZGluZ3MgY2hhbmdlcywgSSdtIGZhaXJs
eSBoYXBweSB3aXRoIHRoZSBpZGVhLApidXQgaWYgd2UgZ28gdGhpcyB3YXkgSSB3b3VsZCBwcmVm
ZXIgYSBmdWxsIHNlcmllcyBpbnN0ZWFkIG9mCmluZGl2aWR1YWwgY2hhbmdlcyB3aXRoOgoKLSB0
aGUgYm9vbGVhbiB5b3UgaW50cm9kdWNlIGhlcmUgKHJlbmFtZWQsIGF0IHRoZSB2ZXJ5IGxlYXN0
KQotIHRoZSBuZXcgYmluZGluZ3MKLSB0aGUgdXBkYXRlIG9mIHRoZSBjdXJyZW50IHByb3ZpZGVy
IGJpbmRpbmdzIHRvIHRha2UgdGhlIG5ldyBiaW5kaW5ncwogIGludG8gYWNjb3VudCBhbmQgZGVw
cmVjYXRlIHRoZSBvbGQgb25lcyBvZmZpY2lhbGx5Ci0gc3VwcG9ydCBmb3IgdGhlIG5ldyBiaW5k
aW5ncyBpbiB0aGUgY29yZQoKPiAgICogQGtlZXBvdXQ6CU9wdGlvbmFsIGFycmF5IG9mIGtlZXBv
dXQgcmFuZ2VzIChzb3J0ZWQgYXNjZW5kaW5nIGJ5IHN0YXJ0KS4KPiAgICogQG5rZWVwb3V0OglO
dW1iZXIgb2YgZWxlbWVudHMgaW4gdGhlIGtlZXBvdXQgYXJyYXkuCj4gICAqIEB0eXBlOglUeXBl
IG9mIHRoZSBudm1lbSBzdG9yYWdlCj4gQEAgLTEwMyw2ICsxMDQsNyBAQCBzdHJ1Y3QgbnZtZW1f
Y29uZmlnIHsKPiAgCXN0cnVjdCBtb2R1bGUJCSpvd25lcjsKPiAgCWNvbnN0IHN0cnVjdCBudm1l
bV9jZWxsX2luZm8JKmNlbGxzOwo+ICAJaW50CQkJbmNlbGxzOwo+ICsJYm9vbAkJCXVzZV9maXhl
ZF9vZl9jZWxsczsKPiAgCWNvbnN0IHN0cnVjdCBudm1lbV9rZWVwb3V0ICprZWVwb3V0Owo+ICAJ
dW5zaWduZWQgaW50CQlua2VlcG91dDsKPiAgCWVudW0gbnZtZW1fdHlwZQkJdHlwZTsKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
