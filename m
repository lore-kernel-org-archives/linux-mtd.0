Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdnOn-00028K-7h
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 22:15:42 +0000
Received: by iebmp1 with SMTP id mp1so72822275ieb.0
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 15:15:17 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 0/3]  Improve MTD dynamic partitioning support
Date: Thu,  2 Apr 2015 15:15:09 -0700
Message-Id: <1428012912-17551-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The goal of this patchset is to make mtd dynamic partitioning work
better.
- First, a new config option is added to allow the master device to
  coexist with partitions, which allows partitions to be created or
  removed based on the master even if other partitions exist.
- Second, to identify partitions and improve visibility, 
- Third, remove overlap checks for partitions, which had a bug
  in them and don't seem necessary since static partitions don't
  have overlap checks.

This patchset has gone through a few iterations.

v1 is based on a different concept, where a separate partition is
used as a master, and partitioning is simply made more flexible.

v2 switched to the model of the master coexisting with the partitions.

v3 brings back the patch to remove overlap checks, as testing
discovered that the overlap checks were buggy. This version
also makes some style improvements.

v4 fixes some style issues in the sysfs patch and adds documentation.

v5 cleans up some unused code in the third patch.

Dan Ehrenberg (3):
  mtd: part: Create the master device node when partitioned
  mtd: part: Add sysfs variable for offset of partition
  mtd: part: Remove partition overlap checks

 Documentation/ABI/testing/sysfs-class-mtd | 10 +++++
 drivers/mtd/Kconfig                       | 13 ++++++
 drivers/mtd/mtdcore.c                     | 52 +++++++++++++++--------
 drivers/mtd/mtdpart.c                     | 68 +++++++++++++++++++------------
 4 files changed, 102 insertions(+), 41 deletions(-)

-- 
2.2.0.rc0.207.ga3a616c
