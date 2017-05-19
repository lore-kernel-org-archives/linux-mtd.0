Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000PB-Pz
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:46 +0000
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
Subject: [PATCH 04/31] bus-virt-phys-mapping.txt: standardize document format
Date: Thu, 18 May 2017 22:22:09 -0300
Message-Id: <bb115c9642b0259384c7db0fe7803011764a2947.1495156488.git.mchehab@s-opensource.com>
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

- Move author info to the beginning of file and use :Author:
- use warning/note annotation;
- mark literal blocks as such;
- Add a title for the document;
- use **emphasis** instead of _emphasis_.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/bus-virt-phys-mapping.txt | 63 +++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/Documentation/bus-virt-phys-mapping.txt b/Documentation/bus-virt-phys-mapping.txt
index 2bc55ff3b4d1..26918b64bd6b 100644
--- a/Documentation/bus-virt-phys-mapping.txt
+++ b/Documentation/bus-virt-phys-mapping.txt
@@ -1,17 +1,26 @@
-[ NOTE: The virt_to_bus() and bus_to_virt() functions have been
+How to access I/O mapped memory from within device drivers
+==========================================================
+
+:Author: Linus
+
+.. warning::
+
+	The virt_to_bus() and bus_to_virt() functions have been
 	superseded by the functionality provided by the PCI DMA interface
 	(see Documentation/DMA-API-HOWTO.txt).  They continue
 	to be documented below for historical purposes, but new code
-	must not use them. --davidm 00/12/12 ]
+	must not use them. --davidm 00/12/12
 
-[ This is a mail message in response to a query on IO mapping, thus the
-  strange format for a "document" ]
+::
+
+  [ This is a mail message in response to a query on IO mapping, thus the
+    strange format for a "document" ]
 
 The AHA-1542 is a bus-master device, and your patch makes the driver give the
 controller the physical address of the buffers, which is correct on x86
 (because all bus master devices see the physical memory mappings directly). 
 
-However, on many setups, there are actually _three_ different ways of looking
+However, on many setups, there are actually **three** different ways of looking
 at memory addresses, and in this case we actually want the third, the
 so-called "bus address". 
 
@@ -38,7 +47,7 @@ because the memory and the devices share the same address space, and that is
 not generally necessarily true on other PCI/ISA setups. 
 
 Now, just as an example, on the PReP (PowerPC Reference Platform), the 
-CPU sees a memory map something like this (this is from memory):
+CPU sees a memory map something like this (this is from memory)::
 
 	0-2 GB		"real memory"
 	2 GB-3 GB	"system IO" (inb/out and similar accesses on x86)
@@ -52,7 +61,7 @@ So when the CPU wants any bus master to write to physical memory 0, it
 has to give the master address 0x80000000 as the memory address.
 
 So, for example, depending on how the kernel is actually mapped on the 
-PPC, you can end up with a setup like this:
+PPC, you can end up with a setup like this::
 
  physical address:	0
  virtual address:	0xC0000000
@@ -61,7 +70,7 @@ PPC, you can end up with a setup like this:
 where all the addresses actually point to the same thing.  It's just seen 
 through different translations..
 
-Similarly, on the Alpha, the normal translation is
+Similarly, on the Alpha, the normal translation is::
 
  physical address:	0
  virtual address:	0xfffffc0000000000
@@ -70,7 +79,7 @@ Similarly, on the Alpha, the normal translation is
 (but there are also Alphas where the physical address and the bus address
 are the same). 
 
-Anyway, the way to look up all these translations, you do
+Anyway, the way to look up all these translations, you do::
 
 	#include <asm/io.h>
 
@@ -81,8 +90,8 @@ Anyway, the way to look up all these translations, you do
 
 Now, when do you need these?
 
