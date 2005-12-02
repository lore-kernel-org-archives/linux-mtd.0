Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ei4ys-0002gR-22
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 02:05:24 -0500
Message-ID: <438FF22A.2060203@ru.mvista.com>
Date: Fri, 02 Dec 2005 10:05:14 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------030203040003070407020304"
Subject: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get rid
 of MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030203040003070407020304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
this patch reorganizes the MTD utls to
- not use MEMGETOOBSEL/MEMSETOOBSEL ioctls as they're planned for 
removal and anyway not needed
- use MEMGETOOBAVAIL ioctl to get the number of available OOB bytes and 
read/write OOB accordingly

Any input is most welcome.

Vitaly



--------------030203040003070407020304
Content-Type: text/plain;
 name="mtd-util.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-util.patch"

Index: util/flash_eraseall.c
===================================================================
RCS file: /home/cvs/mtd/util/flash_eraseall.c,v
retrieving revision 1.24
diff -u -r1.24 flash_eraseall.c
--- util/flash_eraseall.c	7 Nov 2005 11:15:10 -0000	1.24
+++ util/flash_eraseall.c	2 Dec 2005 06:54:11 -0000
@@ -59,10 +59,11 @@
 int main (int argc, char *argv[])
 {
 	mtd_info_t meminfo;
-	int fd, ebhpos = 0, ebhlen = 0;
+	int fd;
 	erase_info_t erase;
 	int isNAND, bbtest = 1;
 	uint32_t pages_per_eraseblock, available_oob_space;
+	uint32_t oobavail;
 
 	process_options(argc, argv);
 
@@ -95,41 +96,13 @@
 					 sizeof(struct jffs2_raw_ebh) - sizeof(struct jffs2_unknown_node) - 4));
 
 		if (isNAND) {
-			struct nand_oobinfo oobinfo;
-
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
-				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
+			if (ioctl(fd, MEMGETOOBAVAIL, &oobavail) != 0) {
+				fprintf(stderr, "%s: %s: unable to get NAND oobavail\n", exe_name, mtd_device);
 				exit(1);
 			}
 
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
-					exit(1);
-				}
-				ebhpos = oobinfo.oobfree[0][0];
-				ebhlen = oobinfo.oobfree[0][1];
-			} else {
-				/* Legacy mode */
-				switch (meminfo.oobsize) {
-				case 8:
-					ebhpos = 6;
-					ebhlen = 2;
-					break;
-				case 16:
-					ebhpos = 8;
-					ebhlen = 8;
-					break;
-				case 64:
-					ebhpos = 16;
-					ebhlen = 8;
-					break;
-				}
-			}
 			pages_per_eraseblock = meminfo.erasesize/meminfo.oobblock;
-			available_oob_space = ebhlen * pages_per_eraseblock;
+			available_oob_space = oobavail * pages_per_eraseblock;
 			if (available_oob_space < sizeof(struct jffs2_raw_ebh)) {
 				fprintf(stderr, "The OOB area(%d) is not big enough to hold eraseblock_header(%d)", available_oob_space, sizeof(struct jffs2_raw_ebh));
 				exit(1);
@@ -180,20 +153,12 @@
 		/* write cleanmarker */
 		if (isNAND) {
 			struct mtd_oob_buf oob;
-			uint32_t i = 0, written = 0;
 
-			while (written < sizeof(struct jffs2_raw_ebh)) {
-				oob.ptr = (unsigned char *) &ebh + written;
-				oob.start = erase.start + meminfo.oobblock*i + ebhpos;
-				oob.length = (sizeof(struct jffs2_raw_ebh) - written) < ebhlen ? (sizeof(struct jffs2_raw_ebh) - written) : ebhlen;
-				if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
-					fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
-					break;
-				}
-				i++;
-				written += oob.length;
-			}
-			if (written < sizeof(struct jffs2_raw_ebh)) {
+			oob.ptr = (unsigned char *) &ebh;
+			oob.start = erase.start;
+			oob.length = sizeof(struct jffs2_raw_ebh) < oobavail ? sizeof(struct jffs2_raw_ebh) : oobavail;
+			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
+				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
 			}
 		} else {
Index: util/nanddump.c
===================================================================
RCS file: /home/cvs/mtd/util/nanddump.c,v
retrieving revision 1.29
diff -u -r1.29 nanddump.c
--- util/nanddump.c	7 Nov 2005 11:15:13 -0000	1.29
+++ util/nanddump.c	2 Dec 2005 06:54:11 -0000
@@ -163,6 +163,7 @@
 	struct mtd_oob_buf oob = {0, 16, oobbuf};
 	mtd_info_t meminfo;
 	char pretty_buf[80];
+	uint32_t oobavail;
 
  	process_options(argc, argv);
 
@@ -179,6 +180,13 @@
 		exit (1);
 	}
 
