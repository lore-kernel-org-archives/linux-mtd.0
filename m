Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0005gc-Dm
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:48 +0000
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
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 04/30] IRQ-domain.txt: standardize document format
Date: Thu, 18 May 2017 22:23:56 -0300
Message-Id: <dc3f7f85fa5d500a8ff9569b5aed6d64d1620bf7.1495156975.git.mchehab@s-opensource.com>
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

- use proper markups for titles;
- mark literal blocks as such;
- add blank lines where needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/IRQ-domain.txt | 69 +++++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/Documentation/IRQ-domain.txt b/Documentation/IRQ-domain.txt
index 82001a25a14b..ef32ec0f2b04 100644
--- a/Documentation/IRQ-domain.txt
+++ b/Documentation/IRQ-domain.txt
@@ -1,4 +1,6 @@
-irq_domain interrupt number mapping library
+===============================================
+The irq_domain interrupt number mapping library
+===============================================
 
 The current design of the Linux kernel uses a single large number
 space where each separate IRQ source is assigned a different number.
@@ -36,7 +38,9 @@ irq_domain also implements translation from an abstract irq_fwspec
 structure to hwirq numbers (Device Tree and ACPI GSI so far), and can
 be easily extended to support other IRQ topology data sources.
 
-=== irq_domain usage ===
+irq_domain usage
+================
+
 An interrupt controller driver creates and registers an irq_domain by
 calling one of the irq_domain_add_*() functions (each mapping method
 has a different allocator function, more on that later).  The function
@@ -62,15 +66,21 @@ If the driver has the Linux IRQ number or the irq_data pointer, and
 needs to know the associated hwirq number (such as in the irq_chip
 callbacks) then it can be directly obtained from irq_data->hwirq.
 
-=== Types of irq_domain mappings ===
+Types of irq_domain mappings
+============================
+
 There are several mechanisms available for reverse mapping from hwirq
 to Linux irq, and each mechanism uses a different allocation function.
 Which reverse map type should be used depends on the use case.  Each
 of the reverse map types are described below:
 
-==== Linear ====
-irq_domain_add_linear()
-irq_domain_create_linear()
+Linear
+------
+
+::
+
+	irq_domain_add_linear()
+	irq_domain_create_linear()
 
 The linear reverse map maintains a fixed size table indexed by the
 hwirq number.  When a hwirq is mapped, an irq_desc is allocated for
@@ -89,9 +99,13 @@ accepts a more general abstraction 'struct fwnode_handle'.
 
 The majority of drivers should use the linear map.
 
-==== Tree ====
-irq_domain_add_tree()
-irq_domain_create_tree()
+Tree
+----
+
+::
+
+	irq_domain_add_tree()
+	irq_domain_create_tree()
 
 The irq_domain maintains a radix tree map from hwirq numbers to Linux
 IRQs.  When an hwirq is mapped, an irq_desc is allocated and the
@@ -109,8 +123,12 @@ accepts a more general abstraction 'struct fwnode_handle'.
 
 Very few drivers should need this mapping.
 
-==== No Map ===-
-irq_domain_add_nomap()
+No Map
+------
+
+::
+
+	irq_domain_add_nomap()
 
 The No Map mapping is to be used when the hwirq number is
 programmable in the hardware.  In this case it is best to program the
@@ -121,10 +139,14 @@ Linux IRQ number into the hardware.
 
 Most drivers cannot use this mapping.
 
-==== Legacy ====
-irq_domain_add_simple()
-irq_domain_add_legacy()
-irq_domain_add_legacy_isa()
+Legacy
+------
+
+::
+
+	irq_domain_add_simple()
+	irq_domain_add_legacy()
+	irq_domain_add_legacy_isa()
 
 The Legacy mapping is a special case for drivers that already have a
 range of irq_descs allocated for the hwirqs.  It is used when the
@@ -163,14 +185,17 @@ that the driver using the simple domain call irq_create_mapping()
 before any irq_find_mapping() since the latter will actually work
 for the static IRQ assignment case.
 
-==== Hierarchy IRQ domain ====
+Hierarchy IRQ domain
+--------------------
+
 On some architectures, there may be multiple interrupt controllers
 involved in delivering an interrupt from the device to the target CPU.
-Let's look at a typical interrupt delivering path on x86 platforms:
+Let's look at a typical interrupt delivering path on x86 platforms::
 
-Device --> IOAPIC -> Interrupt remapping Controller -> Local APIC -> CPU
+  Device --> IOAPIC -> Interrupt remapping Controller -> Local APIC -> CPU
 
 There are three interrupt controllers involved:
+
 1) IOAPIC controller
 2) Interrupt remapping controller
 3) Local APIC controller
@@ -180,7 +205,8 @@ hardware architecture, an irq_domain data structure is built for each
 interrupt controller and those irq_domains are organized into hierarchy.
 When building irq_domain hierarchy, the irq_domain near to the device is
 child and the irq_domain near to CPU is parent. So a hierarchy structure
-as below will be built for the example above.
+as below will be built for the example above::
+
 	CPU Vector irq_domain (root irq_domain to manage CPU vectors)
 		^
 		|
@@ -190,6 +216,7 @@ as below will be built for the example above.
 	IOAPIC irq_domain (manage IOAPIC delivery entries/pins)
 
 There are four major interfaces to use hierarchy irq_domain:
+
 1) irq_domain_alloc_irqs(): allocate IRQ descriptors and interrupt
    controller related resources to deliver these interrupts.
 2) irq_domain_free_irqs(): free IRQ descriptors and interrupt controller
@@ -199,7 +226,8 @@ There are four major interfaces to use hierarchy irq_domain:
 4) irq_domain_deactivate_irq(): deactivate interrupt controller hardware
    to stop delivering the interrupt.
 
-Following changes are needed to support hierarchy irq_domain.
+Following changes are needed to support hierarchy irq_domain:
+
 1) a new field 'parent' is added to struct irq_domain; it's used to
    maintain irq_domain hierarchy information.
 2) a new field 'parent_data' is added to struct irq_data; it's used to
@@ -223,6 +251,7 @@ software architecture.
 
 For an interrupt controller driver to support hierarchy irq_domain, it
 needs to:
+
 1) Implement irq_domain_ops.alloc and irq_domain_ops.free
 2) Optionally implement irq_domain_ops.activate and
    irq_domain_ops.deactivate.
-- 
2.9.4
