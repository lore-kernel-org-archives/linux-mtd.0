Received: from mail-lb0-f173.google.com ([209.85.217.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcDDe-00035j-EG
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 11:16:34 +0000
Received: by mail-lb0-f173.google.com with SMTP id t10so465483lbi.4
 for <linux-mtd@lists.infradead.org>; Tue, 14 May 2013 04:16:12 -0700 (PDT)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5] mtd: nand: pxa3xx: Add support for Read parameter page
 command
Date: Tue, 14 May 2013 08:15:25 -0300
Message-Id: <1368530125-12959-6-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Maen Suleiman <maen@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

This command is required to identify ONFI-compliant devices.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 36780e2..d63d378 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -590,6 +590,16 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 				| addr_cycle;
 		break;
 
+	case NAND_CMD_PARAM:
+		cmd = NAND_CMD_PARAM;
+		info->buf_count = 256;
+		info->ndcb0 |= NDCB0_CMD_TYPE(0)
+				| NDCB0_ADDR_CYC(1)
+				| cmd;
+		info->ndcb1 = (column & 0xFF);
+		info->data_size = 256;
+		break;
+
 	case NAND_CMD_READID:
 		cmd = host->cmdset->read_id;
 		info->buf_count = host->read_id_bytes;
-- 
1.8.1.5
