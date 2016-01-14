Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJj9P-0001id-OK
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 14:45:27 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 3/3] mtd: onenand: unexport onenand_default_bbt()
Date: Thu, 14 Jan 2016 15:44:51 +0100
Message-Id: <1452782691-5193-3-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The onenand_default_bbt() function is only used by the OneNAND core
and not by drivers, so there is no real need to export
it. Additionally, the corresponding nand_default_bbt() for regular
NANDs is not exported either, so for consistency reasons, this commit
removes the EXPORT_SYMBOL on onenand_default_bbt().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/onenand/onenand_bbt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 5f8d470..680188a 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -247,5 +247,3 @@ int onenand_default_bbt(struct mtd_info *mtd)
 
 	return onenand_scan_bbt(mtd, bbm->badblock_pattern);
 }
-
-EXPORT_SYMBOL(onenand_default_bbt);
-- 
2.6.4
