Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcDDF-00033f-5T
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 11:16:10 +0000
Received: by mail-la0-f50.google.com with SMTP id ed20so379232lab.23
 for <linux-mtd@lists.infradead.org>; Tue, 14 May 2013 04:15:47 -0700 (PDT)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] mtd: nand: pxa3xx: Set info->use_dma properly
Date: Tue, 14 May 2013 08:15:21 -0300
Message-Id: <1368530125-12959-2-git-send-email-elezegarcia@gmail.com>
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

Currently, the variable info->use_dma is never set and always
zero-valued which means the driver never does DMA transfers.
We fix this by simply setting info->use_dma to the module parameter,
also named 'use_dma'. Note that the module parameter has the same name,
but different semantics.

This fixes a regression introduced by the below commit
which removed the info->use_dma variable set.

  commit 4eb2da8994042d68e84e31138788429a102da2ea
  Author: Lei Wen <leiwen@marvell.com>
  Date:   Mon Feb 28 10:32:13 2011 +0800

      mtd: pxa3xx_nand: unify prepare command

Before the above commit, the driver had use_dma=1 on all NAND commands
except on CMD_STATUS. This behavior is long lost and we are not
recovering in this patch, either.

This was spotted and verified only by human inspection. No testing of
any kind has been performed for lack of hardware.

Cc: Lei Wen <leiwen@marvell.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 14d3db5..cef1eeb 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -506,6 +506,7 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	info->buf_count		= 0;
 	info->oob_size		= 0;
 	info->use_ecc		= 0;
+	info->use_dma		= (use_dma) ? 1 : 0;
 	info->is_ready		= 0;
 	info->retcode		= ERR_NONE;
 	if (info->cs != 0)
-- 
1.8.1.5
