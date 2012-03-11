Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6r9M-0005Ui-GF
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 22:22:01 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] MTD: Change meaning of -EUCLEAN return code on reads
Date: Sun, 11 Mar 2012 14:21:09 -0700
Message-Id: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
Cc: Ivan Djelic <ivan.djelic@parrot.com>, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patchset addresses the problem of insufficient information being returned
by mtd_read() and mtd_read_oob() with regard to bit error corrections.
Currently -EUCLEAN is returned if one or more bit errors were corrected during
the course of the read operation.  Higher layers like UBI use this return code
as an indication that the erase block may be degrading and should be considered
as a candidate for being marked as a bad block.  The problem is that high bit
error rates are common on more recent NAND flash devices, which these devices
compensate for by using strong ecc algorithms.  Frequent (but entirely normal)
bit error corrections on these devices result in blocks being incorrectly marked
as bad.  On some devices, ubi/ubifs can not be reliably used because of this.

This problem was discussed a while back [1][2][3], and a consensus of sorts was
reached for a solution, which these patches implement.  The recent addition of
the mtd api entry functions now make this solution practical (thanks Artem!).  A
quick description of each patch will provide a synopsis of the patchset:

(1) The element 'ecc_strength' is added to struct mtd_info, which will store the
    maximum number of bit errors that can be corrected in one writesize region.

(2) Drivers set ecc_strength during initialization.

(3) The element 'euclean_threshold' is added to struct mtd_info.  If the driver
    leaves this uninitialized, mtd sets it to ecc_strength when the device or
    partition is registered.  This element is also exposed for reading and
    writing from userspace through sysfs.

(4) The drivers' read methods, absent an error, return a non-negative integer
    indicating the maximum number of bit errors that were corrected in any one
    writesize region.  MTD returns -EUCLEAN if this is >= euclean_threshold, 0
    otherwise.

So basically, the meaning of -EUCLEAN is changed from "one or more bit errors
were corrected over the entire read operation", to "a dangerously high number of
bit errors were corrected on one or more writesize regions".  By default,
"dangerously high" is interpreted as the maximum number of correctible bit
errors per writesize.  Drivers can specify a different value, and the user can
override it if more or less caution regarding data integrity is desired.

Patch #2 touches a lot of files, but they are small changes in most cases.  If
you can verify the correctness of the device's ecc strength, an ACK would be
much appreciated!

And of course general reviews greatly appreciated.  Thanks!

[1] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038755.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038688.html
[3] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038828.html

Mike Dunn (4):
  MTD: add ecc_strength fields to mtd structs
  MTD: flash drivers set ecc strength
  MTD: euclean_threshold added to mtd_info and sysfs
  MTD: drivers return max_bitflips, mtd returns -EUCLEAN

 Documentation/ABI/testing/sysfs-class-mtd |   23 ++++++++++
 drivers/mtd/devices/doc2000.c             |    1 +
 drivers/mtd/devices/doc2001.c             |    1 +
 drivers/mtd/devices/doc2001plus.c         |    1 +
 drivers/mtd/devices/docg3.c               |    5 ++-
 drivers/mtd/mtdcore.c                     |   68 ++++++++++++++++++++++++++++-
 drivers/mtd/mtdpart.c                     |   26 ++++++-----
 drivers/mtd/nand/alauda.c                 |    5 +-
 drivers/mtd/nand/atmel_nand.c             |    1 +
 drivers/mtd/nand/bcm_umi_nand.c           |    8 +++
 drivers/mtd/nand/bf5xx_nand.c             |    2 +
 drivers/mtd/nand/cafe_nand.c              |    1 +
 drivers/mtd/nand/cs553x_nand.c            |    2 +
 drivers/mtd/nand/davinci_nand.c           |    1 +
 drivers/mtd/nand/denali.c                 |    3 +
 drivers/mtd/nand/diskonchip.c             |    1 +
 drivers/mtd/nand/docg4.c                  |    1 +
 drivers/mtd/nand/fsl_elbc_nand.c          |    6 +++
 drivers/mtd/nand/fsmc_nand.c              |    2 +
 drivers/mtd/nand/jz4740_nand.c            |    5 ++
 drivers/mtd/nand/mxc_nand.c               |    7 +++
 drivers/mtd/nand/nand_base.c              |   21 ++++++++-
 drivers/mtd/nand/ndfc.c                   |    1 +
 drivers/mtd/nand/omap2.c                  |    1 +
 drivers/mtd/nand/pxa3xx_nand.c            |    1 +
 drivers/mtd/nand/r852.c                   |    1 +
 drivers/mtd/nand/rtc_from4.c              |    1 +
 drivers/mtd/nand/s3c2410.c                |    1 +
 drivers/mtd/nand/sh_flctl.c               |    1 +
 drivers/mtd/nand/sharpsl.c                |    1 +
 drivers/mtd/nand/tmio_nand.c              |    1 +
 drivers/mtd/nand/txx9ndfmc.c              |    1 +
 drivers/mtd/onenand/onenand_base.c        |    7 ++-
 include/linux/mtd/mtd.h                   |   20 +++++----
 include/linux/mtd/nand.h                  |    2 +
 35 files changed, 200 insertions(+), 30 deletions(-)

-- 
1.7.3.4
