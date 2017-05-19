Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWey-00027b-EI
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:25:42 +0000
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
Subject: [PATCH 22/30] nommu-mmap.txt: standardize document format
Date: Thu, 18 May 2017 22:24:14 -0300
Message-Id: <5b7f304fd37968e691fc55365515585838537621.1495156975.git.mchehab@s-opensource.com>
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

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Adjust identation for main title;
- fix level for chapter titles;
- use ".. important::" tag for an important note;
- use the right notation for paragraph auto-numbering "(#)";
- Fix footnotes syntax;
- fix one literal var to use the right ReST tag.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/nommu-mmap.txt | 52 +++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/Documentation/nommu-mmap.txt b/Documentation/nommu-mmap.txt
index ae57b9ea0d41..39a62ab0f50a 100644
--- a/Documentation/nommu-mmap.txt
+++ b/Documentation/nommu-mmap.txt
@@ -1,6 +1,6 @@
-			 =============================
-			 NO-MMU MEMORY MAPPING SUPPORT
-			 =============================
+=============================
+NO-MMU MEMORY MAPPING SUPPORT
+=============================
 
 The kernel has limited support for memory mapping under no-MMU conditions, such
 as are used in uClinux environments. From the userspace point of view, memory
@@ -16,7 +16,7 @@ the CLONE_VM flag.
 The behaviour is similar between the MMU and no-MMU cases, but not identical;
 and it's also much more restricted in the latter case:
 
