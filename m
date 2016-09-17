Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blJrr-000278-Pp
 for linux-mtd@lists.infradead.org; Sat, 17 Sep 2016 17:57:36 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: Kill the OF_MTD Kconfig option
Date: Sat, 17 Sep 2016 19:57:11 +0200
Message-Id: <1474135031-29443-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d48f62b9a0a0 ("mtd: nand: move of_get_nand_xxx() helpers into
nand_base.c") removed the drivers/of/of_mtd.c file but did not remove
the associated OF_MTD Kconfig option.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/of/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index bc07ad30c9bf..ba7b034b2b91 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -90,10 +90,6 @@ config OF_PCI_IRQ
 	help
 	  OpenFirmware PCI IRQ routing helpers
 
-config OF_MTD
-	depends on MTD
-	def_bool y
-
 config OF_RESERVED_MEM
 	depends on OF_EARLY_FLATTREE
 	bool
-- 
2.7.4
