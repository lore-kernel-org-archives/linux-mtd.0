Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64281EE4993
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WpfBbjca633Qfjg4ku24xmtLh23+pGGS00vs7ID+D4=; b=edjZQyG9mDnbHu
	cjEUE/B6dVeYxCr28LN+wsjgoWQlvrz+ERgqII1DXGjzWhELAv/3idXsXbZvzk/a1zfGi4eEJyquw
	XzcZibCamCfY2ZuEgU+bmcpHf+pAV3dvSvx9ZIq/5v4sSckIovACJ13qMmIrOZ6Ig7FuRCatQNTcA
	S9g8G33eSHxMVSu46YuPMqUXJp4bKUjmDhCdm7ft+RT7S8ombHI5RDVBiN6+hZY4A0UXZL1SuHWjm
	+HgixzYvp11I8Rr8Gw0Y1ZdbVw3EzxN+3ljyWTJmDKBeYMvju8E5MWKM0O3AORzxnDgtlMFdM6lcG
	b01U1uKARU09hwOc7cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznG-00DPdQ-21;
	Mon, 21 Aug 2023 07:57:46 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzn7-00DPYX-0n;
	Mon, 21 Aug 2023 07:57:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD0301C0005;
	Mon, 21 Aug 2023 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mcKt8IDEFBZAch8pCaJAsFnooGm8InpTzIUwhJUPrE0=;
	b=T6Vl1XSXCAZaMLMuPzr/8nIYOwXX1QvQoO+gvjHHOGTUufXkwhUMQTMf0fLeM4fS2r7mXz
	+E+Lmw9WbipQBk6uJycrX2pNqghcErmYAGnjCnqFCQ2ivbiExfKGD2fcxbU7R6Q6zq60Bi
	VAFsV9ya+Rk+JO171MjRWEXrT/xvmeWKklOpVHoBnOIH85O00M0ZQv+4dQEFa9eRTrCKkM
	uLCUAW7AYLfyffu+HsvnRNAjTggHuNT8Dxhf8ld4fznaFh7ZHlEiucGM2NtXg8xTuvtyAA
	3zBkBwe0/zYSvt2fdfBCeifdbKsMQJy6SRM1Ft/3RR38+kFQyqd41H5XTC15Rg==
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
Subject: Re: [PATCH -next v3 12/12] mtd: rawnand: orion: Use helper function devm_clk_get_optional_enabled()
Date: Mon, 21 Aug 2023 09:57:29 +0200
Message-Id: <20230821075729.33115-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-13-lizetao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2c11ea7bee3126f89d0e1b6fec0956b20017ce83'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005737_419006_A895A19B 
X-CRM114-Status: UNSURE (   6.28  )
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

On Mon, 2023-08-21 at 03:17:37 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get_optional() and clk_prepare_enable() can
> now be replaced by devm_clk_get_optional_enabled() when driver enables
> (and possibly prepares) the clocks for the whole lifetime of the device.
> Moreover, it is no longer necessary to unprepare and disable the clocks
> explicitly, so drop the label "no_dev".
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
