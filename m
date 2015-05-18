Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuUP5-0001Mo-2w
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 23:24:59 +0000
Received: by padbw4 with SMTP id bw4so171137769pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 16:24:38 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-sh@vger.kernel.org
Subject: [PATCH] sh: mach-rsk: remove unnecessary MTD partition probe
 specification
Date: Mon, 18 May 2015 16:24:30 -0700
Message-Id: <1431991470-22388-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The cmdlinepart parser is already supported in the default probe.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 arch/sh/boards/mach-rsk/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/boards/mach-rsk/setup.c b/arch/sh/boards/mach-rsk/setup.c
index 2685ea03b064..6bc134bd7ec2 100644
--- a/arch/sh/boards/mach-rsk/setup.c
+++ b/arch/sh/boards/mach-rsk/setup.c
@@ -27,8 +27,6 @@ static struct regulator_consumer_supply dummy_supplies[] = {
 	REGULATOR_SUPPLY("vdd33a", "smsc911x"),
 };
 
-static const char *part_probes[] = { "cmdlinepart", NULL };
-
 static struct mtd_partition rsk_partitions[] = {
 	{
 		.name		= "Bootloader",
@@ -50,7 +48,6 @@ static struct physmap_flash_data flash_data = {
 	.parts			= rsk_partitions,
 	.nr_parts		= ARRAY_SIZE(rsk_partitions),
 	.width			= 2,
-	.part_probe_types	= part_probes,
 };
 
 static struct resource flash_resource = {
-- 
1.9.1
