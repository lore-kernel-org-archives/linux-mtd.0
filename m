Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1Oab-0001u8-P4
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:19:18 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 13/14] mtd: nand: invalidate cache on unaligned reads
Date: Wed, 7 Sep 2011 13:13:40 -0700
Message-ID: <1315426421-16243-14-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In rare cases, we are given an unaligned parameter `from' in
`nand_do_read_ops()'. In such cases, we use the page cache
(chip->buffers->databuf) as an intermediate buffer before dumping to the
client buffer. However, there are also cases where this buffer is not
cleanly reusable. In those cases, we need to make sure that we
explicitly invalidate the cache.

This patch prevents accidental reusage of the page cache, and for me,
this solves some problems I come across when reading a corrupted BBT
from flash (NAND_BBT_USE_FLASH and NAND_BBT_NO_OOB).

Note: the rare "unaligned" case is a result of the extra BBT pattern +
version located in the data area instead of OOB.

Also, this patch disables caching on raw reads, since we are reading
without error correction. This is, obviously, prone to errors and should
not be cached.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c9767b5..51653d9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1479,14 +1479,22 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
 							  page);
-			if (ret < 0)
+			if (ret < 0) {
+				if (!aligned)
+					/* Invalidate page cache */
+					chip->pagebuf = -1;
 				break;
+			}
 
 			/* Transfer not aligned data */
 			if (!aligned) {
 				if (!NAND_SUBPAGE_READ(chip) && !oob &&
-				    !(mtd->ecc_stats.failed - stats.failed))
+				    !(mtd->ecc_stats.failed - stats.failed) &&
+				    (ops->mode != MTD_OPS_RAW))
 					chip->pagebuf = realpage;
+				else
+					/* Invalidate page cache */
+					chip->pagebuf = -1;
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
 
-- 
1.7.5.4
