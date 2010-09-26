Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzwGa-00013M-6A
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 18:48:12 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 5CE871B428D
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 18:47:57 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: standardize PROGRAM_NAME
Date: Sun, 26 Sep 2010 14:48:51 -0400
Message-Id: <1285526931-4005-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make sure all the utils define PROGRAM_NAME and do so at the start of
the file so that sub-headers may assume it exists.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 compr_zlib.c                     |    2 ++
 doc_loadbios.c                   |    2 ++
 docfdisk.c                       |    4 +++-
 flash_info.c                     |    4 +++-
 flash_lock.c                     |    4 +++-
 flash_otp_dump.c                 |    4 +++-
 flash_otp_info.c                 |    4 +++-
 flash_otp_lock.c                 |    8 +++++---
 flash_otp_write.c                |    6 ++++--
 flash_unlock.c                   |    4 +++-
 flashcp.c                        |   20 ++++++++++----------
 ftl_check.c                      |    8 +++++---
 ftl_format.c                     |    4 +++-
 jffs2dump.c                      |   20 +++++++++++---------
 jffs2reader.c                    |    8 +++++---
 mkfs.jffs2.c                     |    7 ++++---
 mkfs.ubifs/hashtable/hashtable.c |    2 ++
 mtd_debug.c                      |   21 +++++++++------------
 nanddump.c                       |   21 +++++++++++----------
 nandtest.c                       |    7 +++++--
 nandwrite.c                      |   15 ++++++++-------
 nftl_format.c                    |    6 ++++--
 nftldump.c                       |    4 +++-
 recv_image.c                     |    3 ++-
 rfddump.c                        |   20 +++++++++++---------
 rfdformat.c                      |   16 +++++++++-------
 serve_image.c                    |    3 ++-
 sumtool.c                        |    6 +++---
 ubi-utils/src/libscan.c          |    4 ++--
 ubi-utils/src/libubi.c           |    4 ++--
 ubi-utils/src/libubigen.c        |    4 ++--
 ubi-utils/src/mtdinfo.c          |    6 +++---
 ubi-utils/src/ubiattach.c        |    5 +++--
 ubi-utils/src/ubicrc32.c         |    6 +++---
 ubi-utils/src/ubidetach.c        |    5 +++--
 ubi-utils/src/ubiformat.c        |    6 +++---
 ubi-utils/src/ubimkvol.c         |    6 +++---
 ubi-utils/src/ubinfo.c           |    6 +++---
 ubi-utils/src/ubinize.c          |    6 +++---
 ubi-utils/src/ubirename.c        |    6 +++---
 ubi-utils/src/ubirmvol.c         |    6 +++---
 ubi-utils/src/ubirsvol.c         |    6 +++---
 ubi-utils/src/ubiupdatevol.c     |    6 +++---
 ubi-utils/src/ubiutils-common.c  |    2 ++
 44 files changed, 182 insertions(+), 135 deletions(-)

diff --git a/compr_zlib.c b/compr_zlib.c
index 0564f16..1f94628 100644
--- a/compr_zlib.c
+++ b/compr_zlib.c
@@ -32,6 +32,8 @@
  * under either the RHEPL or the GPL.
  */
 
+#define PROGRAM_NAME "compr_zlib"
+
 #include <stdint.h>
 #define crc32 __zlib_crc32
 #include <zlib.h>
diff --git a/doc_loadbios.c b/doc_loadbios.c
index 0a11fd2..b999c73 100644
--- a/doc_loadbios.c
+++ b/doc_loadbios.c
@@ -1,3 +1,5 @@
+#define PROGRAM_NAME "doc_loadbios"
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/docfdisk.c b/docfdisk.c
index 56fffc4..a76afb9 100644
--- a/docfdisk.c
+++ b/docfdisk.c
@@ -16,6 +16,8 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
+#define PROGRAM_NAME "docfdisk"
+
 #define _XOPEN_SOURCE 500 /* for pread/pwrite */
 #include <unistd.h>
 #include <stdlib.h>
@@ -158,7 +160,7 @@ int main(int argc, char **argv)
 				"Usage: %s <mtddevice> [<size1> [<size2> [<size3> [<size4]]]]\n"
 				"  Sizes are in device units (run with no sizes to show unitsize and current\n"
 				"  partitions).  Last size = 0 means go to end of device.\n",
-				argv[0]);
+				PROGRAM_NAME);
 		return 1;
 	}
 
diff --git a/flash_info.c b/flash_info.c
index f5ed1c6..ad7b30a 100644
--- a/flash_info.c
+++ b/flash_info.c
@@ -2,6 +2,8 @@
  * flash_info.c -- print info about a MTD device
  */
 
+#define PROGRAM_NAME "flash_info"
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -19,7 +21,7 @@ int main(int argc,char *argv[])
 
 	if (1 >= argc)
 	{
-		fprintf(stderr,"Usage: flash_info device\n");
+		fprintf(stderr,"Usage: %s device\n", PROGRAM_NAME);
 		return 16;
 	}
 
diff --git a/flash_lock.c b/flash_lock.c
index 37f2ad3..ef75234 100644
--- a/flash_lock.c
+++ b/flash_lock.c
@@ -5,6 +5,8 @@
  *
  */
 
+#define PROGRAM_NAME "flash_lock"
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -29,7 +31,7 @@ int main(int argc, char *argv[])
 	 */
 	if(argc != 4)
 	{
-		fprintf(stderr, "USAGE: %s <mtd device> <ofs in hex> <num of sectors in decimal or -1 for all sectors>\n", argv[0]);
+		fprintf(stderr, "USAGE: %s <mtd device> <ofs in hex> <num of sectors in decimal or -1 for all sectors>\n", PROGRAM_NAME);
 		exit(1);
 	}
 	else if(strncmp(argv[1], "/dev/mtd", 8) != 0)
