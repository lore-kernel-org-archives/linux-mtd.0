Received: from rere.qmqm.pl ([89.167.52.164])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L2F5a-0001LW-GU
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 01:09:10 +0000
Date: Tue, 18 Nov 2008 02:09:02 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2.6.27.6] MTD: jedec_probe: add SST39SF040 chip
Message-ID: <20081118010902.GA4130@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Detect SST39SF040 chip (512kB, a bit bigger than SST39SF020A).

Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

--- linux-2.6.27.6-brfix1/drivers/mtd/chips/jedec_probe.c	2008-11-16 14:24:30.000000000 +0100
+++ rechot/drivers/mtd/chips/jedec_probe.c	2008-11-18 01:28:10.000000000 +0100
@@ -165,6 +165,7 @@
 #define SST39LF040	0x00D7
 #define SST39SF010A	0x00B5
 #define SST39SF020A	0x00B6
+#define SST39SF040	0x00B7
 #define SST49LF004B	0x0060
 #define SST49LF040B	0x0050
 #define SST49LF008A	0x005a
@@ -1392,6 +1393,18 @@
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_SST,
+		.dev_id		= SST39SF040,
+		.name		= "SST 39SF040",
+		.devtypes	= CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x5555_0x2AAA,
+		.dev_size	= SIZE_512KiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 1,
+		.regions	= {
+			ERASEINFO(0x01000,128),
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_SST,
 		.dev_id		= SST49LF040B,
 		.name		= "SST 49LF040B",
 		.devtypes	= CFI_DEVICETYPE_X8,
