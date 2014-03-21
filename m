Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQy5q-0002Io-O5
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:58:36 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 0/4] mtd: Fix wrong bad block account in ECC stats
Date: Fri, 21 Mar 2014 08:57:40 -0300
Message-Id: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series addresses the wrong bad and bbt block accounting we currently
have in MTD.

Notice that this is a very old issue, probably around since the dawn of time,
and nobody seem to care much about it. However, with the introduction of
the sysfs ECC stats access, it's easier to access this stats and easier to
see the issue.

Currently, a device with eight blocks used for the BBT in the last partition
would show (getting ECC stats from sysfs):

$ cat /sys/class/mtd/mtd2/ecc_stats
       0        0       10        0
       0        0        4        0
       0        0        8        0

The third column is the badblocks field in the ecc_stats structure. The
number of badblocks is obtained for each partition near the end of
allocate_partition(). The partition is scanned for badblocks and this
number is updated. This series fixes this by adding a check for BBT reserved
blocks, showing:

$ cat /sys/class/mtd/mtd2/ecc_stats
       0        0       10        0
       0        0        4        0
       0        0        0        8

The first two patches have already been posted. I'm resending them here for
conveniency.

Ezequiel Garcia (4):
  mtd: Add sysfs attr to expose ECC stats
  mtd: nand: Account the blocks used by the BBT in the ecc_stats
  mtd: Introduce mtd_block_isreserved()
  mtd: Account for BBT blocks when a partition is being allocated

 drivers/mtd/mtdcore.c        | 24 ++++++++++++++++++++++++
 drivers/mtd/mtdpart.c        | 13 ++++++++++++-
 drivers/mtd/nand/nand_base.c |  1 +
 drivers/mtd/nand/nand_bbt.c  | 16 ++++++++++++++++
 include/linux/mtd/mtd.h      |  2 ++
 include/linux/mtd/nand.h     |  1 +
 6 files changed, 56 insertions(+), 1 deletion(-)

-- 
1.9.0
