Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcXW2-0002WF-Ni
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 08:56:55 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v5 02/11] mtd: increase max OOB size to 744
Date: Wed, 15 May 2013 16:40:25 +0800
Message-ID: <1368607232-2210-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607232-2210-1-git-send-email-b32955@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The oob size of Micron's MT29F64G08CBABAWP is 744 bytes.
So increase the NAND_MAX_OOBSIZE to 744.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 134d470..6f7788a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -56,7 +56,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	640
+#define NAND_MAX_OOBSIZE	744
 #define NAND_MAX_PAGESIZE	8192
 
 /*
-- 
1.7.1
