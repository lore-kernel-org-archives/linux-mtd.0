Received: from mail-px0-f177.google.com ([209.85.212.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7qNH-0004ZH-Bg
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 14:07:39 +0000
Received: by pxi12 with SMTP id 12so170848pxi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 07:07:36 -0700 (PDT)
From: zhangyd <zhangyd6@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: chips: Add SST38VF640x NOR-flashes
Date: Mon, 18 Oct 2010 22:06:50 -0400
Message-Id: <1287454010-2718-1-git-send-email-zhangyd6@gmail.com>
Cc: Artem.Bityutskiy@nokia.com, ladis@linux-mips.org,
	zhangyd <zhangyd6@gmail.com>, w.sang@pengutronix.de,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Du to the wrong sector size description(The actual sector size is
8KBytes/sector, but the reporting size is 64KBytes/sector),you can get
the wrong size of the memory. So they should be moved to the jedec_probe.

Signed-off-by: yidong zhang<zhangyd6@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index d72a5fb..0e8df3b 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -163,6 +163,7 @@
 #define SST49LF030A	0x001C
 #define SST49LF040A	0x0051
 #define SST49LF080A	0x005B
+#define SST38VF6401	0x536B
 #define SST36VF3203	0x7354
 
 /* Toshiba */
@@ -1568,6 +1569,16 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,64),
 		}
 	}, {
+		.mfr_id		= CFI_MFR_SST,
+		.dev_id		= SST38VF6401,
+		.name		= "SST 38VF6401",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 1,
+		.regions	= {
+			ERASEINFO(0x10000,128),
+		}
+	}, {
 		.mfr_id		= CFI_MFR_ST,
 		.dev_id		= M29F800AB,
 		.name		= "ST M29F800AB",
-- 
1.7.2.3
