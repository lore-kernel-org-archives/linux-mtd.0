Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdg-0000P2-8S
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:55 +0000
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
Subject: [PATCH 05/31] cachetlb.txt: standardize document format
Date: Thu, 18 May 2017 22:22:10 -0300
Message-Id: <5ec4b6072ac3e17134e3ad1cda3490d5c9e200be.1495156488.git.mchehab@s-opensource.com>
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

- Adjust the title format;
- use :Author: for author's name;
- mark literals as such;
- use note and important notation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/cachetlb.txt | 92 ++++++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/Documentation/cachetlb.txt b/Documentation/cachetlb.txt
index 3f9f808b5119..6eb9d3f090cd 100644
--- a/Documentation/cachetlb.txt
+++ b/Documentation/cachetlb.txt
@@ -1,7 +1,8 @@
-		Cache and TLB Flushing
-		     Under Linux
+==================================
+Cache and TLB Flushing Under Linux
+==================================
 
-	    David S. Miller <davem@redhat.com>
+:Author: David S. Miller <davem@redhat.com>
 
 This document describes the cache/tlb flushing interfaces called
 by the Linux VM subsystem.  It enumerates over each interface,
@@ -28,7 +29,7 @@ Therefore when software page table changes occur, the kernel will
 invoke one of the following flush methods _after_ the page table
 changes occur:
 
-1) void flush_tlb_all(void)
+1) ``void flush_tlb_all(void)``
 
 	The most severe flush of all.  After this interface runs,
 	any previous page table modification whatsoever will be
@@ -37,7 +38,7 @@ changes occur:
 	This is usually invoked when the kernel page tables are
 	changed, since such translations are "global" in nature.
 
-2) void flush_tlb_mm(struct mm_struct *mm)
+2) ``void flush_tlb_mm(struct mm_struct *mm)``
 
 	This interface flushes an entire user address space from
 	the TLB.  After running, this interface must make sure that
@@ -49,8 +50,8 @@ changes occur:
 	page table operations such as what happens during
 	fork, and exec.
 
-3) void flush_tlb_range(struct vm_area_struct *vma,
-			unsigned long start, unsigned long end)
+3) ``void flush_tlb_range(struct vm_area_struct *vma,
+   unsigned long start, unsigned long end)``
 
 	Here we are flushing a specific range of (user) virtual
 	address translations from the TLB.  After running, this
@@ -69,7 +70,7 @@ changes occur:
 	call flush_tlb_page (see below) for each entry which may be
 	modified.
 
-4) void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
+4) ``void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)``
 
 	This time we need to remove the PAGE_SIZE sized translation
 	from the TLB.  The 'vma' is the backing structure used by
@@ -87,8 +88,8 @@ changes occur:
 
 	This is used primarily during fault processing.
 
-5) void update_mmu_cache(struct vm_area_struct *vma,
-			 unsigned long address, pte_t *ptep)
+5) ``void update_mmu_cache(struct vm_area_struct *vma,
+   unsigned long address, pte_t *ptep)``
 
 	At the end of every page fault, this routine is invoked to
 	tell the architecture specific code that a translation
@@ -100,7 +101,7 @@ changes occur:
 	translations for software managed TLB configurations.
 	The sparc64 port currently does this.
 
-6) void tlb_migrate_finish(struct mm_struct *mm)
+6) ``void tlb_migrate_finish(struct mm_struct *mm)``
 
 	This interface is called at the end of an explicit
 	process migration. This interface provides a hook
@@ -112,7 +113,7 @@ changes occur:
 
 Next, we have the cache flushing interfaces.  In general, when Linux
 is changing an existing virtual-->physical mapping to a new value,
-the sequence will be in one of the following forms:
+the sequence will be in one of the following forms::
 
 	1) flush_cache_mm(mm);
 	   change_all_page_tables_of(mm);
@@ -143,7 +144,7 @@ and have no dependency on translation information.
 
 Here are the routines, one by one:
 
