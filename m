Received: from sproxy.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B9KX-0000Mv-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2002 07:49:57 +0000
Message-ID: <007d01c2895b$1a25cf70$b910340a@datus.com>
From: "Holger Speck" <hospe@gmx.de>
To: "Linux-MTD" <linux-mtd@lists.infradead.org>
Subject: jedec_probe.c
Date: Mon, 11 Nov 2002 09:18:42 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

Below some NumEraseRegions are set to correct values:

--- jedec_probe.c.orig 2002-11-11 09:01:07.000000000 +0100
+++ jedec_probe.c 2002-10-31 11:30:31.000000000 +0100
@@ -43,6 +43,7 @@
 #define AM29F080 0x00D5
 #define AM29F040 0x00A4
 #define AM29LV040B 0x004F
+#define AM29F032B 0x0041
 
 /* Atmel */
 #define AT49BV512 0x0003
@@ -147,6 +148,15 @@
 static const struct amd_flash_info jedec_table[] = {
  {
   mfr_id: MANUFACTURER_AMD,
+  dev_id: AM29F032B,
+  name: "AMD AM29F032B",
+  DevSize: SIZE_4MiB,
+  CmdSet: P_ID_AMD_STD,
+  NumEraseRegions: 1,
+  regions: {ERASEINFO(0x10000,64)
+  }
+ }, {
+  mfr_id: MANUFACTURER_AMD,
   dev_id: AM29LV160DT,
   name: "AMD AM29LV160DT",
   DevSize: SIZE_2MiB,
@@ -199,7 +209,7 @@
   name: "Toshiba TC58FVB321",
   DevSize: SIZE_4MiB,
   CmdSet: P_ID_AMD_STD,
-  NumEraseRegions: 4,
+  NumEraseRegions: 2,
   regions: {ERASEINFO(0x02000,8),
      ERASEINFO(0x10000,63)
   }
@@ -209,7 +219,7 @@
   name: "Toshiba TC58FVT321",
   DevSize: SIZE_4MiB,
   CmdSet: P_ID_AMD_STD,
-  NumEraseRegions: 4,
+  NumEraseRegions: 2,
   regions: {ERASEINFO(0x10000,63),
      ERASEINFO(0x02000,8)
   }
@@ -219,7 +229,7 @@
   name: "Toshiba TC58FVB641",
   DevSize: SIZE_8MiB,
   CmdSet: P_ID_AMD_STD,
-  NumEraseRegions: 4,
+  NumEraseRegions: 2,
   regions: {ERASEINFO(0x02000,8),
      ERASEINFO(0x10000,127)
   }
@@ -229,7 +239,7 @@
   name: "Toshiba TC58FVT641",
   DevSize: SIZE_8MiB,
   CmdSet: P_ID_AMD_STD,
-  NumEraseRegions: 4,
+  NumEraseRegions: 2,
   regions: {ERASEINFO(0x10000,127),
      ERASEINFO(0x02000,8)
   }

Holger
