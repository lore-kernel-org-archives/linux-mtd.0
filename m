Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 187Amk-0002ii-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 08:34:38 +0000
Subject: [PATCH] Support HY28F002T parts in JEDEC probe
From: Ian Campbell <icampbell@arcomcontrols.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="=-vtGfpqJqTpCkfMveJC5m"
Date: 31 Oct 2002 08:58:56 +0000
Message-Id: <1036054736.10939.10.camel@LinuxDev>
Mime-Version: 1.0
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

--=-vtGfpqJqTpCkfMveJC5m
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I'm not sure if this is useful, but I thought I'd contribute it back.

The attached patch causes the JEDEC probe to recognize parts of type
HY28F002T, this is a 256k EEPROM which we happen to use on some of our
boards for the BIOS.
 
Cheers,
Ian.
-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 403465
E-Mail: icampbell@arcomcontrols.com
Web: http://www.arcomcontrols.com


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
--=-vtGfpqJqTpCkfMveJC5m
Content-Disposition: attachment; filename=mtd.hy29f002t.jedec.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=mtd.hy29f002t.jedec.patch; charset=ISO-8859-1

diff -urN kernel-2.4.18.orig/drivers/mtd/chips/jedec_probe.c kernel-2.4.18/=
drivers/mtd/chips/jedec_probe.c
--- kernel-2.4.18.orig/drivers/mtd/chips/jedec_probe.c	Fri Nov  9 22:29:40 =
2001
+++ kernel-2.4.18/drivers/mtd/chips/jedec_probe.c	Tue May 28 11:30:08 2002
@@ -26,6 +26,7 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_TOSHIBA	0x0098
+#define MANUFACTURER_HYUNDAI	0x00AD
=20
 /* AMD */
 #define AM29F800BB	0x2258
@@ -34,6 +35,7 @@
 #define AM29LV800BT	0x22DA
 #define AM29LV160DT	0x22C4
 #define AM29LV160DB	0x2249
+#define AM29F002T	0x00B0
=20
 /* Atmel */
 #define AT49BV16X4	0x00c0
@@ -56,6 +58,8 @@
 #define TC58FVT160	0x00C2
 #define TC58FVB160	0x0043
=20
+/* Hyundai */
+#define HY29F002T	0x00B0
=20
 struct amd_flash_info {
 	const __u16 mfr_id;
@@ -69,6 +73,7 @@
=20
 #define ERASEINFO(size,blocks) (size<<8)|(blocks-1)
=20
+#define SIZE_256KiB 18
 #define SIZE_1MiB 20
 #define SIZE_2MiB 21
 #define SIZE_4MiB 22
@@ -248,6 +253,28 @@
                           ERASEINFO(0x08000,2),
 			  ERASEINFO(0x02000,8)
                 }
+	}, {
+                mfr_id: MANUFACTURER_AMD,
+                dev_id: AM29F002T,
+                name: "AMD AM29F002T",
+                DevSize: SIZE_256KiB,
+                NumEraseRegions: 4,
+                regions: {ERASEINFO(0x10000,3),
+                          ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1)
+                }
+	}, {
+                mfr_id: MANUFACTURER_HYUNDAI,
+                dev_id: HY29F002T,
+                name: "Hyundau HY29F002T",
+                DevSize: SIZE_256KiB,
+                NumEraseRegions: 4,
+                regions: {ERASEINFO(0x10000,3),
+                          ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1)
+                }
 	}=20
 };
=20
@@ -334,7 +361,7 @@
 	=09
 		cfi->mfr =3D jedec_read_mfr(map, base, osf);
 		cfi->id =3D jedec_read_id(map, base, osf);
-	=09
+
 		for (i=3D0; i<sizeof(jedec_table)/sizeof(jedec_table[0]); i++) {
 			if (cfi->mfr =3D=3D jedec_table[i].mfr_id &&
 			    cfi->id =3D=3D jedec_table[i].dev_id)

--=-vtGfpqJqTpCkfMveJC5m--