diff --git a/flash_otp_dump.c b/flash_otp_dump.c
index a18130d..f0c0fb9 100644
--- a/flash_otp_dump.c
+++ b/flash_otp_dump.c
@@ -2,6 +2,8 @@
  * flash_otp_dump.c -- display One-Time-Programm data
  */
 
+#define PROGRAM_NAME "flash_otp_dump"
+
 #include <stdio.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -17,7 +19,7 @@ int main(int argc,char *argv[])
 	unsigned char buf[16];
 
 	if (argc != 3 || (strcmp(argv[1], "-f") && strcmp(argv[1], "-u"))) {
-		fprintf(stderr,"Usage: %s [ -f | -u ] <device>\n", argv[0]);
+		fprintf(stderr,"Usage: %s [ -f | -u ] <device>\n", PROGRAM_NAME);
 		return EINVAL;
 	}
 
diff --git a/flash_otp_info.c b/flash_otp_info.c
index c9486ee..2061797 100644
--- a/flash_otp_info.c
+++ b/flash_otp_info.c
@@ -2,6 +2,8 @@
  * flash_otp_info.c -- print info about One-Time-Programm data
  */
 
+#define PROGRAM_NAME "flash_otp_info"
+
 #include <stdio.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -16,7 +18,7 @@ int main(int argc,char *argv[])
 	int fd, val, i, ret;
 
 	if (argc != 3 || (strcmp(argv[1], "-f") && strcmp(argv[1], "-u"))) {
-		fprintf(stderr,"Usage: %s [ -f | -u ] <device>\n", argv[0]);
+		fprintf(stderr,"Usage: %s [ -f | -u ] <device>\n", PROGRAM_NAME);
 		return EINVAL;
 	}
 
diff --git a/flash_otp_lock.c b/flash_otp_lock.c
index d0e06cd..cc8759e 100644
--- a/flash_otp_lock.c
+++ b/flash_otp_lock.c
@@ -2,6 +2,8 @@
  * flash_otp_lock.c -- lock area of One-Time-Program data
  */
 
+#define PROGRAM_NAME "flash_otp_lock"
+
 #include <stdio.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -18,7 +20,7 @@ int main(int argc,char *argv[])
 	char *p, buf[8];
 
 	if (argc != 5 || strcmp(argv[1], "-u")) {
-		fprintf(stderr, "Usage: %s -u <device> <offset> <size>\n", argv[0]);
+		fprintf(stderr, "Usage: %s -u <device> <offset> <size>\n", PROGRAM_NAME);
 		fprintf(stderr, "offset and size must match on OTP region boundaries\n");
 		fprintf(stderr, "CAUTION! ONCE LOCKED, OTP REGIONS CAN'T BE UNLOCKED!\n");
 		return EINVAL;
@@ -39,13 +41,13 @@ int main(int argc,char *argv[])
 
 	offset = strtoul(argv[3], &p, 0);
 	if (argv[3][0] == 0 || *p != 0) {
-		fprintf(stderr, "%s: bad offset value\n", argv[0]);
+		fprintf(stderr, "%s: bad offset value\n", PROGRAM_NAME);
 		return ERANGE;
 	}
 
 	size = strtoul(argv[4], &p, 0);
 	if (argv[4][0] == 0 || *p != 0) {
-		fprintf(stderr, "%s: bad size value\n", argv[0]);
+		fprintf(stderr, "%s: bad size value\n", PROGRAM_NAME);
 		return ERANGE;
 	}
 
diff --git a/flash_otp_write.c b/flash_otp_write.c
index f01df51..d407ebb 100644
--- a/flash_otp_write.c
+++ b/flash_otp_write.c
@@ -2,6 +2,8 @@
  * flash_otp_write.c -- write One-Time-Program data
  */
 
+#define PROGRAM_NAME "flash_otp_write"
+
 #include <stdio.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -21,7 +23,7 @@ int main(int argc,char *argv[])
 	char *p, buf[2048];
 
 	if (argc != 4 || strcmp(argv[1], "-u")) {
-		fprintf(stderr, "Usage: %s -u <device> <offset>\n", argv[0]);
+		fprintf(stderr, "Usage: %s -u <device> <offset>\n", PROGRAM_NAME);
 		fprintf(stderr, "the raw data to write should be provided on stdin\n");
 		fprintf(stderr, "CAUTION! ONCE SET TO 0, OTP DATA BITS CAN'T BE ERASED!\n");
 		return EINVAL;
@@ -47,7 +49,7 @@ int main(int argc,char *argv[])
 
 	offset = strtoul(argv[3], &p, 0);
 	if (argv[3][0] == 0 || *p != 0) {
-		fprintf(stderr, "%s: bad offset value\n", argv[0]);
+		fprintf(stderr, "%s: bad offset value\n", PROGRAM_NAME);
 		return ERANGE;
 	}
 
diff --git a/flash_unlock.c b/flash_unlock.c
index 3969453..3d29a92 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -5,6 +5,8 @@
  *
  */
 
+#define PROGRAM_NAME "flash_unlock"
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -28,7 +30,7 @@ int main(int argc, char *argv[])
 	 */
 	if(argc < 2)
 	{
-		fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block count in decimal number>\n", argv[0]);
+		fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block count in decimal number>\n", PROGRAM_NAME);
 		exit(1);
 	}
 	else if(strncmp(argv[1], "/dev/mtd", 8) != 0)
diff --git a/flashcp.c b/flashcp.c
index 8775022..d58c81b 100644
--- a/flashcp.c
+++ b/flashcp.c
@@ -29,6 +29,8 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+#define PROGRAM_NAME "flashcp"
+
 #include <stdio.h>
 #include <stdarg.h>
 #include <string.h>
@@ -84,7 +86,7 @@ static void log_printf (int level,const char *fmt, ...)
 	fflush (fp);
 }
 
-static void showusage (const char *progname,bool error)
+static void showusage(bool error)
 {
 	int level = error ? LOG_ERROR : LOG_NORMAL;
 
@@ -92,15 +94,15 @@ static void showusage (const char *progname,bool error)
 			"\n"
 			"Flash Copy - Written by Abraham van der Merwe <abraham@2d3d.co.za>\n"
 			"\n"
-			"usage: %s [ -v | --verbose ] <filename> <device>\n"
-			"       %s -h | --help\n"
+			"usage: %1$s [ -v | --verbose ] <filename> <device>\n"
+			"       %1$s -h | --help\n"
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
 			"   <filename>       File which you want to copy to flash\n"
 			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
 			"\n",
-			progname,progname);
+			PROGRAM_NAME);
 
 	exit (error ? EXIT_FAILURE : EXIT_SUCCESS);
 }
