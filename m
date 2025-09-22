Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13653CAC592
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1AY3XV+W8o3I/ynEPiGkGHadNg56UmtaUlJhYLFt7s=; b=zSlgiFTWcISWCZ
	g34mExlxsR6W/QqjelGjM9XT/IjQi8lWnr8UCOTN6Vl9x6R5aqKCCnA6kIKZxeUd0C8AQ9BCPgiWq
	qYNDy7ianOjV8sNR0FWO19rV/9pHLq26yMI0hNLZ2T3pDMivo6g/rBtbQcuf1V91qobGntMFDbxdo
	2DvgYCNB14QD0o7RmtwuULxigYcaFP8nefET784dSA8MpHsC8oE7nmy2L6M7Rk7tKgp2+107FkUjB
	T0OHM5v6PnrY8DqbYgMq7UevMjZXfrAbfmfAhOmqnIIwrVISw6splMxjThl8o6WnVk1iwb9AoD6rv
	yO9OPBpDUDxzkOMEpNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWL-0000000AoLg-0B1P;
	Mon, 22 Sep 2025 15:32:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWJ-0000000AoJa-2IzG
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5878601D9;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89129C113D0;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555122;
	bh=ddj8UKH4huUFJGE9FKRdTHGDb0ml3M9Cy1EDisYFHSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FrUriq6dOL/U5p1ZoLTASDcX/reFEHmxCrFfd4GeEJ6vo/si7FzS9T//a2p0ZMI+n
	 XthIUEbWDO28X37aAONIIHYiHpGmq92fNuXlrFYu0Fk6wVgyHuZGK/euI5bYIbdZ2Y
	 ZR/DujimGuVWfrd3Bk1oqk5Lq7WlG3MZM6+gaBufmGKC0416lFmhWMpbYdcq3t7t5+
	 /JZGksW3IOgiTjOYeE6v890sYL4m2Q8K3KQDZ/88rpsET52bYLH5uCpgGf6jE92/NU
	 YhFGXIVGPGMIGSEysQWC9f5WrH8o0hJDtVXfBwTG6bnt3gvrhR6imTMsyzOHq4Vo0x
	 xVexMxioj8S3A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hg-0DB6;
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
Subject: [PATCH 1/8] mtd: hyperbus: hbmc-am654: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:00 +0200
Message-ID: <20250922153107.16381-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
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
 drivers/mtd/hyperbus/hbmc-am654.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 82a1e7b7e4d8..9d31464046b2 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -272,5 +272,4 @@ module_platform_driver(am654_hbmc_platform_driver);
 
 MODULE_DESCRIPTION("HBMC driver for AM654 SoC");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:hbmc-am654");
 MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
