Received: from las-dsl250-cust100.mpowercom.net
	([208.57.250.100] helo=mail.fortunet.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17w8Sr-0007tY-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 22:52:29 +0100
Received: from fortunet.com (router [208.57.250.99])
	by mail.fortunet.com (8.9.3/8.9.3) with ESMTP id NAA12562
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 13:46:29 -0700
Message-ID: <3D98C705.5070408@fortunet.com>
Date: Mon, 30 Sep 2002 14:49:57 -0700
From: Boris Itkis <boris@fortunet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Support for Hynix's HY29LV800B & HY29LV800T
Content-Type: multipart/mixed;
 boundary="------------070107030907000401020409"
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

This is a multi-part message in MIME format.
--------------070107030907000401020409
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Added support for Hynix's HY29LV800B & HY29LV800T.

Files affected:

drivers/mtd/chips/amd_flash.c


--------------070107030907000401020409
Content-Type: text/plain;
 name="diff_f10_1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="diff_f10_1"

diff -urN linux-2.4.19/drivers/mtd/chips/amd_flash.c linux.orig/drivers/mtd/chips/amd_flash.c
--- linux-2.4.19/drivers/mtd/chips/amd_flash.c	Fri Aug  2 17:39:44 2002
+++ linux.orig/drivers/mtd/chips/amd_flash.c	Mon Sep 30 10:04:06 2002
@@ -57,6 +57,7 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_TOSHIBA	0x0098
+#define MANUFACTURER_HYNIX	0x00AD
 
 /* AMD */
 #define AM29F800BB	0x2258
@@ -89,6 +90,10 @@
 #define TC58FVT160	0x00C2
 #define TC58FVB160	0x0043
 
+/* Hynix */
+#define HY29LV800B	0x225B
+#define HY29LV800T	0x22DA
+
 #define D6_MASK	0x40
 
 struct amd_flash_private {
@@ -636,6 +641,30 @@
 		regions: {
 			{ offset: 0x000000, erasesize: 0x10000, numblocks: 31 },
 			{ offset: 0x1F0000, erasesize: 0x02000, numblocks:  8 }
+		}
+	}, {
+		mfr_id: MANUFACTURER_HYNIX,
+		dev_id: HY29LV800B,
+		name: "Hynix HY29LV800B",
+		size: 0x00100000,
+		numeraseregions: 4,
+		regions: {
+			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
+			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
+			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
+			{ offset: 0x010000, erasesize: 0x10000, numblocks: 15 }
+		}
+	}, {
+		mfr_id: MANUFACTURER_HYNIX,
+		dev_id: HY29LV800T,
+		name: "Hynix HY29LV800T",
+		size: 0x00100000,
+		numeraseregions: 4,
+		regions: {
+			{ offset: 0x000000, erasesize: 0x10000, numblocks: 15 },
+			{ offset: 0x0F0000, erasesize: 0x08000, numblocks:  1 },
+			{ offset: 0x0F8000, erasesize: 0x02000, numblocks:  2 },
+			{ offset: 0x0FC000, erasesize: 0x04000, numblocks:  1 }
 		}
 	} 
 	};

--------------070107030907000401020409--
