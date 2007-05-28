Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HskQr-0007pf-LR
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 14:59:09 -0400
Date: Mon, 28 May 2007 19:59:00 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cfi_cmdset_0002.c: fix 'cfi_amdstd_erase_varsize' to be static
Message-ID: <20070528185900.GA2328@fluff.org.uk>
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

Make cfi_amdstd_erase_varsize static, as declared at the top
of the file to ensure sparse does not print a warning for an
undeclared function, as so:

drivers/mtd/chips/cfi_cmdset_0002.c:1612:5: warning: symbol 'cfi_amdstd_erase_varsize' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X linux-2.6.22-rc3/Documentation/dontdiff linux-2.6.22-rc3/drivers/mtd/chips/cfi_cmdset_0002.c linux-2.6.22-rc3-sparse1/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.6.22-rc3/drivers/mtd/chips/cfi_cmdset_0002.c	2007-04-26 04:08:32.000000000 +0100
+++ linux-2.6.22-rc3-sparse1/drivers/mtd/chips/cfi_cmdset_0002.c	2007-05-28 19:56:36.000000000 +0100
@@ -1609,7 +1609,7 @@ static int __xipram do_erase_oneblock(st
 }
 
 
-int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
+static int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
 {
 	unsigned long ofs, len;
 	int ret;
