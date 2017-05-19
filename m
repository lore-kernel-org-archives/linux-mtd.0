Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWlR-0002Ct-5Q
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:32:05 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <morbidrsa@gmail.com>
Subject: [PATCH 21/30] men-chameleon-bus.txt: standardize document format
Date: Thu, 18 May 2017 22:24:13 -0300
Message-Id: <8efb749ce7beb2b22c298fb5c9d7d80044076b05.1495156975.git.mchehab@s-opensource.com>
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

- Adjust identations;
- Remove title numbering;
- mark literal blocks;
- comment its TOC.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/men-chameleon-bus.txt | 298 +++++++++++++++++++-----------------
 1 file changed, 155 insertions(+), 143 deletions(-)

diff --git a/Documentation/men-chameleon-bus.txt b/Documentation/men-chameleon-bus.txt
index 30ded732027e..1b1f048aa748 100644
--- a/Documentation/men-chameleon-bus.txt
+++ b/Documentation/men-chameleon-bus.txt
@@ -1,163 +1,175 @@
-                               MEN Chameleon Bus
-                               =================
-
-Table of Contents
 =================
-1 Introduction
-    1.1 Scope of this Document
-    1.2 Limitations of the current implementation
-2 Architecture
-    2.1 MEN Chameleon Bus
-    2.2 Carrier Devices
-    2.3 Parser
-3 Resource handling
-    3.1 Memory Resources
-    3.2 IRQs
-4 Writing an MCB driver
-    4.1 The driver structure
-    4.2 Probing and attaching
-    4.3 Initializing the driver
-
+MEN Chameleon Bus
+=================
 
-1 Introduction
-===============
-  This document describes the architecture and implementation of the MEN
-  Chameleon Bus (called MCB throughout this document).
+.. Table of Contents
+   =================
+   1 Introduction
+       1.1 Scope of this Document
+       1.2 Limitations of the current implementation
+   2 Architecture
+       2.1 MEN Chameleon Bus
+       2.2 Carrier Devices
+       2.3 Parser
+   3 Resource handling
+       3.1 Memory Resources
+       3.2 IRQs
+   4 Writing an MCB driver
+       4.1 The driver structure
+       4.2 Probing and attaching
+       4.3 Initializing the driver
 
-1.1 Scope of this Document
----------------------------
-  This document is intended to be a short overview of the current
-  implementation and does by no means describe the complete possibilities of MCB
-  based devices.
 
-1.2 Limitations of the current implementation
-----------------------------------------------
-  The current implementation is limited to PCI and PCIe based carrier devices
-  that only use a single memory resource and share the PCI legacy IRQ.  Not
-  implemented are:
-  - Multi-resource MCB devices like the VME Controller or M-Module carrier.
-  - MCB devices that need another MCB device, like SRAM for a DMA Controller's
-    buffer descriptors or a video controller's video memory.
-  - A per-carrier IRQ domain for carrier devices that have one (or more) IRQs
-    per MCB device like PCIe based carriers with MSI or MSI-X support.
+Introduction
+============
 
-2 Architecture
-===============
-  MCB is divided into 3 functional blocks:
-  - The MEN Chameleon Bus itself,
-  - drivers for MCB Carrier Devices and
-  - the parser for the Chameleon table.
+This document describes the architecture and implementation of the MEN
+Chameleon Bus (called MCB throughout this document).
 
-2.1 MEN Chameleon Bus
+Scope of this Document
 ----------------------
