Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7Lf-0004Q8-9P
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:29:24 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id B727A6CCA9
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 14:29:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Robert Lippert <roblip@gmail.com>, Robert Lippert <rlippert@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
Date: Mon, 16 Jan 2017 14:27:05 +0100
Message-Id: <1484573225-19095-4-git-send-email-clg@kaod.org>
In-Reply-To: <1484573225-19095-1-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Robert Lippert <roblip@gmail.com>

Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69d4857..775788f9828a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -876,7 +876,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
-- 
2.7.4
