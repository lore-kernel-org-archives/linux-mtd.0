Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9aMK-0006QB-5t
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 09:58:09 +0000
Received: by vws8 with SMTP id 8so6033653vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 02:58:06 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 12 Apr 2011 11:58:06 +0200
Message-ID: <BANLkTinozqCrqaDGsAX-gWWUg2G3bvg_Rg@mail.gmail.com>
Subject: mtd-utils: "flash_erase -j" failes with "unable to get NAND oobinfo"
	on large flash chips.
From: Daid <daid303@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've made a patch to fix flash_erase with large flash chips.
flash_erase uses MEMGETOOBSEL which no longer works if the ECC area is
larger then 32 bytes. ECCGETLAYOUT is the replacement ioctl.

This patch is based on the work of Stanley Miao, he made a patch in
June 2010 for flash_eraseall.
http://lists.infradead.org/pipermail/linux-mtd/2010-June/031981.html
I've implemented the backwards compatibility differently, checking
kernel versions doesn't feel correct.


diff -ur mtd-utils-v1.4.4/flash_erase.c mtd-utils-patch/flash_erase.c
--- mtd-utils-v1.4.4/flash_erase.c	2011-04-01 18:31:43.000000000 +0200
+++ mtd-utils-patch/flash_erase.c	2011-04-12 11:41:43.000000000 +0200
@@ -193,37 +193,57 @@
 		if (!isNAND)
 			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
 		else {
-			struct nand_oobinfo oobinfo;
+#if defined(ECCGETLAYOUT)
+			struct nand_ecclayout ecclayout;

-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
-				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
-
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+			memset(&ecclayout, 0, sizeof(ecclayout));
+			if (ioctl(fd, ECCGETLAYOUT, &ecclayout) == 0) {
 				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1])
-					return errmsg(" Eeep. Autoplacement selected and no empty space in oob");
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
+				if (!ecclayout.oobfree[0].length) {
+					fprintf(stderr, " Eeep. Autoplacement selected and no empty
space in oob\n");
+					return 1;
+	 			}
+				clmpos = ecclayout.oobfree[0].offset;
+				clmlen = ecclayout.oobfree[0].length;
 			} else {
-				/* Legacy mode */
-				switch (mtd.oob_size) {
-					case 8:
-						clmpos = 6;
-						clmlen = 2;
-						break;
-					case 16:
-						clmpos = 8;
-						clmlen = 8;
-						break;
-					case 64:
-						clmpos = 16;
+#endif/*defined(ECCGETLAYOUT)*/
+				/* new ECC interface failed or not available, fall back to old
OOB interface, which does not support large flash */
+				struct nand_oobinfo oobinfo;
+				if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
+					return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
+
+				/* Check for autoplacement */
+				if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+					/* Get the position of the free bytes */
+					if (!oobinfo.oobfree[0][1])
+						return errmsg(" Eeep. Autoplacement selected and no empty space in oob");
+					clmpos = oobinfo.oobfree[0][0];
+					clmlen = oobinfo.oobfree[0][1];
+					if (clmlen > 8)
 						clmlen = 8;
-						break;
+				} else {
+					/* Legacy mode */
+					switch (mtd.oob_size) {
+						case 8:
+							clmpos = 6;
+							clmlen = 2;
+							break;
+						case 16:
+							clmpos = 8;
+							clmlen = 8;
+							break;
+						case 64:
+							clmpos = 16;
+							clmlen = 8;
+							break;
+					}
 				}
+#if defined(ECCGETLAYOUT)
 			}
+#endif/*defined(ECCGETLAYOUT)*/
+
+			if (clmlen > 8)
+				clmlen = 8;
 			cleanmarker.totlen = cpu_to_je32(8);
 		}
 		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker,
sizeof(cleanmarker) - 4));
