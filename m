Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnEfM-0007kv-VX
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 22:07:18 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 0/3] mtd: Add sysfs entries and account BBT blocks properly
Date: Wed, 21 May 2014 19:06:10 -0300
Message-Id: <1400709973-7991-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here's a new round of the patchset to add sysfs entries for the ECC stats
struct fields. See the discussion around previous version for context:

http://lists.infradead.org/pipermail/linux-mtd/2014-March/052804.html

Changes from v1:

  * As agreed I've added a sysfs file per field to replace the ecc_stats
    sysfs file. The current proposal follows the "one file per value" sysfs
    rule, adding the following device attributes:
    - corrected_bits (ecc_stats.corrected)
    - uncorrectable_errors (ecc_stats.failed)
    - bad_blocks (ecc_stats.badblocks)
    - bbt_blocks (ecc_stats.bbtblocks)

  * Following Brian's request, added small wrapper nand_block_isreserved()
    that checks if the NAND has a bad block table before querying the number
    of reserved blocks.

  * Finally, this new series drops patch: "nand: Account the blocks used by
    the BBT in the ecc_stats". It's not yet clear how to best deal with the
    current inconsistencies in MTD master and partition handling.

The first patch adds the sysfs entries. The rest of the patches fixes the
bbtblock accounting and allows to keep track of the reserved blocks correctly.

This is a very old issue, probably around since the dawn of time,
and nobody seemed to care much about it. However, with the introduction of
the sysfs access, it's easier to access this stats and easier to
see the issue.

Ezequiel Garcia (3):
  mtd: Add sysfs attributes to expose the ECC stats fields
  mtd: Introduce mtd_block_isreserved()
  mtd: Account for BBT blocks when a partition is being allocated

 drivers/mtd/mtdcore.c        | 60 ++++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/mtdpart.c        | 13 +++++++++-
 drivers/mtd/nand/nand_base.c | 18 +++++++++++++
 drivers/mtd/nand/nand_bbt.c  | 14 +++++++++++
 include/linux/mtd/mtd.h      |  2 ++
 include/linux/mtd/nand.h     |  1 +
 6 files changed, 105 insertions(+), 3 deletions(-)

-- 
1.9.1