@@ -165,7 +167,7 @@ static void cleanup (void)
 
 int main (int argc,char *argv[])
 {
-	const char *progname,*filename = NULL,*device = NULL;
+	const char *filename = NULL,*device = NULL;
 	int i,flags = FLAG_NONE;
 	ssize_t result;
 	size_t size,written;
@@ -174,8 +176,6 @@ int main (int argc,char *argv[])
 	struct stat filestat;
 	unsigned char src[BUFSIZE],dest[BUFSIZE];
 
-	(progname = strrchr (argv[0],'/')) ? progname++ : (progname = argv[0]);
-
 	/*********************
 	 * parse cmd-line
 	 *****************/
@@ -206,7 +206,7 @@ int main (int argc,char *argv[])
 				break;
 			default:
 				DEBUG("Unknown parameter: %s\n",argv[option_index]);
-				showusage (progname,true);
+				showusage(true);
 		}
 	}
 	if (optind+2 == argc) {
@@ -219,8 +219,8 @@ int main (int argc,char *argv[])
 		DEBUG("Got device: %s\n",device);
 	}
 
-	if (flags & FLAG_HELP || progname == NULL || device == NULL)
-		showusage (progname,flags != FLAG_HELP);
+	if (flags & FLAG_HELP || device == NULL)
+		showusage(flags != FLAG_HELP);
 
 	atexit (cleanup);
 
diff --git a/ftl_check.c b/ftl_check.c
index 485eaa8..5e75e6a 100644
--- a/ftl_check.c
+++ b/ftl_check.c
@@ -34,6 +34,8 @@
 
   ======================================================================*/
 
+#define PROGRAM_NAME "ftl_check"
+
 #include <sys/types.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -178,9 +180,9 @@ static void check_partition(int fd)
 } /* format_partition */
 
 /* Show usage information */
-void showusage(char *pname)
+void showusage(void)
 {
-	fprintf(stderr, "usage: %s device\n", pname);
+	fprintf(stderr, "usage: %s device\n", PROGRAM_NAME);
 }
 
 /*====================================================================*/
@@ -200,7 +202,7 @@ int main(int argc, char *argv[])
 		}
 	}
 	if (errflg || (optind != argc-1)) {
-		showusage(argv[0]);
+		showusage();
 		exit(errflg > 0 ? 0 : EXIT_FAILURE);
 	}
 
diff --git a/ftl_format.c b/ftl_format.c
index ae00c99..bd4203b 100644
--- a/ftl_format.c
+++ b/ftl_format.c
@@ -34,6 +34,8 @@
 
   ======================================================================*/
 
+#define PROGRAM_NAME "ftl_format"
+
 #include <sys/types.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -308,7 +310,7 @@ int main(int argc, char *argv[])
 	}
 	if (errflg || (optind != argc-1)) {
 		fprintf(stderr, "usage: %s [-q] [-i] [-s spare-blocks]"
-				" [-r reserve-percent] [-b bootsize] device\n", argv[0]);
+				" [-r reserve-percent] [-b bootsize] device\n", PROGRAM_NAME);
 		exit(EXIT_FAILURE);
 	}
 
diff --git a/jffs2dump.c b/jffs2dump.c
index d282d9d..d093afc 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -14,6 +14,9 @@
  * Bug/ToDo:
  */
 
+#define PROGRAM_NAME "jffs2dump"
+#define VERSION "$Revision: 1.10 $"
+
 #include <errno.h>
 #include <stdint.h>
 #include <stdio.h>
@@ -34,9 +37,6 @@
 #include <crc32.h>
 #include "summary.h"
 
-#define PROGRAM "jffs2dump"
-#define VERSION "$Revision: 1.10 $"
-
 #define PAD(x) (((x)+3)&~3)
 
 /* For outputting a byte-swapped version of the input image. */
