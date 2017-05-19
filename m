Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWeD-0007Cc-RP
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:08 +0000
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
Subject: [PATCH 31/31] iostats.txt: standardize document format
Date: Thu, 18 May 2017 22:22:36 -0300
Message-Id: <4390b3ca8f9779c95db106605a41d182f6b6b2e7.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- promote main title level;
- mark literal blocks as such;
- Add blank lines to avoid Sphinx errors.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/iostats.txt | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/Documentation/iostats.txt b/Documentation/iostats.txt
index 65f694f2d1c9..456a5b5e0c53 100644
--- a/Documentation/iostats.txt
+++ b/Documentation/iostats.txt
@@ -1,5 +1,6 @@
+=====================
 I/O statistics fields
----------------
+=====================
 
 Since 2.4.20 (and some versions before, with patches), and 2.5.45,
 more extensive disk statistics have been introduced to help measure disk
@@ -16,20 +17,20 @@ is mounted on /sys, although of course it may be mounted anywhere.
 Both /proc/diskstats and sysfs use the same source for the information
 and so should not differ.
 
-Here are examples of these different formats:
+Here are examples of these different formats::
 
-2.4:
-   3     0   39082680 hda 446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
-   3     1    9221278 hda1 35486 0 35496 38030 0 0 0 0 0 38030 38030
+   2.4:
+      3     0   39082680 hda 446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
+      3     1    9221278 hda1 35486 0 35496 38030 0 0 0 0 0 38030 38030
 
 
-2.6 sysfs:
-   446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
-   35486    38030    38030    38030
+   2.6 sysfs:
+      446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
+      35486    38030    38030    38030
 
-2.6 diskstats:
-   3    0   hda 446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
-   3    1   hda1 35486 38030 38030 38030
+   2.6 diskstats:
+      3    0   hda 446216 784926 9550688 4382310 424847 312726 5922052 19310380 0 3376340 23705160
+      3    1   hda1 35486 38030 38030 38030
 
 On 2.4 you might execute "grep 'hda ' /proc/partitions". On 2.6, you have
 a choice of "cat /sys/block/hda/stat" or "grep 'hda ' /proc/diskstats".
@@ -59,30 +60,40 @@ system-wide stats you'll have to find all the devices and sum them all up.
 
 Field  1 -- # of reads completed
     This is the total number of reads completed successfully.
+
 Field  2 -- # of reads merged, field 6 -- # of writes merged
     Reads and writes which are adjacent to each other may be merged for
     efficiency.  Thus two 4K reads may become one 8K read before it is
     ultimately handed to the disk, and so it will be counted (and queued)
     as only one I/O.  This field lets you know how often this was done.
+
 Field  3 -- # of sectors read
     This is the total number of sectors read successfully.
+
 Field  4 -- # of milliseconds spent reading
     This is the total number of milliseconds spent by all reads (as
     measured from __make_request() to end_that_request_last()).
+
 Field  5 -- # of writes completed
     This is the total number of writes completed successfully.
+
 Field  6 -- # of writes merged
     See the description of field 2.
+
 Field  7 -- # of sectors written
     This is the total number of sectors written successfully.
+
 Field  8 -- # of milliseconds spent writing
     This is the total number of milliseconds spent by all writes (as
     measured from __make_request() to end_that_request_last()).
+
 Field  9 -- # of I/Os currently in progress
     The only field that should go to zero. Incremented as requests are
     given to appropriate struct request_queue and decremented as they finish.
+
 Field 10 -- # of milliseconds spent doing I/Os
     This field increases so long as field 9 is nonzero.
+
 Field 11 -- weighted # of milliseconds spent doing I/Os
     This field is incremented at each I/O start, I/O completion, I/O
     merge, or read of these stats by the number of I/Os in progress
@@ -117,11 +128,14 @@ for partitions on 2.6 machines.  This is reflected in the examples above.
 
 Field  1 -- # of reads issued
     This is the total number of reads issued to this partition.
+
 Field  2 -- # of sectors read
     This is the total number of sectors requested to be read from this
     partition.
+
 Field  3 -- # of writes issued
     This is the total number of writes issued to this partition.
+
 Field  4 -- # of sectors written
     This is the total number of sectors requested to be written to
     this partition.
@@ -151,9 +165,9 @@ Additional notes
 
 In 2.6, sysfs is not mounted by default.  If your distribution of
 Linux hasn't added it already, here's the line you'll want to add to
-your /etc/fstab:
+your /etc/fstab::
 
-none /sys sysfs defaults 0 0
+	none /sys sysfs defaults 0 0
 
 
 In 2.6, all disk statistics were removed from /proc/stat.  In 2.4, they
-- 
2.9.4