-1) void flush_cache_mm(struct mm_struct *mm)
+1) ``void flush_cache_mm(struct mm_struct *mm)``
 
 	This interface flushes an entire user address space from
 	the caches.  That is, after running, there will be no cache
@@ -152,7 +153,7 @@ Here are the routines, one by one:
 	This interface is used to handle whole address space
 	page table operations such as what happens during exit and exec.
 
-2) void flush_cache_dup_mm(struct mm_struct *mm)
+2) ``void flush_cache_dup_mm(struct mm_struct *mm)``
 
 	This interface flushes an entire user address space from
 	the caches.  That is, after running, there will be no cache
@@ -164,8 +165,8 @@ Here are the routines, one by one:
 	This option is separate from flush_cache_mm to allow some
 	optimizations for VIPT caches.
 
-3) void flush_cache_range(struct vm_area_struct *vma,
-			  unsigned long start, unsigned long end)
+3) ``void flush_cache_range(struct vm_area_struct *vma,
+   unsigned long start, unsigned long end)``
 
 	Here we are flushing a specific range of (user) virtual
 	addresses from the cache.  After running, there will be no
@@ -181,7 +182,7 @@ Here are the routines, one by one:
 	call flush_cache_page (see below) for each entry which may be
 	modified.
 
-4) void flush_cache_page(struct vm_area_struct *vma, unsigned long addr, unsigned long pfn)
+4) ``void flush_cache_page(struct vm_area_struct *vma, unsigned long addr, unsigned long pfn)``
 
 	This time we need to remove a PAGE_SIZE sized range
 	from the cache.  The 'vma' is the backing structure used by
@@ -202,7 +203,7 @@ Here are the routines, one by one:
 
 	This is used primarily during fault processing.
 
-5) void flush_cache_kmaps(void)
+5) ``void flush_cache_kmaps(void)``
 
 	This routine need only be implemented if the platform utilizes
 	highmem.  It will be called right before all of the kmaps
@@ -214,8 +215,8 @@ Here are the routines, one by one:
 
 	This routing should be implemented in asm/highmem.h
 
-6) void flush_cache_vmap(unsigned long start, unsigned long end)
-   void flush_cache_vunmap(unsigned long start, unsigned long end)
+6) ``void flush_cache_vmap(unsigned long start, unsigned long end)``
+   ``void flush_cache_vunmap(unsigned long start, unsigned long end)``
 
 	Here in these two interfaces we are flushing a specific range
 	of (kernel) virtual addresses from the cache.  After running,
@@ -243,8 +244,10 @@ size).  This setting will force the SYSv IPC layer to only allow user
 processes to mmap shared memory at address which are a multiple of
 this value.
 
-NOTE: This does not fix shared mmaps, check out the sparc64 port for
-one way to solve this (in particular SPARC_FLAG_MMAPSHARED).
+.. note::
+
+  This does not fix shared mmaps, check out the sparc64 port for
+  one way to solve this (in particular SPARC_FLAG_MMAPSHARED).
 
 Next, you have to solve the D-cache aliasing issue for all
 other cases.  Please keep in mind that fact that, for a given page
@@ -255,8 +258,8 @@ physical page into its address space, by implication the D-cache
 aliasing problem has the potential to exist since the kernel already
 maps this page at its virtual address.
 
-  void copy_user_page(void *to, void *from, unsigned long addr, struct page *page)
-  void clear_user_page(void *to, unsigned long addr, struct page *page)
+  ``void copy_user_page(void *to, void *from, unsigned long addr, struct page *page)``
+  ``void clear_user_page(void *to, unsigned long addr, struct page *page)``
 
 	These two routines store data in user anonymous or COW
 	pages.  It allows a port to efficiently avoid D-cache alias
@@ -276,14 +279,16 @@ maps this page at its virtual address.
 	If D-cache aliasing is not an issue, these two routines may
 	simply call memcpy/memset directly and do nothing more.
 
-  void flush_dcache_page(struct page *page)
+  ``void flush_dcache_page(struct page *page)``
 
 	Any time the kernel writes to a page cache page, _OR_
 	the kernel is about to read from a page cache page and
 	user space shared/writable mappings of this page potentially
 	exist, this routine is called.
 
