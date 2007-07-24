Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IDJdr-0003hA-Vn
	for linux-mtd@lists.infradead.org; Tue, 24 Jul 2007 08:37:35 -0400
Date: Tue, 24 Jul 2007 13:37:27 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [NAND] s3c2410: fix arch moves
Message-ID: <20070724123727.GA1675@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixup the includes which have been moved around
when changing the s3c24xx arch support.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X linux-2.6.22-git16-moves1/Documentation/dontdiff linux-2.6.22-git16-moves1/drivers/mtd/nand/s3c2410.c linux-2.6.22-git16-moves1-fixups-split-moves2-fixup/drivers/mtd/nand/s3c2410.c
--- linux-2.6.22-git16-moves1/drivers/mtd/nand/s3c2410.c	2007-07-09 23:36:21.000000000 +0100
+++ linux-2.6.22-git16-moves1-fixups-split-moves2-fixup/drivers/mtd/nand/s3c2410.c	2007-07-22 13:49:00.000000000 +0100
@@ -60,8 +60,8 @@
 
 #include <asm/io.h>
 
-#include <asm/arch/regs-nand.h>
-#include <asm/arch/nand.h>
+#include <asm/plat-s3c/regs-nand.h>
+#include <asm/plat-s3c/nand.h>
 
 #ifdef CONFIG_MTD_NAND_S3C2410_HWECC
 static int hardware_ecc = 1;
