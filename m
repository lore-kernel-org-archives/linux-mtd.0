Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyr2i-0006pV-D7
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:05:49 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 10/10] nandwrite: use common.h "errmsg" functions
Date: Wed, 31 Aug 2011 13:00:39 -0700
Message-ID: <1314820839-7107-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert several forms of exit(), perror(), etc. to use common.h helper
functions.

Also, move one of our parameter checks inside the process_options()
function for consistency.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   44 ++++++++++++++++----------------------------
 1 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index ca72f16..a42f7c9 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -182,6 +182,9 @@ static void process_options(int argc, char * const argv[])
 	if (autoplace && noecc)
 		errmsg_die("Autoplacement and no-ECC are mutually exclusive");
 
+	if (!onlyoob && (pad && writeoob))
+		errmsg_die("Can't pad when oob data is present");
+
 	argc -= optind;
 	argv += optind;
 
@@ -242,23 +245,16 @@ int main(int argc, char * const argv[])
 
 	process_options(argc, argv);
 
-	if (!onlyoob && (pad && writeoob)) {
-		fprintf(stderr, "Can't pad when oob data is present.\n");
-		exit(EXIT_FAILURE);
-	}
-
 	/* Open the device */
-	if ((fd = open(mtd_device, O_RDWR)) == -1) {
-		perror(mtd_device);
-		exit(EXIT_FAILURE);
-	}
+	if ((fd = open(mtd_device, O_RDWR)) == -1)
+		sys_errmsg_die("%s", mtd_device);
 
 	mtd_desc = libmtd_open();
 	if (!mtd_desc)
-		return errmsg("can't initialize libmtd");
+		errmsg_die("can't initialize libmtd");
 	/* Fill in MTD device capability structure */
 	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
-		return errmsg("mtd_get_dev_info failed");
+		errmsg_die("mtd_get_dev_info failed");
 
 	/*
 	 * Pretend erasesize is specified number of blocks - to match jffs2
@@ -267,13 +263,10 @@ int main(int argc, char * const argv[])
 	 */
 	ebsize_aligned = mtd.eb_size * blockalign;
 
-	if (mtdoffset & (mtd.min_io_size - 1)) {
-		fprintf(stderr, "The start address is not page-aligned !\n"
-				"The pagesize of this NAND Flash is 0x%x.\n",
-				mtd.min_io_size);
-		close(fd);
-		exit(EXIT_FAILURE);
-	}
+	if (mtdoffset & (mtd.min_io_size - 1))
+		errmsg_die("The start address is not page-aligned !\n"
+			   "The pagesize of this NAND Flash is 0x%x.\n",
+			   mtd.min_io_size);
 
 	/* Select OOB write mode */
 	if (noecc)
@@ -290,9 +283,7 @@ int main(int argc, char * const argv[])
 			case ENOTTY:
 				errmsg_die("ioctl MTDFILEMODE is missing");
 			default:
-				perror("MTDFILEMODE");
-				close(fd);
-				exit(EXIT_FAILURE);
+				sys_errmsg_die("MTDFILEMODE");
 			}
 		}
 	}
@@ -341,7 +332,7 @@ int main(int argc, char * const argv[])
 		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %d"
 				" bytes, device size %lld bytes\n",
 				imglen, pagelen, mtd.oob_size, mtd.size);
-		perror("Input file does not fit into device");
+		sys_errmsg("Input file does not fit into device");
 		goto closeall;
 	}
 
@@ -557,12 +548,9 @@ closeall:
 	free(filebuf);
 	close(fd);
 
-	if (failed
-		|| ((ifd != STDIN_FILENO) && (imglen > 0))
-		|| (writebuf < (filebuf + filebuf_len))) {
-		perror("Data was only partially written due to error\n");
-		exit(EXIT_FAILURE);
-	}
+	if (failed || ((ifd != STDIN_FILENO) && (imglen > 0))
+		   || (writebuf < (filebuf + filebuf_len)))
+		sys_errmsg_die("Data was only partially written due to error");
 
 	/* Return happy */
 	return EXIT_SUCCESS;
-- 
1.7.5.4
