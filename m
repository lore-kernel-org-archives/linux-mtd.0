Received: from las-dsl250-cust100.mpowercom.net
	([208.57.250.100] helo=mail.fortunet.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17w8TO-0007tk-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 22:53:02 +0100
Received: from fortunet.com (router [208.57.250.99])
	by mail.fortunet.com (8.9.3/8.9.3) with ESMTP id NAA12566
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 13:46:49 -0700
Message-ID: <3D98C719.6040602@fortunet.com>
Date: Mon, 30 Sep 2002 14:50:17 -0700
From: Boris Itkis <boris@fortunet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Support for Sharp's LH28F320BJE-PBTL90
Content-Type: multipart/mixed;
 boundary="------------050702070507060903050304"
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
--------------050702070507060903050304
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Added support for the Sharp's LH28F320BJE-PBTL90. This flash has 
problems with the F0 command.
I will ignore LH28F320BJE-PBTL90 twin (LH28F320BJE-PTTL90) until I can 
test it and see if it
need the fixup sequence.

Files affected:

drivers/mtd/chips/jedec_probe.c


--------------050702070507060903050304
Content-Type: text/plain;
 name="diff_f10_3"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="diff_f10_3"

diff -urN linux-2.4.19/drivers/mtd/chips/jedec_probe.c linux.orig/drivers/mtd/chips/jedec_probe.c
--- linux-2.4.19/drivers/mtd/chips/jedec_probe.c	Mon Sep 30 09:50:46 2002
+++ linux.orig/drivers/mtd/chips/jedec_probe.c	Mon Sep 30 10:04:06 2002
@@ -29,6 +29,7 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_TOSHIBA	0x0098
+#define MANUFACTURER_SHARP	0x00B0
 
 
 /* AMD */
@@ -110,6 +111,9 @@
 #define TC58FVT641	0x0093
 #define TC58FVB641	0x0095
 
+/* Sharp */
+#define LH28F320BJE_PBTL90	0x00E3
+
 
 struct amd_flash_info {
 	const __u16 mfr_id;
@@ -796,6 +800,16 @@
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,64),
 		}
+	}, {
+		mfr_id: MANUFACTURER_SHARP,
+		dev_id: LH28F320BJE_PBTL90,
+		name: "Sharp LH28F320BJE-PBTL90",
+		DevSize: SIZE_4MiB,
+		CmdSet:	P_ID_INTEL_STD,
+		NumEraseRegions: 2,
+		regions: {ERASEINFO(0x02000,8),
+			  ERASEINFO(0x10000,63)
+		}
 	} 
 };
 
@@ -840,6 +854,17 @@
 	 * this should be safe.
 	 */ 
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+
+	/* Fixup for sharp LH28F320BJE-PBTL90 */
+	/* Found by tryle and error for sum unkown reason if you send then 0xF0 they go
+	   into a bizzare state and they Need this sequence to actualy reset them
+	   (Boris Itkis 9-11-2002) */
+	if((cfi->mfr==MANUFACTURER_SHARP)&&(cfi->id==LH28F320BJE_PBTL90))
+	{
+		cfi_read(map, base);
+		cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	}
 
 }
 static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)

--------------050702070507060903050304--
