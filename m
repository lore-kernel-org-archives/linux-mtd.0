Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEFgO-0006EU-19
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2013 09:35:32 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 3/4] mtd: gpmi: scan two nand chips
Date: Tue, 27 Aug 2013 17:29:06 +0800
Message-ID: <1377595747-21033-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1377595747-21033-1-git-send-email-b32955@freescale.com>
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some nand chip has two DIEs in a single chip, such as Micron MT29F32G08QAA.
Each die has its own chip select pin, so this chip acts as two nand
chips.

If we only scan one chip, we may find that we only get 2G for this chip,
but in actually, this chip's size is 4G.

So scan two chips by default.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 24ee8d7..eba7b79 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1676,7 +1676,7 @@ static int gpmi_nfc_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, 1, NULL);
+	ret = nand_scan_ident(mtd, 2, NULL);
 	if (ret)
 		goto err_out;
 
-- 
1.7.1
