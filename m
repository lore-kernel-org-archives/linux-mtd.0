Received: from mail-cys01nam02on0045.outbound.protection.outlook.com
 ([104.47.37.45] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK0Y8-0003xX-6O
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 11:29:10 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>, <devicetree-discuss@lists.ozlabs.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, <computersforpeace@gmail.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH] Documentation: binding: Update endianness usage
Date: Wed, 29 Nov 2017 16:57:35 +0530
Message-ID: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

IFC controller version < 2.0 support IFC register access as
big endian. These controller version also require IFC NOR signals to
be connected in reverse order with NOR flash.

IFC >= 2.0 is other way around.

So updating IFC binding to take care of both using endianness field.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
index 89427b0..824a2ca 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
@@ -18,8 +18,10 @@ Properties:
               interrupt (NAND_EVTER_STAT).  If there is only one,
               that interrupt reports both types of event.
 
-- little-endian : If this property is absent, the big-endian mode will
-                  be in use as default for registers.
+- little-endian or big-endin : It represents how IFC registers  to be accessed.
+			It also represents connection between controller and
+			NOR flash. If this property is absent, the big-endian
+			mode will be in use as default.
 
 - ranges : Each range corresponds to a single chipselect, and covers
            the entire access window as configured.
-- 
1.9.1
