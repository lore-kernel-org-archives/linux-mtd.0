Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9eOL-0007oO-FP
	for linux-mtd@lists.infradead.org; Sat, 23 Oct 2010 13:44:14 +0000
Received: by wyf22 with SMTP id 22so1948483wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 23 Oct 2010 06:44:12 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	kyungmin.park@samsung.com, dwmw2@infradead.org, Artem.Bityutskiy@nokia.com,
	adrian.hunter@nokia.com, m.szyprowski@samsung.com
Subject: [PATCH 1/1] mtd: OneNAND: fix bufferram management when chip has
	2-planes.
Date: Sat, 23 Oct 2010 15:43:54 +0200
Message-Id: <1287841434-3349-2-git-send-email-eballetbo@gmail.com>
In-Reply-To: <1287841434-3349-1-git-send-email-eballetbo@gmail.com>
References: <1287841434-3349-1-git-send-email-eballetbo@gmail.com>
Cc: Enric Balletbo i Serra <eballetbo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds code that I think was lost when it was applied the commit
  5988af2319781bc8e0ce418affec4e09cfa77907 - mtd: Flex-OneNAND support

Test case:
 1. Stress a jffs2 filesystem using
    bonnie++ -u 0:0 -s 32 -m 16 -r 16
 2. dmesg shows various 'Header CRC failed' errors like:
    Header CRC failed on REF_PRISTINE node at 0x1e81315c: Read 0x000000e0,
    calculated 0x564fc9e8

Tested on IGEP v2 board with a Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
with 2 planes from Numonyx and CONFIG_MTD_ONENAND_2X_PROGRAM set to y

Signed-off-by: Enric Balletbo i Serra <eballetbo@gmail.com>
---
 drivers/mtd/onenand/onenand_base.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a2bb520..53aa13e 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1964,6 +1964,10 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 
 			/* In partial page write we don't update bufferram */
 			onenand_update_bufferram(mtd, to, !ret && !subpage);
+			ONENAND_SET_BUFFERRAM1(this);
+			onenand_update_bufferram(mtd, to + this->writesize,
+				!ret && !subpage);
+
 			if (ret) {
 				printk(KERN_ERR "%s: write failed %d\n",
 					__func__, ret);
-- 
1.7.1
