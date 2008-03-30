Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jfx7j-0000QQ-Jd
	for linux-mtd@lists.infradead.org; Sun, 30 Mar 2008 12:59:00 +0000
Date: Sun, 30 Mar 2008 21:59:37 +0900 (JST)
Message-Id: <20080330.215937.130241438.anemo@mba.ocn.ne.jp>
To: Andrew Victor <andrew@sanpeople.com>
Subject: [PATCH] at91_nand: Make part_probes[] static
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Frank Mandarino <fmandarino@endrelia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The part_probes[] should be static.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Acked-by: Joern Engel <joern@logfs.org>
---
This is a resend of same patch, with (hopefully) better description.

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
