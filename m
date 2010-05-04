Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O99iY-0000uR-6R
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 04:26:47 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Mon, 3 May 2010 21:20:04 -0700
Subject: [PATCH] mtd: Increase NAND_MAX_OOBSIZE from 128 to 256
Message-Id: <e511d9573281d8376f800574fac2d72663e2d558@localhost.localdomain>
To: <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND_MAX_OOBSIZE needs to be increased to support newer parts with
218 or 224 byte spare areas.  Tested with Samsung K9GAG08U0D.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 include/linux/mtd/nand.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8bdacb8..50f3aa0 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -53,7 +53,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	128
+#define NAND_MAX_OOBSIZE	256
 #define NAND_MAX_PAGESIZE	4096
 
 /*
-- 
1.6.3.1
