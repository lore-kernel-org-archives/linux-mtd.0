Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6Kju-0004MU-Pq
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 14:59:11 +0000
Received: by mail-qa0-f49.google.com with SMTP id dc16so11038437qab.8
 for <linux-mtd@lists.infradead.org>; Wed, 31 Dec 2014 06:58:49 -0800 (PST)
From: Joe Balough <jbb5044@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: ubiformat: Add --confirm argument
Date: Wed, 31 Dec 2014 09:58:44 -0500
Message-Id: <1420037925-31156-2-git-send-email-jbb5044@gmail.com>
In-Reply-To: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
References: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
Cc: Joe Balough <jbb5044@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for an argument to ubiformat that will read back every
written eraseblock and verify the read data matches the written data.

Signed-off-by: Joe Balough <jbb5044@gmail.com>
---
 ubi-utils/ubiformat.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 21409ca..4129404 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -49,6 +49,7 @@
 
 /* The variables below are set by command line arguments */
 struct args {
+	unsigned int confirm:1;
 	unsigned int yes:1;
 	unsigned int quiet:1;
 	unsigned int verbose:1;
@@ -93,6 +94,7 @@ static const char optionsstr[] =
 "                             (default is 1)\n"
 "-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
 "                             (by default a random number is picked)\n"
+"-c, --confirm                Read back written value and verify it matches\n"
 "-y, --yes                    assume the answer is \"yes\" for all question\n"
 "                             this program would otherwise ask\n"
 "-q, --quiet                  suppress progress percentage information\n"
@@ -105,8 +107,8 @@ static const char usage[] =
 "\t\t\t[-Q <num>] [-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h]\n"
 "\t\t\t[--sub-page-size=<bytes>] [--vid-hdr-offset=<offs>] [--no-volume-table]\n"
 "\t\t\t[--flash-image=<file>] [--image-size=<bytes>] [--erase-counter=<value>]\n"
-"\t\t\t[--image-seq=<num>] [--ubi-ver=<num>] [--yes] [--quiet] [--verbose]\n"
-"\t\t\t[--help] [--version]\n\n"
+"\t\t\t[--image-seq=<num>] [--ubi-ver=<num>] [--confirm] [--yes] [--quiet]\n"
+"\t\t\t[--verbose] [--help] [--version]\n\n"
 "Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
 "           not ask questions.\n"
 "Example 2: " PROGRAM_NAME " /dev/mtd0 -q -e 0 - format MTD device number 0,\n"
@@ -118,6 +120,7 @@ static const struct option long_options[] = {
 	{ .name = "no-volume-table", .has_arg = 0, .flag = NULL, .val = 'n' },
 	{ .name = "flash-image",     .has_arg = 1, .flag = NULL, .val = 'f' },
 	{ .name = "image-size",      .has_arg = 1, .flag = NULL, .val = 'S' },
+	{ .name = "confirm",         .has_arg = 0, .flag = NULL, .val = 'c' },
 	{ .name = "yes",             .has_arg = 0, .flag = NULL, .val = 'y' },
 	{ .name = "erase-counter",   .has_arg = 1, .flag = NULL, .val = 'e' },
 	{ .name = "quiet",           .has_arg = 0, .flag = NULL, .val = 'q' },
@@ -137,7 +140,7 @@ static int parse_opt(int argc, char * const argv[])
 		int key, error = 0;
 		unsigned long int image_seq;
 
-		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
+		key = getopt_long(argc, argv, "nh?Vycqve:x:s:O:f:S:", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -178,6 +181,10 @@ static int parse_opt(int argc, char * const argv[])
 		case 'n':
 			args.novtbl = 1;
 			break;
+			
+		case 'c':
+			args.confirm = 1;
+			break;
 
 		case 'y':
 			args.yes = 1;
@@ -535,6 +542,20 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			skip_data_read = 1;
 			continue;
 		}
+		
+		if (args.confirm) {
+			char read_buf[mtd->eb_size];
+			err = mtd_read(mtd, args.node_fd, eb, 0, read_buf, new_len);
+			if (err) {
+				sys_errmsg("cannot readback eraseblock %d for confirmation", eb);
+				goto out_close;
+			}
+			
+			if (memcmp(buf, read_buf, new_len) != 0) {
+				sys_errmsg("readback failed on eraseblock %d", eb);
+			}
+		}
+		
 		if (++written_ebs >= img_ebs)
 			break;
 	}
-- 
2.1.3
