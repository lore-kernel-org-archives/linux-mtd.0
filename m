Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWe2-0005db-TW
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:57 +0000
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
Subject: [PATCH 15/31] DMA-API-HOWTO.txt: standardize document format
Date: Thu, 18 May 2017 22:22:20 -0300
Message-Id: <c23f92bf473e065b8f50e620fe6a246e30a61742.1495156488.git.mchehab@s-opensource.com>
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

- Mark titles;
- Mark literal blocks;
- Mark some literals that would otherwise produce warnings;
- Mark authorship.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/DMA-API-HOWTO.txt | 159 +++++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 67 deletions(-)

diff --git a/Documentation/DMA-API-HOWTO.txt b/Documentation/DMA-API-HOWTO.txt
index 979228bc9035..7c0a0ae4ab83 100644
--- a/Documentation/DMA-API-HOWTO.txt
+++ b/Documentation/DMA-API-HOWTO.txt
@@ -1,22 +1,24 @@
-		     Dynamic DMA mapping Guide
-		     =========================
+=========================
+Dynamic DMA mapping Guide
+=========================
 
-		 David S. Miller <davem@redhat.com>
-		 Richard Henderson <rth@cygnus.com>
-		  Jakub Jelinek <jakub@redhat.com>
+:Author: David S. Miller <davem@redhat.com>
+:Author: Richard Henderson <rth@cygnus.com>
+:Author: Jakub Jelinek <jakub@redhat.com>
 
 This is a guide to device driver writers on how to use the DMA API
 with example pseudo-code.  For a concise description of the API, see
 DMA-API.txt.
 
-                       CPU and DMA addresses
+CPU and DMA addresses
+=====================
 
 There are several kinds of addresses involved in the DMA API, and it's
 important to understand the differences.
 
 The kernel normally uses virtual addresses.  Any address returned by
 kmalloc(), vmalloc(), and similar interfaces is a virtual address and can
-be stored in a "void *".
+be stored in a ``void *``.
 
 The virtual memory system (TLB, page tables, etc.) translates virtual
 addresses to CPU physical addresses, which are stored as "phys_addr_t" or
@@ -37,7 +39,7 @@ be restricted to a subset of that space.  For example, even if a system
 supports 64-bit addresses for main memory and PCI BARs, it may use an IOMMU
 so devices only need to use 32-bit DMA addresses.
 
-Here's a picture and some examples:
+Here's a picture and some examples::
 
                CPU                  CPU                  Bus
              Virtual              Physical             Address
@@ -98,15 +100,16 @@ microprocessor architecture. You should use the DMA API rather than the
 bus-specific DMA API, i.e., use the dma_map_*() interfaces rather than the
 pci_map_*() interfaces.
 
-First of all, you should make sure
+First of all, you should make sure::
 
-#include <linux/dma-mapping.h>
+	#include <linux/dma-mapping.h>
 
 is in your driver, which provides the definition of dma_addr_t.  This type
 can hold any valid DMA address for the platform and should be used
 everywhere you hold a DMA address returned from the DMA mapping functions.
 
-			 What memory is DMA'able?
+What memory is DMA'able?
+========================
 
 The first piece of information you must know is what kernel memory can
 be used with the DMA mapping facilities.  There has been an unwritten
@@ -143,7 +146,8 @@ What about block I/O and networking buffers?  The block I/O and
 networking subsystems make sure that the buffers they use are valid
 for you to DMA from/to.
 
-			DMA addressing limitations
+DMA addressing limitations
+==========================
 
 Does your device have any DMA addressing limitations?  For example, is
 your device only capable of driving the low order 24-bits of address?
@@ -166,7 +170,7 @@ style to do this even if your device holds the default setting,
 because this shows that you did think about these issues wrt. your
 device.
 
-The query is performed via a call to dma_set_mask_and_coherent():
+The query is performed via a call to dma_set_mask_and_coherent()::
 
 	int dma_set_mask_and_coherent(struct device *dev, u64 mask);
 
