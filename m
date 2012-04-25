Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Xg-0004G5-Ei
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 19:06:21 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/7] mtd: Change meaning of -EUCLEAN return code on reads
Date: Wed, 25 Apr 2012 12:06:04 -0700
Message-Id: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This v2 of this set includes the following changes:
  - [Patch 4/7]: Propagate bitflip_threshold from master to slave partition.
  - [Patch 5/7]: Zero out max_bitflips outside of if-block in fsl_ifc_nand.
  - [Patch 6/7]: Simplify ecc strength sanity check.

This patchset addresses the problem of insufficient information being returned
by mtd_read() with regard to bit error corrections.  Currently -EUCLEAN is
returned if one or more bit errors were corrected during the course of the read
operation.  Higher layers like UBI use this return code as an indication that
the erase block may be degrading and should be considered as a candidate for
being marked as a bad block.  The problem is that high bit error rates are
common on more recent NAND flash devices with strong ecc algorithms.  Frequent
(but entirely normal) bit error corrections on these devices result in blocks
being incorrectly marked as bad.  On some devices, ubi/ubifs can not be reliably
used because of this.

This problem was discussed a while back [1][2][3], and a consensus of sorts was
reached for a solution, which these patches implement.  The recent addition of
the mtd api entry functions now make this solution practical (thanks Artem!).  A
quick description of each patch will provide a synopsis of the set:

(1) Fix how mtd->ecc_strength is calculated from nand->ecc.strength to reflect
    the fact that granularity is now at ecc step level (the two values are now
    the same).
(2) Fix a couple incorrect nand->ecc.strength values.
(3) Expose mtd->ecc_strength through sysfs (read-only).
(4) mtd->bitflip_threshold is added and exposed as read/write through sysfs.
    The drivers can initialize it, otherwise mtd initializes it to the default
    value of ecc_strength.  Users can change it through sysfs.
(5) The nand driver method _read_page() returns max_bitflips to the nand
    infrastructure code.  This is the maximum number of bitflip corrections that
    were made on any one region comprising an ecc step.
(6) Sanity checks added to nand_scan_tail() to ensure that drivers needing to
    set ecc strength do so.  (This includes all drivers using hardware ecc.)
(7) Absent a hard error, all drivers' mtd->_read() methods now return
    max_bitflips to mtd, and mtd_read() makes the decision of whether to return
    -EUCLEAN or 0. If max_bitflips >= bitflip_threshold, -EUCLEAN is returned.
    If bitflip_threshold == 0 (no ecc), make no comparison and return 0.

Of course reviews greatly appreciated.  Thanks!

P.S. It looks like some of these patches may conflict with others that may be
queued up, so let me know if they need to be reworked.

[1] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038755.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038688.html
[3] http://lists.infradead.org/pipermail/linux-mtd/2011-December/038828.html

Mike Dunn (7):
  mtd; ecc_strength is at ecc step granularity
  mtd: nand: fix incorrect ecc strength values
  mtd: expose ecc_strength through sysfs
  mtd: bitflip threshold added to mtd_info and sysfs
  mtd: nand: read_page() returns max_bitflips
  mtd: nand: sanity checks of ecc strength in nand_scan_tail()
  mtd: driver _read() returns max_bitflips; mtd_read() returns -EUCLEAN

 Documentation/ABI/testing/sysfs-class-mtd |   48 +++++++++++++++
 drivers/mtd/devices/docg3.c               |    4 +-
 drivers/mtd/mtdcore.c                     |   57 +++++++++++++++++-
 drivers/mtd/mtdpart.c                     |   12 ++--
 drivers/mtd/nand/alauda.c                 |    4 +-
 drivers/mtd/nand/atmel_nand.c             |    9 ++-
 drivers/mtd/nand/bcm_umi_bch.c            |    4 +-
 drivers/mtd/nand/bcm_umi_nand.c           |    7 +--
 drivers/mtd/nand/cafe_nand.c              |    4 +-
 drivers/mtd/nand/denali.c                 |   10 ++-
 drivers/mtd/nand/docg4.c                  |    5 +-
 drivers/mtd/nand/fsl_elbc_nand.c          |   21 ++++--
 drivers/mtd/nand/fsl_ifc_nand.c           |   10 +++-
 drivers/mtd/nand/fsmc_nand.c              |    9 ++-
 drivers/mtd/nand/jz4740_nand.c            |    6 +--
 drivers/mtd/nand/nand_base.c              |   95 ++++++++++++++++++++--------
 drivers/mtd/nand/sh_flctl.c               |    2 +-
 drivers/mtd/onenand/onenand_base.c        |    6 +-
 include/linux/mtd/mtd.h                   |   11 +++-
 include/linux/mtd/nand.h                  |    3 +
 20 files changed, 254 insertions(+), 73 deletions(-)

-- 
1.7.3.4
