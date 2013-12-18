Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtJFw-0001KE-NQ
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 15:41:53 +0000
Received: by mail-pd0-f182.google.com with SMTP id v10so8425713pde.27
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 07:41:31 -0800 (PST)
From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 2/2] mtd: gpmi: add sanity check when mapping DMA for
 read_buf/write_buf
Date: Wed, 18 Dec 2013 23:41:00 +0800
Message-Id: <1387381260-11923-2-git-send-email-shijie8@gmail.com>
In-Reply-To: <1387381260-11923-1-git-send-email-shijie8@gmail.com>
References: <1387381260-11923-1-git-send-email-shijie8@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The buffer pointer passed from the upper layer may points to
a buffer in the stack or a buffer allocated by vmalloc, and etc..

This patch adds more sanity check to this buffer.
After this patch, if we meet a buffer which is allocated by vmalloc or
a buffer in the stack, we will use our own DMA buffer @data_buffer_dma
to do the DMA operations. If the buffer is not the cases above, we will
map it for DMA operations directly.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index cee5f81..1908709 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -367,25 +367,28 @@ void prepare_data_dma(struct gpmi_nand_data *this, enum dma_data_direction dr)
 	struct scatterlist *sgl = &this->data_sgl;
 	int ret;
 
-	this->direct_dma_map_ok = true;
-
 	/* first try to map the upper buffer directly */
-	sg_init_one(sgl, this->upper_buf, this->upper_len);
-	ret = dma_map_sg(this->dev, sgl, 1, dr);
-	if (ret == 0) {
-		/* We have to use our own DMA buffer. */
-		sg_init_one(sgl, this->data_buffer_dma, PAGE_SIZE);
-
-		if (dr == DMA_TO_DEVICE)
-			memcpy(this->data_buffer_dma, this->upper_buf,
-				this->upper_len);
-
+	if (virt_addr_valid(this->upper_buf) &&
+		!object_is_on_stack(this->upper_buf)) {
+		sg_init_one(sgl, this->upper_buf, this->upper_len);
 		ret = dma_map_sg(this->dev, sgl, 1, dr);
 		if (ret == 0)
-			dev_err(this->dev, "DMA mapping failed.\n");
+			goto map_fail;
 
-		this->direct_dma_map_ok = false;
+		this->direct_dma_map_ok = true;
+		return;
 	}
+
+map_fail:
+	/* We have to use our own DMA buffer. */
+	sg_init_one(sgl, this->data_buffer_dma, this->upper_len);
+
+	if (dr == DMA_TO_DEVICE)
+		memcpy(this->data_buffer_dma, this->upper_buf, this->upper_len);
+
+	dma_map_sg(this->dev, sgl, 1, dr);
+
+	this->direct_dma_map_ok = false;
 }
 
 /* This will be called after the DMA operation is finished. */
-- 
1.8.3.1
