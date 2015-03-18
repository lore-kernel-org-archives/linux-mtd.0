Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YY9if-0004PR-KN
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 08:52:54 +0000
From: Tanya Brokhman <tlinder@codeaurora.org>
To: richard.weinberger@gmail.com,
	ricard.wanderlof@axis.com
Subject: [PATCH 1/2] ubi-utils: ubinize: add "-c max-leb-count" input parameter
Date: Wed, 18 Mar 2015 10:52:21 +0200
Message-Id: <1426668741-6387-1-git-send-email-tlinder@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While generating ubi image with ubinize, (almost) all UBI data required for
Fastmap is present. If we generate the Fastmap data as part of the image, the first boot
after flash wount require full scan of the UBI device.
In order to be able to generate the Fastmap data number of device PEBs is required.
A new input parameter was added to ubinize:

 -c, --max-leb-cnt=COUNT  maximum logical erase block count

Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
---
 ubi-utils/ubinize.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 34f465a..eccf41f 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -66,6 +66,7 @@ static const char optionsstr[] =
 "                             header)\n"
 "-e, --erase-counter=<num>    the erase counter value to put to EC headers\n"
 "                             (default is 0)\n"
+"-c, --max-leb-cnt=<num>      maximum logical erase block count\n"
 "-x, --ubi-ver=<num>          UBI version number to put to EC headers\n"
 "                             (default is 1)\n"
 "-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
@@ -78,8 +79,8 @@ static const char usage[] =
 "Usage: " PROGRAM_NAME " [-o filename] [-p <bytes>] [-m <bytes>] [-s <bytes>] [-O <num>] [-e <num>]\n"
 "\t\t[-x <num>] [-Q <num>] [-v] [-h] [-V] [--output=<filename>] [--peb-size=<bytes>]\n"
 "\t\t[--min-io-size=<bytes>] [--sub-page-size=<bytes>] [--vid-hdr-offset=<num>]\n"
-"\t\t[--erase-counter=<num>] [--ubi-ver=<num>] [--image-seq=<num>] [--verbose] [--help]\n"
-"\t\t[--version] ini-file\n"
+"\t\t[--erase-counter=<num>] [--max-leb-cnt=<num>] [--ubi-ver=<num>] [--image-seq=<num>]\n"
+"\t\t[--verbose] [--help] [--version] ini-file\n"
 "Example: " PROGRAM_NAME " -o ubi.img -p 16KiB -m 512 -s 256 cfg.ini - create UBI image\n"
 "         'ubi.img' as described by configuration file 'cfg.ini'";
 
@@ -119,6 +120,7 @@ static const char ini_doc[] = "INI-file format.\n"
 static const struct option long_options[] = {
 	{ .name = "output",         .has_arg = 1, .flag = NULL, .val = 'o' },
 	{ .name = "peb-size",       .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "max-leb-cnt",    .has_arg = 1, .flag = NULL, .val = 'c' },
 	{ .name = "min-io-size",    .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "sub-page-size",  .has_arg = 1, .flag = NULL, .val = 's' },
 	{ .name = "vid-hdr-offset", .has_arg = 1, .flag = NULL, .val = 'O' },
@@ -136,6 +138,7 @@ struct args {
 	const char *f_out;
 	int out_fd;
 	int peb_size;
+	int max_leb_count;
 	int min_io_size;
 	int subpage_size;
 	int vid_hdr_offs;
@@ -148,6 +151,7 @@ struct args {
 
 static struct args args = {
 	.peb_size     = -1,
+	.max_leb_count = -1,
 	.min_io_size  = -1,
 	.subpage_size = -1,
 	.ubi_ver      = 1,
@@ -162,7 +166,7 @@ static int parse_opt(int argc, char * const argv[])
 		int key, error = 0;
 		unsigned long int image_seq;
 
-		key = getopt_long(argc, argv, "o:p:m:s:O:e:x:Q:vhV", long_options, NULL);
+		key = getopt_long(argc, argv, "o:p:c:m:s:O:e:x:Q:vhV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -180,7 +184,11 @@ static int parse_opt(int argc, char * const argv[])
 			if (args.peb_size <= 0)
 				return errmsg("bad physical eraseblock size: \"%s\"", optarg);
 			break;
-
+		case 'c':
+			args.max_leb_count = ubiutils_get_bytes(optarg);
+			if (args.max_leb_count <= 0)
+				return errmsg("bad maximum LEB count: \"%s\"", optarg);
+			break;
 		case 'm':
 			args.min_io_size = ubiutils_get_bytes(optarg);
 			if (args.min_io_size <= 0)
@@ -473,6 +481,8 @@ int main(int argc, char * const argv[])
 	verbose(args.verbose, "VID offset:                %d", ui.vid_hdr_offs);
 	verbose(args.verbose, "data offset:               %d", ui.data_offs);
 	verbose(args.verbose, "UBI image sequence number: %u", ui.image_seq);
+	if (args.max_leb_count > 0)
+		verbose(args.verbose, "maximum logical erase block count: %d", args.max_leb_count);
 
 	vtbl = ubigen_create_empty_vtbl(&ui);
 	if (!vtbl)
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
