Received: from [195.149.178.206] (helo=mail.runaware.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ays2j-0005qE-Gn
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2004 12:33:37 +0000
Message-Id: <200403041233.i24CX6rl023928@mail.runaware.com>
From: "Christian Magnusson" <christian.magnusson@runaware.com>
To: <linux-mtd@lists.infradead.org>,
   "'uClinux development list'" <uclinux-dev@uclinux.org>
Date: Thu, 4 Mar 2004 13:35:10 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Support for AM29LV004T in mtd-driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



I'm using uClinux on my MCF5206eC3 evaluation board, and I noticed that the
AM29LV004T flash wasn't detected in jedec_probe.c.

I have tested it on the linux-2.4.24-uc0 kernel and it works perfect with
interleave 2 since there are 2 x 512Kb flash in the board.

I still haven't tried the patch for the linux-2.6.2-uc0 kernel yet, since I
was unsure about the .uaddr structure. Does anyone know for sure what it
should be set to?

/Christian




diff -u -r uClinux-dist/linux-2.4.x/drivers/mtd/chips/jedec_probe.c
uClinux-dist-test/linux-2.4.x/drivers/mtd/chips/jedec_probe.c
--- uClinux-dist/linux-2.4.x/drivers/mtd/chips/jedec_probe.c    Tue Feb 17
13:53:07 2004
+++ uClinux-dist-test/linux-2.4.x/drivers/mtd/chips/jedec_probe.c       Thu
Mar  4 10:29:29 2004
@@ -44,6 +44,8 @@
 #define AM29F040       0x00A4
 #define AM29LV040B     0x004F
 #define AM29F032B      0x0041
+#define AM29LV004T     0x00B5
+#define AM29LV004B     0x00B6
 
 /* Atmel */
 #define AT49BV512      0x0003
@@ -150,6 +152,30 @@
 static const struct amd_flash_info jedec_table[] = {
        {
                mfr_id: MANUFACTURER_AMD,
+               dev_id: AM29LV004T,
+               name: "AMD AM29LV004T",
+               DevSize: SIZE_512KiB,
+               CmdSet: P_ID_AMD_STD,
+               NumEraseRegions: 4,
+               regions: {ERASEINFO(0x10000,7),
+                         ERASEINFO(0x08000,1),
+                         ERASEINFO(0x02000,2),
+                         ERASEINFO(0x04000,1)
+               }
+       }, {
+               mfr_id: MANUFACTURER_AMD,
+               dev_id: AM29LV004B,
+               name: "AMD AM29LV004B",
+               DevSize: SIZE_512KiB,
+               CmdSet: P_ID_AMD_STD,
+               NumEraseRegions: 4,
+               regions: {ERASEINFO(0x04000,1),
+                         ERASEINFO(0x02000,2),
+                         ERASEINFO(0x08000,1),
+                         ERASEINFO(0x10000,7)
+               }
+       }, {
+               mfr_id: MANUFACTURER_AMD,
                dev_id: AM29F032B,
                name: "AMD AM29F032B",
                DevSize: SIZE_4MiB,



--- uClinux-dist-test/linux-2.6.x.old/drivers/mtd/chips/jedec_probe.c	Fri
Jan 30 00:22:39 2004
+++ uClinux-dist-test/linux-2.6.x/drivers/mtd/chips/jedec_probe.c	Thu
Mar  4 10:40:44 2004
@@ -50,6 +50,8 @@
 #define AM29F040	0x00A4
 #define AM29LV040B	0x004F
 #define AM29F032B	0x0041
+#define AM29LV004T	0x00B5
+#define AM29LV004B	0x00B6
 
 /* Atmel */
 #define AT49BV512	0x0003
@@ -239,6 +241,40 @@
 static const struct amd_flash_info jedec_table[] = {
 	{
 		.mfr_id		= MANUFACTURER_AMD,
+		.dev_id		= AM29LV004T,
+		.name		= "AMD AM29LV004T",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_512KiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x10000,7),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x04000,1)
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_AMD,
+		.dev_id		= AM29LV004B,
+		.name		= "AMD AM29LV004B",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_512KiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,7)
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_AMD,
 		.dev_id		= AM29F032B,
 		.name		= "AMD AM29F032B",
 		.uaddr		= {
