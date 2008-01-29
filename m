Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JJqYf-0008Eq-Bj
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 13:31:25 +0000
Date: Tue, 29 Jan 2008 22:28:37 +0900 (JST)
Message-Id: <20080129.222837.126141133.anemo@mba.ocn.ne.jp>
To: Andrew Victor <andrew@sanpeople.com>
Subject: [PATCH] at91_nand: Make part_probes[] static
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Frank Mandarino <fmandarino@endrelia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes this sparse warning:

linux/drivers/mtd/nand/at91_nand.c:86:12: warning: symbol 'part_probes' was not declared. Should it be static?

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index b2a5672..9adbf2a 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -83,7 +83,7 @@ static void at91_nand_disable(struct at91_nand_host *host)
 }
 
 #ifdef CONFIG_MTD_PARTITIONS
-const char *part_probes[] = { "cmdlinepart", NULL };
+static const char *part_probes[] = { "cmdlinepart", NULL };
 #endif
 
 /*
