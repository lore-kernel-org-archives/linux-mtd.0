Received: from webbox180.server-home.net ([62.208.70.182])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19X5GP-0005zW-5l
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2003 21:28:37 +0100
Received: from clagi.de (A20fe.pppool.de [213.6.32.254])
	by webbox180.server-home.net (Postfix) with ESMTP id C5400829F84
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Jun 2003 22:29:01 +0200 (CEST)
Message-ID: <3F009D87.2090401@clagi.de>
Date: Mon, 30 Jun 2003 22:28:55 +0200
From: Guido Classen <guido@clagi.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] some additional ST M29Fxxx 8bit JEDEC chips for 2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hallo,

I've add some 8bit chips from ST to the chip table in jedec_probe.c
from kernel 2.4.21. I've testet the M29F040B and it seems to work
pretty well with MTD and jffs2.

Guido


-----------------------------------------------------
--- drivers/mtd/chips/jedec_probe.c	2003-06-30 17:28:28.000000000 +0200
+++ drivers/mtd/chips/jedec_probe.c	2003-06-30 18:01:28.000000000 +0200
@@ -98,6 +98,12 @@
  #define M29W160DT	0x22C4
  #define M29W160DB	0x2249
  #define M29W040B	0x00E3
+/* 2003-06-06 gc:  */
+#define M29F010B        0x0020  /*  8 blocks a 16kByte */
+#define M29F040B        0x00e2  /*  8 blocks a 64kByte */
+#define M29F080D        0x00f1  /* 16 blocks a 64kByte */
+#define M29F016D        0x00ad  /* 32 blocks a 64kByte */
+#define M29F032D        0x00ac  /* 64 blocks a 64kByte */

  /* SST */
  #define SST29EE512	0x005d
@@ -649,6 +655,42 @@
  			  ERASEINFO(0x10000,31)
  		}
  	}, {
+ 		mfr_id: MANUFACTURER_ST,
+ 		dev_id: M29F010B,
+ 		name: "ST M29F010B",
+ 		DevSize: SIZE_128KiB,
+ 		NumEraseRegions: 1,
+ 		regions: {ERASEINFO(0x04000,8),
+ 		}
+ 	}, {
+ 		mfr_id: MANUFACTURER_ST,
+ 		dev_id: M29F040B,
+ 		name: "ST M29F040B",
+ 		DevSize: SIZE_512KiB,
+ 		NumEraseRegions: 1,
+ 		regions: {ERASEINFO(0x10000, 8) }
+ 	}, {
+ 		mfr_id: MANUFACTURER_ST,
+ 		dev_id: M29F080D,
+ 		name: "ST M29F080D",
+ 		DevSize: SIZE_1MiB,
+ 		NumEraseRegions: 1,
+ 		regions: {ERASEINFO(0x10000, 16) }
+ 	}, {
+ 		mfr_id: MANUFACTURER_ST,
+ 		dev_id: M29F016D,
+ 		name: "ST M29F016D",
+ 		DevSize: SIZE_2MiB,
+ 		NumEraseRegions: 1,
+ 		regions: {ERASEINFO(0x10000, 32) }
+ 	}, {
+ 		mfr_id: MANUFACTURER_ST,
+ 		dev_id: M29F032D,
+ 		name: "ST M29F032D",
+ 		DevSize: SIZE_4MiB,
+ 		NumEraseRegions: 1,
+ 		regions: {ERASEINFO(0x10000, 64) }
+	}, {
  		mfr_id: MANUFACTURER_ATMEL,
  		dev_id: AT49BV512,
  		name: "Atmel AT49BV512",
