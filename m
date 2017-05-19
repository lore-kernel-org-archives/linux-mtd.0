Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWfG-0007Ip-T0
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:25:20 +0000
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
Subject: [PATCH 23/30] nommu-mmap.txt: don't use all upper case on titles
Date: Thu, 18 May 2017 22:24:15 -0300
Message-Id: <f068ba93984e49dc34905065778cf38a219414d2.1495156975.git.mchehab@s-opensource.com>
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

This file is almost in the standard format we're adopting for
other documentation text files. Yet, it use upper case on
titles.

So, in order to uniform how chapter names, adjust caps on
titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/nommu-mmap.txt | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/nommu-mmap.txt b/Documentation/nommu-mmap.txt
index 39a62ab0f50a..69556f0d494b 100644
--- a/Documentation/nommu-mmap.txt
+++ b/Documentation/nommu-mmap.txt
@@ -1,5 +1,5 @@
 =============================
-NO-MMU MEMORY MAPPING SUPPORT
+No-MMU memory mapping support
 =============================
 
 The kernel has limited support for memory mapping under no-MMU conditions, such
@@ -105,7 +105,7 @@ and it's also much more restricted in the latter case:
 	provide any such support, then the mapping request will be denied.
 
 
-FURTHER NOTES ON NO-MMU MMAP
+Further notes on no-MMU MMAP
 ============================
 
  (#) A request for a private mapping of a file may return a buffer that is not
@@ -160,7 +160,7 @@ FURTHER NOTES ON NO-MMU MMAP
      with character device files, pipes, fifos and sockets.
 
 
-INTERPROCESS SHARED MEMORY
+Interprocess shared memory
 ==========================
 
 Both SYSV IPC SHM shared memory and POSIX shared memory is supported in NOMMU
@@ -168,7 +168,7 @@ mode.  The former through the usual mechanism, the latter through files created
 on ramfs or tmpfs mounts.
 
 
-FUTEXES
+Futexes
 =======
 
 Futexes are supported in NOMMU mode if the arch supports them.  An error will
@@ -177,7 +177,7 @@ mappings made by a process or if the mapping in which the address lies does not
 support futexes (such as an I/O chardev mapping).
 
 
-NO-MMU MREMAP
+No-MMU mremap
 =============
 
 The mremap() function is partially supported.  It may change the size of a
@@ -199,7 +199,7 @@ act on a complete mapping.
 .. [#] Not currently supported.
 
 
-PROVIDING SHAREABLE CHARACTER DEVICE SUPPORT
+Providing shareable character device support
 ============================================
 
 To provide shareable character device support, a driver must provide a
@@ -244,7 +244,7 @@ copy mapped otherwise.
 	circumstances!
 
 
-PROVIDING SHAREABLE MEMORY-BACKED FILE SUPPORT
+Providing shareable memory-backed file support
 ==============================================
 
 Provision of shared mappings on memory backed files is similar to the provision
@@ -261,7 +261,7 @@ Memory backed devices are indicated by the mapping's backing device info having
 the memory_backed flag set.
 
 
-PROVIDING SHAREABLE BLOCK DEVICE SUPPORT
+Providing shareable block device support
 ========================================
 
 Provision of shared mappings on block device files is exactly the same as for
@@ -269,7 +269,7 @@ character devices. If there isn't a real device underneath, then the driver
 should allocate sufficient contiguous memory to honour any supported mapping.
 
 
-ADJUSTING PAGE TRIMMING BEHAVIOUR
+Adjusting page trimming behaviour
 =================================
 
 NOMMU mmap automatically rounds up to the nearest power-of-2 number of pages
-- 
2.9.4