@@ -175,12 +179,12 @@ If you have some special requirements, then the following two separate
 queries can be used instead:
 
 	The query for streaming mappings is performed via a call to
-	dma_set_mask():
+	dma_set_mask()::
 
 		int dma_set_mask(struct device *dev, u64 mask);
 
 	The query for consistent allocations is performed via a call
-	to dma_set_coherent_mask():
+	to dma_set_coherent_mask()::
 
 		int dma_set_coherent_mask(struct device *dev, u64 mask);
 
@@ -209,7 +213,7 @@ of your driver reports that performance is bad or that the device is not
 even detected, you can ask them for the kernel messages to find out
 exactly why.
 
-The standard 32-bit addressing device would do something like this:
+The standard 32-bit addressing device would do something like this::
 
 	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))) {
 		dev_warn(dev, "mydev: No suitable DMA available\n");
@@ -225,7 +229,7 @@ than 64-bit addressing.  For example, Sparc64 PCI SAC addressing is
 more efficient than DAC addressing.
 
 Here is how you would handle a 64-bit capable device which can drive
-all 64-bits when accessing streaming DMA:
+all 64-bits when accessing streaming DMA::
 
 	int using_dac;
 
@@ -239,7 +243,7 @@ all 64-bits when accessing streaming DMA:
 	}
 
 If a card is capable of using 64-bit consistent allocations as well,
-the case would look like this:
+the case would look like this::
 
 	int using_dac, consistent_using_dac;
 
@@ -260,7 +264,7 @@ uses consistent allocations, one would have to check the return value from
 dma_set_coherent_mask().
 
 Finally, if your device can only drive the low 24-bits of
