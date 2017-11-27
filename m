Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJSHB-0001Pl-3Q
 for linux-mtd@lists.infradead.org; Mon, 27 Nov 2017 22:53:23 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990416AbdK0Ww6M3v5y (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 27 Nov 2017 23:52:58 +0100
Date: Mon, 27 Nov 2017 23:52:56 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: onenand: Remove obsolete url from Kconfig help
Message-ID: <20171127225256.GA18990@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Samsung website no longer host information about OneNAND,
delete it.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/mtd/onenand/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index dcae2f6a2b11..aaeb30458139 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -4,8 +4,7 @@ menuconfig MTD_ONENAND
 	depends on HAS_IOMEM
 	help
 	  This enables support for accessing all type of OneNAND flash
-	  devices. For further information see
-	  <http://www.samsung.com/Products/Semiconductor/OneNAND/index.htm>
+	  devices.
 
 if MTD_ONENAND
 
-- 
2.15.0
