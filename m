Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqJnR-0003b7-Ic
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 04:49:49 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: jedec_probe: add PSD4256G6V id
Date: Wed, 23 Sep 2009 00:49:39 -0400
Message-Id: <1253681379-24718-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1253662791.27055.522.camel@macbook.infradead.org>
References: <1253662791.27055.522.camel@macbook.infradead.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
sorry, went to go see a movie and missed your 30min window

 drivers/mtd/chips/jedec_probe.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index ccc4cfc..556f378 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -150,6 +150,7 @@
 #define M50LPW080       0x002F
 #define M50FLW080A	0x0080
 #define M50FLW080B	0x0081
+#define PSD4256G6V	0x00e9
 
 /* SST */
 #define SST29EE020	0x0010
@@ -201,6 +202,7 @@ enum uaddr {
 	MTD_UADDR_0x0555_0x02AA,
 	MTD_UADDR_0x0555_0x0AAA,
 	MTD_UADDR_0x5555_0x2AAA,
+	MTD_UADDR_0x0AAA_0x0554,
 	MTD_UADDR_0x0AAA_0x0555,
 	MTD_UADDR_0xAAAA_0x5555,
 	MTD_UADDR_DONT_CARE,		/* Requires an arbitrary address */
@@ -245,6 +247,11 @@ static const struct unlock_addr  unlock_addrs[] = {
 		.addr2 = 0x2aaa
 	},
 
+	[MTD_UADDR_0x0AAA_0x0554] = {
+		.addr1 = 0x0AAA,
+		.addr2 = 0x0554
+	},
+
 	[MTD_UADDR_0x0AAA_0x0555] = {
 		.addr1 = 0x0AAA,
 		.addr2 = 0x0555
@@ -1726,6 +1733,18 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,16),
 		}
 	}, {
+		.mfr_id		= 0xff00 | MANUFACTURER_ST,
+		.dev_id		= 0xff00 | PSD4256G6V,
+		.name		= "ST PSD4256G6V",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0554,
+		.dev_size	= SIZE_1MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 1,
+		.regions	= {
+			ERASEINFO(0x10000,16),
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_TOSHIBA,
 		.dev_id		= TC58FVT160,
 		.name		= "Toshiba TC58FVT160",
-- 
1.6.5.rc1
