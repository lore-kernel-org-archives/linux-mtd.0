Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0005gX-Dk
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:50 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 01/30] iostats.txt: update it to cover recent Kernels
Date: Thu, 18 May 2017 22:23:53 -0300
Message-Id: <9391f94cff236d9653d42b98379c9382f45af3f7.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Everything there that it is said for 2.6 also applies on
current 4.x Kernels. So, update the information there.

While here, use ``foo`` for literals.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/iostats.txt | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/iostats.txt b/Documentation/iostats.txt
index 456a5b5e0c53..04d394a2e06c 100644
--- a/Documentation/iostats.txt
+++ b/Documentation/iostats.txt
@@ -4,17 +4,17 @@ I/O statistics fields
 
 Since 2.4.20 (and some versions before, with patches), and 2.5.45,
 more extensive disk statistics have been introduced to help measure disk
-activity. Tools such as sar and iostat typically interpret these and do
+activity. Tools such as ``sar`` and ``iostat`` typically interpret these and do
 the work for you, but in case you are interested in creating your own
 tools, the fields are explained here.
 
 In 2.4 now, the information is found as additional fields in
-/proc/partitions.  In 2.6, the same information is found in two
-places: one is in the file /proc/diskstats, and the other is within
+``/proc/partitions``.  In 2.6 and upper, the same information is found in two
+places: one is in the file ``/proc/diskstats``, and the other is within
 the sysfs file system, which must be mounted in order to obtain
 the information. Throughout this document we'll assume that sysfs
-is mounted on /sys, although of course it may be mounted anywhere.
-Both /proc/diskstats and sysfs use the same source for the information
+is mounted on ``/sys``, although of course it may be mounted anywhere.
+Both ``/proc/diskstats`` and sysfs use the same source for the information
 and so should not differ.
 
 Here are examples of these different formats::
@@ -23,28 +23,28 @@ Here are examples of these different formats::
       3     0   39082680 hda 446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
       3     1    9221278 hda1 35486 0 35496 38030 0 0 0 0 0 38030 38030
 
-
-   2.6 sysfs:
+   2.6+ sysfs:
       446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
       35486    38030    38030    38030
 
-   2.6 diskstats:
+   2.6+ diskstats:
       3    0   hda 446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
       3    1   hda1 35486 38030 38030 38030
 
-On 2.4 you might execute "grep 'hda ' /proc/partitions". On 2.6, you have
-a choice of "cat /sys/block/hda/stat" or "grep 'hda ' /proc/diskstats".
+On 2.4 you might execute ``grep 'hda ' /proc/partitions``. On 2.6+, you have
+a choice of ``cat /sys/block/hda/stat`` or ``grep 'hda ' /proc/diskstats``.
+
 The advantage of one over the other is that the sysfs choice works well
-if you are watching a known, small set of disks.  /proc/diskstats may
+if you are watching a known, small set of disks.  ``/proc/diskstats`` may
 be a better choice if you are watching a large number of disks because
 you'll avoid the overhead of 50, 100, or 500 or more opens/closes with
 each snapshot of your disk statistics.
 
 In 2.4, the statistics fields are those after the device name. In
 the above example, the first field of statistics would be 446216.
-By contrast, in 2.6 if you look at /sys/block/hda/stat, you'll
+By contrast, in 2.6+ if you look at ``/sys/block/hda/stat``, you'll
 find just the eleven fields, beginning with 446216.  If you look at
-/proc/diskstats, the eleven fields will be preceded by the major and
+``/proc/diskstats``, the eleven fields will be preceded by the major and
 minor device numbers, and device name.  Each of these formats provides
 eleven fields of statistics, each meaning exactly the same things.
 All fields except field 9 are cumulative since boot.  Field 9 should
@@ -108,7 +108,7 @@ introduced when changes collide, so (for instance) adding up all the
 read I/Os issued per partition should equal those made to the disks ...
 but due to the lack of locking it may only be very close.
 
-In 2.6, there are counters for each CPU, which make the lack of locking
+In 2.6+, there are counters for each CPU, which make the lack of locking
 almost a non-issue.  When the statistics are read, the per-CPU counters
 are summed (possibly overflowing the unsigned long variable they are
 summed to) and the result given to the user.  There is no convenient
@@ -117,14 +117,14 @@ user interface for accessing the per-CPU counters themselves.
 Disks vs Partitions
 -------------------
 
-There were significant changes between 2.4 and 2.6 in the I/O subsystem.
+There were significant changes between 2.4 and 2.6+ in the I/O subsystem.
 As a result, some statistic information disappeared. The translation from
 a disk address relative to a partition to the disk address relative to
 the host disk happens much earlier.  All merges and timings now happen
 at the disk level rather than at both the disk and partition level as
-in 2.4.  Consequently, you'll see a different statistics output on 2.6 for
+in 2.4.  Consequently, you'll see a different statistics output on 2.6+ for
 partitions from that for disks.  There are only *four* fields available
-for partitions on 2.6 machines.  This is reflected in the examples above.
+for partitions on 2.6+ machines.  This is reflected in the examples above.
 
 Field  1 -- # of reads issued
     This is the total number of reads issued to this partition.
@@ -163,16 +163,16 @@ to some (probably insignificant) inaccuracy.
 Additional notes
 ----------------
 
-In 2.6, sysfs is not mounted by default.  If your distribution of
+In 2.6+, sysfs is not mounted by default.  If your distribution of
 Linux hasn't added it already, here's the line you'll want to add to
-your /etc/fstab::
+your ``/etc/fstab``::
 
 	none /sys sysfs defaults 0 0
 
 
-In 2.6, all disk statistics were removed from /proc/stat.  In 2.4, they
-appear in both /proc/partitions and /proc/stat, although the ones in
-/proc/stat take a very different format from those in /proc/partitions
+In 2.6+, all disk statistics were removed from ``/proc/stat``.  In 2.4, they
+appear in both ``/proc/partitions`` and ``/proc/stat``, although the ones in
+``/proc/stat`` take a very different format from those in ``/proc/partitions``
 (see proc(5), if your system has it.)
 
 -- ricklind@us.ibm.com
-- 
2.9.4
