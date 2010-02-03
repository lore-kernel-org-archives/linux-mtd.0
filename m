Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcX1m-0005we-5B
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 04:39:50 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o134djRb029318
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 20:39:45 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] clean up the legacy interfaces in nandwrite.c
Date: Wed,  3 Feb 2010 12:45:50 +0800
Message-Id: <1265172354-26682-2-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
References: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ioctl command "MEMSETOOBSEL" doesn't exist in the current linux kernel
anymore, and the arguments "forcelegacy", "jffs2", "yaffs", "noecc" are not
suitable with the current linux kernel, so clean them up.

Although the ioctl comand "MEMGETOOBSEL" still exist in the current linux
kernel, it is not suitable with some platforms with the NAND ECC data longer
than 32 bytes, so replace it with the new command "ECCGETLAYOUT"

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 nandwrite.c |  181 +++++-----------------------------------------------------
 1 files changed, 16 insertions(+), 165 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index b77edd6..c66eda0 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -45,26 +45,6 @@
 #define MAX_PAGE_SIZE	4096
 #define MAX_OOB_SIZE	128
 
-// oob layouts to pass into the kernel as default
-static struct nand_oobinfo none_oobinfo = {
-	.useecc = MTD_NANDECC_OFF,
-};
-
-static struct nand_oobinfo jffs2_oobinfo = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = { 0, 1, 2, 3, 6, 7 }
-};
-
-static struct nand_oobinfo yaffs_oobinfo = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = { 8, 9, 10, 13, 14, 15}
-};
-
-static struct nand_oobinfo autoplace_oobinfo = {
-	.useecc = MTD_NANDECC_AUTOPLACE
-};
 
 static void display_help (void)
 {
@@ -72,13 +52,7 @@ static void display_help (void)
 "Usage: nandwrite [OPTION] MTD_DEVICE [INPUTFILE|-]\n"
 "Writes to the specified MTD device.\n"
 "\n"
-"  -a, --autoplace         Use auto oob layout\n"
-"  -j, --jffs2             Force jffs2 oob layout (legacy support)\n"
-"  -y, --yaffs             Force yaffs oob layout (legacy support)\n"
-"  -f, --forcelegacy       Force legacy support on autoplacement-enabled mtd\n"
-"                          device\n"
 "  -m, --markbad           Mark blocks bad if write fails\n"
-"  -n, --noecc             Write without ecc\n"
 "  -o, --oob               Image contains oob data\n"
 "  -s addr, --start=addr   Set start address (default is 0)\n"
 "  -p, --pad               Pad to page size\n"
@@ -110,12 +84,7 @@ static const char	*mtd_device, *img;
 static int		mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
-static bool		autoplace = false;
 static bool		markbad = false;
-static bool		forcejffs2 = false;
-static bool		forceyaffs = false;
-static bool		forcelegacy = false;
-static bool		noecc = false;
 static bool		pad = false;
 static int		blockalign = 1; /*default to using 16K block size */
 
@@ -125,21 +94,16 @@ static void process_options (int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "ab:fjmnopqs:y";
+		static const char *short_options = "b:mopqs:";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
-			{"autoplace", no_argument, 0, 'a'},
 			{"blockalign", required_argument, 0, 'b'},
-			{"forcelegacy", no_argument, 0, 'f'},
-			{"jffs2", no_argument, 0, 'j'},
 			{"markbad", no_argument, 0, 'm'},
-			{"noecc", no_argument, 0, 'n'},
 			{"oob", no_argument, 0, 'o'},
 			{"pad", no_argument, 0, 'p'},
 			{"quiet", no_argument, 0, 'q'},
 			{"start", required_argument, 0, 's'},
-			{"yaffs", no_argument, 0, 'y'},
 			{0, 0, 0, 0},
 		};
 
@@ -163,21 +127,6 @@ static void process_options (int argc, char * const argv[])
 			case 'q':
 				quiet = true;
 				break;
-			case 'a':
-				autoplace = true;
-				break;
-			case 'j':
-				forcejffs2 = true;
-				break;
-			case 'y':
-				forceyaffs = true;
-				break;
-			case 'f':
-				forcelegacy = true;
-				break;
-			case 'n':
-				noecc = true;
-				break;
 			case 'm':
 				markbad = true;
 				break;
@@ -251,8 +200,7 @@ int main(int argc, char * const argv[])
 	struct mtd_oob_buf oob;
 	loff_t offs;
 	int ret;
-	int oobinfochanged = 0;
-	struct nand_oobinfo old_oobinfo;
+	struct nand_ecclayout ecclayout;
 	bool failed = true;
 	// contains all the data read from the file so far for the current eraseblock
 	unsigned char *filebuf = NULL;
@@ -300,86 +248,16 @@ int main(int argc, char * const argv[])
 		exit (EXIT_FAILURE);
 	}
 
