Received: from mx1.mail.ru ([194.67.23.121])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cn2jR-00065p-15
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 17:37:22 -0500
From: Alexey Dobriyan <adobriyan@mail.ru>
To: dwmw2@redhat.com
Date: Sat, 8 Jan 2005 01:36:23 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200501080136.23339.adobriyan@mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] jedec_probe.c: add c99 initializers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- a/drivers/mtd/chips/jedec_probe.c	2005-01-08 01:20:33.805808392 +0200
+++ b/drivers/mtd/chips/jedec_probe.c	2005-01-08 01:24:16.630933824 +0200
@@ -514,15 +514,16 @@
 			ERASEINFO(0x10000,8),
 		}
 	}, {
-		mfr_id: MANUFACTURER_AMD,
-		dev_id: AM29F002T,
-		name: "AMD AM29F002T",
-		DevSize: SIZE_256KiB,
-		NumEraseRegions: 4,
-		regions: {ERASEINFO(0x10000,3),
-			  ERASEINFO(0x08000,1),
-			  ERASEINFO(0x02000,2),
-			  ERASEINFO(0x04000,1)
+		.mfr_id		= MANUFACTURER_AMD,
+		.dev_id		= AM29F002T,
+		.name		= "AMD AM29F002T",
+		.DevSize	= SIZE_256KiB,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x10000,3),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x04000,1)
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_ATMEL,
@@ -770,15 +771,16 @@
 			ERASEINFO(0x04000,1)
 		}
 	}, {
-		mfr_id: MANUFACTURER_HYUNDAI,
-		dev_id: HY29F002T,
-		name: "Hyundai HY29F002T",
-		DevSize: SIZE_256KiB,
-		NumEraseRegions: 4,
-		regions: {ERASEINFO(0x10000,3),
-			  ERASEINFO(0x08000,1),
-			  ERASEINFO(0x02000,2),
-			  ERASEINFO(0x04000,1)
+		.mfr_id		= MANUFACTURER_HYUNDAI,
+		.dev_id		= HY29F002T,
+		.name		= "Hyundai HY29F002T",
+		.DevSize	= SIZE_256KiB,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x10000,3),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x04000,1)
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_INTEL,
@@ -1177,15 +1179,16 @@
 			ERASEINFO(0x10000,7),
 		}
 	}, {
-		mfr_id: MANUFACTURER_MACRONIX,
-		dev_id: MX29F002T,
-		name: "Macronix MX29F002T",
-		DevSize: SIZE_256KiB,
-		NumEraseRegions: 4,
-		regions: {ERASEINFO(0x10000,3),
-			  ERASEINFO(0x08000,1),
-			  ERASEINFO(0x02000,2),
-			  ERASEINFO(0x04000,1)
+		.mfr_id		= MANUFACTURER_MACRONIX,
+		.dev_id		= MX29F002T,
+		.name		= "Macronix MX29F002T",
+		.DevSize	= SIZE_256KiB,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x10000,3),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x04000,1)
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_PMC,
@@ -1262,7 +1265,8 @@
  		.DevSize	= SIZE_256KiB,
  		.CmdSet		= P_ID_SST_PAGE,
  		.NumEraseRegions= 1,
- 		regions: {ERASEINFO(0x01000,64),
+ 		.regions	= {
+			ERASEINFO(0x01000,64),
  		}
          }, {
  		.mfr_id		= MANUFACTURER_SST,
@@ -1274,7 +1278,8 @@
  		.DevSize	= SIZE_256KiB,
  		.CmdSet		= P_ID_SST_PAGE,
  		.NumEraseRegions= 1,
- 		regions: {ERASEINFO(0x01000,64),
+ 		.regions	= {
+			ERASEINFO(0x01000,64),
  		}
 	}, {
 		.mfr_id		= MANUFACTURER_SST,