-   The MEN Chameleon Bus is an artificial bus system that attaches to a so
-   called Chameleon FPGA device found on some hardware produced my MEN Mikro
-   Elektronik GmbH. These devices are multi-function devices implemented in a
-   single FPGA and usually attached via some sort of PCI or PCIe link. Each
-   FPGA contains a header section describing the content of the FPGA. The
-   header lists the device id, PCI BAR, offset from the beginning of the PCI
-   BAR, size in the FPGA, interrupt number and some other properties currently
-   not handled by the MCB implementation.
-
-2.2 Carrier Devices
+
+This document is intended to be a short overview of the current
+implementation and does by no means describe the complete possibilities of MCB
+based devices.
+
+Limitations of the current implementation
+-----------------------------------------
+
+The current implementation is limited to PCI and PCIe based carrier devices
+that only use a single memory resource and share the PCI legacy IRQ.  Not
+implemented are:
+
+- Multi-resource MCB devices like the VME Controller or M-Module carrier.
+- MCB devices that need another MCB device, like SRAM for a DMA Controller's
+  buffer descriptors or a video controller's video memory.
+- A per-carrier IRQ domain for carrier devices that have one (or more) IRQs
+  per MCB device like PCIe based carriers with MSI or MSI-X support.
+
+Architecture
+============
+
+MCB is divided into 3 functional blocks:
+
+- The MEN Chameleon Bus itself,
+- drivers for MCB Carrier Devices and
+- the parser for the Chameleon table.
+
+MEN Chameleon Bus
+-----------------
+
+The MEN Chameleon Bus is an artificial bus system that attaches to a so
+called Chameleon FPGA device found on some hardware produced my MEN Mikro
+Elektronik GmbH. These devices are multi-function devices implemented in a
+single FPGA and usually attached via some sort of PCI or PCIe link. Each
+FPGA contains a header section describing the content of the FPGA. The
+header lists the device id, PCI BAR, offset from the beginning of the PCI
+BAR, size in the FPGA, interrupt number and some other properties currently
+not handled by the MCB implementation.
+
+Carrier Devices
+---------------
+
+A carrier device is just an abstraction for the real world physical bus the
+Chameleon FPGA is attached to. Some IP Core drivers may need to interact with
+properties of the carrier device (like querying the IRQ number of a PCI
+device). To provide abstraction from the real hardware bus, an MCB carrier
+device provides callback methods to translate the driver's MCB function calls
+to hardware related function calls. For example a carrier device may
+implement the get_irq() method which can be translated into a hardware bus
+query for the IRQ number the device should use.
+
+Parser
+------
+
+The parser reads the first 512 bytes of a Chameleon device and parses the
+Chameleon table. Currently the parser only supports the Chameleon v2 variant
+of the Chameleon table but can easily be adopted to support an older or
+possible future variant. While parsing the table's entries new MCB devices
+are allocated and their resources are assigned according to the resource
+assignment in the Chameleon table. After resource assignment is finished, the
+MCB devices are registered at the MCB and thus at the driver core of the
+Linux kernel.
+
+Resource handling
+=================
+
+The current implementation assigns exactly one memory and one IRQ resource
+per MCB device. But this is likely going to change in the future.
+
+Memory Resources
+----------------
+
+Each MCB device has exactly one memory resource, which can be requested from
+the MCB bus. This memory resource is the physical address of the MCB device
+inside the carrier and is intended to be passed to ioremap() and friends. It
+is already requested from the kernel by calling request_mem_region().
+
+IRQs
+----
+
+Each MCB device has exactly one IRQ resource, which can be requested from the
+MCB bus. If a carrier device driver implements the ->get_irq() callback
+method, the IRQ number assigned by the carrier device will be returned,
+otherwise the IRQ number inside the Chameleon table will be returned. This
+number is suitable to be passed to request_irq().
+
+Writing an MCB driver
+=====================
+
+The driver structure
 --------------------
-   A carrier device is just an abstraction for the real world physical bus the
-   Chameleon FPGA is attached to. Some IP Core drivers may need to interact with
-   properties of the carrier device (like querying the IRQ number of a PCI
-   device). To provide abstraction from the real hardware bus, an MCB carrier
-   device provides callback methods to translate the driver's MCB function calls
-   to hardware related function calls. For example a carrier device may
-   implement the get_irq() method which can be translated into a hardware bus
-   query for the IRQ number the device should use.
 
-2.3 Parser
------------
-   The parser reads the first 512 bytes of a Chameleon device and parses the
-   Chameleon table. Currently the parser only supports the Chameleon v2 variant
-   of the Chameleon table but can easily be adopted to support an older or
-   possible future variant. While parsing the table's entries new MCB devices
-   are allocated and their resources are assigned according to the resource
-   assignment in the Chameleon table. After resource assignment is finished, the
-   MCB devices are registered at the MCB and thus at the driver core of the
-   Linux kernel.
+Each MCB driver has a structure to identify the device driver as well as
+device ids which identify the IP Core inside the FPGA. The driver structure
+also contains callback methods which get executed on driver probe and
+removal from the system::
 
