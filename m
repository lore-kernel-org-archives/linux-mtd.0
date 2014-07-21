Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9KVC-0008OV-8w
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 20:48:06 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] MIPS: BCM63XX: disable unaligned accesses for SMP
Date: Mon, 21 Jul 2014 22:47:28 +0200
Message-Id: <1405975648-25375-4-git-send-email-jogo@openwrt.org>
In-Reply-To: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
References: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Gregory Fong <gregory.0xf0@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unaligned accesses to flash can cause random wrong reads when having
both cores enabled. This is easily noticable with a jffs2 filesystem,
as jffs2 reads its filenames into an unaligned bytebuffer.
This can cause random boot failures when critical files have their read
filenames corrupted.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 arch/mips/bcm63xx/dev-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm63xx/dev-flash.c b/arch/mips/bcm63xx/dev-flash.c
index 172dd83..f6a7116 100644
--- a/arch/mips/bcm63xx/dev-flash.c
+++ b/arch/mips/bcm63xx/dev-flash.c
@@ -36,6 +36,7 @@ static struct physmap_flash_data flash_data = {
 	.width			= 2,
 	.parts			= mtd_partitions,
 	.part_probe_types	= bcm63xx_part_types,
+	.no_unaligned_access	= IS_ENABLED(CONFIG_SMP),
 };
 
 static struct resource mtd_resources[] = {
-- 
2.0.0