+	if (ioctl(fd, MEMGETOOBAVAIL, &oobavail) != 0) {
+		perror("unable to get NAND oobavail");
+		close(fd);
+		exit(1);
+	}
+
+
 	/* Make sure device page sizes are valid */
 	if (!(meminfo.oobsize == 64 && meminfo.oobblock == 2048) &&
 	    !(meminfo.oobsize == 16 && meminfo.oobblock == 512) &&
@@ -208,7 +216,7 @@
 	bs = meminfo.oobblock;
 
 	/* Print informative message */
-	fprintf(stderr, "Block size %u, page size %u, OOB size %u\n", meminfo.erasesize, meminfo.oobblock, meminfo.oobsize);
+	fprintf(stderr, "Block size %u, page size %u, OOB size %u, OOB free size%u\n", meminfo.erasesize, meminfo.oobblock, meminfo.oobsize, oobavail);
 	fprintf(stderr, "Dumping data starting at 0x%08x and ending at 0x%08x...\n",
 	        (unsigned int) start_addr, (unsigned int) end_addr);
 
@@ -260,10 +268,11 @@
 			continue;
 
 		if (badblock) {
-			memset (readbuf, 0xff, meminfo.oobsize);
+			memset (readbuf, 0xff, oobavail);
 		} else {
 			/* Read OOB data and exit on failure */
 			oob.start = ofs;
+			oob.length = oobavail;
 			if (ioctl(fd, MEMREADOOB, &oob) != 0) {
 				perror("ioctl(MEMREADOOB)");
 				goto closeall;
@@ -272,29 +281,17 @@
 
 		/* Write out OOB data */
 		if (pretty_print) {
-			if (meminfo.oobsize < 16) {
-				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
-					"%02x %02x\n",
-					oobbuf[0], oobbuf[1], oobbuf[2],
-					oobbuf[3], oobbuf[4], oobbuf[5],
-					oobbuf[6], oobbuf[7]);
-				write(ofd, pretty_buf, 48);
-				continue;
+			for (i = 0; i < oobavail; i += 16) {
+				int j;
+				sprintf(pretty_buf, "  OOB Data: ");
+				for (j = 0; 
+				     j < (oobavail-i < 16 ? oobavail-i : 16);
+				     j++) 
+					sprintf(pretty_buf + strlen(pretty_buf), "%02x ", oobbuf[i+j]);
+				sprintf(pretty_buf + strlen(pretty_buf), "\n");
+				write(ofd, pretty_buf, strlen(pretty_buf)+1);
 			}
-
-			for (i = 0; i < meminfo.oobsize; i += 16) {
-				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
-					"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-					oobbuf[i], oobbuf[i+1], oobbuf[i+2],
-					oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
-					oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
-					oobbuf[i+9], oobbuf[i+10], oobbuf[i+11],
-					oobbuf[i+12], oobbuf[i+13], oobbuf[i+14],
-					oobbuf[i+15]);
-				write(ofd, pretty_buf, 60);
-			}
-		} else
-			write(ofd, oobbuf, meminfo.oobsize);
+		}
 	}
 
 	/* Close the output file and MTD device */