-address you might do something like:
+address you might do something like::
 
 	if (dma_set_mask(dev, DMA_BIT_MASK(24))) {
 		dev_warn(dev, "mydev: 24-bit DMA addressing not available\n");
@@ -280,7 +284,7 @@ only provide the functionality which the machine can handle.  It
 is important that the last call to dma_set_mask() be for the
 most specific mask.
 
-Here is pseudo-code showing how this might be done:
+Here is pseudo-code showing how this might be done::
 
 	#define PLAYBACK_ADDRESS_BITS	DMA_BIT_MASK(32)
 	#define RECORD_ADDRESS_BITS	DMA_BIT_MASK(24)
@@ -308,7 +312,8 @@ A sound card was used as an example here because this genre of PCI
 devices seems to be littered with ISA chips given a PCI front end,
 and thus retaining the 16MB DMA addressing limitations of ISA.
 
-			Types of DMA mappings
+Types of DMA mappings
+=====================
 
 There are two types of DMA mappings:
 
@@ -336,12 +341,14 @@ There are two types of DMA mappings:
   to memory is immediately visible to the device, and vice
   versa.  Consistent mappings guarantee this.
 
-  IMPORTANT: Consistent DMA memory does not preclude the usage of
-             proper memory barriers.  The CPU may reorder stores to
+  .. important::
+
+	     Consistent DMA memory does not preclude the usage of
+	     proper memory barriers.  The CPU may reorder stores to
 	     consistent memory just as it may normal memory.  Example:
 	     if it is important for the device to see the first word
 	     of a descriptor updated before the second, you must do
-	     something like:
+	     something like::
 
 		desc->word0 = address;
 		wmb();
@@ -377,16 +384,17 @@ Also, systems with caches that aren't DMA-coherent will work better
 when the underlying buffers don't share cache lines with other data.
 
 
-		 Using Consistent DMA mappings.
+Using Consistent DMA mappings
+=============================
 
 To allocate and map large (PAGE_SIZE or so) consistent DMA regions,
-you should do:
+you should do::
 
 	dma_addr_t dma_handle;
 
 	cpu_addr = dma_alloc_coherent(dev, size, &dma_handle, gfp);
 
-where device is a struct device *. This may be called in interrupt
+where device is a ``struct device *``. This may be called in interrupt
 context with the GFP_ATOMIC flag.
 
 Size is the length of the region you want to allocate, in bytes.
@@ -415,7 +423,7 @@ exists (for example) to guarantee that if you allocate a chunk
 which is smaller than or equal to 64 kilobytes, the extent of the
 buffer you receive will not cross a 64K boundary.
 
-To unmap and free such a DMA region, you call:
+To unmap and free such a DMA region, you call::
 
 	dma_free_coherent(dev, size, cpu_addr, dma_handle);
 
@@ -430,7 +438,7 @@ a kmem_cache, but it uses dma_alloc_coherent(), not __get_free_pages().
 Also, it understands common hardware constraints for alignment,
 like queue heads needing to be aligned on N byte boundaries.
 
-Create a dma_pool like this:
+Create a dma_pool like this::
 
 	struct dma_pool *pool;
 
@@ -444,7 +452,7 @@ pass 0 for boundary; passing 4096 says memory allocated from this pool
 must not cross 4KByte boundaries (but at that time it may be better to
 use dma_alloc_coherent() directly instead).
 
-Allocate memory from a DMA pool like this:
+Allocate memory from a DMA pool like this::
 
 	cpu_addr = dma_pool_alloc(pool, flags, &dma_handle);
 
@@ -452,7 +460,7 @@ flags are GFP_KERNEL if blocking is permitted (not in_interrupt nor
 holding SMP locks), GFP_ATOMIC otherwise.  Like dma_alloc_coherent(),
 this returns two values, cpu_addr and dma_handle.
 
-Free memory that was allocated from a dma_pool like this:
+Free memory that was allocated from a dma_pool like this::
 
 	dma_pool_free(pool, cpu_addr, dma_handle);
 
@@ -460,7 +468,7 @@ where pool is what you passed to dma_pool_alloc(), and cpu_addr and
 dma_handle are the values dma_pool_alloc() returned. This function
 may be called in interrupt context.
 
-Destroy a dma_pool by calling:
+Destroy a dma_pool by calling::
 
 	dma_pool_destroy(pool);
 
@@ -468,11 +476,12 @@ Make sure you've called dma_pool_free() for all memory allocated
 from a pool before you destroy the pool. This function may not
 be called in interrupt context.
 
-			DMA Direction
+DMA Direction
+=============
 
 The interfaces described in subsequent portions of this document
 take a DMA direction argument, which is an integer and takes on
-one of the following values:
+one of the following values::
 
  DMA_BIDIRECTIONAL
  DMA_TO_DEVICE
@@ -521,14 +530,15 @@ packets, map/unmap them with the DMA_TO_DEVICE direction
 specifier.  For receive packets, just the opposite, map/unmap them
 with the DMA_FROM_DEVICE direction specifier.
 
-		  Using Streaming DMA mappings
+Using Streaming DMA mappings
+============================
 
 The streaming DMA mapping routines can be called from interrupt
 context.  There are two versions of each map/unmap, one which will
 map/unmap a single memory region, and one which will map/unmap a
 scatterlist.
 
-To map a single region, you do:
+To map a single region, you do::
 
 	struct device *dev = &my_dev->dev;
 	dma_addr_t dma_handle;
@@ -545,7 +555,7 @@ To map a single region, you do:
 		goto map_error_handling;
 	}
 
-and to unmap it:
+and to unmap it::
 
 	dma_unmap_single(dev, dma_handle, size, direction);
 
@@ -561,7 +571,8 @@ to check for errors that make assumptions about the underlying DMA
 implementation are as follows and these are applicable to dma_map_page() as
 well.
 
-Incorrect example 1:
+Incorrect example 1::
+
 	dma_addr_t dma_handle;
 
 	dma_handle = dma_map_single(dev, addr, size, direction);
@@ -569,7 +580,8 @@ Incorrect example 1:
 		goto map_error;
 	}
 
