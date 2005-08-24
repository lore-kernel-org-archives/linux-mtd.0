Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8c21-0002Gn-Pr
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 07:06:14 -0400
Message-ID: <430C46B4.10406@dev.rtsoft.ru>
Date: Wed, 24 Aug 2005 14:06:44 +0400
From: Dmitry Krivoschokov <dkrivoschokov@dev.rtsoft.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: flash status after unlocking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    Hi all,

it appears that cfi flash unlocking routines always leaves a flash chip 
in status mode (if CONFIG_MTD_XIP is not set).
But in some cases it is desired that the chip remains in read array 
mode, for linear cramfs at least.
So I've added code to put a chip in read array mode after unlocking, see 
patch below (the patch against 2.4 kernel, sorry), tested on OMAP1610. 
The patch is for Intel's command set only,  though it is easy to add the 
fix to others.
If  no complaints for the fix I can test it with the latest kernel and 
submit a patch.

    Thanks,
       Dmitry

diff -upr linux-2.4.orig/drivers/mtd/chips/cfi_cmdset_0001.c 
linux-2.4/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.4.orig/drivers/mtd/chips/cfi_cmdset_0001.c  2005-04-06 
03:01:44.000000000 +0400
+++ linux-2.4/drivers/mtd/chips/cfi_cmdset_0001.c       2005-08-23 
15:31:31.000000000 +0400
@@ -1920,6 +1920,13 @@ static int __xipram do_xxlock_oneblock(s
        /* Done and happy. */
        chip->state = FL_STATUS;
        xip_enable(map, chip, adr);
+
+#ifndef CONFIG_MTD_XIP
+       if (chip->state != FL_POINT && chip->state != FL_READY) {
+               map_write(map, CMD(0xff), adr);
+               chip->state = FL_READY;
+       }
+#endif
        put_chip(map, chip, adr);
        spin_unlock(chip->mutex);
        return 0;
