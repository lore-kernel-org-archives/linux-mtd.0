Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbtqq-0008Ie-Cu
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 12:58:57 +0000
Received: by mail-ey0-f177.google.com with SMTP id k12so3598635eaa.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 04:58:56 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] MIPS: BCM63XX: bcm963xx_tag.h: make crc fields integers
Date: Sat, 17 Dec 2011 13:58:17 +0100
Message-Id: <1324126698-9919-5-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All CRC32 fields are 32 bit integers, so define them as such to prevent
unnecessary casts if we want to use them.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---

I decided for __u32 against u32 so that user space applications can still
use the header (like image creation utilities).

 arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h b/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h
index ed72e6a..1e6b587 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm963xx_tag.h
@@ -16,7 +16,6 @@
 #define TAGINFO1_LEN		30	/* Length of vendor information field1 in tag */
 #define FLASHLAYOUTVER_LEN	4	/* Length of Flash Layout Version String tag */
 #define TAGINFO2_LEN		16	/* Length of vendor information field2 in tag */
-#define CRC_LEN			4	/* Length of CRC in bytes */
 #define ALTTAGINFO_LEN		54	/* Alternate length for vendor information; Pirelli */
 
 #define NUM_PIRELLI		2
@@ -77,19 +76,19 @@ struct bcm_tag {
 	/* 192-195: Version flash layout */
 	char flash_layout_ver[FLASHLAYOUTVER_LEN];
 	/* 196-199: kernel+rootfs CRC32 */
-	char fskernel_crc[CRC_LEN];
+	__u32 fskernel_crc;
 	/* 200-215: Unused except on Alice Gate where is is information */
 	char information2[TAGINFO2_LEN];
 	/* 216-219: CRC32 of image less imagetag (kernel for Alice Gate) */
-	char image_crc[CRC_LEN];
+	__u32 image_crc;
 	/* 220-223: CRC32 of rootfs partition */
-	char rootfs_crc[CRC_LEN];
+	__u32 rootfs_crc;
 	/* 224-227: CRC32 of kernel partition */
-	char kernel_crc[CRC_LEN];
+	__u32 kernel_crc;
 	/* 228-235: Unused at present */
 	char reserved1[8];
 	/* 236-239: CRC32 of header excluding last 20 bytes */
-	char header_crc[CRC_LEN];
+	__u32 header_crc;
 	/* 240-255: Unused at present */
 	char reserved2[16];
 };
-- 
1.7.2.5
