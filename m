Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHi3-00023Y-75
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:42:48 +0000
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baiyaowei@cmss.chinamobile.com
Subject: [PATCH 4/5] drivers/mtd: mtd_nand_has_bch can be boolean
Date: Fri, 25 Mar 2016 10:41:54 +0800
Message-Id: <1458873715-3670-5-git-send-email-baiyaowei@cmss.chinamobile.com>
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

This patch makes mtd_nand_has_bch return bool to improve readability
due to this particular function only using either one or zero as its return
value.

No functional change.

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 include/linux/mtd/nand_bch.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand_bch.h b/include/linux/mtd/nand_bch.h
index fb0bc34..8778c79 100644
--- a/include/linux/mtd/nand_bch.h
+++ b/include/linux/mtd/nand_bch.h
@@ -16,7 +16,7 @@ struct nand_bch_control;
 
 #if defined(CONFIG_MTD_NAND_ECC_BCH)
 
-static inline int mtd_nand_has_bch(void) { return 1; }
+static inline bool mtd_nand_has_bch(void) { return true; }
 
 /*
  * Calculate BCH ecc code
@@ -42,7 +42,7 @@ void nand_bch_free(struct nand_bch_control *nbc);
 
 #else /* !CONFIG_MTD_NAND_ECC_BCH */
 
-static inline int mtd_nand_has_bch(void) { return 0; }
+static inline bool mtd_nand_has_bch(void) { return false; }
 
 static inline int
 nand_bch_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
-- 
1.9.1
