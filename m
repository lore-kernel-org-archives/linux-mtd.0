From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 28 Jul 2008 10:06:31 +0300
Message-Id: <20080728070631.4707.68077.sendpatchset@localhost.localdomain>
In-Reply-To: <20080728070626.4707.99096.sendpatchset@localhost.localdomain>
References: <20080728070626.4707.99096.sendpatchset@localhost.localdomain>
Subject: [PATCH resend] MTD: nandsim: allow changing some module parameters
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Grant write permissions to some nandsim module parameters
to make it possible to change them runtime e.g., via sysfs:

echo 1 > /sys/module/nandsim/parameters/rptwear

There is no reason to have that file read-only. This patches
also changes the permissions from octal to S_* format.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   30 +++++++++++++++---------------
 1 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 8e73a66..6e4703e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -77,21 +77,21 @@ static char *gravepages = NULL;
 static unsigned int rptwear = 0;
 static unsigned int overridesize = 0;
 
-module_param(first_id_byte,  uint, 0400);
-module_param(second_id_byte, uint, 0400);
-module_param(third_id_byte,  uint, 0400);
-module_param(fourth_id_byte, uint, 0400);
-module_param(bus_width,      uint, 0400);
-module_param(log,            uint, 0400);
-module_param(dbg,            uint, 0400);
-module_param_array(parts, ulong, &parts_num, 0400);
-module_param(badblocks,      charp, 0400);
-module_param(weakblocks,     charp, 0400);
-module_param(weakpages,      charp, 0400);
-module_param(bitflips,       uint, 0400);
-module_param(gravepages,     charp, 0400);
-module_param(rptwear,        uint, 0400);
-module_param(overridesize,   uint, 0400);
+module_param(first_id_byte,  uint, S_IRUGO);
+module_param(second_id_byte, uint, S_IRUGO);
+module_param(third_id_byte,  uint, S_IRUGO);
+module_param(fourth_id_byte, uint, S_IRUGO);
+module_param(bus_width,      uint, S_IRUGO);
+module_param(log,            uint, S_IRUGO | S_IWUSR);
+module_param(dbg,            uint, S_IRUGO | S_IWUSR);
+module_param(badblocks,      charp, S_IRUGO);
+module_param(weakblocks,     charp, S_IRUGO);
+module_param(weakpages,      charp, S_IRUGO);
+module_param(bitflips,       uint,  S_IRUGO | S_IWUSR);
+module_param(gravepages,     charp, S_IRUGO);
+module_param(rptwear,        uint,  S_IRUGO | S_IWUSR);
+module_param(overridesize,   uint,  S_IRUGO);
+module_param_array(parts, ulong, &parts_num, S_IRUGO);
 
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
-- 
1.5.4.1
