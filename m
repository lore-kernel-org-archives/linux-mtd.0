Received: from dsl-62-3-66-203.zen.co.uk
	([62.3.66.203] helo=crown.nexus.co.uk ident=foobar)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwJtZ-0003xt-CF
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 11:41:37 +0000
Received: from dsl-62-3-66-204.zen.co.uk ([62.3.66.204] helo=mill.nexus.co.uk)
	by crown.nexus.co.uk with esmtp (TLS-1.0:RSA_ARCFOUR_MD5:16)
	(Exim 4.30)
	id 1AwJtU-0003iD-0s
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 11:41:32 +0000
From: Philip Blundell <pb@nexus.co.uk>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-VdioIHaQulEY/iTc9PHD"
Message-Id: <1077795691.14444.50.camel@mill.nexus.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Feb 2004 11:41:31 +0000
Subject: patch for Alliance JEDEC devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VdioIHaQulEY/iTc9PHD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This patch adds support for Alliance AS29LV800 chips.  They use the same
command set as AMD, so it's just a case of recognising the ID numbers.

p.


--=-VdioIHaQulEY/iTc9PHD
Content-Disposition: attachment; filename=alliance.diff
Content-Type: text/x-patch; name=alliance.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: jedec_probe.c
===================================================================
RCS file: /cvs/linux/kernel26/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.12
diff -u -r1.12 jedec_probe.c
--- jedec_probe.c	8 Feb 2004 03:26:01 -0000	1.12
+++ jedec_probe.c	26 Feb 2004 11:39:06 -0000
@@ -26,6 +26,7 @@
 
 /* Manufacturers */
 #define MANUFACTURER_AMD	0x0001
+#define MANUFACTURER_ALLIANCE	0x0052
 #define MANUFACTURER_ATMEL	0x001f
 #define MANUFACTURER_FUJITSU	0x0004
 #define MANUFACTURER_INTEL	0x0089
@@ -53,6 +54,10 @@
 #define AM29LV040B	0x004F
 #define AM29F032B	0x0041
 
+/* Alliance */
+#define AS29LV800B	0x22DA
+#define AS29LV800T	0x225B
+
 /* Atmel */
 #define AT49BV512	0x0003
 #define AT29LV512	0x003d
@@ -244,6 +249,40 @@
  */
 static const struct amd_flash_info jedec_table[] = {
 	{
+		.mfr_id		= MANUFACTURER_ALLIANCE,
+		.dev_id		= AS29LV800B,
+		.name		= "Alliance AS29LV800B",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_1MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,15),
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_ALLIANCE,
+		.dev_id		= AS29LV800T,
+		.name		= "Alliance AS29LV800T",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_1MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,15),
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_AMD,
 		.dev_id		= AM29F032B,
 		.name		= "AMD AM29F032B",

--=-VdioIHaQulEY/iTc9PHD--