-	NOTE: This routine need only be called for page cache pages
+	.. note::
+
+	      This routine need only be called for page cache pages
 	      which can potentially ever be mapped into the address
 	      space of a user process.  So for example, VFS layer code
 	      handling vfs symlinks in the page cache need not call
@@ -322,18 +327,19 @@ maps this page at its virtual address.
 	made of this flag bit, and if set the flush is done and the flag
 	bit is cleared.
 
-	IMPORTANT NOTE: It is often important, if you defer the flush,
+	.. important::
+
+			It is often important, if you defer the flush,
 			that the actual flush occurs on the same CPU
 			as did the cpu stores into the page to make it
 			dirty.  Again, see sparc64 for examples of how
 			to deal with this.
 
-  void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
-                         unsigned long user_vaddr,
-                         void *dst, void *src, int len)
-  void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
-                           unsigned long user_vaddr,
-                           void *dst, void *src, int len)
+  ``void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
+  unsigned long user_vaddr, void *dst, void *src, int len)``
+  ``void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
+  unsigned long user_vaddr, void *dst, void *src, int len)``
+
 	When the kernel needs to copy arbitrary data in and out
 	of arbitrary user pages (f.e. for ptrace()) it will use
 	these two routines.
@@ -344,8 +350,9 @@ maps this page at its virtual address.
 	likely that you will need to flush the instruction cache
 	for copy_to_user_page().
 
-  void flush_anon_page(struct vm_area_struct *vma, struct page *page,
-                       unsigned long vmaddr)
+  ``void flush_anon_page(struct vm_area_struct *vma, struct page *page,
+  unsigned long vmaddr)``
+
   	When the kernel needs to access the contents of an anonymous
 	page, it calls this function (currently only
 	get_user_pages()).  Note: flush_dcache_page() deliberately
@@ -354,7 +361,8 @@ maps this page at its virtual address.
 	architectures).  For incoherent architectures, it should flush
 	the cache of the page at vmaddr.
 
-  void flush_kernel_dcache_page(struct page *page)
+  ``void flush_kernel_dcache_page(struct page *page)``
+
 	When the kernel needs to modify a user page is has obtained
 	with kmap, it calls this function after all modifications are
 	complete (but before kunmapping it) to bring the underlying
@@ -366,14 +374,16 @@ maps this page at its virtual address.
 	the kernel cache for page (using page_address(page)).
 
 
-  void flush_icache_range(unsigned long start, unsigned long end)
+  ``void flush_icache_range(unsigned long start, unsigned long end)``
+
   	When the kernel stores into addresses that it will execute
 	out of (eg when loading modules), this function is called.
 
 	If the icache does not snoop stores then this routine will need
 	to flush it.
 
-  void flush_icache_page(struct vm_area_struct *vma, struct page *page)
+  ``void flush_icache_page(struct vm_area_struct *vma, struct page *page)``
+
 	All the functionality of flush_icache_page can be implemented in
 	flush_dcache_page and update_mmu_cache. In the future, the hope
 	is to remove this interface completely.
@@ -387,7 +397,8 @@ the kernel trying to do I/O to vmap areas must manually manage
 coherency.  It must do this by flushing the vmap range before doing
 I/O and invalidating it after the I/O returns.
 
-  void flush_kernel_vmap_range(void *vaddr, int size)
+  ``void flush_kernel_vmap_range(void *vaddr, int size)``
+
        flushes the kernel cache for a given virtual address range in
        the vmap area.  This is to make sure that any data the kernel
        modified in the vmap range is made visible to the physical
@@ -395,7 +406,8 @@ I/O and invalidating it after the I/O returns.
        Note that this API does *not* also flush the offset map alias
        of the area.
 
-  void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates
+  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``
+
        the cache for a given virtual address range in the vmap area
        which prevents the processor from making the cache stale by
        speculatively reading data while the I/O was occurring to the
-- 
2.9.4
