Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz0KS-0001fS-0e
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 08:42:09 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 3/3] mtd: nand: add support for H27UCG8T2B(16K + 1280)
Date: Fri, 3 Jan 2014 16:08:38 +0800
Message-ID: <1388736518-5934-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1388736518-5934-1-git-send-email-b32955@freescale.com>
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Assume that:
          tmp = ((extid >> 2) & 0x04) | (extid & 0x03));

>From H27UCG8T2B's datasheet, we know that:
   (1) the oob size is 640 when the tmp is 6;
   (2) the oob size got from (1) is just the per 8K oob size.
       the real oob size should be multipled with the ((page size) / 8K).

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2c2f7af..5be3a71 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3245,10 +3245,17 @@ static void nand_parse_hynix(struct mtd_info *mtd, struct nand_chip *chip,
 		case 5:
 			mtd->oobsize = 16;
 			break;
+		case 6:
+			mtd->oobsize = 640;
+			break;
 		default:
 			mtd->oobsize = 640;
 			break;
 		}
+
+		/* See H27UCG8T2B (p.22) */
+		if (mtd->writesize > SZ_8K)
+			mtd->oobsize *= mtd->writesize / SZ_8K;
 	} else {
 		switch (tmp) {
 		case 0:
-- 
1.7.2.rc3
