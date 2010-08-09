Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiNgK-0006nJ-CJ
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 08:26:05 +0000
From: stefani@seibold.net
To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] Add quick erase format option
Date: Mon,  9 Aug 2010 10:25:53 +0200
Message-Id: <1281342353-18180-1-git-send-email-stefani@seibold.net>
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

This patch add a quick format option which skips erasing of already erased
flash blocks. This is useful for first time production environments where
the flash arrived erased.

Signed-off-by: Stefani Seibold <stefani@seibold.net>
---
 ubi-utils/src/ubiformat.c |   29 ++++++++++++++++++++++++++---
 1 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 4e27e4f..8e33334 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -45,7 +45,7 @@
 #include "common.h"
 #include "ubiutils-common.h"
 
-#define PROGRAM_VERSION "1.5"
+#define PROGRAM_VERSION "1.6"
 #define PROGRAM_NAME    "ubiformat"
 
 /* The variables below are set by command line arguments */
@@ -55,6 +55,7 @@ struct args {
 	unsigned int verbose:1;
 	unsigned int override_ec:1;
 	unsigned int novtbl:1;
+	unsigned int quick:1;
 	unsigned int manual_subpage;
 	int subpage_size;
 	int vid_hdr_offs;
@@ -94,6 +95,7 @@ static const char *optionsstr =
 "                             (default is 1)\n"
 "-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
 "                             (by default a random number is picked)\n"
+"-E, --erase-quick            erase only used blocks\n"
 "-y, --yes                    assume the answer is \"yes\" for all question\n"
 "                             this program would otherwise ask\n"
 "-q, --quiet                  suppress progress percentage information\n"
@@ -125,6 +127,7 @@ static const struct option long_options[] = {
 	{ .name = "ubi-ver",         .has_arg = 1, .flag = NULL, .val = 'x' },
 	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "erase-quick",     .has_arg = 0, .flag = NULL, .val = 'E' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -138,7 +141,7 @@ static int parse_opt(int argc, char * const argv[])
 		char *endp;
 		unsigned long int image_seq;
 
-		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
+		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:E", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -202,6 +205,10 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 
+		case 'E':
+			args.quick = 1;
+			break;
+
 		case 'v':
 			args.verbose = 1;
 			break;
@@ -600,7 +607,20 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			ec = si->ec[eb] + 1;
 		else
 			ec = si->mean_ec;
-		ubigen_init_ec_hdr(ui, hdr, ec);
+
+		if (args.quick) {
+			err = mtd_read(mtd, args.node_fd, eb, 0, hdr, write_size);
+			if (!err) {
+				int i;
+
+				for(i = 0; i != write_size; i++) {
+					if (((unsigned char *)hdr)[i] != 0xff)
+						break;
+				}
+				if (i == write_size)
+					goto skip_erase;
+			}
+		}
 
 		if (args.verbose) {
 			normsg_cont("eraseblock %d: erase", eb);
@@ -621,6 +641,9 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
+skip_erase:
+		ubigen_init_ec_hdr(ui, hdr, ec);
+
 		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
 			if (eb1 == -1) {
 				eb1 = eb;
-- 
1.7.2
