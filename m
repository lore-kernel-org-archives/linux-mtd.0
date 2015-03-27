Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbZs5-0000T0-D5
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 19:24:46 +0000
Received: by igbqf9 with SMTP id qf9so28677878igb.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 12:24:22 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, Richard Weinberger <richard@nod.at>
Subject: [PATCH v3 0/3] Improve MTD dynamic partitioning support
Date: Fri, 27 Mar 2015 12:24:14 -0700
Message-Id: <1427484257-13708-1-git-send-email-dehrenberg@chromium.org>
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

This patchset has gone through a few iterations, initially based on
using one partition as a stand-in for the master, then adding the
master coexisting, and now in this iteration, bringing back the patch
to remove overlap checks, as testing discovered that the overlap
checks were buggy. This version also makes some style improvements.

Dan Ehrenberg (3):
  mtd: part: Create the master device node when partitioned
  mtd: part: Add sysfs variable for offset of partition
  mtd: part: Remove partition overlap checks

 drivers/mtd/Kconfig   | 13 +++++++++++
 drivers/mtd/mtdcore.c | 52 ++++++++++++++++++++++++++++-------------
 drivers/mtd/mtdpart.c | 64 ++++++++++++++++++++++++++++++++++-----------------
 3 files changed, 92 insertions(+), 37 deletions(-)

-- 
2.2.0.rc0.207.ga3a616c
