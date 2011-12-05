Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXaAE-0006rE-RW
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 15:09:10 +0000
Received: by mail-fx0-f49.google.com with SMTP id s1so1350834fab.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 07:09:06 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/7] MIPS: BCM63XX: use the new bcm63xxpart parser
Date: Mon,  5 Dec 2011 16:08:10 +0100
Message-Id: <1323097691-16414-7-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 40b223b..c223854 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -834,10 +834,13 @@ static struct mtd_partition mtd_partitions[] = {
 	}
 };
 
+static const char *bcm63xx_part_types[] = { "bcm63xxpart", NULL };
+
 static struct physmap_flash_data flash_data = {
 	.width			= 2,
 	.nr_parts		= ARRAY_SIZE(mtd_partitions),
 	.parts			= mtd_partitions,
+	.part_probe_types	= bcm63xx_part_types,
 };
 
 static struct resource mtd_resources[] = {
-- 
1.7.2.5