-Incorrect example 2:
+Incorrect example 2::
+
 	dma_addr_t dma_handle;
 
 	dma_handle = dma_map_single(dev, addr, size, direction);
@@ -584,7 +596,7 @@ Using CPU pointers like this for single mappings has a disadvantage:
 you cannot reference HIGHMEM memory in this way.  Thus, there is a
 map/unmap interface pair akin to dma_{map,unmap}_single().  These
 interfaces deal with page/offset pairs instead of CPU pointers.
-Specifically:
+Specifically::
 
 	struct device *dev = &my_dev->dev;
 	dma_addr_t dma_handle;
@@ -614,7 +626,7 @@ error as outlined under the dma_map_single() discussion.
 You should call dma_unmap_page() when the DMA activity is finished, e.g.,
 from the interrupt which told you that the DMA transfer is done.
 
-With scatterlists, you map a region gathered from several regions by:
+With scatterlists, you map a region gathered from several regions by::
 
 	int i, count = dma_map_sg(dev, sglist, nents, direction);
 	struct scatterlist *sg;
@@ -638,16 +650,18 @@ Then you should loop count times (note: this can be less than nents times)
 and use sg_dma_address() and sg_dma_len() macros where you previously
 accessed sg->address and sg->length as shown above.
 
-To unmap a scatterlist, just call:
+To unmap a scatterlist, just call::
 
 	dma_unmap_sg(dev, sglist, nents, direction);
 
 Again, make sure DMA activity has already finished.
 
-PLEASE NOTE:  The 'nents' argument to the dma_unmap_sg call must be
-              the _same_ one you passed into the dma_map_sg call,
-	      it should _NOT_ be the 'count' value _returned_ from the
-              dma_map_sg call.
+.. note::
+
+	The 'nents' argument to the dma_unmap_sg call must be
+	the _same_ one you passed into the dma_map_sg call,
+	it should _NOT_ be the 'count' value _returned_ from the
+	dma_map_sg call.
 
 Every dma_map_{single,sg}() call should have its dma_unmap_{single,sg}()
 counterpart, because the DMA address space is a shared resource and
@@ -659,11 +673,11 @@ properly in order for the CPU and device to see the most up-to-date and
 correct copy of the DMA buffer.
 
 So, firstly, just map it with dma_map_{single,sg}(), and after each DMA
-transfer call either:
+transfer call either::
 
 	dma_sync_single_for_cpu(dev, dma_handle, size, direction);
 
-or:
+or::
 
 	dma_sync_sg_for_cpu(dev, sglist, nents, direction);
 
@@ -671,17 +685,19 @@ as appropriate.
 
 Then, if you wish to let the device get at the DMA area again,
 finish accessing the data with the CPU, and then before actually
-giving the buffer to the hardware call either:
+giving the buffer to the hardware call either::
 
 	dma_sync_single_for_device(dev, dma_handle, size, direction);
 
-or:
+or::
 
 	dma_sync_sg_for_device(dev, sglist, nents, direction);
 
 as appropriate.
 
-PLEASE NOTE:  The 'nents' argument to dma_sync_sg_for_cpu() and
+.. note::
+
+	      The 'nents' argument to dma_sync_sg_for_cpu() and
 	      dma_sync_sg_for_device() must be the same passed to
 	      dma_map_sg(). It is _NOT_ the count returned by
 	      dma_map_sg().
@@ -692,7 +708,7 @@ dma_map_*() call till dma_unmap_*(), then you don't have to call the
 dma_sync_*() routines at all.
 
 Here is pseudo code which shows a situation in which you would need
