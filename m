Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbloZ-0002By-Gm
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 03:51:53 +0000
From: Lei Wen <leiwen@marvell.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Igor Grinberg <grinberg@compulab.co.il>, Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/9] ARM: littleton: fix nand platform data
Date: Tue, 28 Jun 2011 20:51:31 -0700
Message-Id: <1309319494-17951-7-git-send-email-leiwen@marvell.com>
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
 arch/arm/mach-pxa/littleton.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.c
index e5e326d..f6d1f9d 100644
--- a/arch/arm/mach-pxa/littleton.c
+++ b/arch/arm/mach-pxa/littleton.c
@@ -325,8 +325,9 @@ static struct mtd_partition littleton_nand_partitions[] = {
 
 static struct pxa3xx_nand_platform_data littleton_nand_info = {
 	.enable_arbiter	= 1,
-	.parts		= littleton_nand_partitions,
-	.nr_parts	= ARRAY_SIZE(littleton_nand_partitions),
+	.num_cs		= 1,
+	.parts[0]	= littleton_nand_partitions,
+	.nr_parts[0]	= ARRAY_SIZE(littleton_nand_partitions),
 };
 
 static void __init littleton_init_nand(void)
-- 
1.7.0.4
