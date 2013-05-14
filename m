Received: from mail-lb0-f178.google.com ([209.85.217.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcDDZ-00035A-0k
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 11:16:29 +0000
Received: by mail-lb0-f178.google.com with SMTP id p10so459716lbv.23
 for <linux-mtd@lists.infradead.org>; Tue, 14 May 2013 04:16:06 -0700 (PDT)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] mtd: nand: pxa3xx: Add address support for READID command
Date: Tue, 14 May 2013 08:15:24 -0300
Message-Id: <1368530125-12959-5-git-send-email-elezegarcia@gmail.com>
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

This allows to support READID ONFI command which sends 0x20
as address together with the 0x90 READID command.

This is required to detect ONFI compliant devices.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index e4e697f..36780e2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -596,6 +596,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 		info->ndcb0 |= NDCB0_CMD_TYPE(3)
 				| NDCB0_ADDR_CYC(1)
 				| cmd;
+		info->ndcb1 = (column & 0xFF);
 
 		info->data_size = 8;
 		break;
-- 
1.8.1.5
