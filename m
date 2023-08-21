Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9546EE4993
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEimTwY6AljO1R+vo9tOdzPQ9cj7gCUJtHDm0OfiPtE=; b=HDvpAugWH3DeJ5
	R34DKbX75x65HpObh6Nh6SpRm73TZWOg3Hro8qk5zFHVGWf1VH0T2be50quDFen6YFFtvATCRpzm2
	myflBGvyCTeh5Oam3nTF9hayUkJ7MTJ90r/hDOTHjb79UadQ+rYpVgJi90vJeDOdP8LYzPLErgVh7
	jypfUPsDF6VWzmMOrsdDm2nukONjZ1ddrPrBhO6+CeAzukF9RwqyEtmZBJViidB0Fa1v4xl+KSn/u
	h0IifWYonjyPUJOyI1/XWmNjlN5JtJrbSIPt1KCbSdv5Y62cvXhQ43ko4kSxYG/WiHEuefSeZ8s5h
	t5LeLDrLp1uYGNmbaKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzoK-00DQS5-2B;
	Mon, 21 Aug 2023 07:58:52 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznj-00DPvJ-1s;
	Mon, 21 Aug 2023 07:58:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8536EFF805;
	Mon, 21 Aug 2023 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csAoFKA3ZksxcuKoRHPmah2BgqsjPGi8FyIZC+1caQQ=;
	b=URLFnUgpGinK9+aLxy0OR1OX6ulERlQKJO9VLjQKDIuDoOLXewnJ58o73OHHUJg6L6gzYj
	jy40J4AUn8P/o7RJ5cgXH2jUXpPRCHZA+R9Jr0aP7FEWcNGb22hIlygQ3LSRI+CCYY6N0d
	1tGJkAlSW18SzOj0ElVNzQNaRLNTfWIdKPpY1LvjqdL+gcjV7kFKJpR26oTljwKNXV5KgI
	vgJRT3IzofSuRv2vAhAsjMA1dBxbR6foJt2M5TnEPitVfHPKbGFuvDnRKfOeMNYWIjAbnE
	y7+XFuAHfwgqzdVyxeO6rxNozrqlFMHrJO7BndOBsozv1Mwq1e64RJCSjeM7UA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>,
	miquel.raynal@bootlin.com
Cc: alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	christophe.kerello@foss.st.com,
	christophe.leroy@csgroup.eu,
	dmitry.torokhov@gmail.com,
	frank.li@vivo.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jinpu.wang@ionos.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michael@walle.cc,
	michal.simek@amd.com,
	paul@crapouillou.net,
	philmd@linaro.org,
	pratyush@kernel.org,
	richard@nod.at,
	robh@kernel.org,
	rogerq@kernel.org,
	samuel@sholland.org,
	stefan@agner.ch,
	tudor.ambarus@linaro.org,
	u.kleine-koenig@pengutronix.de,
	vigneshr@ti.com,
	vz@mleia.com,
	wens@csie.org,
	yangyingliang@huawei.com
Subject: Re: [PATCH -next v3 04/12] mtd: rawnand: intel: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 09:58:03 +0200
Message-Id: <20230821075804.33368-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-5-lizetao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'03f2cde57d86b20dc0f3ddc10f394c00ab77ee02'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005815_791612_8205D6F9 
X-CRM114-Status: UNSURE (   5.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2023-08-21 at 03:17:29 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly, so drop
> the label "err_disable_unprepare_clk".
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
