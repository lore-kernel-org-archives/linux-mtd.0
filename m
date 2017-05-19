Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWhT-0005xl-3D
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:28 +0000
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
Subject: [PATCH 28/29] zorro.txt: standardize document format
Date: Thu, 18 May 2017 22:26:12 -0300
Message-Id: <ea7d645a23ca7035b3fad8c3af655eb4fe8a0a7e.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
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

- Use right marks for titles;
- Use authorship marks;
- Mark literals and literal blocks;
- Use autonumbered list for references.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/zorro.txt | 59 +++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/Documentation/zorro.txt b/Documentation/zorro.txt
index d530971beb00..664072b017e3 100644
--- a/Documentation/zorro.txt
+++ b/Documentation/zorro.txt
@@ -1,12 +1,13 @@
-		Writing Device Drivers for Zorro Devices
-		----------------------------------------
+========================================
+Writing Device Drivers for Zorro Devices
+========================================
 
-Written by Geert Uytterhoeven <geert@linux-m68k.org>
-Last revised: September 5, 2003
+:Author: Written by Geert Uytterhoeven <geert@linux-m68k.org>
+:Last revised: September 5, 2003
 
 
-1. Introduction
----------------
+Introduction
+------------
 
 The Zorro bus is the bus used in the Amiga family of computers. Thanks to
 AutoConfig(tm), it's 100% Plug-and-Play.
@@ -20,12 +21,12 @@ There are two types of Zorro buses, Zorro II and Zorro III:
     with Zorro II. The Zorro III address space lies outside the first 16 MB.
 
 
-2. Probing for Zorro Devices
-----------------------------
+Probing for Zorro Devices
+-------------------------
 
-Zorro devices are found by calling `zorro_find_device()', which returns a
-pointer to the `next' Zorro device with the specified Zorro ID. A probe loop
-for the board with Zorro ID `ZORRO_PROD_xxx' looks like:
+Zorro devices are found by calling ``zorro_find_device()``, which returns a
+pointer to the ``next`` Zorro device with the specified Zorro ID. A probe loop
+for the board with Zorro ID ``ZORRO_PROD_xxx`` looks like::
 
     struct zorro_dev *z = NULL;
 
@@ -35,8 +36,8 @@ for the board with Zorro ID `ZORRO_PROD_xxx' looks like:
 	...
     }
 
-`ZORRO_WILDCARD' acts as a wildcard and finds any Zorro device. If your driver
-supports different types of boards, you can use a construct like:
+``ZORRO_WILDCARD`` acts as a wildcard and finds any Zorro device. If your driver
+supports different types of boards, you can use a construct like::
 
     struct zorro_dev *z = NULL;
 
@@ -49,24 +50,24 @@ supports different types of boards, you can use a construct like:
     }
 
 
-3. Zorro Resources
-------------------
+Zorro Resources
+---------------
 
 Before you can access a Zorro device's registers, you have to make sure it's
 not yet in use. This is done using the I/O memory space resource management
-functions:
+functions::
 
     request_mem_region()
     release_mem_region()
 
-Shortcuts to claim the whole device's address space are provided as well:
+Shortcuts to claim the whole device's address space are provided as well::
 
     zorro_request_device
     zorro_release_device
 
 
-4. Accessing the Zorro Address Space
-------------------------------------
+Accessing the Zorro Address Space
+---------------------------------
 
 The address regions in the Zorro device resources are Zorro bus address
 regions. Due to the identity bus-physical address mapping on the Zorro bus,
@@ -78,26 +79,26 @@ The treatment of these regions depends on the type of Zorro space:
     explicitly using z_ioremap().
     
     Conversion from bus/physical Zorro II addresses to kernel virtual addresses
-    and vice versa is done using:
+    and vice versa is done using::
 
 	virt_addr = ZTWO_VADDR(bus_addr);
 	bus_addr = ZTWO_PADDR(virt_addr);
 
   - Zorro III address space must be mapped explicitly using z_ioremap() first
-    before it can be accessed:
+    before it can be accessed::
  
 	virt_addr = z_ioremap(bus_addr, size);
 	...
 	z_iounmap(virt_addr);
 
 
-5. References
--------------
+References
+----------
 
-linux/include/linux/zorro.h
-linux/include/uapi/linux/zorro.h
-linux/include/uapi/linux/zorro_ids.h
-linux/arch/m68k/include/asm/zorro.h
-linux/drivers/zorro
-/proc/bus/zorro
+#. linux/include/linux/zorro.h
+#. linux/include/uapi/linux/zorro.h
+#. linux/include/uapi/linux/zorro_ids.h
+#. linux/arch/m68k/include/asm/zorro.h
+#. linux/drivers/zorro
+#. /proc/bus/zorro
 
-- 
2.9.4
