Received: from yuha.menta.net ([212.78.128.42])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHOdC-0002Zx-1L
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 14:27:34 +0000
Received: from gibson.menta.net ([212.78.128.22]) by
          yuha.menta.net (Netscape Messaging Server 4.15) with ESMTP id
          HNVUNL01.5D7 for <linux-mtd@lists.infradead.org>; Wed, 5 Nov
          2003 15:23:45 +0100
Received: from stream.amrsystems.com ([62.57.42.165]) by
          gibson.menta.net (Netscape Messaging Server 4.15 gibson Mar 14
          2002 21:29:48) with ESMTP id HNVUQQ00.TJ3 for
          <linux-mtd@lists.infradead.org>; Wed, 5 Nov 2003 15:25:38 +0100
Received: (from perello@localhost)
	by stream.amrsystems.com (8.11.6/linuxconf) id hA5EYab08484
	for linux-mtd@lists.infradead.org; Wed, 5 Nov 2003 15:34:36 +0100
From: Carles Perello <carles.perello@ieee.org>
To: linux-mtd@lists.infradead.org
Message-Id: <1068042874.6863.4.camel@stream.amrsystems.com>
Mime-Version: 1.0
Date: 05 Nov 2003 15:34:35 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: redboot partition parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Since I downloaded last CVS mtd tree, I am struggling with both 2.4.18
and 2.4.21 kernels to be able to read redboot partitions again...


I do have redboot parser compiled:

CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_REDBOOT_PARTS=y
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

and the flash is correctly probed:

-- SA11xx Flash probe.  Please report results.
* Probing 0x00000000: MSC = 0xfff8 32 bit <6>SA1100-flash: Found 2 x16
devices at 0x0 in 32-bit mode
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
pass
* Probing 0x08000000: MSC = 0x75fe 16 bit <4>genprobe_new_chip called
with unsupported buswidth 2
CFI: Found no SA1100-flash device at location zero
failed
* Probing 0x10000000: MSC = 0x1822 32 bit <4>CFI: Found no SA1100-flash
device at location zero
failed
* Probing 0x18000000: MSC = 0x0011 32 bit wrong type
* Probing 0x40000000: MSC = 0xfffc 16 bit <4>genprobe_new_chip called
with unsupported buswidth 2
CFI: Found no SA1100-flash device at location zero
failed
* Probing 0x48000000: MSC = 0xf71f 16 bit <4>genprobe_new_chip called
with unsupported buswidth 2
CFI: Found no SA1100-flash device at location zero
failed
-- SA11xx Flash probe complete.

and no output form the redboot partition parser...

any hint?

cheers

-- 
Carles Perello <carles.perello@ieee.org>