-3 Resource handling
-====================
-  The current implementation assigns exactly one memory and one IRQ resource
-  per MCB device. But this is likely going to change in the future.
+	static const struct mcb_device_id foo_ids[] = {
+		{ .device = 0x123 },
+		{ }
+	};
+	MODULE_DEVICE_TABLE(mcb, foo_ids);
 
-3.1 Memory Resources
+	static struct mcb_driver foo_driver = {
+	driver = {
+		.name = "foo-bar",
+		.owner = THIS_MODULE,
+	},
+		.probe = foo_probe,
+		.remove = foo_remove,
+		.id_table = foo_ids,
+	};
+
+Probing and attaching
 ---------------------
-   Each MCB device has exactly one memory resource, which can be requested from
-   the MCB bus. This memory resource is the physical address of the MCB device
-   inside the carrier and is intended to be passed to ioremap() and friends. It
-   is already requested from the kernel by calling request_mem_region().
 
-3.2 IRQs
----------
-   Each MCB device has exactly one IRQ resource, which can be requested from the
-   MCB bus. If a carrier device driver implements the ->get_irq() callback
-   method, the IRQ number assigned by the carrier device will be returned,
-   otherwise the IRQ number inside the Chameleon table will be returned. This
-   number is suitable to be passed to request_irq().
+When a driver is loaded and the MCB devices it services are found, the MCB
+core will call the driver's probe callback method. When the driver is removed
+from the system, the MCB core will call the driver's remove callback method::
 
-4 Writing an MCB driver
-=======================
+	static init foo_probe(struct mcb_device *mdev, const struct mcb_device_id *id);
+	static void foo_remove(struct mcb_device *mdev);
 
-4.1 The driver structure
--------------------------
-    Each MCB driver has a structure to identify the device driver as well as
-    device ids which identify the IP Core inside the FPGA. The driver structure
-    also contains callback methods which get executed on driver probe and
-    removal from the system.
+Initializing the driver
+-----------------------
 
+When the kernel is booted or your foo driver module is inserted, you have to
+perform driver initialization. Usually it is enough to register your driver
+module at the MCB core::
 
-  static const struct mcb_device_id foo_ids[] = {
-          { .device = 0x123 },
-          { }
-  };
-  MODULE_DEVICE_TABLE(mcb, foo_ids);
+	static int __init foo_init(void)
+	{
+		return mcb_register_driver(&foo_driver);
+	}
+	module_init(foo_init);
 
-  static struct mcb_driver foo_driver = {
-          driver = {
-                  .name = "foo-bar",
-                  .owner = THIS_MODULE,
-          },
-          .probe = foo_probe,
-          .remove = foo_remove,
-          .id_table = foo_ids,
-  };
+	static void __exit foo_exit(void)
+	{
+		mcb_unregister_driver(&foo_driver);
+	}
+	module_exit(foo_exit);
 
-4.2 Probing and attaching
---------------------------
-   When a driver is loaded and the MCB devices it services are found, the MCB
-   core will call the driver's probe callback method. When the driver is removed
-   from the system, the MCB core will call the driver's remove callback method.
+The module_mcb_driver() macro can be used to reduce the above code::
 
-
-  static init foo_probe(struct mcb_device *mdev, const struct mcb_device_id *id);
-  static void foo_remove(struct mcb_device *mdev);
-
-4.3 Initializing the driver
-----------------------------
-   When the kernel is booted or your foo driver module is inserted, you have to
-   perform driver initialization. Usually it is enough to register your driver
-   module at the MCB core.
-
-
-  static int __init foo_init(void)
-  {
-          return mcb_register_driver(&foo_driver);
-  }
-  module_init(foo_init);
-
-  static void __exit foo_exit(void)
-  {
-          mcb_unregister_driver(&foo_driver);
-  }
-  module_exit(foo_exit);
-
-   The module_mcb_driver() macro can be used to reduce the above code.
-
-
-  module_mcb_driver(foo_driver);
+	module_mcb_driver(foo_driver);
-- 
2.9.4
