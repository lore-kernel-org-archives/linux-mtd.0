Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kwV-0006zD-Dj
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:45:24 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 09/10] mtd: add more information for the MTD_NANDFLASH case
Date: Mon, 12 Aug 2013 13:42:52 +0800
Message-ID: <1376286173-12581-10-git-send-email-b32955@freescale.com>
In-Reply-To: <1376286173-12581-1-git-send-email-b32955@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
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

In mtd_type_show(), the MTD_NANDFLASH case shows "nand".
In actually, the printed information is not accurate enough.
The MTD_NANDFLASH stands for SLC nand now.

This patch adds the SLC information for the MTD_NANDFLASH case.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/mtdcore.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c7cee29..78b8f2e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -149,7 +149,7 @@ static ssize_t mtd_type_show(struct device *dev,
 		type = "nor";
 		break;
 	case MTD_NANDFLASH:
-		type = "nand";
+		type = "SLC nand";
 		break;
 	case MTD_DATAFLASH:
 		type = "dataflash";
-- 
1.7.1
