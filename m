Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0wB3-0003A8-EP
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 12:54:30 +0000
Received: by bwz19 with SMTP id 19so654907bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 05:54:28 -0700 (PDT)
Subject: Re: pwrite() to nand in raw mode fails with EINVAL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: mbizon@freebox.fr, Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1285699650.32420.70.camel@sakura.staff.proxad.net>
References: <1285699650.32420.70.camel@sakura.staff.proxad.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 15:52:27 +0300
Message-ID: <1285764747.2437.116.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maxime, I've cleaned up comments, added your signed-off-by and cc
stable. Is this OK?

It would also be nice to get an ack from Maxim Levitsky.

From: Maxime Bizon <mbizon@freebox.fr>
Subject: [PATCH] mtd: fix NAND pwrite in raw mode

Since commit 782ce79a45b3b850b108896fcf7da26754061c8f ("cleanup the
nand_do_write_ops") 'pwrite()' to a NAND device fails with '-EINVAL'
which comes from:

        /* Don't allow multipage oob writes with offset */
        if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
                return -EINVAL;

because 'ops->ooboffs' was uninitialized. This patch fixes the issue.

Artem: clean-up comment, add stable.

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
Cc: stable <stable@kernel.org>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdchar.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a825002..39dcb57 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -216,6 +216,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		{
 			struct mtd_oob_ops ops;
 
+			memset(&ops, 0, sizeof (ops));
 			ops.mode = MTD_OOB_RAW;
 			ops.datbuf = kbuf;
 			ops.oobbuf = NULL;
@@ -319,6 +320,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 		{
 			struct mtd_oob_ops ops;
 
+			memset(&ops, 0, sizeof (ops));
 			ops.mode = MTD_OOB_RAW;
 			ops.datbuf = kbuf;
 			ops.oobbuf = NULL;
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
