Received: from gw-nl5.philips.com ([212.153.235.109] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NDBo-00012W-Oa
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 15:55:04 +0100
Received: from smtpscan-nl3.philips.com (smtpscan-nl3.philips.com
	[130.139.36.23])
	by gw-nl5.philips.com (Postfix) with ESMTP id D769D55BBE
	for <linux-mtd@lists.infradead.org>;
	Tue,  3 Jun 2003 16:55:43 +0200 (MET DST)
Received: from smtprelay-nl2.philips.com (localhost [127.0.0.1])
	ESMTP id QAA01425	for <linux-mtd@lists.infradead.org>;
	Tue, 3 Jun 2003 16:55:43 +0200 (MET DST)
From: nicolas.bellido@philips.com
Received: from hbg001soh.diamond.philips.com (e1soh01.diamond.philips.com
	[130.143.165.45]) ESMTP id QAA23269
	for <linux-mtd@lists.infradead.org>;
	Tue, 3 Jun 2003 16:55:42 +0200 (MEST)
To: <linux-mtd@lists.infradead.org>
Date: Tue, 3 Jun 2003 16:56:20 +0200
Message-ID: <OF1FF7B095.C08BCDCB-ONC1256D3A.00520075@diamond.philips.com>
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: StrataFlash K3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We are working on a custom PXA255 board, with 256K3 flashes from Intel.
The kernel version we use is 2.4.17-rmk5-pxa1, patched with MTD CVS code
from 19 feb.

We experience some problems trying to program the flashes via the
buffered-write method (reading works perfectly).

We tryed a patch from Robert Schwebel, available at
http://www.pengutronix.de/software/linux-arm/linux-2.4.19-rmk7-pxa1-ptx3.diff
(we merged the MTD code from the patch with our kernel version)

When we try that patch, we see the following messages :

waiting for chip to be ready timed out in bufwrite
Write of %zd bytes at 0x0000088b failed. returned 3369884, retlen %zd
waiting for chip to be ready timed out in bufwrite
error: after bufwrite at addr 5f746c (e0021985/c013981c), stat=840084
error: after bufwrite at addr 5f7470 (85f/80981c), stat=840084
error: after bufwrite at addr 5f7474 (11fc7a3b/800080), stat=840084
error: after bufwrite at addr 5f7478 (5ad/800080), stat=840084
error: after bufwrite at addr 5f747c (125/800080), stat=840084
Write of %zd bytes at 0x0000085f failed. returned 3372140, retlen %zd
Not marking the space at 0x0033746c as dirty because the flash driver
returned retlen zero


We did some investigation, and we came to the following patch (against
MTD CVS from 19 feb), and it works well here :

--- linux.orig/drivers/mtd/chips/cfi_cmdset_0001.c    Mon Jun  2 14:11:06 2003
+++ linux/drivers/mtd/chips/cfi_cmdset_0001.c   Mon Jun  2 14:09:01 2003
@@ -1172,6 +1172,10 @@
      z = 0;
      for (;;) {
            cfi_write(map, CMD(0xe8), cmd_adr);
+//NBE
+     /* Write length of data to come */
+     cfi_write(map, CMD(len/CFIDEV_BUSWIDTH-1), cmd_adr );
+//NBE:end

            status = cfi_read(map, cmd_adr);
            if ((status & status_OK) == status_OK)
@@ -1194,9 +1198,10 @@
                  goto out;
            }
      }
-
+//NBE : Moved above
      /* Write length of data to come */
-     cfi_write(map, CMD(len/CFIDEV_BUSWIDTH-1), cmd_adr );
+     //cfi_write(map, CMD(len/CFIDEV_BUSWIDTH-1), cmd_adr );
+//NBE : end

      /* Write data */
      for (z = 0; z < len; z += CFIDEV_BUSWIDTH) {



We are in contact with the Intel representatives and they sent us an
errata for the status bits floating while the chip is busy (Errata #4).

Who has an idea and/or solution to this ?

Regards,

Nicolas.
--
---------------------------------------------------------------------
Nicolas Bellido Y Ortega
Philips TASS Belgium
Tweestationsstraat 80
1070 Brussel
Belgium
---------------------------------------------------------------------
