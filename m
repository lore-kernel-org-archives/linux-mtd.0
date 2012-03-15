Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8ERY-0003qp-Po
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 17:26:30 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
Date: Thu, 15 Mar 2012 10:25:50 -0700
Message-Id: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

These are a repost of the last two patches in the patchset of the same name that
was posted the other day, with the addition of patch #1, which is new.  This
version incorporates Artem's comments.  The changes are minimal, but I did test
again.

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
the mtd api entry functions now make this solution practical (thanks Artem!).
These patches are on top of those which added ecc_strength to mtd_info and had
the drivers initialize it.  (Those patches have already been pushed.)  A quick
description of each patch will provide a synopsis of the patchset:

(1) The struct mtd_info element 'ecc_strength' is exposed through sysfs as a
    read-only variable.

(2) The element 'bitflip_threshold' is added to struct mtd_info.  If the driver
    leaves this uninitialized, mtd sets it to ecc_strength when the device or
    partition is registered.  This element is also exposed for reading and
    writing from userspace through sysfs.

(3) The drivers' read methods, absent an error, return a non-negative integer
    indicating the maximum number of bit errors that were corrected in any one
    writesize region.  MTD returns -EUCLEAN if this is >= bitflip_threshold, 0
    otherwise.

So basically, the meaning of -EUCLEAN is changed from "one or more bit errors
were corrected", to "a dangerously high number of bit errors were corrected on
one or more writesize regions".  By default, "dangerously high" is interpreted
as ecc_strength.  Drivers can specify a different value, and the user can
override it if more or less caution regarding data integrity is desired.

Of course reviews greatly appreciated.  Thanks!

[1] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038755.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038688.html
[3] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038828.html


Mike Dunn (3):
  MTD: expose ecc_strength through sysfs
  MTD: bitflip_threshold added to mtd_info and sysfs
  MTD: drivers return max_bitflips, mtd returns -EUCLEAN

 Documentation/ABI/testing/sysfs-class-mtd |   42 +++++++++++++++
 drivers/mtd/devices/docg3.c               |    4 +-
 drivers/mtd/mtdcore.c                     |   78 ++++++++++++++++++++++++++++-
 drivers/mtd/mtdpart.c                     |   25 +++++-----
 drivers/mtd/nand/alauda.c                 |    4 +-
 drivers/mtd/nand/nand_base.c              |   14 +++++-
 drivers/mtd/onenand/onenand_base.c        |    6 ++-
 include/linux/mtd/mtd.h                   |   19 ++++---
 8 files changed, 163 insertions(+), 29 deletions(-)

-- 
1.7.3.4
