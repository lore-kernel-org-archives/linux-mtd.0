Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5962FCAC5B2
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZychrBlpLclY26P8y4NI1BruEyjS0XKsiNAWWxPXDE=; b=fZAXhAFJkU6DYa
	BAeRkes9yF/8EYbf0qBIER/7wtDYr47113LkaulSk4p75cCCuV70GrFu/SVZctB1BBucx1PoZa6hn
	EmMSPW1kZMr3vWUPvl1wOh5F12NRHncK7d+f8sntEUOCSWeQCzWqhRyeqUBU8wkK/qk4t9TAmhs4N
	CLuFJTu17qztfjiHgp4a6PuR+JDZ2/Y2A5bYl1Xcq5O7ZckAtVqC5+9J4rcQE/o6B6HmR9uDjoLAP
	a40zhG8VJqbQ8Ie9b1m7C7FY93oDRNOeze3+LLL3EnXdl1oLAhdJ6pIcSKi70LfwP1zhDFB5+GVCs
	nCSbkt8sSMaPDvfPeOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWP-0000000AoPp-0Epk;
	Mon, 22 Sep 2025 15:32:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWJ-0000000AoK7-3Aaf
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0791044EAE;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB861C19424;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555122;
	bh=SfaFrl4QZz0bkddp7YAsKSPz8h9hoenE26+Qxca49Cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSPOkrAwxVhlLva+kII+0FJHAR0eNKTqECqic4+PAVCuE4eqk7ooafrFxWCnltglU
	 tMVsBTMGWAYkbapenkNHfeZef6UQJhu2w300uk+hEmCwGfxv2VXzbueMe1++4EU1Px
	 QFw1Kx4f25xVrmUEGsvK0AvqiENk5Lzj86gODINbeNV+hb3JkXkquSeEm1khf5usU8
	 mmiIyMuF3/0eK8PmV1veEFGDj16Z3md+IUbWyjj8YwWsW56B/NTPK4oDL6cyGsDW7e
	 qXvWEvsp6CCFAAsViFmxyybQrX0hvXH5w54S5sH+7L4ILJcPbC7Sa34uqFF+ywT5Ql
	 7Ir4Ztfd20jBg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hp-1rny;
	Mon, 22 Sep 2025 17:31:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/8] mtd: rawnand: pl353: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:04 +0200
Message-ID: <20250922153107.16381-6-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083203_834018_531F13C6 
X-CRM114-Status: UNSURE (   9.77  )
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

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 09440ed4652e..a7dc45c7f214 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1193,6 +1193,5 @@ static struct platform_driver pl35x_nandc_driver = {
 module_platform_driver(pl35x_nandc_driver);
 
 MODULE_AUTHOR("Xilinx, Inc.");
-MODULE_ALIAS("platform:" PL35X_NANDC_DRIVER_NAME);
 MODULE_DESCRIPTION("ARM PL35X NAND controller driver");
 MODULE_LICENSE("GPL");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
