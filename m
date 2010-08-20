Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmXOL-0005yC-EM
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 19:36:44 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: nand: Increase NAND_MAX_OOBSIZE
Date: Fri, 20 Aug 2010 12:36:13 -0700
Message-ID: <1282332973-12077-2-git-send-email-norris@broadcom.com>
In-Reply-To: <1282332973-12077-1-git-send-email-norris@broadcom.com>
References: <1282332973-12077-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An increase in NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE is necessary
in order to support many new chips. Among those:

Toshiba TC58TxG4S2FBAxx  8KB page, 576B OOB
Micron MT29F64G08CBAAA   8KB page, 448B OOB

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 include/linux/mtd/nand.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 102e12c..a8921c2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -53,8 +53,8 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	256
-#define NAND_MAX_PAGESIZE	4096
+#define NAND_MAX_OOBSIZE	576
+#define NAND_MAX_PAGESIZE	8192
 
 /*
  * Constants for hardware specific CLE/ALE/NCE function
-- 
1.7.0.4