Index: util/nandwrite.c
===================================================================
RCS file: /home/cvs/mtd/util/nandwrite.c,v
retrieving revision 1.32
diff -u -r1.32 nandwrite.c
--- util/nandwrite.c	7 Nov 2005 11:15:13 -0000	1.32
+++ util/nandwrite.c	2 Dec 2005 06:54:11 -0000
@@ -50,36 +50,11 @@
 unsigned char oobbuf[MAX_OOB_SIZE];
 unsigned char oobreadbuf[MAX_OOB_SIZE];
 
-// oob layouts to pass into the kernel as default
-struct nand_oobinfo none_oobinfo = {
-	.useecc = MTD_NANDECC_OFF,
-};
-
-struct nand_oobinfo jffs2_oobinfo = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = { 0, 1, 2, 3, 6, 7 }
-};
-
-struct nand_oobinfo yaffs_oobinfo = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = { 8, 9, 10, 13, 14, 15}
-};
-
-struct nand_oobinfo autoplace_oobinfo = {
-	.useecc = MTD_NANDECC_AUTOPLACE
-};
-
 void display_help (void)
 {
 	printf("Usage: nandwrite [OPTION] MTD_DEVICE INPUTFILE\n"
 	       "Writes to the specified MTD device.\n"
 	       "\n"
-	       "  -a, --autoplace  	Use auto oob layout\n"
-	       "  -j, --jffs2  	 	force jffs2 oob layout (legacy support)\n"
-	       "  -y, --yaffs  	 	force yaffs oob layout (legacy support)\n"
-	       "  -f, --forcelegacy     force legacy support on autoplacement enabled mtd device\n"
 	       "  -n, --noecc		write without ecc\n"
 	       "  -o, --oob    	 	image contains oob data\n"
 	       "  -s addr, --start=addr set start address (default is 0)\n"
@@ -110,10 +85,6 @@
 int 	mtdoffset = 0;
 int 	quiet = 0;
 int	writeoob = 0;
-int	autoplace = 0;
-int	forcejffs2 = 0;
-int	forceyaffs = 0;
-int	forcelegacy = 0;
 int	noecc = 0;
 int	pad = 0;
 int	blockalign = 1; /*default to using 16K block size */
@@ -124,20 +95,16 @@
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "ab:fjnopqs:y";
+		static const char *short_options = "b:nopqs:";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
-			{"autoplace", no_argument, 0, 'a'},
 		   	{"blockalign", required_argument, 0, 'b'},
-			{"forcelegacy", no_argument, 0, 'f'},
-			{"jffs2", no_argument, 0, 'j'},
 			{"noecc", no_argument, 0, 'n'},
 			{"oob", no_argument, 0, 'o'},
 			{"pad", no_argument, 0, 'p'},
 			{"quiet", no_argument, 0, 'q'},
 			{"start", required_argument, 0, 's'},
-			{"yaffs", no_argument, 0, 'y'},
 			{0, 0, 0, 0},
 		};
 
@@ -161,18 +128,6 @@
 		case 'q':
 			quiet = 1;
 			break;
-		case 'a':
-			autoplace = 1;
-			break;
-		case 'j':
-			forcejffs2 = 1;
-			break;
-		case 'y':
-			forceyaffs = 1;
-			break;
-		case 'f':
-			forcelegacy = 1;
-			break;
 		case 'n':
 			noecc = 1;
 			break;
@@ -211,8 +166,7 @@
 	struct mtd_oob_buf oob;
 	loff_t offs;
 	int ret, readlen;
-	int oobinfochanged = 0;
-	struct nand_oobinfo old_oobinfo;
+	uint32_t oobavail;
 
 	process_options(argc, argv);
 
@@ -236,6 +190,12 @@
 		exit(1);
 	}
 
+	if (ioctl(fd, MEMGETOOBAVAIL, &oobavail) != 0) {
+		perror("unable to get NAND oobavail");
+		close(fd);
+		exit(1);
+	}
+
         /* Set erasesize to specified number of blocks - to match jffs2 (virtual) block size */
         meminfo.erasesize *= blockalign;
 
