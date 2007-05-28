Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hskd2-00088l-9y
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 15:11:41 -0400
Date: Mon, 28 May 2007 20:11:37 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cfi_cmdset_0001.c: sparse fixes
Message-ID: <20070528191137.GA4659@fluff.org.uk>
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

Fix sparse warnings generated from cfi_cmdset_0001.c.

drivers/mtd/chips/cfi_cmdset_0001.c:1783:5: warning: symbol 'cfi_intelext_erase_varsize' was not declared. Should it be static?
drivers/mtd/chips/cfi_cmdset_0001.c:2258:43: warning: Using plain integer as NULL pointer

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

--- linux-2.6.22-rc3/drivers/mtd/chips/cfi_cmdset_0001.c	2007-05-27 18:54:21.000000000 +0100
+++ linux-2.6.22-rc3-sparse1/drivers/mtd/chips/cfi_cmdset_0001.c	2007-05-28 20:09:26.000000000 +0100
@@ -1780,7 +1780,7 @@ static int __xipram do_erase_oneblock(st
 	return ret;
 }
 
-int cfi_intelext_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
+static int cfi_intelext_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
 {
 	unsigned long ofs, len;
 	int ret;
@@ -2255,7 +2255,7 @@ static void cfi_intelext_save_locks(stru
 			adr = region->offset + block * len;
 
 			status = cfi_varsize_frob(mtd,
-					do_getlockstatus_oneblock, adr, len, 0);
+					do_getlockstatus_oneblock, adr, len, NULL);
 			if (status)
 				set_bit(block, region->lockmap);
 			else
