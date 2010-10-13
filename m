Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6kKh-00085x-27
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 13:28:27 +0000
Received: by gyf1 with SMTP id 1so377424gyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 06:28:26 -0700 (PDT)
From: zhangyd <zhangyd6@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] [MTD] [CHIPS] Add JEDEC probe support for the SST38VF6401
	flash chip
Date: Wed, 13 Oct 2010 13:54:42 -0400
Message-Id: <1286992482-6009-1-git-send-email-zhangyd6@gmail.com>
Cc: Artem.Bityutskiy@nokia.com, ladis@linux-mips.org,
	zhangyd <zhangyd6@gmail.com>, jkosina@suse.cz,
	w.sang@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add SST38VF6401(64Mbit) chip to jedec_probe. Sorry for the wrong description of the flash size in last patch. 

Signed-off-by: yidong zhang<zhangyd6@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index d72a5fb..b7a1016 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -163,6 +163,7 @@
 #define SST49LF030A	0x001C
 #define SST49LF040A	0x0051
 #define SST49LF080A	0x005B
+#define SST38VF6401	0x536B
 #define SST36VF3203	0x7354
 
 /* Toshiba */
@@ -1569,6 +1570,18 @@ static const struct amd_flash_info jedec_table[] = {
 		}
 	}, {
 		.mfr_id		= CFI_MFR_ST,
+		.dev_id		= SST38VF6401,
+		.name		= "SST 38VF6401",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_0X0AAA_0x555,
+		.dev_size	= SIZE_8MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 1,
+		.regions	= {
+			ERASEINFO(0x10000,128),
+		}
+	}, {
+		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M29F800AB,
 		.name		= "ST M29F800AB",
 		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
-- 
1.7.2.3
