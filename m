Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGY5-0003Dh-VI
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:45 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 07/10] mtd-utils: switch more utils to unified
 versioning
Date: Mon, 27 Jun 2011 11:27:24 -0700
Message-ID: <1309199247-19248-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

More utilities now use the common VERSION system.

For utils that printed a very simple message, we use the new
common_print_version() "function."

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 jffs2dump.c              |    2 +-
 mkfs.ubifs/mkfs.ubifs.c  |    4 +---
 ubi-utils/mtdinfo.c      |    5 ++---
 ubi-utils/ubiattach.c    |    5 ++---
 ubi-utils/ubicrc32.c     |    5 ++---
 ubi-utils/ubidetach.c    |    5 ++---
 ubi-utils/ubiformat.c    |    5 ++---
 ubi-utils/ubimkvol.c     |    5 ++---
 ubi-utils/ubinfo.c       |    5 ++---
 ubi-utils/ubinize.c      |    5 ++---
 ubi-utils/ubirename.c    |    1 -
 ubi-utils/ubirmvol.c     |    5 ++---
 ubi-utils/ubirsvol.c     |    5 ++---
 ubi-utils/ubiupdatevol.c |    5 ++---
 14 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/jffs2dump.c b/jffs2dump.c
index d093afc..9e13e98 100644
--- a/jffs2dump.c
+++ b/jffs2dump.c
@@ -15,7 +15,6 @@
  */
 
 #define PROGRAM_NAME "jffs2dump"
-#define VERSION "$Revision: 1.10 $"
 
 #include <errno.h>
 #include <stdint.h>
@@ -36,6 +35,7 @@
 #include <getopt.h>
 #include <crc32.h>
 #include "summary.h"
+#include "common.h"
 
 #define PAD(x) (((x)+3)&~3)
 
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index c718818..733a3bb 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -26,8 +26,6 @@
 #include <crc32.h>
 #include "common.h"
 
-#define PROGRAM_VERSION "1.5"
-
 /* Size (prime number) of hash table for link counting */
 #define HASH_TABLE_SIZE 10099
 
@@ -606,7 +604,7 @@ static int get_options(int argc, char**argv)
 			verbose = 1;
 			break;
 		case 'V':
-			printf("Version " PROGRAM_VERSION "\n");
+			common_print_version();
 			exit(0);
 		case 'g':
 			debug_level = strtol(optarg, &endp, 0);
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index bfd7e6d..ab00ce0 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -21,7 +21,6 @@
  * Author: Artem Bityutskiy
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "mtdinfo"
 
 #include <stdint.h>
