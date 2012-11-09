Received: from asav3.lyse.net ([81.167.37.131])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWoYA-0004ih-G2
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 13:23:11 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by asav3.lyse.net (Postfix) with ESMTP id 1F4CB840EF
 for <linux-mtd@lists.infradead.org>; Fri,  9 Nov 2012 14:23:04 +0100 (CET)
Received: from srv.nordgard-hansen.net (82.79-160-147.customer.lyse.net
 [79.160.147.82]) by asav3.lyse.net (Postfix) with ESMTP id 6C4F08408B
 for <linux-mtd@lists.infradead.org>; Fri,  9 Nov 2012 14:23:03 +0100 (CET)
Received: from srv.nordgard-hansen.net ([192.168.42.5])
 by srv.nordgard-hansen.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhansen@pvv.org>) id 1TWoY4-0002Dv-PI
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 14:23:05 +0100
Message-ID: <509D03B7.3070304@pvv.org>
Date: Fri, 09 Nov 2012 14:23:03 +0100
From: Harald Nordgard-Hansen <hhansen@pvv.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Fix recovery after failed write-buffer operation in cfi_cmdset_0002.c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

When working on a problem with some flash chips that lock up during
write-buffer operations, I think there may be a bug in the linux
handling of chips using cfi_cmdset_0002.c.

The datasheets I have found for a number of these chips all specify that
when aborting a write-buffer command, it is not enough to use the
standard reset.  Rather a "write-to-buffer-reset command" is needed.
This command is quite similar for all chips, the main variance seem to
be if the final 0xF0 can go to any address or must go to addr_unlock1.

The bug is then in the recovery handling when timing out at the end of
do_write_buffer, where using the normal reset command is not sufficient.

Without this change, if the write-buffer command fails then any
following operations on the flash also fail.

The small patch here should apply against just about all kernels I've
seen over the last 5 years, the code has not changed in this area for a
long time...

-Harald Nordgård-Hansen

--------
--- a/drivers/mtd/chips/cfi_cmdset_0002.c      2012-05-21
13:46:28.679794861 +0200
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c      2012-10-30
18:27:49.939109556 +0100
@@ -1536,8 +1536,10 @@
                UDELAY(map, chip, adr, 1);
        }

-       /* reset on all failures. */
-       map_write( map, CMD(0xF0), chip->start );
+       /* write-to-buffer-reset on all failures. */
+       cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
cfi->device_type, NULL);
        xip_enable(map, chip, adr);
        /* FIXME - should have reset delay before continuing */
--------


-- 
Harald Nordgård-Hansen
