Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bV0Ry-0000f1-HN
 for linux-mtd@lists.infradead.org; Wed, 03 Aug 2016 17:59:36 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, gustavo@zacarias.com.ar,
 otavio@debian.org, riku.voipio@linaro.org, pascal.bleser@opensuse.org,
 mpluskal@suse.com, dwmw2@infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 4/5] Unify version string printing
Date: Wed,  3 Aug 2016 19:57:14 +0200
Message-Id: <20160803175715.1171-5-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20160803175715.1171-1-david.oberhollenzer@sigma-star.at>
References: <20160803175715.1171-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a program does sophisticated enough command line processing
(i.e. getopt), make sure it responds to -V and --version.

When a program prints a version string, make sure it uses the
common_print_version macro to print out its name, that it is part
of mtd-utils and the mtd-utils version from the build system in a
fashion similar to common program packages like the GNU coreutils.

When a program responds to -V/--version or -h/--help, make sure it
reports success exit status.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 include/common.h                    |  2 +-
 jffsX-utils/jffs2dump.c             | 29 ++++++++++++-----------------
 jffsX-utils/jffs2reader.c           | 18 +++++++++++++++---
 jffsX-utils/mkfs.jffs2.c            |  8 ++++----
 jffsX-utils/sumtool.c               |  9 ++++-----
 misc-utils/flash_erase.c            | 27 +++++++++++----------------
 misc-utils/flash_unlock.c           |  8 ++++----
 misc-utils/flashcp.c                | 13 +++++++++----
 misc-utils/ftl_check.c              | 14 ++++++++++++--
 misc-utils/ftl_format.c             | 22 ++++++++++++++++++----
 misc-utils/mtdpart.c                | 13 ++++++-------
 nand-utils/nanddump.c               | 15 +++++++--------
 nand-utils/nandtest.c               |  9 +++++++--
 nand-utils/nandwrite.c              | 17 ++++++++---------
 nand-utils/nftl_format.c            | 33 +++++++++++++++++++++++++++++----
 nor-utils/rfddump.c                 | 12 +++++-------
 nor-utils/rfdformat.c               | 12 +++++-------
 tests/fs-tests/integrity/integck.c  |  5 ++---
 tests/jittertest/JitterTest.c       |  8 +++-----
 tests/jittertest/plotJittervsFill.c |  6 ++++--
 20 files changed, 166 insertions(+), 114 deletions(-)

diff --git a/include/common.h b/include/common.h
index 7c201ed..0a68a92 100644
--- a/include/common.h
+++ b/include/common.h
@@ -210,7 +210,7 @@ simple_strtoX(strtoull, unsigned long long int)
 /* Simple version-printing for utils */
 #define common_print_version() \
 do { \
-	printf("%s %s\n", PROGRAM_NAME, VERSION); \
+	printf("%s (mtd-utils) %s\n", PROGRAM_NAME, VERSION); \
 } while (0)
 
 #include "xalloc.h"
diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index f8b8ac7..4b3164b 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -54,8 +54,8 @@ void display_help (void)
 {
 	printf("Usage: %s [OPTION]... INPUTFILE\n"
 	       "Dump the contents of a binary JFFS2 image.\n\n"
-	       "     --help                   display this help and exit\n"
-	       "     --version                display version information and exit\n"
+	       " -h, --help                   display this help and exit\n"
+	       " -V, --version                display version information and exit\n"
 	       " -b, --bigendian              image is big endian\n"
 	       " -l, --littleendian           image is little endian\n"
 	       " -c, --content                dump image contents\n"
@@ -70,9 +70,8 @@ void display_help (void)
 
 void display_version (void)
 {
-	printf("%1$s " VERSION "\n"
-			"\n"
-			"Copyright (C) 2003 Thomas Gleixner \n"
+	common_print_version();
+	printf("Copyright (C) 2003 Thomas Gleixner \n"
 			"\n"
 			"%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
@@ -102,10 +101,10 @@ void process_options (int argc, char *argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "blce:rd:o:v";
+		static const char *short_options = "blce:rd:o:vVh";
 		static const struct option long_options[] = {
-			{"help", no_argument, 0, 0},
-			{"version", no_argument, 0, 0},
+			{"help", no_argument, 0, 'h'},
+			{"version", no_argument, 0, 'V'},
 			{"bigendian", no_argument, 0, 'b'},
 			{"littleendian", no_argument, 0, 'l'},
 			{"content", no_argument, 0, 'c'},
@@ -124,15 +123,11 @@ void process_options (int argc, char *argv[])
 		}
 
 		switch (c) {
-			case 0:
-				switch (option_index) {
-					case 0:
-						display_help();
-						break;
-					case 1:
-						display_version();
-						break;
-				}
+			case 'h':
+				display_help();
+				break;
+			case 'V':
+				display_version();
 				break;
 			case 'v':
 				verbose = 1;
diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index a62da9a..09d1d89 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -71,6 +71,7 @@ BUGS:
 #include <unistd.h>
 #include <fcntl.h>
 #include <time.h>
+#include <getopt.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <dirent.h>
@@ -79,6 +80,14 @@ BUGS:
 #include "mtd/jffs2-user.h"
 #include "common.h"
 
+static struct option long_opt[] = {
+	{"help", 0, NULL, 'h'},
+	{"version", 0, NULL, 'V'},
+	{NULL, 0, NULL, 0},
+};
+
+static const char *short_opt = "rd:f:tVh";
+
 #define SCRATCH_SIZE (5*1024*1024)
 
 /* macro to avoid "lvalue required as left operand of assignment" error */
@@ -857,7 +866,7 @@ void catfile(char *o, size_t size, char *path, char *b, size_t bsize,
 
 int main(int argc, char **argv)
 {
-	int fd, opt, recurse = 0, want_ctime = 0;
+	int fd, opt, c, recurse = 0, want_ctime = 0;
 	struct stat st;
 
 	char *scratch, *dir = NULL, *file = NULL;
@@ -865,7 +874,7 @@ int main(int argc, char **argv)
 
 	char *buf;
 
-	while ((opt = getopt(argc, argv, "rd:f:t")) > 0) {
+	while ((opt = getopt_long(argc, argv, short_opt, long_opt, &c)) > 0) {
 		switch (opt) {
 			case 'd':
 				dir = optarg;
@@ -879,11 +888,14 @@ int main(int argc, char **argv)
 			case 't':
 				want_ctime++;
 				break;
+			case 'V':
+				common_print_version();
+				exit(EXIT_SUCCESS);
 			default:
 				fprintf(stderr,
 						"Usage: %s <image> [-d|-f] < path >\n",
 						PROGRAM_NAME);
-				exit(EXIT_FAILURE);
+				exit(opt == 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
 		}
 	}
 
diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index b83c1ee..5446a16 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -1427,8 +1427,6 @@ static const char helptext[] =
 "  -V, --version           Display version information\n"
 "  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n\n";
 
-static const char revtext[] = "1.60";
-
 int load_next_block() {
 
 	int ret;
@@ -1631,14 +1629,16 @@ int main(int argc, char **argv)
 
 			case 'h':
 			case '?':
-				errmsg_die("%s", helptext);
+				puts(helptext);
+				exit(EXIT_SUCCESS);
 
 			case 'v':
 				verbose = 1;
 				break;
 
 			case 'V':
-				errmsg_die("revision %s\n", revtext);
+				common_print_version();
+				exit(EXIT_SUCCESS);
 
 			case 'e': {
 						  char *next;
diff --git a/jffsX-utils/sumtool.c b/jffsX-utils/sumtool.c
index 886b545..0958615 100644
--- a/jffsX-utils/sumtool.c
+++ b/jffsX-utils/sumtool.c
@@ -113,8 +113,6 @@ static const char helptext[] =
 "                            eraseblock\n\n";
 
 
-static const char revtext[] = "$Revision: 1.9 $";
-
 static unsigned char ffbuf[16] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
@@ -159,14 +157,15 @@ void process_options (int argc, char **argv)
 				break;
 			case 'h':
 			case '?':
-				errmsg_die("%s", helptext);
+				puts(helptext);
+				exit(EXIT_SUCCESS);
 			case 'v':
 				verbose = 1;
 				break;
 
 			case 'V':
-				errmsg_die("revision %.*s\n",
-						(int) strlen(revtext) - 13, revtext + 11);
+				common_print_version();
+				exit(EXIT_SUCCESS);
 
 			case 'e': {
 						  char *next;
diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 933373a..2bca78d 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -76,9 +76,8 @@ static void display_help (void)
 
 static void display_version (void)
 {
-	printf("%1$s version " VERSION "\n"
-			"\n"
-			"Copyright (C) 2000 Arcom Control Systems Ltd\n"
+	common_print_version();
+	printf("Copyright (C) 2000 Arcom Control Systems Ltd\n"
 			"\n"
 			"%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
@@ -105,10 +104,10 @@ int main(int argc, char *argv[])
 	 */
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "jNqu";
+		static const char *short_options = "jNquVh";
 		static const struct option long_options[] = {
-			{"help", no_argument, 0, 0},
-			{"version", no_argument, 0, 0},
+			{"help", no_argument, 0, 'h'},
+			{"version", no_argument, 0, 'V'},
 			{"jffs2", no_argument, 0, 'j'},
 			{"noskipbad", no_argument, 0, 'N'},
 			{"quiet", no_argument, 0, 'q'},
@@ -124,16 +123,12 @@ int main(int argc, char *argv[])
 			break;
 
 		switch (c) {
-		case 0:
-			switch (option_index) {
-			case 0:
-				display_help();
-				return 0;
-			case 1:
-				display_version();
-				return 0;
-			}
-			break;
+		case 'h':
+			display_help();
+			return EXIT_SUCCESS;
+		case 'V':
+			display_version();
+			return EXIT_SUCCESS;
 		case 'j':
 			jffs2 = 1;
 			break;
diff --git a/misc-utils/flash_unlock.c b/misc-utils/flash_unlock.c
index f51870a..94f4761 100644
--- a/misc-utils/flash_unlock.c
+++ b/misc-utils/flash_unlock.c
@@ -46,7 +46,7 @@ static void usage(int status)
 		"\n"
 		"Options:\n"
 		" -h         --help              Display this help and exit\n"
-		"            --version           Display version information and exit\n"
+		" -V         --version           Display version information and exit\n"
 		" -i         --islocked          Check if flash region is locked\n"
 		" -l         --lock              Lock a region of flash\n"
 		" -u         --unlock            Unlock a region of flash\n"
@@ -59,13 +59,13 @@ static void usage(int status)
 	exit(status);
 }
 
-static const char short_opts[] = "hilu";
+static const char short_opts[] = "hiluV";
 static const struct option long_opts[] = {
 	{ "help",	no_argument,	0, 'h' },
 	{ "islocked",	no_argument,	0, 'i' },
 	{ "lock",	no_argument,	0, 'l' },
 	{ "unlock",	no_argument,	0, 'u' },
-	{ "version",	no_argument,	0, 'v' },
+	{ "version",	no_argument,	0, 'V' },
 	{ NULL,		0,		0, 0 },
 };
 
@@ -101,7 +101,7 @@ static void process_args(int argc, char *argv[])
 			req = REQUEST_UNLOCK;
 			req_set++;
 			break;
-		case 'v':
+		case 'V':
 			common_print_version();
 			exit(0);
 		default:
diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 3fddeb0..6594a45 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -43,9 +43,7 @@
 #include <mtd/mtd-user.h>
 #include <getopt.h>
 
-typedef int bool;
-#define true 1
-#define false 0
+#include "common.h"
 
 #define EXIT_FAILURE 1
 #define EXIT_SUCCESS 0
@@ -96,9 +94,11 @@ static void showusage(bool error)
 			"\n"
 			"usage: %1$s [ -v | --verbose ] <filename> <device>\n"
 			"       %1$s -h | --help\n"
+			"       %1$s -V | --version\n"
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
+			"   -V | --version   Show version information and exit\n"
 			"   <filename>       File which you want to copy to flash\n"
 			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
 			"\n",
@@ -182,10 +182,11 @@ int main (int argc,char *argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "hv";
+		static const char *short_options = "hvV";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"verbose", no_argument, 0, 'v'},
+			{"version", no_argument, 0, 'V'},
 			{0, 0, 0, 0},
 		};
 
@@ -204,6 +205,10 @@ int main (int argc,char *argv[])
 				flags |= FLAG_VERBOSE;
 				DEBUG("Got FLAG_VERBOSE\n");
 				break;
+			case 'V':
+				common_print_version();
+				exit(EXIT_SUCCESS);
+				break;
 			default:
 				DEBUG("Unknown parameter: %s\n",argv[option_index]);
 				showusage(true);
diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
index 0eada8f..d7d2e8b 100644
--- a/misc-utils/ftl_check.c
+++ b/misc-utils/ftl_check.c
@@ -44,6 +44,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <errno.h>
+#include <getopt.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
@@ -175,14 +176,23 @@ void showusage(void)
 
 /*====================================================================*/
 
+static const struct option long_opts[] = {
+	{"help", no_argument, 0, 'h'},
+	{"version", no_argument, 0, 'V'},
+	{0, 0, 0, 0},
+};
+
 int main(int argc, char *argv[])
 {
-	int optch, errflg, fd;
+	int c, optch, errflg, fd;
 	struct stat buf;
 
 	errflg = 0;
-	while ((optch = getopt(argc, argv, "h")) != -1) {
+	while ((optch = getopt_long(argc, argv, "hV", long_opts, &c)) != -1) {
 		switch (optch) {
+			case 'V':
+				common_print_version();
+				exit(EXIT_SUCCESS);
 			case 'h':
 				errflg = 1; break;
 			default:
diff --git a/misc-utils/ftl_format.c b/misc-utils/ftl_format.c
index b58677f..74322c7 100644
--- a/misc-utils/ftl_format.c
+++ b/misc-utils/ftl_format.c
@@ -45,6 +45,7 @@
 #include <fcntl.h>
 #include <errno.h>
 #include <time.h>
+#include <getopt.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 
@@ -253,9 +254,17 @@ static int format_partition(int fd, int quiet, int interrogate,
 
 /*====================================================================*/
 
+static const struct option long_opts[] = {
+	{"help", no_argument, 0, 'h'},
+	{"version", no_argument, 0, 'V'},
+	{0, 0, 0, 0},
+};
+
+static const char *short_opts = "qir:s:b:Vh";
+
 int main(int argc, char *argv[])
 {
-	int quiet, interrogate, reserve;
+	int quiet, interrogate, reserve, c;
 	int optch, errflg, fd, ret;
 	u_int spare, bootsize;
 	char *s;
@@ -269,7 +278,7 @@ int main(int argc, char *argv[])
 	errflg = 0;
 	bootsize = 0;
 
-	while ((optch = getopt(argc, argv, "qir:s:b:")) != -1) {
+	while ((optch = getopt_long(argc, argv, short_opts, long_opts, &c)) != -1) {
 		switch (optch) {
 			case 'q':
 				quiet = 1; break;
@@ -284,14 +293,19 @@ int main(int argc, char *argv[])
 				if ((*s == 'k') || (*s == 'K'))
 					bootsize *= 1024;
 				break;
-			default:
+			case 'V':
+				common_print_version();
+				exit(EXIT_SUCCESS);
+			case 'h':
 				errflg = 1; break;
+			default:
+				errflg = -1; break;
 		}
 	}
 	if (errflg || (optind != argc-1)) {
 		fprintf(stderr, "usage: %s [-q] [-i] [-s spare-blocks]"
 				" [-r reserve-percent] [-b bootsize] device\n", PROGRAM_NAME);
-		exit(EXIT_FAILURE);
+		exit(errflg > 0 ? EXIT_SUCCESS : EXIT_FAILURE);
 	}
 
 	if (stat(argv[optind], &buf) != 0) {
diff --git a/misc-utils/mtdpart.c b/misc-utils/mtdpart.c
index 0016e34..e480e1b 100644
--- a/misc-utils/mtdpart.c
+++ b/misc-utils/mtdpart.c
@@ -34,7 +34,7 @@ static void display_help(int status)
 "Adds a partition to an MTD device, or remove an existing partition from it.\n"
 "\n"
 "  -h, --help    Display this help and exit\n"
-"      --version Output version information and exit\n"
+"  -V, --version Output version information and exit\n"
 "\n"
 "START location and SIZE of the partition are in bytes. They should align on\n"
 "eraseblock size.\n",
@@ -45,9 +45,8 @@ static void display_help(int status)
 
 static void display_version(void)
 {
-	printf("%1$s " VERSION "\n"
-			"\n"
-			"%1$s comes with NO WARRANTY\n"
+	common_print_version();
+	printf("%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
 			"\n"
 			"You may redistribute copies of %1$s\n"
@@ -77,9 +76,9 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char short_options[] = "h";
+		static const char short_options[] = "hV";
 		static const struct option long_options[] = {
-			{"version", no_argument, 0, 0},
+			{"version", no_argument, 0, 'V'},
 			{"help", no_argument, 0, 'h'},
 			{0, 0, 0, 0},
 		};
@@ -91,7 +90,7 @@ static void process_options(int argc, char * const argv[])
 		}
 
 		switch (c) {
-			case 0:
+			case 'V':
 				display_version();
 				break;
 			case 'h':
diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 4ee7ed4..c6518b8 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -63,9 +63,8 @@ static void display_help(int status)
 
 static void display_version(void)
 {
-	printf("%1$s " VERSION "\n"
-			"\n"
-			"%1$s comes with NO WARRANTY\n"
+	common_print_version();
+	printf("%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
 			"\n"
 			"You may redistribute copies of %1$s\n"
@@ -101,9 +100,9 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char short_options[] = "hs:f:l:opqnca";
+		static const char short_options[] = "hs:f:l:opqncaV";
 		static const struct option long_options[] = {
-			{"version", no_argument, 0, 0},
+			{"version", no_argument, 0, 'V'},
 			{"bb", required_argument, 0, 0},
 			{"omitoob", no_argument, 0, 0},
 			{"help", no_argument, 0, 'h'},
@@ -128,9 +127,6 @@ static void process_options(int argc, char * const argv[])
 		switch (c) {
 			case 0:
 				switch (option_index) {
-					case 0:
-						display_version();
-						break;
 					case 1:
 						/* Handle --bb=METHOD */
 						if (!strcmp(optarg, "padbad"))
@@ -152,6 +148,9 @@ static void process_options(int argc, char * const argv[])
 						break;
 				}
 				break;
+			case 'V':
+				display_version();
+				break;
 			case 's':
 				start_addr = simple_strtoll(optarg, &error);
 				break;
diff --git a/nand-utils/nandtest.c b/nand-utils/nandtest.c
index 2ef7cc8..5676733 100644
--- a/nand-utils/nandtest.c
+++ b/nand-utils/nandtest.c
@@ -22,6 +22,7 @@ void usage(int status)
 	fprintf(status ? stderr : stdout,
 		"usage: %s [OPTIONS] <device>\n\n"
 		"  -h, --help           Display this help output\n"
+		"  -V, --version        Display version information and exit\n"
 		"  -m, --markbad        Mark blocks bad if they appear so\n"
 		"  -s, --seed           Supply random seed\n"
 		"  -p, --passes         Number of passes\n"
@@ -160,9 +161,10 @@ int main(int argc, char **argv)
 	seed = time(NULL);
 
 	for (;;) {
-		static const char short_options[] = "hkl:mo:p:r:s:";
+		static const char short_options[] = "hkl:mo:p:r:s:V";
 		static const struct option long_options[] = {
 			{ "help", no_argument, 0, 'h' },
+			{ "version", no_argument, 0, 'V' },
 			{ "markbad", no_argument, 0, 'm' },
 			{ "seed", required_argument, 0, 's' },
 			{ "passes", required_argument, 0, 'p' },
@@ -181,7 +183,10 @@ int main(int argc, char **argv)
 		case 'h':
 			usage(0);
 			break;
-
+		case 'V':
+			common_print_version();
+			exit(EXIT_SUCCESS);
+			break;
 		case '?':
 			usage(1);
 			break;
diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index 9c3fe8f..1c00cdf 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -61,16 +61,15 @@ static void display_help(int status)
 "      --input-size=length Only read |length| bytes of the input file\n"
 "  -q, --quiet             Don't display progress messages\n"
 "  -h, --help              Display this help and exit\n"
-"      --version           Output version information and exit\n"
+"  -V, --version           Output version information and exit\n"
 	);
 	exit(status);
 }
 
 static void display_version(void)
 {
-	printf("%1$s " VERSION "\n"
-			"\n"
-			"Copyright (C) 2003 Thomas Gleixner \n"
+	common_print_version();
+	printf("Copyright (C) 2003 Thomas Gleixner \n"
 			"\n"
 			"%1$s comes with NO WARRANTY\n"
 			"to the extent permitted by law.\n"
@@ -103,10 +102,10 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char short_options[] = "hb:mnNoOpqs:a";
+		static const char short_options[] = "hb:mnNoOpqs:aV";
 		static const struct option long_options[] = {
 			/* Order of these args with val==0 matters; see option_index. */
-			{"version", no_argument, 0, 0},
+			{"version", no_argument, 0, 'V'},
 			{"input-skip", required_argument, 0, 0},
 			{"input-size", required_argument, 0, 0},
 			{"help", no_argument, 0, 'h'},
@@ -131,9 +130,6 @@ static void process_options(int argc, char * const argv[])
 		switch (c) {
 		case 0:
 			switch (option_index) {
-			case 0: /* --version */
-				display_version();
-				break;
 			case 1: /* --input-skip */
 				inputskip = simple_strtoll(optarg, &error);
 				break;
@@ -142,6 +138,9 @@ static void process_options(int argc, char * const argv[])
 				break;
 			}
 			break;
+		case 'V':
+			display_version();
+			break;
 		case 'q':
 			quiet = true;
 			break;
diff --git a/nand-utils/nftl_format.c b/nand-utils/nftl_format.c
index 1fc3b36..8485553 100644
--- a/nand-utils/nftl_format.c
+++ b/nand-utils/nftl_format.c
@@ -33,6 +33,7 @@
 #include <sys/mount.h>
 #include <errno.h>
 #include <string.h>
+#include <getopt.h>
 
 #include <asm/types.h>
 #include <mtd/mtd-user.h>
@@ -40,6 +41,8 @@
 #include <mtd/inftl-user.h>
 #include <mtd_swab.h>
 
+#include "common.h"
+
 unsigned char BadUnitTable[MAX_ERASE_ZONES];
 unsigned char *readbuf;
 unsigned char *writebuf[4];
@@ -53,6 +56,12 @@ struct INFTLMediaHeader *INFTLhdr;
 static int do_oobcheck = 1;
 static int do_rwecheck = 1;
 
+static const struct option long_opts[] = {
+	{"version", no_argument, 0, 'V'},
+	{"help", no_argument, 0, 'h'},
+	{0, 0, 0, 0},
+};
+
 static unsigned char check_block_1(unsigned long block)
 {
 	unsigned char oobbuf[16];
@@ -195,6 +204,21 @@ void usage(int rc)
 	exit(rc);
 }
 
+static void display_version(void)
+{
+	common_print_version();
+	printf("Copyright (C) 2005 Thomas Gleixner \n"
+			"\n"
+			"%1$s comes with NO WARRANTY\n"
+			"to the extent permitted by law.\n"
+			"\n"
+			"You may redistribute copies of %1$s\n"
+			"under the terms of the GNU General Public Licence.\n"
+			"See the file `COPYING' for more information.\n",
+			PROGRAM_NAME);
+	exit(EXIT_SUCCESS);
+}
+
 int main(int argc, char **argv)
 {
 	unsigned long startofs = 0, part_size = 0;
@@ -207,16 +231,14 @@ int main(int argc, char **argv)
 	char *mtddevice;
 	const char *nftl;
 	int c, do_inftl = 0, do_bbt = 0;
-
-
-	printf("version 1.24 2005/11/07 11:15:13 gleixner\n");
+	int idx = 0;
 
 	if (argc < 2)
 		usage(1);
 
 	nftl = "NFTL";
 
-	while ((c = getopt(argc, argv, "?hib")) > 0) {
+	while ((c = getopt_long(argc, argv, "?hibV", long_opts, &idx)) != -1) {
 		switch (c) {
 			case 'i':
 				nftl = "INFTL";
@@ -229,6 +251,9 @@ int main(int argc, char **argv)
 			case '?':
 				usage(0);
 				break;
+			case 'V':
+				display_version();
+				break;
 			default:
 				usage(1);
 				break;
diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index 32810f5..048f58c 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -10,7 +10,6 @@
  */
 
 #define PROGRAM_NAME "rfddump"
-#define PROGRAM_VERSION "$Revision 1.0 $"
 
 #define _XOPEN_SOURCE 500 /* For pread */
 
@@ -28,6 +27,8 @@
 #include <linux/types.h>
 #include <mtd_swab.h>
 
+#include "common.h"
+
 /* next is an array of mapping for each corresponding sector */
 #define RFD_MAGIC		0x9193
 #define HEADER_MAP_OFFSET       3
@@ -69,12 +70,9 @@ void display_help(void)
 
 void display_version(void)
 {
-	printf("%s " PROGRAM_VERSION "\n"
-			"\n"
-			"This is free software; see the source for copying conditions.  There is NO\n"
-			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
-			PROGRAM_NAME);
-
+	common_print_version();
+	printf("This is free software; see the source for copying conditions.  There is NO\n"
+			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n");
 	exit(0);
 }
 
diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
index a8a44a9..d393975 100644
--- a/nor-utils/rfdformat.c
+++ b/nor-utils/rfdformat.c
@@ -13,7 +13,6 @@
  */
 
 #define PROGRAM_NAME "rfdformat"
-#define PROGRAM_VERSION "$Revision 1.0 $"
 
 #define _XOPEN_SOURCE 500 /* For pread/pwrite */
 
@@ -29,6 +28,8 @@
 #include <mtd/mtd-user.h>
 #include <linux/types.h>
 
+#include "common.h"
+
 void display_help(void)
 {
 	printf("Usage: %s [OPTIONS] MTD-device\n"
@@ -42,12 +43,9 @@ void display_help(void)
 
 void display_version(void)
 {
-	printf("%s " PROGRAM_VERSION "\n"
-			"\n"
-			"This is free software; see the source for copying conditions.  There is NO\n"
-			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
-			PROGRAM_NAME);
-
+	common_print_version();
+	printf("This is free software; see the source for copying conditions.  There is NO\n"
+			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n");
 	exit(0);
 }
 
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 8badd1f..c4c8fd7 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -38,7 +38,6 @@
 #include <sys/mount.h>
 #include <sys/statvfs.h>
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME "integck"
 #include "common.h"
 #include "libubi.h"
@@ -2993,7 +2992,7 @@ static void get_tested_fs_info(void)
 	       pid, fsinfo.fstype, fsinfo.mount_point);
 }
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 " - a stress test which checks the file-system integrity.\n"
 "\n"
 "The test creates a directory named \"integck_test_dir_<pid>\", where where\n"
@@ -3078,7 +3077,7 @@ static int parse_opts(int argc, char * const argv[])
 			args.verbose = 1;
 			break;
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case 'h':
diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index 76371e8..1d74b8a 100644
--- a/tests/jittertest/JitterTest.c
+++ b/tests/jittertest/JitterTest.c
@@ -92,7 +92,8 @@
 #include <fcntl.h>
 #include <sys/mman.h>
 
-
+#define PROGRAM_NAME "JitterTest"
+#include "common.h"
 
 /**************************** Enumerations ****************************/
 enum timerActions
@@ -165,9 +166,6 @@ enum timerActions
 
 
 /************************** Module Variables **************************/
-/* version identifier (value supplied by CVS)*/
-static const char Version[] = "$Id: JitterTest.c,v 1.13 2005/11/07 11:15:20 gleixner Exp $";
-
 static char OutFileName[MAX_FILE_NAME_LEN+1];  /* output file name            */
 static char LogFile[MAX_FILE_NAME_LEN+1] = "/dev/console"; /* default */
 static char ReadFile[MAX_FILE_NAME_LEN+1]; /* This file is read. Should
@@ -988,7 +986,7 @@ void SetSchedulerPriority(
  ***********************************************************************/
 void PrintVersionInfo(void)
 {
-    printf("JitterTest version %s\n", Version);
+    common_print_version();
     printf("Copyright (c) 2001, Daniel Industries, Inc.\n");
     return;
 }
diff --git a/tests/jittertest/plotJittervsFill.c b/tests/jittertest/plotJittervsFill.c
index 99e627b..f9427f1 100644
--- a/tests/jittertest/plotJittervsFill.c
+++ b/tests/jittertest/plotJittervsFill.c
@@ -62,7 +62,9 @@
 #include <unistd.h>
 #include <fcntl.h>
 
-static char Version_string[] = "$Id: plotJittervsFill.c,v 1.6 2005/11/07 11:15:21 gleixner Exp $";
+#define PROGRAM_NAME "plotJittervsFill"
+#include "common.h"
+
 static char LogFile[250] = "InputLogFile.log";
 
 static int JitterThreshold_ms = 1000;
@@ -103,7 +105,7 @@ void HandleCmdLineArgs(
             if ((strcmp(argv[argNum],"--version") == 0) ||
                 (strcmp(argv[argNum],"-v")        == 0)) {
                 /* Print version information and exit. */
-                printf("%s\n", Version_string);
+                common_print_version();
                 exit(0);
             }
 
-- 
2.9.0