@@ -53,7 +52,7 @@ static struct args args = {
 	.node = NULL,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to print MTD information.";
 
 static const char optionsstr[] =
@@ -125,7 +124,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			printf("%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index 4f18e99..27e7c09 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -21,7 +21,6 @@
  * Author: Artem Bityutskiy
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubiattach"
 
 #include <stdio.h>
@@ -53,7 +52,7 @@ static struct args args = {
 	.dev = NULL,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to attach MTD device to UBI.";
 
 static const char optionsstr[] =
@@ -129,7 +128,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubicrc32.c b/ubi-utils/ubicrc32.c
index 73ec595..0ea255d 100644
--- a/ubi-utils/ubicrc32.c
+++ b/ubi-utils/ubicrc32.c
@@ -22,7 +22,6 @@
  * Author: Oliver Lohmann
  */
 
-#define PROGRAM_VERSION "1.0"
 #define PROGRAM_NAME    "ubicrc32"
 
 #include <stdio.h>
@@ -37,7 +36,7 @@
 
 #define BUFSIZE 4096
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to calculate CRC32 with UBI start value (0xFFFFFFFF)";
 
 static const char optionsstr[] =
@@ -70,7 +69,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubidetach.c b/ubi-utils/ubidetach.c
index 668f1bd..64b748e 100644
--- a/ubi-utils/ubidetach.c
+++ b/ubi-utils/ubidetach.c
@@ -21,7 +21,6 @@
  * Author: Artem Bityutskiy
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubidetach"
 
 #include <stdio.h>
@@ -50,7 +49,7 @@ static struct args args = {
 	.dev = NULL,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 " - tool to remove UBI devices (detach MTD devices from UBI)";
 
 static const char optionsstr[] =
@@ -113,7 +112,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index c4b944a..bfa1730 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -29,7 +29,6 @@
  */
 #define MAX_CONSECUTIVE_BAD_BLOCKS 4
 
-#define PROGRAM_VERSION "1.5"
 #define PROGRAM_NAME    "ubiformat"
 
 #include <sys/stat.h>
@@ -72,7 +71,7 @@ static struct args args =
 	.ubi_ver   = 1,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 		" - a tool to format MTD devices and flash UBI images";
 
 static const char optionsstr[] =
@@ -206,7 +205,7 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case 'h':
diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
index 25065e3..7c2a234 100644
--- a/ubi-utils/ubimkvol.c
+++ b/ubi-utils/ubimkvol.c
@@ -23,7 +23,6 @@
  *          Frank Haverkamp <haver@vnet.ibm.com>
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubimkvol"
 
 #include <stdio.h>
@@ -56,7 +55,7 @@ static struct args args = {
 	.vol_id = UBI_VOL_NUM_AUTO,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to create UBI volumes.";
 
 static const char optionsstr[] =
@@ -173,7 +172,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case 'm':
diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
index 8e14e6e..7aa4aa4 100644
--- a/ubi-utils/ubinfo.c
+++ b/ubi-utils/ubinfo.c
@@ -21,7 +21,6 @@
  * Author: Artem Bityutskiy
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubinfo"
 
 #include <stdint.h>
@@ -51,7 +50,7 @@ static struct args args = {
 	.vol_name = NULL,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to print UBI information.";
 
 static const char optionsstr[] =
@@ -124,7 +123,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 3085b66..453494d 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -24,7 +24,6 @@
  *          Oliver Lohmann
  */
 
-#define PROGRAM_VERSION "1.2"
 #define PROGRAM_NAME    "ubinize"
 
 #include <sys/stat.h>
@@ -39,7 +38,7 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 " - a tool to generate UBI images. An UBI image may contain one or more UBI "
 "volumes which have to be defined in the input configuration ini-file. The "
 "ini file defines all the UBI volumes - their characteristics and the and the "
@@ -234,7 +233,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		default:
diff --git a/ubi-utils/ubirename.c b/ubi-utils/ubirename.c
index 070e32e..288475b 100644
--- a/ubi-utils/ubirename.c
+++ b/ubi-utils/ubirename.c
@@ -21,7 +21,6 @@
  * Author: Richard Titmuss
  */
 
-#define PROGRAM_VERSION "1.0"
 #define PROGRAM_NAME    "ubirename"
 
 #include <stdio.h>
diff --git a/ubi-utils/ubirmvol.c b/ubi-utils/ubirmvol.c
index 5725d90..464f05d 100644
--- a/ubi-utils/ubirmvol.c
+++ b/ubi-utils/ubirmvol.c
@@ -23,7 +23,6 @@
  *          Frank Haverkamp <haver@vnet.ibm.com>
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubirmvol"
 
 #include <stdio.h>
@@ -46,7 +45,7 @@ static struct args args = {
 	.vol_id = -1,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 				 " - a tool to remove UBI volumes.";
 
 static const char optionsstr[] =
@@ -117,7 +116,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubirsvol.c b/ubi-utils/ubirsvol.c
index 65f579c..c469060 100644
--- a/ubi-utils/ubirsvol.c
+++ b/ubi-utils/ubirsvol.c
@@ -23,7 +23,6 @@
  *          Frank Haverkamp <haver@vnet.ibm.com>
  */
 
-#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "ubirsvol"
 
 #include <stdio.h>
@@ -51,7 +50,7 @@ static struct args args = {
 	.lebs = -1,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 				 " - a tool to resize UBI volumes.";
 
 static const char optionsstr[] =
@@ -146,7 +145,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
diff --git a/ubi-utils/ubiupdatevol.c b/ubi-utils/ubiupdatevol.c
index 24f38fe..7fedb3c 100644
--- a/ubi-utils/ubiupdatevol.c
+++ b/ubi-utils/ubiupdatevol.c
@@ -24,7 +24,6 @@
  *          Artem Bityutskiy
  */
 
-#define PROGRAM_VERSION "1.2"
 #define PROGRAM_NAME    "ubiupdatevol"
 
 #include <fcntl.h>
@@ -52,7 +51,7 @@ struct args {
 
 static struct args args;
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to write data to UBI volumes.";
 
 static const char optionsstr[] =
@@ -103,7 +102,7 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			common_print_version();
 			exit(EXIT_SUCCESS);
 
 		case ':':
-- 
1.7.0.4