-You want the _virtual_ address when you are actually going to access that 
-pointer from the kernel. So you can have something like this:
+You want the **virtual** address when you are actually going to access that
+pointer from the kernel. So you can have something like this::
 
 	/*
 	 * this is the hardware "mailbox" we use to communicate with
@@ -104,7 +113,7 @@ pointer from the kernel. So you can have something like this:
 				...
 
 on the other hand, you want the bus address when you have a buffer that 
-you want to give to the controller:
+you want to give to the controller::
 
 	/* ask the controller to read the sense status into "sense_buffer" */
 	mbox.bufstart = virt_to_bus(&sense_buffer);
@@ -112,7 +121,7 @@ you want to give to the controller:
 	mbox.status = 0;
 	notify_controller(&mbox);
 
-And you generally _never_ want to use the physical address, because you can't
+And you generally **never** want to use the physical address, because you can't
 use that from the CPU (the CPU only uses translated virtual addresses), and
 you can't use it from the bus master. 
 
@@ -124,8 +133,10 @@ be remapped as measured in units of pages, a.k.a. the pfn (the memory
 management layer doesn't know about devices outside the CPU, so it
 shouldn't need to know about "bus addresses" etc).
 
-NOTE NOTE NOTE! The above is only one part of the whole equation. The above
-only talks about "real memory", that is, CPU memory (RAM). 
+.. note::
+
+	The above is only one part of the whole equation. The above
+	only talks about "real memory", that is, CPU memory (RAM).
 
 There is a completely different type of memory too, and that's the "shared
 memory" on the PCI or ISA bus. That's generally not RAM (although in the case
@@ -137,20 +148,22 @@ whatever, and there is only one way to access it: the readb/writeb and
 related functions. You should never take the address of such memory, because
 there is really nothing you can do with such an address: it's not
 conceptually in the same memory space as "real memory" at all, so you cannot
-just dereference a pointer. (Sadly, on x86 it _is_ in the same memory space,
+just dereference a pointer. (Sadly, on x86 it **is** in the same memory space,
 so on x86 it actually works to just deference a pointer, but it's not
 portable). 
 
-For such memory, you can do things like
+For such memory, you can do things like:
+
+ - reading::
 
- - reading:
 	/*
 	 * read first 32 bits from ISA memory at 0xC0000, aka
 	 * C000:0000 in DOS terms
 	 */
 	unsigned int signature = isa_readl(0xC0000);
 
- - remapping and writing:
+ - remapping and writing::
+
 	/*
 	 * remap framebuffer PCI memory area at 0xFC000000,
 	 * size 1MB, so that we can access it: We can directly
@@ -165,7 +178,8 @@ For such memory, you can do things like
 	/* unmap when we unload the driver */
 	iounmap(baseptr);
 
- - copying and clearing:
+ - copying and clearing::
+
 	/* get the 6-byte Ethernet address at ISA address E000:0040 */
 	memcpy_fromio(kernel_buffer, 0xE0040, 6);
 	/* write a packet to the driver */
@@ -181,10 +195,10 @@ happy that your driver works ;)
 Note that kernel versions 2.0.x (and earlier) mistakenly called the
 ioremap() function "vremap()".  ioremap() is the proper name, but I
 didn't think straight when I wrote it originally.  People who have to
-support both can do something like:
+support both can do something like::
  
 	/* support old naming silliness */
-	#if LINUX_VERSION_CODE < 0x020100                                     
+	#if LINUX_VERSION_CODE < 0x020100
 	#define ioremap vremap
 	#define iounmap vfree                                                     
 	#endif
@@ -196,13 +210,10 @@ And the above sounds worse than it really is.  Most real drivers really
 don't do all that complex things (or rather: the complexity is not so
 much in the actual IO accesses as in error handling and timeouts etc). 
 It's generally not hard to fix drivers, and in many cases the code
-actually looks better afterwards:
+actually looks better afterwards::
 
 	unsigned long signature = *(unsigned int *) 0xC0000;
 		vs
 	unsigned long signature = readl(0xC0000);
 
 I think the second version actually is more readable, no?
-
-		Linus
-
-- 
2.9.4