-	if (autoplace) {
-		/* Read the current oob info */
-		if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-			perror ("MEMGETOOBSEL");
-			close (fd);
-			exit (EXIT_FAILURE);
-		}
-
-		// autoplace ECC ?
-		if (autoplace && (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE)) {
-
-			if (ioctl (fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
-				perror ("MEMSETOOBSEL");
-				close (fd);
-				exit (EXIT_FAILURE);
-			}
-			oobinfochanged = 1;
-		}
-	}
-
-	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
-		if (ret == 0) {
-			oobinfochanged = 2;
-		} else {
-			switch (errno) {
-			case ENOTTY:
-				if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-					perror ("MEMGETOOBSEL");
-					close (fd);
-					exit (EXIT_FAILURE);
-				}
-				if (ioctl (fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
-					perror ("MEMSETOOBSEL");
-					close (fd);
-					exit (EXIT_FAILURE);
-				}
-				oobinfochanged = 1;
-				break;
-			default:
-				perror ("MTDFILEMODE");
-				close (fd);
-				exit (EXIT_FAILURE);
-			}
-		}
-	}
-
-	/*
-	 * force oob layout for jffs2 or yaffs ?
-	 * Legacy support
-	 */
-	if (forcejffs2 || forceyaffs) {
-		struct nand_oobinfo *oobsel = forcejffs2 ? &jffs2_oobinfo : &yaffs_oobinfo;
 
-		if (autoplace) {
-			fprintf(stderr, "Autoplacement is not possible for legacy -j/-y options\n");
-			goto restoreoob;
-		}
-		if ((old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) && !forcelegacy) {
-			fprintf(stderr, "Use -f option to enforce legacy placement on autoplacement enabled mtd device\n");
-			goto restoreoob;
-		}
-		if (meminfo.oobsize == 8) {
-			if (forceyaffs) {
-				fprintf (stderr, "YAFSS cannot operate on 256 Byte page size");
-				goto restoreoob;
-			}
-			/* Adjust number of ecc bytes */
-			jffs2_oobinfo.eccbytes = 3;
-		}
+	oob.length = meminfo.oobsize;
+	oob.ptr =  oobbuf;
 
-		if (ioctl (fd, MEMSETOOBSEL, oobsel) != 0) {
-			perror ("MEMSETOOBSEL");
-			goto restoreoob;
-		}
+	if (ioctl(fd, ECCGETLAYOUT, &ecclayout) != 0) {
+		perror("ECCGETLAYOUT");
+		close(fd);
+		exit(EXIT_FAILURE);
 	}
 
-	oob.length = meminfo.oobsize;
-	oob.ptr = noecc ? oobreadbuf : oobbuf;
-
 	/* Determine if we are reading from standard input or from a file. */
 	if (strcmp(img, standard_input) == 0) {
 		ifd = STDIN_FILENO;
@@ -543,6 +421,7 @@ int main(int argc, char * const argv[])
 		}
 
 		if (writeoob) {
+			int i, start, len;
 			oobreadbuf = writebuf + meminfo.writesize;
 
 			// Read more data for the OOB from the input if there isn't enough in the buffer
@@ -579,34 +458,13 @@ int main(int argc, char * const argv[])
 				}
 			}
 
-			if (noecc) {
-				oob.ptr = oobreadbuf;
-			} else {
-				int i, start, len;
-				/*
-				 *  We use autoplacement and have the oobinfo with the autoplacement
-				 * information from the kernel available
-				 *
-				 * Modified to support out of order oobfree segments,
-				 * such as the layout used by diskonchip.c
-				 */
-				if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
-					for (i = 0;old_oobinfo.oobfree[i][1]; i++) {
-						/* Set the reserved bytes to 0xff */
-						start = old_oobinfo.oobfree[i][0];
-						len = old_oobinfo.oobfree[i][1];
-						memcpy(oobbuf + start,
-								oobreadbuf + start,
-								len);
-					}
-				} else {
-					/* Set at least the ecc byte positions to 0xff */
-					start = old_oobinfo.eccbytes;
-					len = meminfo.oobsize - start;
-					memcpy(oobbuf + start,
-							oobreadbuf + start,
-							len);
-				}
+			for (i = 0; ecclayout.oobfree[i].length; i++) {
+				/* Set the reserved bytes to 0xff */
+				start = ecclayout.oobfree[i].offset;
+				len = ecclayout.oobfree[i].length;
+				memcpy(oobbuf + start,
+						oobreadbuf + start,
+						len);
 			}
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
@@ -666,13 +524,6 @@ closeall:
 	close(ifd);
 
 restoreoob:
-	if (oobinfochanged == 1) {
-		if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
-			perror ("MEMSETOOBSEL");
-			close (fd);
-			exit (EXIT_FAILURE);
-		}
-	}
 
 	close(fd);
 
-- 
1.5.4.3