@@ -52,7 +52,7 @@ char	*data;		// image data
 
 void display_help (void)
 {
-	printf("Usage: " PROGRAM " [OPTION]... INPUTFILE\n"
+	printf("Usage: %s [OPTION]... INPUTFILE\n"
 	       "Dump the contents of a binary JFFS2 image.\n\n"
 	       "     --help                   display this help and exit\n"
 	       "     --version                display version information and exit\n"
@@ -63,22 +63,24 @@ void display_help (void)
 	       " -r, --recalccrc              recalc name and data crc on endian conversion\n"
 	       " -d, --datsize=LEN            size of data chunks, when oob data in binary image (NAND only)\n"
 	       " -o, --oobsize=LEN            size of oob data chunk in binary image (NAND only)\n"
-	       " -v, --verbose                verbose output\n");
+	       " -v, --verbose                verbose output\n",
+	       PROGRAM_NAME);
 	exit(0);
 }
 
 void display_version (void)
 {
-	printf(PROGRAM " " VERSION "\n"
+	printf("%1$s " VERSION "\n"
 			"\n"
 			"Copyright (C) 2003 Thomas Gleixner \n"
 			"\n"
-			PROGRAM " comes with NO WARRANTY\n"
+			"%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
 			"\n"
-			"You may redistribute copies of " PROGRAM "\n"
+			"You may redistribute copies of %1$s\n"
 			"under the terms of the GNU General Public Licence.\n"
-			"See the file `COPYING' for more information.\n");
+			"See the file `COPYING' for more information.\n",
+			PROGRAM_NAME);
 	exit(0);
 }
 
diff --git a/jffs2reader.c b/jffs2reader.c
index 0ad7207..0cdff19 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -62,6 +62,7 @@ BUGS:
 - Doesn't check CRC checksums.
  */
 
+#define PROGRAM_NAME "jffs2reader"
 
 #include <errno.h>
 #include <stdint.h>
@@ -817,8 +818,8 @@ void lsdir(char *o, size_t size, char *path, int recurse)
 
 	if (ino == 0 ||
 			(dd == NULL && ino == 0) || (dd != NULL && dd->type != DT_DIR)) {
-		fprintf(stderr, "jffs2reader: %s: No such file or directory\n",
-				path);
+		fprintf(stderr, "%s: %s: No such file or directory\n",
+				PROGRAM_NAME, path);
 		exit(EXIT_FAILURE);
 	}
 
@@ -888,7 +889,8 @@ int main(int argc, char **argv)
 				break;
 			default:
 				fprintf(stderr,
-						"Usage: jffs2reader <image> [-d|-f] < path > \n");
+						"Usage: %s <image> [-d|-f] < path >\n",
+						PROGRAM_NAME);
 				exit(EXIT_FAILURE);
 		}
 	}
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index c83b725..1abe09c 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -47,6 +47,8 @@
  *  -Erik, November 2002
  */
 
+#define PROGRAM_NAME "mkfs.jffs2"
+
 #define _GNU_SOURCE
 #include <sys/types.h>
 #include <stdio.h>
@@ -108,7 +110,6 @@ static int squash_uids = 0;
 static int squash_perms = 0;
 static int fake_times = 0;
 int target_endian = __BYTE_ORDER;
-static const char *const app_name = "mkfs.jffs2";
 static const char *const memory_exhausted = "memory exhausted";
 
 uint32_t find_hardlink(struct filesystem_entry *e)
@@ -141,7 +142,7 @@ uint32_t find_hardlink(struct filesystem_entry *e)
 static void verror_msg(const char *s, va_list p)
 {
 	fflush(stdout);
-	fprintf(stderr, "%s: ", app_name);
+	fprintf(stderr, "%s: ", PROGRAM_NAME);
 	vfprintf(stderr, s, p);
 }
 static void error_msg(const char *s, ...)
@@ -247,7 +248,7 @@ extern char *xreadlink(const char *path)
 		buf = xrealloc(buf, bufsize += GROWBY);
 		readsize = readlink(path, buf, bufsize); /* 1st try */
 		if (readsize == -1) {
-			perror_msg("%s:%s", app_name, path);
+			perror_msg("%s:%s", PROGRAM_NAME, path);
 			return NULL;
 		}
 	}
diff --git a/mkfs.ubifs/hashtable/hashtable.c b/mkfs.ubifs/hashtable/hashtable.c
index b751c62..8aa273c 100644
--- a/mkfs.ubifs/hashtable/hashtable.c
+++ b/mkfs.ubifs/hashtable/hashtable.c
@@ -1,5 +1,7 @@
 /* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
 
+#define PROGRAM_NAME "hashtable"
+
 #include "common.h"
 #include "hashtable.h"
 #include "hashtable_private.h"
diff --git a/mtd_debug.c b/mtd_debug.c
index 928cb5a..b82dabe 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -27,6 +27,8 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+#define PROGRAM_NAME "mtd_debug"
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <errno.h>
@@ -347,17 +349,14 @@ int showinfo (int fd)
 	return (0);
 }
 
-void showusage (const char *progname)
+void showusage(void)
 {
 	fprintf (stderr,
-			"usage: %s info <device>\n"
-			"       %s read <device> <offset> <len> <dest-filename>\n"
-			"       %s write <device> <offset> <len> <source-filename>\n"
-			"       %s erase <device> <offset> <len>\n",
-			progname,
-			progname,
-			progname,
-			progname);
+			"usage: %1$s info <device>\n"
+			"       %1$s read <device> <offset> <len> <dest-filename>\n"
+			"       %1$s write <device> <offset> <len> <source-filename>\n"
+			"       %1$s erase <device> <offset> <len>\n",
+			PROGRAM_NAME);
 	exit (1);
 }
 
@@ -368,10 +367,8 @@ void showusage (const char *progname)
 
 int main (int argc,char *argv[])
 {
-	const char *progname;
 	int err = 0,fd,option = OPT_INFO;
 	int open_flag;
-	(progname = strrchr (argv[0],'/')) ? progname++ : (progname = argv[0]);
 
 	/* parse command-line options */
 	if (argc == 3 && !strcmp (argv[1],"info"))
