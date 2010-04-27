Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6aOu-0002O0-3E
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 02:19:53 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 27 Apr 2010 04:19:33 +0200
Message-Id: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
Subject: [PATCH 1/2] mtd/chips: add SST39WF160x NOR-flashes
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Due to a broken CFI, they have to be added to jedec_probe.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---

Sadly, those two cannot be detected using Guillaume's SST-patchset.

 drivers/mtd/chips/jedec_probe.c |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 8db1148..6850b23 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -166,6 +166,8 @@
 #define SST39LF160	0x2782
 #define SST39VF1601	0x234b
 #define SST39VF3201	0x235b
+#define SST39WF1601	0x274b
+#define SST39WF1602	0x274a
 #define SST39LF512	0x00D4
 #define SST39LF010	0x00D5
 #define SST39LF020	0x00D6
@@ -1529,6 +1531,34 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
+		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
+		.mfr_id		= MANUFACTURER_SST,
+		.dev_id		= SST39WF1601,
+		.name		= "SST 39WF1601",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_0xAAAA_0x5555,
+		.dev_size	= SIZE_2MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 2,
+		.regions	= {
+			ERASEINFO(0x1000,256),
+			ERASEINFO(0x1000,256)
+		}
+	}, {
+		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
+		.mfr_id		= MANUFACTURER_SST,
+		.dev_id		= SST39WF1602,
+		.name		= "SST 39WF1602",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_0xAAAA_0x5555,
+		.dev_size	= SIZE_2MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 2,
+		.regions	= {
+			ERASEINFO(0x1000,256),
+			ERASEINFO(0x1000,256)
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_SST,     /* should be CFI */
 		.dev_id		= SST39VF3201,
 		.name		= "SST 39VF3201",
-- 
1.7.0
