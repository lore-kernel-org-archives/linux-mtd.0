Received: from mail-am1on0094.outbound.protection.outlook.com ([157.56.112.94]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anBaS-0007mk-7x
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 20:59:06 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: gpmi: fix raw_buffer pointer double free issue
Date: Mon, 4 Apr 2016 15:41:29 -0500
Message-ID: <1459802489-30382-1-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix the raw_buffer pointer double free issue found by coverify.

CID 18344 (#2 of 2): Double free (USE_AFTER_FREE)
3. double_free: Calling gpmi_alloc_dma_buffer frees pointer
this->raw_buffer which has already been freed

Signed-off-by: Han Xu <han.xu@nxp.com>
---

changes in v2:
 - add coverity check log
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8122c69..dcb60b0 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -797,6 +797,7 @@ static void gpmi_free_dma_buffer(struct gpmi_nand_data *this)
 
 	this->cmd_buffer	= NULL;
 	this->data_buffer_dma	= NULL;
+	this->raw_buffer	= NULL;
 	this->page_buffer_virt	= NULL;
 	this->page_buffer_size	=  0;
 }
-- 
1.9.1
