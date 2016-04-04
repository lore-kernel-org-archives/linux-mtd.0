Received: from mail-db5eur01on0088.outbound.protection.outlook.com
 ([104.47.2.88] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an8WN-0004Uf-6N
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 17:42:41 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: gpmi: fix raw_buffer pointer double free issue
Date: Mon, 4 Apr 2016 12:25:10 -0500
Message-ID: <1459790710-25747-1-git-send-email-han.xu@nxp.com>
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

Signed-off-by: Han Xu <han.xu@nxp.com>
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