@@ -383,7 +380,7 @@ int main (int argc,char *argv[])
 	else if (argc == 5 && !strcmp (argv[1],"erase"))
 		option = OPT_ERASE;
 	else
-		showusage (progname);
+		showusage();
 
 	/* open device */
 	open_flag = (option==OPT_INFO || option==OPT_READ) ? O_RDONLY : O_RDWR;
diff --git a/nanddump.c b/nanddump.c
index 709b2db..3589931 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -13,6 +13,9 @@
  *   chips contained in DoC devices.
  */
 
+#define PROGRAM_NAME "nanddump"
+#define VERSION "$Revision: 1.29 $"
+
 #define _GNU_SOURCE
 #include <ctype.h>
 #include <errno.h>
@@ -30,9 +33,6 @@
 #include <asm/types.h>
 #include <mtd/mtd-user.h>
 
-#define PROGRAM "nanddump"
-#define VERSION "$Revision: 1.29 $"
-
 static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
 };
@@ -40,7 +40,7 @@ static struct nand_oobinfo none_oobinfo = {
 static void display_help (void)
 {
 	printf(
-"Usage: nanddump [OPTIONS] MTD-device\n"
+"Usage: %s [OPTIONS] MTD-device\n"
 "Dumps the contents of a nand mtd partition.\n"
 "\n"
 "           --help               Display this help and exit\n"
@@ -55,21 +55,22 @@ static void display_help (void)
 "-b         --omitbad            Omit bad blocks from the dump\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
-"-s addr    --startaddress=addr  Start address\n"
-	);
+"-s addr    --startaddress=addr  Start address\n",
+	PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
 }
 
 static void display_version (void)
 {
-	printf(PROGRAM " " VERSION "\n"
+	printf("%1$s " VERSION "\n"
 			"\n"
-			PROGRAM " comes with NO WARRANTY\n"
+			"%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
 			"\n"
-			"You may redistribute copies of " PROGRAM "\n"
+			"You may redistribute copies of %1$s\n"
 			"under the terms of the GNU General Public Licence.\n"
-			"See the file `COPYING' for more information.\n");
+			"See the file `COPYING' for more information.\n",
+			PROGRAM_NAME);
 	exit(EXIT_SUCCESS);
 }
 
diff --git a/nandtest.c b/nandtest.c
index 4d90159..93f01ca 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -1,3 +1,5 @@
+#define PROGRAM_NAME "nandtest"
+
 #define _GNU_SOURCE
 #include <ctype.h>
 #include <errno.h>
@@ -17,14 +19,15 @@
 
 void usage(void)
 {
-	fprintf(stderr, "usage: nandtest [OPTIONS] <device>\n\n"
+	fprintf(stderr, "usage: %s [OPTIONS] <device>\n\n"
 		"  -h, --help           Display this help output\n"
 		"  -m, --markbad        Mark blocks bad if they appear so\n"
 		"  -s, --seed           Supply random seed\n"
 		"  -p, --passes         Number of passes\n"
 		"  -o, --offset         Start offset on flash\n"
 		"  -l, --length         Length of flash to test\n"
-		"  -k, --keep           Restore existing contents after test\n");
+		"  -k, --keep           Restore existing contents after test\n",
+		PROGRAM_NAME);
 	exit(1);
 }
 
diff --git a/nandwrite.c b/nandwrite.c
index 9eb2004..3520c62 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -19,6 +19,9 @@
  * Bug/ToDo:
  */
 
+#define PROGRAM_NAME "nandwrite"
+#define VERSION "$Revision: 1.32 $"
+
 #define _GNU_SOURCE
 #include <ctype.h>
 #include <errno.h>
@@ -39,9 +42,6 @@
 #include <asm/types.h>
 #include "mtd/mtd-user.h"
 
-#define PROGRAM "nandwrite"
-#define VERSION "$Revision: 1.32 $"
-
 #define MAX_PAGE_SIZE	4096
 #define MAX_OOB_SIZE	128
 
@@ -94,16 +94,17 @@ static void display_help (void)
 
 static void display_version (void)
 {
-	printf(PROGRAM " " VERSION "\n"
+	printf("%1$s " VERSION "\n"
 			"\n"
 			"Copyright (C) 2003 Thomas Gleixner \n"
 			"\n"
-			PROGRAM " comes with NO WARRANTY\n"
+			"%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
 			"\n"
-			"You may redistribute copies of " PROGRAM "\n"
+			"You may redistribute copies of %1$s\n"
 			"under the terms of the GNU General Public Licence.\n"
-			"See the file `COPYING' for more information.\n");
+			"See the file `COPYING' for more information.\n",
+			PROGRAM_NAME);
 	exit (EXIT_SUCCESS);
 }
 
diff --git a/nftl_format.c b/nftl_format.c
index 167098a..1fc3b36 100644
--- a/nftl_format.c
+++ b/nftl_format.c
@@ -20,6 +20,8 @@
  *	2. test, test, and test !!!
  */
 
+#define PROGRAM_NAME "nftl_format"
+
 #define _XOPEN_SOURCE 500 /* for pread/pwrite */
 #include <unistd.h>
 #include <stdlib.h>
@@ -171,7 +173,7 @@ static int checkbbt(void)
 	int i, addr;
 
 	if (pread(fd, bbt, 512, 0x800) < 0) {
-		printf("nftl_format: failed to read BBT, errno=%d\n", errno);
+		printf("%s: failed to read BBT, errno=%d\n", PROGRAM_NAME, errno);
 		return (-1);
 	}
 
@@ -189,7 +191,7 @@ static int checkbbt(void)
 
 void usage(int rc)
 {
-	fprintf(stderr, "Usage: nftl_format [-ib] <mtddevice> [<start offset> [<size>]]\n");
+	fprintf(stderr, "Usage: %s [-ib] <mtddevice> [<start offset> [<size>]]\n", PROGRAM_NAME);
 	exit(rc);
 }
 
diff --git a/nftldump.c b/nftldump.c
index 6d72acd..90ea072 100644
--- a/nftldump.c
+++ b/nftldump.c
@@ -20,6 +20,8 @@
  *	2. test, test, and test !!!
  */
 
+#define PROGRAM_NAME "nftldump"
+
 #define _XOPEN_SOURCE 500 /* For pread */
 
 #include <unistd.h>
@@ -249,7 +251,7 @@ static void dump_virtual_units(void)
 int main(int argc, char **argv)
 {
 	if (argc < 2) {
-		printf("Usage: %s <device> [<outfile>]\n", argv[0]);
+		printf("Usage: %s <device> [<outfile>]\n", PROGRAM_NAME);
 		exit(1);
 	}
 	fd = open(argv[1], O_RDONLY);
diff --git a/recv_image.c b/recv_image.c
index 6d27f3b..fb8e8b3 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -1,4 +1,5 @@
 
+#define PROGRAM_NAME "recv_image"
 #define _XOPEN_SOURCE 500
 
 #include <errno.h>
@@ -63,7 +64,7 @@ int main(int argc, char **argv)
 
 	if (argc != 4) {
 		fprintf(stderr, "usage: %s <host> <port> <mtddev>\n",
-			(strrchr(argv[0], '/')?:argv[0]-1)+1);
+			PROGRAM_NAME);
 		exit(1);
 	}
 	/* Open the device */
diff --git a/rfddump.c b/rfddump.c
index 73b0eca..1934d93 100644
--- a/rfddump.c
+++ b/rfddump.c
@@ -9,6 +9,9 @@
  *  (at your option) any later version.
  */
 
+#define PROGRAM_NAME "rfddump"
+#define VERSION "$Revision 1.0 $"
+
 #define _XOPEN_SOURCE 500 /* For pread */
 
 #include <stdio.h>
@@ -51,27 +54,26 @@ struct rfd {
 	int verbose;
 };
 
-#define PROGRAM "rfddump"
-#define VERSION "$Revision 1.0 $"
-
 void display_help(void)
 {
-	printf("Usage: " PROGRAM " [OPTIONS] MTD-device filename\n"
+	printf("Usage: %s [OPTIONS] MTD-device filename\n"
 			"Dumps the contents of a resident flash disk\n"
 			"\n"
 			"-h         --help               display this help and exit\n"
 			"-V         --version            output version information and exit\n"
 			"-v         --verbose		Be verbose\n"
-			"-b size    --blocksize          Block size (defaults to erase unit)\n");
+			"-b size    --blocksize          Block size (defaults to erase unit)\n",
+			PROGRAM_NAME);
 	exit(0);
 }
 
 void display_version(void)
 {
-	printf(PROGRAM " " VERSION "\n"
+	printf("%s " VERSION "\n"
 			"\n"
 			"This is free software; see the source for copying conditions.  There is NO\n"
-			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n");
+			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
+			PROGRAM_NAME);
 
 	exit(0);
 }
@@ -248,13 +250,13 @@ int main(int argc, char *argv[])
 
 	rfd.header = malloc(rfd.header_size);
 	if (!rfd.header) {
-		perror(PROGRAM);
+		perror(PROGRAM_NAME);
 		close(fd);
 		return 2;
 	}
 	rfd.sector_map = malloc(rfd.sector_count * sizeof(int));
 	if (!rfd.sector_map) {
-		perror(PROGRAM);
+		perror(PROGRAM_NAME);
 		close(fd);
 		free(rfd.sector_map);
 		return 2;
diff --git a/rfdformat.c b/rfdformat.c
index d2637a1..17d9d2d 100644
--- a/rfdformat.c
+++ b/rfdformat.c
@@ -12,6 +12,9 @@
  * the beginning of each block.
  */
 
+#define PROGRAM_NAME "rfdformat"
+#define VERSION "$Revision 1.0 $"
+
 #define _XOPEN_SOURCE 500 /* For pread/pwrite */
 
 #include <stdio.h>
@@ -26,25 +29,24 @@
 #include <mtd/mtd-user.h>
 #include <linux/types.h>
 
-#define PROGRAM "rfdformat"
-#define VERSION "$Revision 1.0 $"
-
 void display_help(void)
 {
-	printf("Usage: " PROGRAM " [OPTIONS] MTD-device\n"
+	printf("Usage: %s [OPTIONS] MTD-device\n"
 			"Formats NOR flash for resident flash disk\n"
 			"\n"
 			"-h         --help               display this help and exit\n"
-			"-V         --version            output version information and exit\n");
+			"-V         --version            output version information and exit\n",
+			PROGRAM_NAME);
 	exit(0);
 }
 
 void display_version(void)
 {
-	printf(PROGRAM " " VERSION "\n"
+	printf("%s " VERSION "\n"
 			"\n"
 			"This is free software; see the source for copying conditions.  There is NO\n"
-			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n");
+			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
+			PROGRAM_NAME);
 
 	exit(0);
 }
diff --git a/serve_image.c b/serve_image.c
index 4b5dba9..f8f28a1 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -1,3 +1,4 @@
+#define PROGRAM_NAME "serve_image"
 #define _POSIX_C_SOURCE 199309
 
 #include <time.h>
@@ -59,7 +60,7 @@ int main(int argc, char **argv)
 	}
 	if (argc != 5) {
 		fprintf(stderr, "usage: %s <host> <port> <image> <erasesize> [<tx_rate>]\n",
-			(strrchr(argv[0], '/')?:argv[0]-1)+1);
+			PROGRAM_NAME);
 		exit(1);
 	}
 	pkt_delay = (sizeof(pktbuf) * 1000000) / tx_rate;
diff --git a/sumtool.c b/sumtool.c
index 2e2098c..d0e2a7b 100644
--- a/sumtool.c
+++ b/sumtool.c
@@ -26,6 +26,8 @@
  *
  */
 
+#define PROGRAM_NAME "sumtool"
+
 #include <errno.h>
 #include <stdint.h>
 #include <stdio.h>
@@ -49,8 +51,6 @@
 
 #define PAD(x) (((x)+3)&~3)
 
-static const char *const app_name = "sumtool";
-
 static struct jffs2_summary *sum_collected = NULL;
 
 static int verbose = 0;
@@ -122,7 +122,7 @@ static unsigned char ffbuf[16] = {
 static void verror_msg(const char *s, va_list p)
 {
 	fflush(stdout);
-	fprintf(stderr, "%s: ", app_name);
+	fprintf(stderr, "%s: ", PROGRAM_NAME);
 	vfprintf(stderr, s, p);
 }
 
diff --git a/ubi-utils/src/libscan.c b/ubi-utils/src/libscan.c
index 6c6990f..dc47a89 100644
--- a/ubi-utils/src/libscan.c
+++ b/ubi-utils/src/libscan.c
@@ -20,6 +20,8 @@
  * UBI scanning library.
  */
 
+#define PROGRAM_NAME "libscan"
+
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <stdint.h>
@@ -35,8 +37,6 @@
 #include <crc32.h>
 #include "common.h"
 
-#define PROGRAM_NAME "libscan"
-
 static int all_ff(const void *buf, int len)
 {
 	int i;
diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
index 2eab3ba..4d5f316 100644
--- a/ubi-utils/src/libubi.c
+++ b/ubi-utils/src/libubi.c
@@ -20,6 +20,8 @@
  * UBI (Unsorted Block Images) library.
  */
 
+#define PROGRAM_NAME "libubi"
+
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -34,8 +36,6 @@
 #include "libubi_int.h"
 #include "common.h"
 
-#define PROGRAM_NAME "libubi"
-
 /**
  * mkpath - compose full path from 2 given components.
  * @path: the first component
diff --git a/ubi-utils/src/libubigen.c b/ubi-utils/src/libubigen.c
index 710aa97..9eaa7f5 100644
--- a/ubi-utils/src/libubigen.c
+++ b/ubi-utils/src/libubigen.c
@@ -24,6 +24,8 @@
  *          Artem Bityutskiy
  */
 
+#define PROGRAM_NAME "libubigen"
+
 #include <stdlib.h>
 #include <stdint.h>
 #include <unistd.h>
@@ -35,8 +37,6 @@
 #include <crc32.h>
 #include "common.h"
 
-#define PROGRAM_NAME "libubigen"
-
 void ubigen_info_init(struct ubigen_info *ui, int peb_size, int min_io_size,
 		      int subpage_size, int vid_hdr_offs, int ubi_ver,
 		      uint32_t image_seq)
diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index b39ed5f..a2d7547 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -21,6 +21,9 @@
  * Author: Artem Bityutskiy
  */
 
+#define PROGRAM_VERSION "1.0"
+#define PROGRAM_NAME    "mtdinfo"
+
 #include <stdint.h>
 #include <stdio.h>
 #include <getopt.h>
@@ -33,9 +36,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.0"
-#define PROGRAM_NAME    "mtdinfo"
-
 /* The variables below are set by command line arguments */
 struct args {
 	int mtdn;
diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index 5a7d2cf..51a0cfb 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -21,6 +21,9 @@
  * Author: Artem Bityutskiy
  */
 
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubiattach"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <getopt.h>
@@ -31,8 +34,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubiattach"
 #define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
 
 /* The variables below are set by command line arguments */
diff --git a/ubi-utils/src/ubicrc32.c b/ubi-utils/src/ubicrc32.c
index becd604..ec10858 100644
--- a/ubi-utils/src/ubicrc32.c
+++ b/ubi-utils/src/ubicrc32.c
@@ -22,6 +22,9 @@
  * Author: Oliver Lohmann
  */
 
+#define PROGRAM_VERSION "1.0"
+#define PROGRAM_NAME    "ubicrc32"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <stdlib.h>
@@ -34,9 +37,6 @@
 
 #define BUFSIZE 4096
 
-#define PROGRAM_VERSION "1.0"
-#define PROGRAM_NAME    "ubicrc32"
-
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
 			 " - a tool to calculate CRC32 with UBI start value (0xFFFFFFFF)";
 
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index e0bc050..59e478b 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -21,6 +21,9 @@
  * Author: Artem Bityutskiy
  */
 
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubidetach"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <getopt.h>
@@ -30,8 +33,6 @@
 #include <libubi.h>
 #include "common.h"
 
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubidetach"
 #define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
 
 /* The variables below are set by command line arguments */
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 8559f61..7cea8a9 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -29,6 +29,9 @@
  */
 #define MAX_CONSECUTIVE_BAD_BLOCKS 4
 
+#define PROGRAM_VERSION "1.5"
+#define PROGRAM_NAME    "ubiformat"
+
 #include <sys/stat.h>
 #include <unistd.h>
 #include <stdint.h>
@@ -45,9 +48,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.5"
-#define PROGRAM_NAME    "ubiformat"
-
 /* The variables below are set by command line arguments */
 struct args {
 	unsigned int yes:1;
diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/src/ubimkvol.c
index c867c44..cc8cd55 100644
--- a/ubi-utils/src/ubimkvol.c
+++ b/ubi-utils/src/ubimkvol.c
@@ -23,6 +23,9 @@
  *          Frank Haverkamp <haver@vnet.ibm.com>
  */
 
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubimkvol"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <getopt.h>
@@ -33,9 +36,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubimkvol"
-
 /* The variables below are set by command line arguments */
 struct args {
 	int vol_id;
diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
index cecab43..44f6fb0 100644
--- a/ubi-utils/src/ubinfo.c
+++ b/ubi-utils/src/ubinfo.c
@@ -21,6 +21,9 @@
  * Author: Artem Bityutskiy
  */
 
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubinfo"
+
 #include <stdint.h>
 #include <stdio.h>
 #include <getopt.h>
@@ -31,9 +34,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubinfo"
-
 /* The variables below are set by command line arguments */
 struct args {
 	int devn;
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index 2ff4e29..5cee5aa 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -24,6 +24,9 @@
  *          Oliver Lohmann
  */
 
+#define PROGRAM_VERSION "1.2"
+#define PROGRAM_NAME    "ubinize"
+
 #include <sys/stat.h>
 #include <stdlib.h>
 #include <getopt.h>
@@ -36,9 +39,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.2"
-#define PROGRAM_NAME    "ubinize"
-
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
 " - a tool to generate UBI images. An UBI image may contain one or more UBI "
 "volumes which have to be defined in the input configuration ini-file. The "
diff --git a/ubi-utils/src/ubirename.c b/ubi-utils/src/ubirename.c
index 00c53e4..295bfc7 100644
--- a/ubi-utils/src/ubirename.c
+++ b/ubi-utils/src/ubirename.c
@@ -21,6 +21,9 @@
  * Author: Richard Titmuss
  */
 
+#define PROGRAM_VERSION "1.0"
+#define PROGRAM_NAME    "ubirename"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <getopt.h>
@@ -30,9 +33,6 @@
 #include <libubi.h>
 #include "common.h"
 
-#define PROGRAM_VERSION "1.0"
-#define PROGRAM_NAME    "ubirename"
-
 static const char *usage =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [<old name> <new name>|...]\n\n"
 "Example: " PROGRAM_NAME "/dev/ubi0 A B C D - rename volume A to B, and C to D\n\n"
diff --git a/ubi-utils/src/ubirmvol.c b/ubi-utils/src/ubirmvol.c
index 4fbe73a..334bb38 100644
--- a/ubi-utils/src/ubirmvol.c
+++ b/ubi-utils/src/ubirmvol.c
@@ -23,6 +23,9 @@
  *          Frank Haverkamp <haver@vnet.ibm.com>
  */
 
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubirmvol"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <getopt.h>
@@ -32,9 +35,6 @@
 #include <libubi.h>
 #include "common.h"
 
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubirmvol"
-
 /* The variables below are set by command line arguments */
 struct args {
 	int vol_id;
diff --git a/ubi-utils/src/ubirsvol.c b/ubi-utils/src/ubirsvol.c
index 683e606..a622ea6 100644
--- a/ubi-utils/src/ubirsvol.c
+++ b/ubi-utils/src/ubirsvol.c
@@ -23,6 +23,9 @@
  *          Frank Haverkamp <haver@vnet.ibm.com>
  */
 
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubirsvol"
+
 #include <stdio.h>
 #include <stdint.h>
 #include <getopt.h>
@@ -33,9 +36,6 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubirsvol"
-
 /* The variables below are set by command line arguments */
 struct args {
 	int vol_id;
diff --git a/ubi-utils/src/ubiupdatevol.c b/ubi-utils/src/ubiupdatevol.c
index b314b58..4521138 100644
--- a/ubi-utils/src/ubiupdatevol.c
+++ b/ubi-utils/src/ubiupdatevol.c
@@ -24,6 +24,9 @@
  *          Artem Bityutskiy
  */
 
+#define PROGRAM_VERSION "1.2"
+#define PROGRAM_NAME    "ubiupdatevol"
+
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdint.h>
@@ -37,9 +40,6 @@
 #include <libubi.h>
 #include "common.h"
 
-#define PROGRAM_VERSION "1.2"
-#define PROGRAM_NAME    "ubiupdatevol"
-
 struct args {
 	int truncate;
 	const char *node;
diff --git a/ubi-utils/src/ubiutils-common.c b/ubi-utils/src/ubiutils-common.c
index da5156d..6609a6b 100644
--- a/ubi-utils/src/ubiutils-common.c
+++ b/ubi-utils/src/ubiutils-common.c
@@ -23,6 +23,8 @@
  *          Adrian Hunter
  */
 
+#define PROGRAM_NAME "ubiutils"
+
 #include <sys/time.h>
 #include <sys/types.h>
 #include <stdio.h>
-- 
1.7.2.3
