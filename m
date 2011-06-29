Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qblob-0002Cz-A9
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 03:51:57 +0000
From: Lei Wen <leiwen@marvell.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Igor Grinberg <grinberg@compulab.co.il>, Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 8/9] ARM: raumfeld: fix nand platform data
Date: Tue, 28 Jun 2011 20:51:33 -0700
Message-Id: <1309319494-17951-9-git-send-email-leiwen@marvell.com>
In-Reply-To: <1309246361.23597.30.camel@sauron>
References: <1309246361.23597.30.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since two chip select is supported, the original defined nand platform
data need to be fixed accordingly.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 arch/arm/mach-pxa/raumfeld.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/raumfeld.c b/arch/arm/mach-pxa/raumfeld.c
index d130f77..c7ec847 100644
--- a/arch/arm/mach-pxa/raumfeld.c
+++ b/arch/arm/mach-pxa/raumfeld.c
@@ -349,8 +349,9 @@ static struct mtd_partition raumfeld_nand_partitions[] = {
 static struct pxa3xx_nand_platform_data raumfeld_nand_info = {
 	.enable_arbiter	= 1,
 	.keep_config	= 1,
-	.parts		= raumfeld_nand_partitions,
-	.nr_parts	= ARRAY_SIZE(raumfeld_nand_partitions),
+	.num_cs		= 1,
+	.parts[0]	= raumfeld_nand_partitions,
+	.nr_parts[0]	= ARRAY_SIZE(raumfeld_nand_partitions),
 };
 
 /**
-- 
1.7.0.4
