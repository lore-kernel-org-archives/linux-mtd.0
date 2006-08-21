Received: from tim.rpsys.net ([194.106.48.114])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GF5lv-0007Os-9R
	for linux-mtd@lists.infradead.org; Mon, 21 Aug 2006 10:08:40 +0100
Subject: [PATCH] [MTD] Protect chip->ops with correct locking - fix jffs2
	corruption
From: Richard Purdie <rpurdie@rpsys.net>
To: Josh Boyer <jwboyer@gmail.com>, Greg KH <greg@kroah.com>
Content-Type: text/plain
Date: Mon, 21 Aug 2006 10:05:10 +0100
Message-Id: <1156151110.5557.33.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read the return value before we release the nand device otherwise the
value can become corrupted by another user of chip->ops, ultimately
resulting in filesystem corruption.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
Acked-by: Josh Boyer <jwboyer@gmail.com>

---

This fixes the jffs2 errors and filesystem corruption I reported. It
should be applied for 2.6.18.

On Sun, 2006-08-20 at 18:35 -0700, Greg KH wrote:
> On Sat, Aug 19, 2006 at 08:34:46PM -0500, Josh Boyer wrote: 
> > We have multiple confirmations that this patch fixes the issue
> > reported.  I agree it should go in 2.6.18.
> > 
> > Greg, can you add this to your tree?
> 
> Add what to what tree?  I need things to be a bit more specific
> here :) 

 drivers/mtd/nand/nand_base.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: git/drivers/mtd/nand/nand_base.c
===================================================================
--- git.orig/drivers/mtd/nand/nand_base.c	2006-08-17 22:46:19.000000000 +0100
+++ git/drivers/mtd/nand/nand_base.c	2006-08-17 22:47:27.000000000 +0100
@@ -1093,9 +1093,10 @@ static int nand_read(struct mtd_info *mt
 
 	ret = nand_do_read_ops(mtd, from, &chip->ops);
 
+	*retlen = chip->ops.retlen;
+
 	nand_release_device(mtd);
 
-	*retlen = chip->ops.retlen;
 	return ret;
 }
 
@@ -1691,9 +1692,10 @@ static int nand_write(struct mtd_info *m
 
 	ret = nand_do_write_ops(mtd, to, &chip->ops);
 
+	*retlen = chip->ops.retlen;
+
 	nand_release_device(mtd);
 
-	*retlen = chip->ops.retlen;
 	return ret;
 }
 
