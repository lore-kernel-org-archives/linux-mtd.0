Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8wXK-0006YK-Gm
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 14:54:36 +0000
Received: by iwn8 with SMTP id 8so2727995iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 07:54:32 -0700 (PDT)
From: zhangyd <zhangyd6@gmail.com>
To: glecerf@gmail.com
Subject: [PATCH] mtd: chips: add SST38VF640x nor-flashes
Date: Thu, 21 Oct 2010 22:53:42 -0400
Message-Id: <1287716022-2792-1-git-send-email-zhangyd6@gmail.com>
Cc: linux-mtd@lists.infradead.org, zhangyd <zhangyd6@gmail.com>,
	dwmw2@infradead.org, w.sang@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Due to broken CFI, these flashes should be operated in jedec probe mode.
When you operate them in the CFI probe mode, you will get the wrong sector
size.And it will fail to set up the flash during the probe(CFI mode).
And i have tested it on my platform.

Signed-off-by: yidong zhang <zhangyd6@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index d72a5fb..21f07da 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -163,6 +163,7 @@
 #define SST49LF030A	0x001C
 #define SST49LF040A	0x0051
 #define SST49LF080A	0x005B
+#define SST38VF6401	0x536B
 #define SST36VF3203	0x7354
 
 /* Toshiba */
@@ -1557,6 +1558,18 @@ static const struct amd_flash_info jedec_table[] = {
 		}
 	}, {
 		.mfr_id		= CFI_MFR_SST,
+		.dev_id		= SST38VF6401,
+		.name		= "SST 38VF6401",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
+		.dev_size	= SIZE_8MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 1,
+		.regions	= {
+			ERASEINFO(0x10000,128),
+		}
+	}, {
+		.mfr_id		= CFI_MFR_SST,
 		.dev_id		= SST36VF3203,
 		.name		= "SST 36VF3203",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
-- 
1.7.2.3
