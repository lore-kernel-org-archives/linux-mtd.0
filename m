Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyO-0004sj-1m
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:19 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 37/46] mtd: nandsim: Turn parts[] into a integer
Date: Wed, 31 Aug 2016 09:28:44 +0200
Message-Id: <20160831072853.27822-38-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

The parts array denotes how many erase blocks each partition
has. Therefore a plain integer can also do it.
If someone shows me a NAND with more than 2^32 erase blocks we can
turn it back into a long. ;)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 4 ++--
 include/linux/mtd/nandsim.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 0176271..584fc72 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -73,7 +73,7 @@ static uint output_cycle   = NANDSIM_OUTPUT_CYCLE;
 static uint input_cycle    = NANDSIM_INPUT_CYCLE;
 static uint bus_width      = NANDSIM_BUS_WIDTH;
 static uint do_delays      = NANDSIM_DO_DELAYS;
-static unsigned long parts[NANDSIM_MAX_PARTS];
+static unsigned int parts[NANDSIM_MAX_PARTS];
 static unsigned int parts_num;
 static char *badblocks = NULL;
 static char *weakblocks = NULL;
@@ -105,7 +105,7 @@ module_param(output_cycle,   uint, 0400);
 module_param(input_cycle,    uint, 0400);
 module_param(bus_width,      uint, 0400);
 module_param(do_delays,      uint, 0400);
-module_param_array(parts, ulong, &parts_num, 0400);
+module_param_array(parts,    uint, &parts_num, 0400);
 module_param(badblocks,      charp, 0400);
 module_param(weakblocks,     charp, 0400);
 module_param(weakpages,      charp, 0400);
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 85d4d7e..61ff5dd 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -12,7 +12,7 @@ struct nandsim_params {
 	unsigned int input_cycle;
 	unsigned int bus_width;
 	unsigned int do_delays;
-	unsigned long *parts;
+	unsigned int *parts;
 	unsigned int parts_num;
 	char *badblocks;
 	char *weakblocks;
-- 
2.8.3
