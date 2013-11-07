Received: from mail-db9lp0248.outbound.messaging.microsoft.com
 ([213.199.154.248] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeMVH-0002nX-Lp
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 10:07:56 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: gpmi: only scan two chips for imx6
Date: Thu, 7 Nov 2013 17:46:37 +0800
Message-ID: <1383817597-31992-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1383817597-31992-1-git-send-email-b32955@freescale.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: festevam@gmail.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We cannot scan two chips for imx23 and imx28:
  imx23: the Ready-Busy1 line is not connected for some board.
  imx28: we do not set the pinctrl for Ready-Busy1

So we only scan two chips for imx6.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index d34cc54..00ea9c4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1675,7 +1675,7 @@ static int gpmi_nfc_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, 2, NULL);
+	ret = nand_scan_ident(mtd, GPMI_IS_MX6Q(this) ? 2 : 1, NULL);
 	if (ret)
 		goto err_out;
 
-- 
1.7.2.rc3
