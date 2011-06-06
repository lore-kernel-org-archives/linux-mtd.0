Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QTaEz-0005eh-30
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:53:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by redbean.intranet.gw-instruments.de (Postfix) with ESMTP id
	2CCF82E45A for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 15:50:58 +0200 (CEST)
Date: Mon, 6 Jun 2011 15:50:58 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] MTD mtdchar: add missing initializer on raw write
Message-ID: <alpine.LSU.2.00.1106061541210.26001@redbean.intranet.gw-instruments.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On writes in MODE_RAW the mtd_oob_ops struct is not sufficiently 
initialized which may cause nandwrite to fail. With this patch
it is possible to write raw nand/oob data without additional ECC
(either for testing or when some sectors need different oob layout
e.g. bootloader) like
nandwrite  -n -r -o  /dev/mtd0 <myfile>

Signed-off-by: Peter Wippich <pewi@gw-instruments.de>

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3f92731..797a34a 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -321,6 +321,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
                         ops.datbuf = kbuf;
                         ops.oobbuf = NULL;
                         ops.len = len;
+                       ops.ooboffs = 0;

                         ret = mtd->write_oob(mtd, *ppos, &ops);
                         retlen = ops.retlen;