-to use the dma_sync_*() interfaces.
+to use the dma_sync_*() interfaces::
 
 	my_card_setup_receive_buffer(struct my_card *cp, char *buffer, int len)
 	{
@@ -768,7 +784,8 @@ is planned to completely remove virt_to_bus() and bus_to_virt() as
 they are entirely deprecated.  Some ports already do not provide these
 as it is impossible to correctly support them.
 
-			Handling Errors
+Handling Errors
+===============
 
 DMA address space is limited on some architectures and an allocation
 failure can be determined by:
@@ -776,7 +793,7 @@ failure can be determined by:
 - checking if dma_alloc_coherent() returns NULL or dma_map_sg returns 0
 
 - checking the dma_addr_t returned from dma_map_single() and dma_map_page()
-  by using dma_mapping_error():
+  by using dma_mapping_error()::
 
 	dma_addr_t dma_handle;
 
@@ -794,7 +811,8 @@ failure can be determined by:
   of a multiple page mapping attempt. These example are applicable to
   dma_map_page() as well.
 
-Example 1:
+Example 1::
+
 	dma_addr_t dma_handle1;
 	dma_addr_t dma_handle2;
 
@@ -823,8 +841,12 @@ Example 1:
 		dma_unmap_single(dma_handle1);
 	map_error_handling1:
 
-Example 2: (if buffers are allocated in a loop, unmap all mapped buffers when
-	    mapping error is detected in the middle)
+Example 2::
+
+	/*
+	 * if buffers are allocated in a loop, unmap all mapped buffers when
+	 * mapping error is detected in the middle
+	 */
 
 	dma_addr_t dma_addr;
 	dma_addr_t array[DMA_BUFFERS];
@@ -867,7 +889,8 @@ SCSI drivers must return SCSI_MLQUEUE_HOST_BUSY if the DMA mapping
 fails in the queuecommand hook. This means that the SCSI subsystem
 passes the command to the driver again later.
 
-		Optimizing Unmap State Space Consumption
+Optimizing Unmap State Space Consumption
+========================================
 
 On many platforms, dma_unmap_{single,page}() is simply a nop.
 Therefore, keeping track of the mapping address and length is a waste
@@ -879,7 +902,7 @@ Actually, instead of describing the macros one by one, we'll
 transform some example code.
 
 1) Use DEFINE_DMA_UNMAP_{ADDR,LEN} in state saving structures.
-   Example, before:
+   Example, before::
 
 	struct ring_state {
 		struct sk_buff *skb;
@@ -887,7 +910,7 @@ transform some example code.
 		__u32 len;
 	};
 
-   after:
+   after::
 
 	struct ring_state {
 		struct sk_buff *skb;
@@ -896,23 +919,23 @@ transform some example code.
 	};
 
 2) Use dma_unmap_{addr,len}_set() to set these values.
-   Example, before:
+   Example, before::
 
 	ringp->mapping = FOO;
 	ringp->len = BAR;
 
-   after:
+   after::
 
 	dma_unmap_addr_set(ringp, mapping, FOO);
 	dma_unmap_len_set(ringp, len, BAR);
 
 3) Use dma_unmap_{addr,len}() to access these values.
-   Example, before:
+   Example, before::
 
 	dma_unmap_single(dev, ringp->mapping, ringp->len,
 			 DMA_FROM_DEVICE);
 
-   after:
+   after::
 
 	dma_unmap_single(dev,
 			 dma_unmap_addr(ringp, mapping),
@@ -923,7 +946,8 @@ It really should be self-explanatory.  We treat the ADDR and LEN
 separately, because it is possible for an implementation to only
 need the address in order to perform the unmap operation.
 
-			Platform Issues
+Platform Issues
+===============
 
 If you are just writing drivers for Linux and do not maintain
 an architecture port for the kernel, you can safely skip down
@@ -949,12 +973,13 @@ to "Closing".
    alignment constraints (e.g. the alignment constraints about 64-bit
    objects).
 
-			   Closing
+Closing
+=======
 
 This document, and the API itself, would not be in its current
 form without the feedback and suggestions from numerous individuals.
 We would like to specifically mention, in no particular order, the
-following people:
+following people::
 
 	Russell King <rmk@arm.linux.org.uk>
 	Leo Dagum <dagum@barrel.engr.sgi.com>
-- 
2.9.4
