Received: from www84.your-server.de ([213.133.104.84])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PZmUe-00070D-Th
	for linux-mtd@lists.infradead.org; Mon, 03 Jan 2011 15:38:46 +0000
From: stefani@seibold.net
To: dedekind1@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Artem.Bityutskiy@nokia.com
Subject: [PATCH] Add an option do not erase pristine blocks in ubiformat
Date: Mon,  3 Jan 2011 16:39:36 +0100
Message-Id: <1294069176-27123-1-git-send-email-stefani@seibold.net>
Cc: stefani@seibold.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stefani Seibold <stefani@seibold.net>

This patch add a pristine option which skips erasing of pristine flash blocks.
This is useful for first time production environments where the flash arrived
erased.

The patch is against the current mtd git tree.

Signed-off-by: Stefani Seibold <stefani@seibold.net>
---
 ubi-utils/src/ubiformat.c |   34 +++++++++++++++++++++++++++++-----
 1 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 098da7d..83e3485 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -29,7 +29,7 @@
  */
 #define MAX_CONSECUTIVE_BAD_BLOCKS 4
 
-#define PROGRAM_VERSION "1.5"
+#define PROGRAM_VERSION "1.6"
 #define PROGRAM_NAME    "ubiformat"
 
 #include <sys/stat.h>
@@ -55,6 +55,7 @@ struct args {
 	unsigned int verbose:1;
 	unsigned int override_ec:1;
 	unsigned int novtbl:1;
+	unsigned int pristine:1;
 	unsigned int manual_subpage;
 	int subpage_size;
 	int vid_hdr_offs;
@@ -94,6 +95,7 @@ static const char optionsstr[] =
 "                             (default is 1)\n"
 "-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
 "                             (by default a random number is picked)\n"
+"-P, --pristine               do not erase pristine blocks\n"
 "-y, --yes                    assume the answer is \"yes\" for all question\n"
 "                             this program would otherwise ask\n"
 "-q, --quiet                  suppress progress percentage information\n"
@@ -106,7 +108,7 @@ static const char usage[] =
 "\t\t\t[-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h] [-v]\n"
 "\t\t\t[--sub-page-size=<bytes>] [--vid-hdr-offset=<offs>] [--no-volume-table]\n"
 "\t\t\t[--flash-image=<file>] [--image-size=<bytes>] [--erase-counter=<value>]\n"
-"\t\t\t[--ubi-ver=<num>] [--yes] [--quiet] [--verbose] [--help] [--version]\n\n"
+"\t\t\t[--ubi-ver=<num>] [--pristine] [--yes] [--quiet] [--verbose] [--help] [--version]\n\n"
 "Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
 "           not ask questions.\n"
 "Example 2: " PROGRAM_NAME " /dev/mtd0 -q -e 0 - format MTD device number 0,\n"
@@ -125,6 +127,7 @@ static const struct option long_options[] = {
 	{ .name = "ubi-ver",         .has_arg = 1, .flag = NULL, .val = 'x' },
 	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "pristine",        .has_arg = 0, .flag = NULL, .val = 'P' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -138,7 +141,7 @@ static int parse_opt(int argc, char * const argv[])
 		char *endp;
 		unsigned long int image_seq;
 
-		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
+		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:P:", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -202,6 +205,10 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 
+		case 'P':
+			args.pristine = 1;
+			break;
+
 		case 'v':
 			args.verbose = 1;
 			break;
@@ -577,7 +584,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
 	write_size /= mtd->subpage_size;
 	write_size *= mtd->subpage_size;
-	hdr = malloc(write_size);
+	hdr = malloc(mtd->eb_size);
 	if (!hdr)
 		return sys_errmsg("cannot allocate %d bytes of memory", write_size);
 	memset(hdr, 0xFF, write_size);
@@ -600,7 +607,21 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			ec = si->ec[eb] + 1;
 		else
 			ec = si->mean_ec;
-		ubigen_init_ec_hdr(ui, hdr, ec);
+
+		if (args.pristine) {
+			err = mtd_read(mtd, args.node_fd, eb, 0, hdr, mtd->eb_size);
+			if (!err) {
+				int i;
+
+				for(i = 0; i != mtd->eb_size; i++) {
+					if (((unsigned char *)hdr)[i] != 0xff)
+						break;
+				}
+				if (i == mtd->eb_size)
+					goto skip_erase;
+			}
+			memset(hdr, 0xFF, write_size);
+		}
 
 		if (args.verbose) {
 			normsg_cont("eraseblock %d: erase", eb);
@@ -621,6 +642,9 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
+skip_erase:
+		ubigen_init_ec_hdr(ui, hdr, ec);
+
 		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
 			if (eb1 == -1) {
 				eb1 = eb;
-- 
1.7.3.4
