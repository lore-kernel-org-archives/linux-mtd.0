Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0fDJ-0000Eh-BM
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 18:47:42 +0000
Subject: pwrite() to nand in raw mode fails with EINVAL
From: Maxime Bizon <mbizon@freebox.fr>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Date: Tue, 28 Sep 2010 20:47:30 +0200
Message-ID: <1285699650.32420.70.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David.Woodhouse@intel.com
Reply-To: mbizon@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

Since commit 782ce79a45b3b850b108896fcf7da26754061c8f ("cleanup the
nand_do_write_ops"), a pwrite() to a NAND device fails with EINVAL.

The EINVAL comes from here:

        /* Don't allow multipage oob writes with offset */
        if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
                return -EINVAL;


ops->ooboffs seems uninitialized.


I think the following memset() are missing:

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e4def84..731ff36 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -202,6 +202,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		{
 			struct mtd_oob_ops ops;
 
+			memset(&ops, 0, sizeof (ops));
 			ops.mode = MTD_OOB_RAW;
 			ops.datbuf = kbuf;
 			ops.oobbuf = NULL;
@@ -305,6 +306,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 		{
 			struct mtd_oob_ops ops;
 
+			memset(&ops, 0, sizeof (ops));
 			ops.mode = MTD_OOB_RAW;
 			ops.datbuf = kbuf;
 			ops.oobbuf = NULL;



-- 
Maxime
