Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llsqc-0001p3-8L
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 22:42:47 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] flash_eraseall: create two functions from existing code
Date: Mon, 23 Mar 2009 23:42:16 +0100
Message-Id: <1237848138-18157-2-git-send-email-sebastian@breakpoint.cc>
In-Reply-To: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

create prepare_clean_marker() and write_clean_marker() from existing code.
The only difference to the earlier version is, that if the preparation of
a cleanmarker fails then the creation of clean markers is disabled instead
of an abort.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 flash_eraseall.c |  160 ++++++++++++++++++++++++++++++------------------------
 1 files changed, 90 insertions(+), 70 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..3da56ee 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -54,13 +54,97 @@ static void display_help (void);
 static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
+static int fd;
+static int clmpos;
+static int clmlen = 8;
+
+static int prepare_clean_marker(mtd_info_t *meminfo)
+{
+	cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
+	if (meminfo->type != MTD_NANDFLASH)
+		cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
+	else {
+		struct nand_oobinfo oobinfo;
+
+		if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
+			fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n",
+					exe_name, mtd_device);
+			return -1;
+		}
+
+		/* Check for autoplacement */
+		if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+			/* Get the position of the free bytes */
+			if (!oobinfo.oobfree[0][1]) {
+				fprintf (stderr, " Eeep. Autoplacement "
+					"selected and no empty space in oob\n");
+				return -1;
+			}
+			clmpos = oobinfo.oobfree[0][0];
+			clmlen = oobinfo.oobfree[0][1];
+			if (clmlen > 8)
+				clmlen = 8;
+		} else {
+			/* Legacy mode */
+			switch (meminfo->oobsize) {
+			case 8:
+				clmpos = 6;
+				clmlen = 2;
+				break;
+			case 16:
+				clmpos = 8;
+				clmlen = 8;
+				break;
+			case 64:
+				clmpos = 16;
+				clmlen = 8;
+				break;
+			}
+		}
+		cleanmarker.totlen = cpu_to_je32(8);
+	}
+	cleanmarker.hdr_crc = cpu_to_je32(crc32(0, &cleanmarker,
+				sizeof(struct jffs2_unknown_node) - 4));
+	return 0;
+}
+
+static void write_clean_marker(int fd, int erase_start, int isNAND)
+{
+	struct mtd_oob_buf oob;
+
+	if (isNAND) {
+		oob.ptr = (unsigned char *) &cleanmarker;
+		oob.start = erase_start + clmpos;
+		oob.length = clmlen;
+		if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
+			fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n",
+					exe_name, mtd_device, strerror(errno));
+			return;
+		}
+	} else {
+		if (lseek(fd, erase_start, SEEK_SET) < 0) {
+			fprintf(stderr, "\n%s: %s: MTD lseek failure: %s\n",
+					exe_name, mtd_device, strerror(errno));
+			return;
+		}
+		if (write(fd, &cleanmarker, sizeof(cleanmarker)) !=
+				sizeof(cleanmarker)) {
+			fprintf(stderr, "\n%s: %s: MTD write failure: %s\n",
+					exe_name, mtd_device, strerror(errno));
+			return;
+		}
+	}
+	if (!quiet)
+		printf(" Cleanmarker written at %x.", erase_start);
+}
 
 int main (int argc, char *argv[])
 {
 	mtd_info_t meminfo;
-	int fd, clmpos = 0, clmlen = 8;
 	erase_info_t erase;
 	int isNAND, bbtest = 1;
+	int ret;
 
 	process_options(argc, argv);
 
@@ -79,49 +163,9 @@ int main (int argc, char *argv[])
 	isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;
 
 	if (jffs2) {
-		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
-		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-		if (!isNAND)
-			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
-		else {
-			struct nand_oobinfo oobinfo;
-
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
-				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
-				return 1;
-			}
-
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
-					return 1;
-				}
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
-			} else {
-				/* Legacy mode */
-				switch (meminfo.oobsize) {
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
-						clmlen = 8;
-						break;
-				}
-			}
-			cleanmarker.totlen = cpu_to_je32(8);
-		}
-		cleanmarker.hdr_crc =  cpu_to_je32 (crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
+		ret = prepare_clean_marker(&meminfo);
+		if (ret < 0)
+			jffs2 = 0;
 	}
 
 	for (erase.start = 0; erase.start < meminfo.size; erase.start += meminfo.erasesize) {
@@ -155,31 +199,8 @@ int main (int argc, char *argv[])
 		}
 
 		/* format for JFFS2 ? */
-		if (!jffs2)
-			continue;
-
-		/* write cleanmarker */
-		if (isNAND) {
-			struct mtd_oob_buf oob;
-			oob.ptr = (unsigned char *) &cleanmarker;
-			oob.start = erase.start + clmpos;
-			oob.length = clmlen;
-			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
-				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
-				continue;
-			}
-		} else {
-			if (lseek (fd, erase.start, SEEK_SET) < 0) {
-				fprintf(stderr, "\n%s: %s: MTD lseek failure: %s\n", exe_name, mtd_device, strerror(errno));
-				continue;
-			}
-			if (write (fd , &cleanmarker, sizeof (cleanmarker)) != sizeof (cleanmarker)) {
-				fprintf(stderr, "\n%s: %s: MTD write failure: %s\n", exe_name, mtd_device, strerror(errno));
-				continue;
-			}
-		}
-		if (!quiet)
-			printf (" Cleanmarker written at %x.", erase.start);
+		if (jffs2)
+			write_clean_marker(fd, erase.start, isNAND);
 	}
 	if (!quiet) {
 		show_progress(&meminfo, &erase);
@@ -189,7 +210,6 @@ int main (int argc, char *argv[])
 	return 0;
 }
 
-
 void process_options (int argc, char *argv[])
 {
 	int error = 0;
-- 
1.6.0.6
