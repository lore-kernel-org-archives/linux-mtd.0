Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E433CAC5B0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7HwqPYqt/lxqByYiXUy2m6DMHrQseSV+cJZHCfcxJ8=; b=O38/TeSPNAg2Rj
	pru1MEIq60FGvsyikcmeiaXPcHcU37Abdh43bDRWGxaUQ2kZg7rthn3PyJ8NpyleO6UrVrj7nc4FX
	ATnYhbRcgQaPhdKTH0ketyKvkAnTwPjfq58RRWjxRtfyW9gwAHWjykCiUUufsOgBli4xCkIQRbwng
	/NAVYA0h9WOOPuUP6UiBfmCfFGbTLUyuDubugBQEVbsnEOXzd+We6B0S5TB06CesA3lQEj34jCAo2
	I4iLtsEH6Ov2eNEqgm0TG/nNgXQwPth7rGIqGRfso5aSnGyrmMl5V6MmMoRH88zhSN5uk7GTbd+9P
	iIJdZbSBqtciPvz7HxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWO-0000000AoPJ-1eze;
	Mon, 22 Sep 2025 15:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWJ-0000000AoJU-2o20
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C481743694;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C545C4CEF7;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555122;
	bh=F/QqHKTdDoP1uBZAZZjnrrOZP/fFFhBzGoiYO8vzUdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGwUgvxIZtJT38NmYLl9PjbwLyElyqNSTIz1Fdp9HXKdVD2eDrzuibq2qz2bI/Q1N
	 rHJstbynpjUW23il3TUbAiCd8ETSiFHwSRb3VKlFyRgVSV18Nuc2RKnEkz3Htmw4qz
	 tagOr2QMpvnmg0qs1VJQcOBlVjQOFdvj6B5qpZfHn6U5GVfITY6byi3YDI5vIpqRDk
	 6TWsr0ZPZS+XBtBVNI2l5FlL5KJYQeenyInL11YD72HicHr4vmbu1m74oYr43RWNk7
	 Lkjh4KGbsy7rSsFhD6FQfK7F9V/iOnyjlzRPrbV4nxhYCHq9qQydjEmjFmEkx3oDyI
	 nN2FrUNsjRfqA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hi-0e4V;
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
Subject: [PATCH 2/8] mtd: onenand: omap2: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:01 +0200
Message-ID: <20250922153107.16381-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083203_763281_63542045 
X-CRM114-Status: GOOD (  10.72  )
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

The driver only supports OF probing since commit a758f50f10cf ("mtd:
onenand: omap2: Configure driver from DT") so drop the unused platform
module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/onenand/onenand_omap2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index f9a386b69050..0793251ada3b 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -603,7 +603,6 @@ static struct platform_driver omap2_onenand_driver = {
 
 module_platform_driver(omap2_onenand_driver);
 
-MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarkko Lavinen <jarkko.lavinen@nokia.com>");
 MODULE_DESCRIPTION("Glue layer for OneNAND flash on OMAP2 / OMAP3");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