@@ -248,78 +208,20 @@
 		exit(1);
 	}
 
-	/* Read the current oob info */
-	if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-		perror ("MEMGETOOBSEL");
-		close (fd);
-		exit (1);
-	}
-
-	// write without ecc ?
-	if (noecc) {
-		if (ioctl (fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
-			perror ("MEMSETOOBSEL");
-			close (fd);
-			exit (1);
-		}
-		oobinfochanged = 1;
-	}
-
-	// autoplace ECC ?
-	if (autoplace && (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE)) {
-
-		if (ioctl (fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
-			perror ("MEMSETOOBSEL");
-			close (fd);
-			exit (1);
-		}
-		oobinfochanged = 1;
-	}
-
-	/*
-	 * force oob layout for jffs2 or yaffs ?
-	 * Legacy support
-	 */
-	if (forcejffs2 || forceyaffs) {
-		struct nand_oobinfo *oobsel = forcejffs2 ? &jffs2_oobinfo : &yaffs_oobinfo;
-
-		if (autoplace) {
-			fprintf(stderr, "Autoplacement is not possible for legacy -j/-y options\n");
-			goto restoreoob;
-		}
-		if ((old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE) && !forcelegacy) {
-			fprintf(stderr, "Use -f option to enforce legacy placement on autoplacement enabled mtd device\n");
-			goto restoreoob;
-		}
-		if (meminfo.oobsize == 8) {
-    			if (forceyaffs) {
-				fprintf (stderr, "YAFSS cannot operate on 256 Byte page size");
-				goto restoreoob;
-			}
-			/* Adjust number of ecc bytes */
-			jffs2_oobinfo.eccbytes = 3;
-		}
-
-		if (ioctl (fd, MEMSETOOBSEL, oobsel) != 0) {
-			perror ("MEMSETOOBSEL");
-			goto restoreoob;
-		}
-	}
-
 	oob.length = meminfo.oobsize;
 	oob.ptr = noecc ? oobreadbuf : oobbuf;
 
 	/* Open the input file */
 	if ((ifd = open(img, O_RDONLY)) == -1) {
 		perror("open input file");
-		goto restoreoob;
+		goto closeall;
 	}
 
 	// get image length
    	imglen = lseek(ifd, 0, SEEK_END);
 	lseek (ifd, 0, SEEK_SET);
 
-	pagelen = meminfo.oobblock + ((writeoob == 1) ? meminfo.oobsize : 0);
+	pagelen = meminfo.oobblock + ((writeoob == 1) ? oobavail : 0);
 
 	// Check, if file is pagealigned
 	if ((!pad) && ((imglen % pagelen) != 0)) {
@@ -387,39 +289,16 @@
 
 		if (writeoob) {
 			/* Read OOB data from input file, exit on failure */
-			if ((cnt = read(ifd, oobreadbuf, meminfo.oobsize)) != meminfo.oobsize) {
+			if ((cnt = read(ifd, oobreadbuf, oobavail)) != oobavail) {
 				perror ("File I/O error on input file");
 				goto closeall;
 			}
 			if (!noecc) {
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
-							oobreadbuf + start,
-							len);
-					}
-				} else {
-					/* Set at least the ecc byte positions to 0xff */
-					start = old_oobinfo.eccbytes;
-					len = meminfo.oobsize - start;
-					memcpy(oobbuf + start,
-						oobreadbuf + start,
-						len);
-				}
+				memcpy(oobbuf, oobreadbuf, oobavail);
 			}
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
+			oob.length = oobavail;
 			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
 				perror ("ioctl(MEMWRITEOOB)");
 				goto closeall;
@@ -438,16 +317,6 @@
 
  closeall:
 	close(ifd);
-
- restoreoob:
-	if (oobinfochanged) {
-		if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
-			perror ("MEMSETOOBSEL");
-			close (fd);
-			exit (1);
-		}
-	}
-
 	close(fd);
 
 	if (imglen > 0) {
cvs diff: Diffing util/checkfs
cvs diff: Diffing util/jittertest

--------------030203040003070407020304--
