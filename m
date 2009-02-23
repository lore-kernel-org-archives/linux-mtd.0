Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbiT5-00076z-Mu
	for linux-mtd@lists.infradead.org; Mon, 23 Feb 2009 21:36:06 +0000
Received: id: bigeasy by Chamillionaire.breakpoint.cc with local
	(easymta 1.00 BETA 1) id 1LbiT2-0004Le-Sy
	for linux-mtd@lists.infradead.org; Mon, 23 Feb 2009 22:36:00 +0100
Date: Mon, 23 Feb 2009 22:36:00 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] flash_eraseall: remove support for clean markers
Message-ID: <20090223213600.GA15989@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clean markers are written by JFFS2 after mounting an empty flash media and
are used to identify. This is done by the kernel while mounting an empty
flash. The -j option should do the same thing after erasing a block.
This patch rips it out since it seems to be broken and has no advantage over
the kernel.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
Josh said in [1] that it should be fixed or removed. Since I can't see
any benefit of fixing this here is the remove.

[1] http://lists.infradead.org/pipermail/linux-mtd/2008-January/020274.html

 flash_eraseall.c |   84 ++---------------------------------------------------
 1 files changed, 4 insertions(+), 80 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..e0cfe1f 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -46,19 +46,16 @@
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet;		/* true -- don't output progress */
-static int jffs2;		// format for jffs2 usage
 
 static void process_options (int argc, char *argv[]);
 void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
 static void display_help (void);
 static void display_version (void);
-static struct jffs2_unknown_node cleanmarker;
-int target_endian = __BYTE_ORDER;
 
 int main (int argc, char *argv[])
 {
 	mtd_info_t meminfo;
-	int fd, clmpos = 0, clmlen = 8;
+	int fd;
 	erase_info_t erase;
 	int isNAND, bbtest = 1;
 
@@ -78,52 +75,6 @@ int main (int argc, char *argv[])
 	erase.length = meminfo.erasesize;
 	isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;
 
-	if (jffs2) {
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
-	}
-
 	for (erase.start = 0; erase.start < meminfo.size; erase.start += meminfo.erasesize) {
 		if (bbtest) {
 			loff_t offset = erase.start;
@@ -153,33 +104,6 @@ int main (int argc, char *argv[])
 			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name, mtd_device, strerror(errno));
 			continue;
 		}
-
-		/* format for JFFS2 ? */
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
 	}
 	if (!quiet) {
 		show_progress(&meminfo, &erase);
@@ -189,7 +113,6 @@ int main (int argc, char *argv[])
 	return 0;
 }
 
-
 void process_options (int argc, char *argv[])
 {
 	int error = 0;
@@ -230,7 +153,8 @@ void process_options (int argc, char *argv[])
 				quiet = 1;
 				break;
 			case 'j':
-				jffs2 = 1;
+				fprintf(stderr, "Clean markers for JFFS2 "
+						"will not be written\n");
 				break;
 			case '?':
 				error = 1;
@@ -263,7 +187,7 @@ void display_help (void)
 	printf("Usage: %s [OPTION] MTD_DEVICE\n"
 			"Erases all of the specified MTD device.\n"
 			"\n"
-			"  -j, --jffs2    format the device for jffs2\n"
+			"  -j, --jffs2    does nothing, left for compability.\n"
 			"  -q, --quiet    don't display progress messages\n"
 			"      --silent   same as --quiet\n"
 			"      --help     display this help and exit\n"
-- 
1.6.1.3
