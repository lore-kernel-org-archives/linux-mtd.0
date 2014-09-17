Received: from xes-mad.com ([216.165.139.218])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUJgr-0007LP-KM
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 18:10:54 +0000
Date: Wed, 17 Sep 2014 13:08:28 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org
Message-ID: <850734862.234398.1410977308984.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1723729858.233869.1410977102931.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 2/2] mtd: physmap_of: Add non-obsolete map_rom probe
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously, the only way to map a NOR device as a simple ROM was to
use the obsolete "direct-mapped" compatible binding (which further
requires device_type = "nor" and probe-type = "NOR" properties).

This patch adds an "mtd-rom" compatible binding to the "map_rom"
probe type.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 4 ++--
 drivers/mtd/maps/physmap_of.c                         | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index 61c5ec8..6b9f680 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -4,8 +4,8 @@ Flash chips (Memory Technology Devices) are often used for solid state
 file systems on embedded devices.
 
  - compatible : should contain the specific model of mtd chip(s)
-   used, if known, followed by either "cfi-flash", "jedec-flash"
-   or "mtd-ram".
+   used, if known, followed by either "cfi-flash", "jedec-flash",
+   "mtd-ram" or "mtd-rom".
  - reg : Address range(s) of the mtd chip(s)
    It's possible to (optionally) define multiple "reg" tuples so that
    non-identical chips can be described in one node.
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 63d82da..c1d21cb 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -340,6 +340,10 @@ static struct of_device_id of_flash_match[] = {
 		.data           = (void *)"map_ram",
 	},
 	{
+		.compatible     = "mtd-rom",
+		.data           = (void *)"map_rom",
+	},
+	{
 		.type		= "rom",
 		.compatible	= "direct-mapped"
 	},
-- 
1.9.1
