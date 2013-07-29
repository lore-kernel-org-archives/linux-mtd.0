Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3wot-0003Gc-W8
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 23:25:40 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/13] mtd: nand: pxa3xx-nand: Increase data buffer size
Date: Mon, 29 Jul 2013 20:24:22 -0300
Message-Id: <1375140263-2028-13-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, eric.miao@marvell.com,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Devices with 4 KiB pages (plus OOB data) can be detected, so we increase
the data buffer size. A better solution would be to allocate a buffer
depending on the detected page size, but that's not possible given
we need the buffer prior to the device detection.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ccb8636..ed47f14 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -892,7 +892,7 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
  * is: 2048 + 64 = 2112 bytes, allocate a page here for both the
  * data buffer and the DMA descriptor
  */
-#define MAX_BUFF_SIZE	PAGE_SIZE
+#define MAX_BUFF_SIZE	(PAGE_SIZE*2)
 
 #ifdef ARCH_HAS_DMA
 static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
-- 
1.8.1.5
