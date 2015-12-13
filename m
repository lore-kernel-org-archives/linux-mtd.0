Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FRD-00060j-Q3
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:48:20 +0000
Subject: [PATCH linux-next v4 04/11] MIPS: bcm963xx: Move extended flash
 address to bcm_tag header file
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF59B.8000804@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:47:55 +0000
MIME-Version: 1.0
In-Reply-To: <566DF43B.5010400@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The extended flash address needs to be subtracted from bcm_tag flash
image offsets. Move this value to the bcm_tag header file.

Renamed define name to consistently use bcm963xx for flash layout
which should be considered a property of the board and not the SoC
(i.e. bcm63xx could theoretically be used on a board without CFE
or any flash).

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: New patch.

 drivers/mtd/bcm63xxpart.c    | 6 ++----
 include/linux/bcm963xx_tag.h | 5 +++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index b5bad1f..cec3188 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -37,8 +37,6 @@
 #include <asm/mach-bcm63xx/bcm63xx_nvram.h>
 #include <asm/mach-bcm63xx/board_bcm963xx.h>
 
-#define BCM63XX_EXTENDED_SIZE	0xBFC00000	/* Extended flash address */
-
 #define BCM63XX_CFE_BLOCK_SIZE	SZ_64K		/* always at least 64KiB */
 
 #define BCM63XX_CFE_MAGIC_OFFSET 0x4e0
@@ -123,8 +121,8 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 		pr_info("CFE boot tag found with version %s and board type %s\n",
 			tagversion, boardid);
 
-		kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
-		rootfsaddr = rootfsaddr - BCM63XX_EXTENDED_SIZE;
+		kerneladdr = kerneladdr - BCM963XX_EXTENDED_SIZE;
+		rootfsaddr = rootfsaddr - BCM963XX_EXTENDED_SIZE;
 		spareaddr = roundup(totallen, master->erasesize) + cfelen;
 
 		if (rootfsaddr < kerneladdr) {
diff --git a/include/linux/bcm963xx_tag.h b/include/linux/bcm963xx_tag.h
index f389dac..08e0133 100644
--- a/include/linux/bcm963xx_tag.h
+++ b/include/linux/bcm963xx_tag.h
@@ -28,6 +28,11 @@
 	"DWV-S0", \
 }
 
+/* Extended flash address, needs to be subtracted
+ * from bcm_tag flash image offsets.
+ */
+#define BCM963XX_EXTENDED_SIZE	0xBFC00000
+
 /*
  * The broadcom firmware assumes the rootfs starts the image,
  * therefore uses the rootfs start (flash_image_address)
-- 
2.1.4

-- 
Simon Arlott
