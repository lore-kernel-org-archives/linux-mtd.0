Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C19606A32C
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OcNUX9pr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlH26Vkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/xOPEkMMiyMmxeSN8S8shbNpjnfFyfwURCQdbe2FkSg=; b=OcNUX9prMaU9Tk/vtL+5rK0xt7
	ndUZx0tXxvcNOdu3mJSM1wHqNDXRdfJ22PfwR9VrVcccH3/nxKCybTdXVfoNO4pQe2iegiFeNJq2l
	M2peRaRR3nv5ff17MLLrGDxi+7Ufwa5KW5/SdMJ58t3rP65sKLTDSRxUQ14gndvTCTvlgm5v2R1nT
	O1dUCQXBLZLwzXzKavbH6doXoWmhwECyVcRmp++HQw6QYnDS4IxmSiMTVKBq6PTUZWXDKRqSBTMQU
	mTuJrPmsn2Dl7imSWUlX2CQwWAVHKL6R8LwVfwjQP53J5xeIJf0KZ3XDCZtMq/vrFF+ed9aG7YIMK
	wQU3OgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn2W-0000000FMBa-0ih4;
	Sat, 07 Nov 2026 20:29:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn2T-0000000FMBA-3vvL;
	Sat, 07 Nov 2026 20:29:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C9D2611C9;
	Sat,  7 Nov 2026 20:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E6C1F0089F;
	Sat,  7 Nov 2026 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083364;
	bh=1fsl7JZFQyXxjjK/JE+evV8C5FWEAhsAMXLZmVGmCpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nlH26Vkpn+Lby4qxfU9i9cpb9x2w9zz4rXIYGMpzjWzF7zLTTgjjzQsoKbdqC/qMY
	 JsAu6C9nmcjeWt+JU8qdUIu1jrzXolJzXSsAS6Ld4+LYwxg9XlCpLd8wu3aqmiit+h
	 WVO5XvrNrfHl182Qwyi9aokvmIBN7ntjxnJ1NpsT6svuBWzJKgQqyeEOKi8+dpVRZN
	 jPYRQel82BUr9Y1mxI3J1H39f7Z6b8QT/iOlKSii2jvn+jn41zyBbnHv/Dy3i7tkAC
	 JlXh4bUOZCUfBZrU9g922Ax2Q4SrbfNL6jwGt36BqcuLgKRBeH57gH5rjKC338H/+e
	 rpn/3Nu0pYZBw==
Message-ID: <sashiko-outbox-203286@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Vitaly Wool" <vitalywool@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "Russell King" <rmk+kernel@arm.linux.org.uk>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Mike Rapoport" <rppt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Christophe
 Kerello" <christophe.kerello@st.com>, "Jason Roberts" <jason.e.roberts@intel.com>, "Michal
 Simek" <michal.simek@amd.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Mason
 Yang" <masonccyang@mxic.com.tw>, "Ramuthevar Vadivel Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>, "Heiko Stuebner" <heiko@sntech.de>, "Yifeng
 Zhao" <yifeng.zhao@rock-chips.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Jacky Huang" <ychuang3@nuvoton.com>, "Shan-Chun
 Hung" <schung@nuvoton.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han
 Xu" <han.xu@nxp.com>, "Liang Yang" <liang.yang@amlogic.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Kamal Dasu" <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Harvey Hunt" <harveyhuntnexus@gmail.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, "Michael Walle" <michael@walle.cc>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Tze Yee Ng" <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:29:20 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBvcmlv
bjogbWlzc2luZyBGaXhlcyB0cmFpbGVyIGZvciByZW1vdmFsIFVBRiBmaXgKLS0KCmNvbW1pdCA5
NDY1ZDUxNGY5NDljMjJlNDA2NjNlZjU2NjQxNTNjMDg4M2UxZDU5CkF1dGhvcjogSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cgo+IG10ZDogcmF3bmFuZDogb3Jpb246
IHJldGFpbiBvcGVuLWhhbmRsZSBzdGF0ZSBvbiByZW1vdmFsCj4KPiBLZWVwIGNoaXAgbWV0YWRh
dGEgYW5kIGNvbnRyb2xsZXIgc3RvcmFnZSBhbGl2ZSB1bnRpbCB0aGUgZmluYWwgTVRECj4gcmVm
ZXJlbmNlIGlzIHJlbGVhc2VkLiBVbnJlZ2lzdGVyIGFuZCBkaXNjb25uZWN0IGVhY2ggcHVibGlz
aGVkIGNoaXAKPiBiZWZvcmUgcmVsZWFzaW5nIHRoZSByZXNvdXJjZXMgdXNlZCBieSBpdHMgaGFy
ZHdhcmUgb3BlcmF0aW9ucy4KPgo+IFJldGFpbiB0aGUgZW1iZWRkZWQgY2hpcCBhbmQgaXRzIGNv
cGllZCBuYW1lIHRocm91Z2ggdGhlIHNoYXJlZAo+IGFsbG9jYXRpb24uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCltTZXZlcml0
eTogTG93XQpUaGlzIGZpeGVzIGEgdXNlLWFmdGVyLWZyZWUgd2hlbiB0aGUgZGV2aWNlIGlzIHJl
bW92ZWQgd2hpbGUgTVREIGhhbmRsZXMKcmVtYWluIG9wZW4sIHdoaWNoIGhhcyBiZWVuIHByZXNl
bnQgc2luY2UgdGhlIGRyaXZlciB3YXMgaW50cm9kdWNlZC4KU2hvdWxkIGl0IGluY2x1ZGUgYSBG
aXhlcyB0YWc/CgogIEZpeGVzOiAyYTFkYmEyOTMxZGMgKCJbTVREXSBbTkFORF0gTWFydmVsbCBP
cmlvbiBkZXZpY2UgYnVzIE5BTkQgY29udHJvbGxlciIpCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA3LXN1Ym1pdC1yYXduYW5k
LXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12MS0wLTAxODFlZjBjYzRjOEBnbWFpbC5jb20/
cGFydD0xOQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