- (*) Anonymous mapping, MAP_PRIVATE
+ (#) Anonymous mapping, MAP_PRIVATE
 
 	In the MMU case: VM regions backed by arbitrary pages; copy-on-write
 	across fork.
@@ -24,14 +24,14 @@ and it's also much more restricted in the latter case:
 	In the no-MMU case: VM regions backed by arbitrary contiguous runs of
 	pages.
 
- (*) Anonymous mapping, MAP_SHARED
+ (#) Anonymous mapping, MAP_SHARED
 
 	These behave very much like private mappings, except that they're
 	shared across fork() or clone() without CLONE_VM in the MMU case. Since
 	the no-MMU case doesn't support these, behaviour is identical to
 	MAP_PRIVATE there.
 
- (*) File, MAP_PRIVATE, PROT_READ / PROT_EXEC, !PROT_WRITE
+ (#) File, MAP_PRIVATE, PROT_READ / PROT_EXEC, !PROT_WRITE
 
 	In the MMU case: VM regions backed by pages read from file; changes to
 	the underlying file are reflected in the mapping; copied across fork.
@@ -56,7 +56,7 @@ and it's also much more restricted in the latter case:
 	   are visible in other processes (no MMU protection), but should not
 	   happen.
 
- (*) File, MAP_PRIVATE, PROT_READ / PROT_EXEC, PROT_WRITE
+ (#) File, MAP_PRIVATE, PROT_READ / PROT_EXEC, PROT_WRITE
 
 	In the MMU case: like the non-PROT_WRITE case, except that the pages in
 	question get copied before the write actually happens. From that point
@@ -66,7 +66,7 @@ and it's also much more restricted in the latter case:
 	In the no-MMU case: works much like the non-PROT_WRITE case, except
 	that a copy is always taken and never shared.
 
- (*) Regular file / blockdev, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
+ (#) Regular file / blockdev, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
 
 	In the MMU case: VM regions backed by pages read from file; changes to
 	pages written back to file; writes to file reflected into pages backing
@@ -74,7 +74,7 @@ and it's also much more restricted in the latter case:
 
 	In the no-MMU case: not supported.
 
- (*) Memory backed regular file, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
+ (#) Memory backed regular file, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
 
 	In the MMU case: As for ordinary regular files.
 
@@ -85,7 +85,7 @@ and it's also much more restricted in the latter case:
 	as for the MMU case. If the filesystem does not provide any such
 	support, then the mapping request will be denied.
 
- (*) Memory backed blockdev, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
+ (#) Memory backed blockdev, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
 
 	In the MMU case: As for ordinary regular files.
 
@@ -94,7 +94,7 @@ and it's also much more restricted in the latter case:
 	truncate being called. The ramdisk driver could do this if it allocated
 	all its memory as a contiguous array upfront.
 
- (*) Memory backed chardev, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
+ (#) Memory backed chardev, MAP_SHARED, PROT_READ / PROT_EXEC / PROT_WRITE
 
 	In the MMU case: As for ordinary regular files.
 
@@ -105,21 +105,20 @@ and it's also much more restricted in the latter case:
 	provide any such support, then the mapping request will be denied.
 
 
-============================
 FURTHER NOTES ON NO-MMU MMAP
 ============================
 
- (*) A request for a private mapping of a file may return a buffer that is not
+ (#) A request for a private mapping of a file may return a buffer that is not
      page-aligned.  This is because XIP may take place, and the data may not be
      paged aligned in the backing store.
 
- (*) A request for an anonymous mapping will always be page aligned.  If
+ (#) A request for an anonymous mapping will always be page aligned.  If
      possible the size of the request should be a power of two otherwise some
      of the space may be wasted as the kernel must allocate a power-of-2
      granule but will only discard the excess if appropriately configured as
      this has an effect on fragmentation.
 
- (*) The memory allocated by a request for an anonymous mapping will normally
+ (#) The memory allocated by a request for an anonymous mapping will normally
      be cleared by the kernel before being returned in accordance with the
      Linux man pages (ver 2.22 or later).
 
@@ -145,23 +144,22 @@ FURTHER NOTES ON NO-MMU MMAP
      uClibc uses this to speed up malloc(), and the ELF-FDPIC binfmt uses this
      to allocate the brk and stack region.
 
- (*) A list of all the private copy and anonymous mappings on the system is
+ (#) A list of all the private copy and anonymous mappings on the system is
      visible through /proc/maps in no-MMU mode.
 
- (*) A list of all the mappings in use by a process is visible through
+ (#) A list of all the mappings in use by a process is visible through
      /proc/<pid>/maps in no-MMU mode.
 
- (*) Supplying MAP_FIXED or a requesting a particular mapping address will
+ (#) Supplying MAP_FIXED or a requesting a particular mapping address will
      result in an error.
 
- (*) Files mapped privately usually have to have a read method provided by the
+ (#) Files mapped privately usually have to have a read method provided by the
      driver or filesystem so that the contents can be read into the memory
      allocated if mmap() chooses not to map the backing device directly. An
      error will result if they don't. This is most likely to be encountered
      with character device files, pipes, fifos and sockets.
 
 
-==========================
 INTERPROCESS SHARED MEMORY
 ==========================
 
@@ -170,7 +168,6 @@ mode.  The former through the usual mechanism, the latter through files created
 on ramfs or tmpfs mounts.
 
 
-=======
 FUTEXES
 =======
 
@@ -180,12 +177,11 @@ mappings made by a process or if the mapping in which the address lies does not
 support futexes (such as an I/O chardev mapping).
 
 
-=============
 NO-MMU MREMAP
 =============
 
 The mremap() function is partially supported.  It may change the size of a
-mapping, and may move it[*] if MREMAP_MAYMOVE is specified and if the new size
+mapping, and may move it [#]_ if MREMAP_MAYMOVE is specified and if the new size
 of the mapping exceeds the size of the slab object currently occupied by the
 memory to which the mapping refers, or if a smaller slab object could be used.
 
@@ -200,10 +196,9 @@ a previously mapped object.  It may not be used to create holes in existing
 mappings, move parts of existing mappings or resize parts of mappings.  It must
 act on a complete mapping.
 
-[*] Not currently supported.
+.. [#] Not currently supported.
 
 
-============================================
 PROVIDING SHAREABLE CHARACTER DEVICE SUPPORT
 ============================================
 
@@ -235,7 +230,7 @@ direct the call to the device-specific driver. Under such circumstances, the
 mapping request will be rejected if NOMMU_MAP_COPY is not specified, and a
 copy mapped otherwise.
 
-IMPORTANT NOTE:
+.. important::
 
 	Some types of device may present a different appearance to anyone
 	looking at them in certain modes. Flash chips can be like this; for
@@ -249,7 +244,6 @@ IMPORTANT NOTE:
 	circumstances!
 
 
-==============================================
 PROVIDING SHAREABLE MEMORY-BACKED FILE SUPPORT
 ==============================================
 
@@ -267,7 +261,6 @@ Memory backed devices are indicated by the mapping's backing device info having
 the memory_backed flag set.
 
 
-========================================
 PROVIDING SHAREABLE BLOCK DEVICE SUPPORT
 ========================================
 
@@ -276,7 +269,6 @@ character devices. If there isn't a real device underneath, then the driver
 should allocate sufficient contiguous memory to honour any supported mapping.
 
 
-=================================
 ADJUSTING PAGE TRIMMING BEHAVIOUR
 =================================
 
@@ -288,4 +280,4 @@ allocator.  In order to retain finer-grained control over fragmentation, this
 behaviour can either be disabled completely, or bumped up to a higher page
 watermark where trimming begins.
 
-Page trimming behaviour is configurable via the sysctl `vm.nr_trim_pages'.
+Page trimming behaviour is configurable via the sysctl ``vm.nr_trim_pages``.
-- 
2.9.4
