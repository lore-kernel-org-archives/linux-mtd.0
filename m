Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdt-0000PM-28
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:03 +0000
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
Subject: [PATCH 28/31] Intel-IOMMU.txt: standardize document format
Date: Thu, 18 May 2017 22:22:33 -0300
Message-Id: <24a8b58f77a3e3152ac9943a5bee682012c02342.1495156488.git.mchehab@s-opensource.com>
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

This file is almost in the right format. It only needed to
convert a list to bulleted list and to use the right markup
for literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/Intel-IOMMU.txt | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/Documentation/Intel-IOMMU.txt b/Documentation/Intel-IOMMU.txt
index 49585b6e1ea2..11151bd39b2f 100644
--- a/Documentation/Intel-IOMMU.txt
+++ b/Documentation/Intel-IOMMU.txt
@@ -9,11 +9,11 @@ This guide gives a quick cheat sheet for some basic understanding.
 
 Some Keywords
 
-DMAR - DMA remapping
-DRHD - DMA Remapping Hardware Unit Definition
-RMRR - Reserved memory Region Reporting Structure
-ZLR  - Zero length reads from PCI devices
-IOVA - IO Virtual address.
+- DMAR - DMA remapping
+- DRHD - DMA Remapping Hardware Unit Definition
+- RMRR - Reserved memory Region Reporting Structure
+- ZLR  - Zero length reads from PCI devices
+- IOVA - IO Virtual address.
 
 Basic stuff
 -----------
@@ -33,7 +33,7 @@ devices that need to access these regions. OS is expected to setup
 unity mappings for these regions for these devices to access these regions.
 
 How is IOVA generated?
----------------------
+----------------------
 
 Well behaved drivers call pci_map_*() calls before sending command to device
 that needs to perform DMA. Once DMA is completed and mapping is no longer
@@ -82,14 +82,14 @@ in ACPI.
 ACPI: DMAR (v001 A M I  OEMDMAR  0x00000001 MSFT 0x00000097) @ 0x000000007f5b5ef0
 
 When DMAR is being processed and initialized by ACPI, prints DMAR locations
-and any RMRR's processed.
+and any RMRR's processed::
 
-ACPI DMAR:Host address width 36
-ACPI DMAR:DRHD (flags: 0x00000000)base: 0x00000000fed90000
-ACPI DMAR:DRHD (flags: 0x00000000)base: 0x00000000fed91000
-ACPI DMAR:DRHD (flags: 0x00000001)base: 0x00000000fed93000
-ACPI DMAR:RMRR base: 0x00000000000ed000 end: 0x00000000000effff
-ACPI DMAR:RMRR base: 0x000000007f600000 end: 0x000000007fffffff
+	ACPI DMAR:Host address width 36
+	ACPI DMAR:DRHD (flags: 0x00000000)base: 0x00000000fed90000
+	ACPI DMAR:DRHD (flags: 0x00000000)base: 0x00000000fed91000
+	ACPI DMAR:DRHD (flags: 0x00000001)base: 0x00000000fed93000
+	ACPI DMAR:RMRR base: 0x00000000000ed000 end: 0x00000000000effff
+	ACPI DMAR:RMRR base: 0x000000007f600000 end: 0x000000007fffffff
 
 When DMAR is enabled for use, you will notice..
 
@@ -98,10 +98,12 @@ PCI-DMA: Using DMAR IOMMU
 Fault reporting
 ---------------
 
-DMAR:[DMA Write] Request device [00:02.0] fault addr 6df084000
-DMAR:[fault reason 05] PTE Write access is not set
-DMAR:[DMA Write] Request device [00:02.0] fault addr 6df084000
-DMAR:[fault reason 05] PTE Write access is not set
+::
+
+	DMAR:[DMA Write] Request device [00:02.0] fault addr 6df084000
+	DMAR:[fault reason 05] PTE Write access is not set
+	DMAR:[DMA Write] Request device [00:02.0] fault addr 6df084000
+	DMAR:[fault reason 05] PTE Write access is not set
 
 TBD
 ----
-- 
2.9.4
