Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6ey5-000799-0a
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 07:44:46 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd-utils: nanddump/nandwrite: Style fixups
Date: Fri, 15 Oct 2010 00:44:23 -0700
Message-ID: <1287128665-6573-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c  |   58 ++++++++++++++----------------
 nandwrite.c |  114 +++++++++++++++++++++++++++++------------------------------
 2 files changed, 83 insertions(+), 89 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index b7341a5..00762a5 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -37,7 +37,7 @@ static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
 };
 
-static void display_help (void)
+static void display_help(void)
 {
 	printf(
 "Usage: %s [OPTIONS] MTD-device\n"
@@ -60,7 +60,7 @@ static void display_help (void)
 	exit(EXIT_SUCCESS);
 }
 
-static void display_version (void)
+static void display_version(void)
 {
 	printf("%1$s " VERSION "\n"
 			"\n"
@@ -89,7 +89,7 @@ static bool		quiet = false;		// suppress diagnostic output
 static bool		canonical = false;	// print nice + ascii
 static bool		forcebinary = false;	// force printing binary to tty
 
-static void process_options (int argc, char * const argv[])
+static void process_options(int argc, char * const argv[])
 {
 	int error = 0;
 
@@ -185,7 +185,7 @@ static void process_options (int argc, char * const argv[])
 	}
 
 	if ((argc - optind) != 1 || error)
-		display_help ();
+		display_help();
 
 	mtddev = argv[optind];
 }
@@ -293,14 +293,14 @@ int main(int argc, char * const argv[])
 	/* Open MTD device */
 	if ((fd = open(mtddev, O_RDONLY)) == -1) {
 		perror(mtddev);
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Fill in MTD device capability structure */
 	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
 		perror("MEMGETINFO");
 		close(fd);
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Make sure device page sizes are valid */
@@ -320,32 +320,31 @@ int main(int argc, char * const argv[])
 	oob.length = meminfo.oobsize;
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
+		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
 		if (ret == 0) {
 			oobinfochanged = 2;
 		} else {
 			switch (errno) {
 			case ENOTTY:
-				if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-					perror ("MEMGETOOBSEL");
-					close (fd);
-					exit (EXIT_FAILURE);
+				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
+					perror("MEMGETOOBSEL");
+					close(fd);
+					exit(EXIT_FAILURE);
 				}
-				if (ioctl (fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
-					perror ("MEMSETOOBSEL");
-					close (fd);
-					exit (EXIT_FAILURE);
+				if (ioctl(fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
+					perror("MEMSETOOBSEL");
+					close(fd);
+					exit(EXIT_FAILURE);
 				}
 				oobinfochanged = 1;
 				break;
 			default:
-				perror ("MTDFILEMODE");
-				close (fd);
-				exit (EXIT_FAILURE);
+				perror("MTDFILEMODE");
+				close(fd);
+				exit(EXIT_FAILURE);
 			}
 		}
 	} else {
-
 		/* check if we can read ecc stats */
 		if (!ioctl(fd, ECCGETSTATS, &stat1)) {
 			eccstats = true;
@@ -363,8 +362,8 @@ int main(int argc, char * const argv[])
 	 * output. */
 	if (!dumpfile) {
 		ofd = STDOUT_FILENO;
-	} else if ((ofd = open(dumpfile, O_WRONLY | O_TRUNC | O_CREAT, 0644))== -1) {
-		perror (dumpfile);
+	} else if ((ofd = open(dumpfile, O_WRONLY | O_TRUNC | O_CREAT, 0644)) == -1) {
+		perror(dumpfile);
 		close(fd);
 		exit(EXIT_FAILURE);
 	}
@@ -391,12 +390,11 @@ int main(int argc, char * const argv[])
 				meminfo.erasesize, meminfo.writesize, meminfo.oobsize);
 		fprintf(stderr,
 				"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
-				(unsigned int) start_addr, (unsigned int) end_addr);
+				(unsigned int)start_addr, (unsigned int)end_addr);
 	}
 	/* Dump the flash contents */
-	for (ofs = start_addr; ofs < end_addr ; ofs+=bs) {
-
-		// new eraseblock , check for bad block
+	for (ofs = start_addr; ofs < end_addr; ofs += bs) {
+		/* Check for bad block */
 		if (noskipbad) {
 			badblock = 0;
 		} else if (blockstart != (ofs & (~meminfo.erasesize + 1))) {
@@ -446,8 +444,6 @@ int main(int argc, char * const argv[])
 		} else
 			write(ofd, readbuf, bs);
 
-
-
 		if (omitoob)
 			continue;
 
@@ -475,8 +471,8 @@ int main(int argc, char * const argv[])
 
 	/* reset oobinfo */
 	if (oobinfochanged == 1) {
-		if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
-			perror ("MEMSETOOBSEL");
+		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
+			perror("MEMSETOOBSEL");
 			close(fd);
 			close(ofd);
 			return EXIT_FAILURE;
@@ -492,8 +488,8 @@ int main(int argc, char * const argv[])
 closeall:
 	/* The new mode change is per file descriptor ! */
 	if (oobinfochanged == 1) {
-		if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0)  {
-			perror ("MEMSETOOBSEL");
+		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0)  {
+			perror("MEMSETOOBSEL");
 		}
 	}
 	close(fd);
diff --git a/nandwrite.c b/nandwrite.c
index 3520c62..e0f5f44 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -66,7 +66,7 @@ static struct nand_oobinfo autoplace_oobinfo = {
 	.useecc = MTD_NANDECC_AUTOPLACE
 };
 
-static void display_help (void)
+static void display_help(void)
 {
 	printf(
 "Usage: nandwrite [OPTION] MTD_DEVICE [INPUTFILE|-]\n"
@@ -89,10 +89,10 @@ static void display_help (void)
 "      --help              Display this help and exit\n"
 "      --version           Output version information and exit\n"
 	);
-	exit (EXIT_SUCCESS);
+	exit(EXIT_SUCCESS);
 }
 
-static void display_version (void)
+static void display_version(void)
 {
 	printf("%1$s " VERSION "\n"
 			"\n"
@@ -105,7 +105,7 @@ static void display_version (void)
 			"under the terms of the GNU General Public Licence.\n"
 			"See the file `COPYING' for more information.\n",
 			PROGRAM_NAME);
-	exit (EXIT_SUCCESS);
+	exit(EXIT_SUCCESS);
 }
 
 static const char	*standard_input = "-";
@@ -122,9 +122,9 @@ static bool		forcelegacy = false;
 static bool		noecc = false;
 static bool		noskipbad = false;
 static bool		pad = false;
-static int		blockalign = 1; /*default to using 16K block size */
+static int		blockalign = 1; /* default to using 16K block size */
 
-static void process_options (int argc, char * const argv[])
+static void process_options(int argc, char * const argv[])
 {
 	int error = 0;
 
@@ -202,10 +202,10 @@ static void process_options (int argc, char * const argv[])
 				writeoob = true;
 				break;
 			case 's':
-				mtdoffset = strtol (optarg, NULL, 0);
+				mtdoffset = strtol(optarg, NULL, 0);
 				break;
 			case 'b':
-				blockalign = atoi (optarg);
+				blockalign = atoi(optarg);
 				break;
 			case '?':
 				error++;
@@ -216,7 +216,7 @@ static void process_options (int argc, char * const argv[])
 	if (mtdoffset < 0) {
 		fprintf(stderr, "Can't specify a negative device offset `%d'\n",
 				mtdoffset);
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	argc -= optind;
@@ -228,7 +228,7 @@ static void process_options (int argc, char * const argv[])
 	 */
 
 	if (argc < 1 || argc > 2 || error)
-		display_help ();
+		display_help();
 
 	mtd_device = argv[0];
 
@@ -284,20 +284,20 @@ int main(int argc, char * const argv[])
 
 	if (pad && writeoob) {
 		fprintf(stderr, "Can't pad when oob data is present.\n");
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Open the device */
 	if ((fd = open(mtd_device, O_RDWR)) == -1) {
 		perror(mtd_device);
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Fill in MTD device capability structure */
 	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
 		perror("MEMGETINFO");
 		close(fd);
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	/* Set erasesize to specified number of blocks - to match jffs2
@@ -312,7 +312,7 @@ int main(int argc, char * const argv[])
 			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
 		close(fd);
-		exit (EXIT_FAILURE);
+		exit(EXIT_FAILURE);
 	}
 
 	if (mtdoffset & (meminfo.writesize - 1)) {
@@ -325,47 +325,47 @@ int main(int argc, char * const argv[])
 
 	if (autoplace) {
 		/* Read the current oob info */
-		if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-			perror ("MEMGETOOBSEL");
-			close (fd);
-			exit (EXIT_FAILURE);
+		if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
+			perror("MEMGETOOBSEL");
+			close(fd);
+			exit(EXIT_FAILURE);
 		}
 
 		// autoplace ECC ?
 		if (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE) {
 
-			if (ioctl (fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
-				perror ("MEMSETOOBSEL");
-				close (fd);
-				exit (EXIT_FAILURE);
+			if (ioctl(fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
+				perror("MEMSETOOBSEL");
+				close(fd);
+				exit(EXIT_FAILURE);
 			}
 			oobinfochanged = 1;
 		}
 	}
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
+		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
 		if (ret == 0) {
 			oobinfochanged = 2;
 		} else {
 			switch (errno) {
 			case ENOTTY:
-				if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-					perror ("MEMGETOOBSEL");
-					close (fd);
-					exit (EXIT_FAILURE);
+				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
+					perror("MEMGETOOBSEL");
+					close(fd);
+					exit(EXIT_FAILURE);
 				}
-				if (ioctl (fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
-					perror ("MEMSETOOBSEL");
-					close (fd);
-					exit (EXIT_FAILURE);
+				if (ioctl(fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
+					perror("MEMSETOOBSEL");
+					close(fd);
+					exit(EXIT_FAILURE);
 				}
 				oobinfochanged = 1;
 				break;
 			default:
-				perror ("MTDFILEMODE");
-				close (fd);
-				exit (EXIT_FAILURE);
+				perror("MTDFILEMODE");
+				close(fd);
+				exit(EXIT_FAILURE);
 			}
 		}
 	}
@@ -387,15 +387,15 @@ int main(int argc, char * const argv[])
 		}
 		if (meminfo.oobsize == 8) {
 			if (forceyaffs) {
-				fprintf (stderr, "YAFSS cannot operate on 256 Byte page size");
+				fprintf(stderr, "YAFSS cannot operate on 256 Byte page size");
 				goto restoreoob;
 			}
 			/* Adjust number of ecc bytes */
 			jffs2_oobinfo.eccbytes = 3;
 		}
 
-		if (ioctl (fd, MEMSETOOBSEL, oobsel) != 0) {
-			perror ("MEMSETOOBSEL");
+		if (ioctl(fd, MEMSETOOBSEL, oobsel) != 0) {
+			perror("MEMSETOOBSEL");
 			goto restoreoob;
 		}
 	}
@@ -432,27 +432,27 @@ int main(int argc, char * const argv[])
 	    imglen = pagelen;
 	} else {
 	    imglen = lseek(ifd, 0, SEEK_END);
-	    lseek (ifd, 0, SEEK_SET);
+	    lseek(ifd, 0, SEEK_SET);
 	}
 
 	// Check, if file is page-aligned
 	if ((!pad) && ((imglen % pagelen) != 0)) {
-		fprintf (stderr, "Input file is not page-aligned. Use the padding "
+		fprintf(stderr, "Input file is not page-aligned. Use the padding "
 				 "option.\n");
 		goto closeall;
 	}
 
 	// Check, if length fits into device
-	if ( ((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
-		fprintf (stderr, "Image %d bytes, NAND page %d bytes, OOB area %u bytes, device size %u bytes\n",
+	if (((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
+		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %u bytes, device size %u bytes\n",
 				imglen, pagelen, meminfo.writesize, meminfo.size);
-		perror ("Input file does not fit into device");
+		perror("Input file does not fit into device");
 		goto closeall;
 	}
 
 	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
 	filebuf_max = pagelen * meminfo.erasesize / meminfo.writesize;
-	filebuf = (unsigned char*)malloc(filebuf_max);
+	filebuf = (unsigned char *)malloc(filebuf_max);
 	if (!filebuf) {
 		fprintf(stderr, "Failed to allocate memory for file buffer (%d bytes)\n",
 				pagelen * meminfo.erasesize / meminfo.writesize);
@@ -490,7 +490,7 @@ int main(int argc, char * const argv[])
 
 			baderaseblock = false;
 			if (!quiet)
-				fprintf (stdout, "Writing data to block %d at offset 0x%x\n",
+				fprintf(stdout, "Writing data to block %d at offset 0x%x\n",
 						 blockstart / meminfo.erasesize, blockstart);
 
 			/* Check all the blocks in an erase block for bad blocks */
@@ -512,8 +512,8 @@ int main(int argc, char * const argv[])
 				if (baderaseblock) {
 					mtdoffset = blockstart + meminfo.erasesize;
 				}
-				offs +=  meminfo.erasesize / blockalign ;
-			} while ( offs < blockstart + meminfo.erasesize );
+				offs +=  meminfo.erasesize / blockalign;
+			} while (offs < blockstart + meminfo.erasesize);
 
 		}
 
@@ -529,7 +529,7 @@ int main(int argc, char * const argv[])
 				if (cnt == 0) { // EOF
 					break;
 				} else if (cnt < 0) {
-					perror ("File I/O error on input");
+					perror("File I/O error on input");
 					goto closeall;
 				}
 				tinycnt += cnt;
@@ -573,7 +573,6 @@ int main(int argc, char * const argv[])
 			// Read more data for the OOB from the input if there isn't enough in the buffer
 			if ((oobreadbuf + meminfo.oobsize) > (filebuf + filebuf_len)) {
 				int readlen = meminfo.oobsize;
-
 				int alreadyread = (filebuf + filebuf_len) - oobreadbuf;
 				int tinycnt = alreadyread;
 
@@ -582,7 +581,7 @@ int main(int argc, char * const argv[])
 					if (cnt == 0) { // EOF
 						break;
 					} else if (cnt < 0) {
-						perror ("File I/O error on input");
+						perror("File I/O error on input");
 						goto closeall;
 					}
 					tinycnt += cnt;
@@ -641,7 +640,7 @@ int main(int argc, char * const argv[])
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
 			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
-				perror ("ioctl(MEMWRITEOOB)");
+				perror("ioctl(MEMWRITEOOB)");
 				goto closeall;
 			}
 		}
@@ -697,10 +696,10 @@ closeall:
 
 restoreoob:
 	if (oobinfochanged == 1) {
-		if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
-			perror ("MEMSETOOBSEL");
-			close (fd);
-			exit (EXIT_FAILURE);
+		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
+			perror("MEMSETOOBSEL");
+			close(fd);
+			exit(EXIT_FAILURE);
 		}
 	}
 
@@ -708,10 +707,9 @@ restoreoob:
 
 	if (failed
 		|| ((ifd != STDIN_FILENO) && (imglen > 0))
-		|| (writebuf < (filebuf + filebuf_len)))
-	{
-		perror ("Data was only partially written due to error\n");
-		exit (EXIT_FAILURE);
+		|| (writebuf < (filebuf + filebuf_len))) {
+		perror("Data was only partially written due to error\n");
+		exit(EXIT_FAILURE);
 	}
 
 	/* Return happy */
-- 
1.7.0.4
