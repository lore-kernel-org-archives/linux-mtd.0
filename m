Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfTvB-0002DX-0T
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 12:47:33 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: [PATCH] mtd: denali: disable usage of subpages
Date: Wed, 30 Apr 2014 14:46:41 +0200
Message-Id: <1398862001-29785-1-git-send-email-bigeasy@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Josh Triplett <josh@joshtriplett.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use this driver on an Altera SoC (not MRST) and its ECC algorithm
does not compute 0xff ECC of an empty page. That problem can be easily
noticed if ubifs is used. Therefore I disable subpages support.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
I can't test if this is also the case for MRST or not.

 drivers/mtd/nand/denali.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c07cd57..44f2c8b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1524,6 +1524,8 @@ int denali_init(struct denali_nand_info *denali)
 	denali->nand.options |= NAND_SKIP_BBTSCAN;
 	denali->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
 
+	denali->nand.options |= NAND_NO_SUBPAGE_WRITE;
+
 	/* Denali Controller only support 15bit and 8bit ECC in MRST,
 	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
 	 * SLC if possible.
-- 
1.9.2
