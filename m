Received: from kynes.gatewest.net ([198.163.227.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b2L5-0002xJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 16:32:59 +0000
Received: from yahweh (h24-66-30-3.wp.shawcable.net [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g1DGi4mD015435
        for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 10:44:04 -0600
Message-ID: <003e01c1b4ad$417d30f0$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: Flash appears to be ROM, readonly.
Date: Wed, 13 Feb 2002 10:41:16 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,
I'm running the mtd_debug.c app, and when I use the
"info" switch, I get the following:

 mtd.type = MTD_ROM
 mtd.flags = MTD_CAP_ROM
 mtd.size = 8388608 (8M)
 mtd.erasesize = 65536 (64K)
 mtd.oobblock = 0
 mtd.oobsize = 0
 mtd.ecctype = MTD_ECC_NONE
 regions = 0

If I try to write or erase a sector, the app immediately
exits as soon as it tries to open the file discriptor 
with O_RDWR flag set.

If I run a "cat /proc/mtd" I get:

 dev:  size     erasesize   name
 mtd0: 00800000 00010000    "flash"
 mtd1: 0000c000 00000010    "SRAM"
 mtd2: 00000080 00010000    "BootROM"


The hardware details are:

CDB89712 (rev B) development board.

Flash TE28F320 B Jedec, not CFI
Will later be using C for final product, which is CFI

Kernel is 2.4.6-rmk1-rayl1, and we also have 2.4.16-rmk2
We can upgrade mtd drivers if necessary.

Thank you,
Derek Ross.
