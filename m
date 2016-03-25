Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHi0-00023d-0H
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:42:47 +0000
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baiyaowei@cmss.chinamobile.com
Subject: [PATCH 5/5] drivers/mtd/nand: nand_opcode_8bits can be boolean
Date: Fri, 25 Mar 2016 10:41:55 +0800
Message-Id: <1458873715-3670-6-git-send-email-baiyaowei@cmss.chinamobile.com>
In-Reply-To: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes nand_opcode_8bits return bool due to this
particular function only using either one or zero as its return
value.

No functional change.

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 include/linux/mtd/nand.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index bdd68e2..dd79eae 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -989,18 +989,18 @@ static inline bool nand_is_slc(struct nand_chip *chip)
  * Check if the opcode's address should be sent only on the lower 8 bits
  * @command: opcode to check
  */
-static inline int nand_opcode_8bits(unsigned int command)
+static inline bool nand_opcode_8bits(unsigned int command)
 {
 	switch (command) {
 	case NAND_CMD_READID:
 	case NAND_CMD_PARAM:
 	case NAND_CMD_GET_FEATURES:
 	case NAND_CMD_SET_FEATURES:
-		return 1;
+		return true;
 	default:
 		break;
 	}
-	return 0;
+	return false;
 }
 
 /* return the supported JEDEC features. */
-- 
1.9.1
