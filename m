Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzoBz-000583-D1
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 15:01:12 +0000
Received: by mail-wg0-f52.google.com with SMTP id x12so11225912wgg.11
 for <linux-mtd@lists.infradead.org>; Sat, 13 Dec 2014 07:00:47 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] ubinfo: allow passing MTD device number
Date: Sat, 13 Dec 2014 16:00:28 +0100
Message-Id: <1418482828-21290-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This provides a nice way to find if and which UBI device is attached to
the MTD.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 ubi-utils/ubinfo.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
index cb88f53..1499d0a 100644
--- a/ubi-utils/ubinfo.c
+++ b/ubi-utils/ubinfo.c
@@ -36,6 +36,7 @@
 /* The variables below are set by command line arguments */
 struct args {
 	int devn;
+	int mtdn;
 	int vol_id;
 	int all;
 	const char *node;
@@ -45,6 +46,7 @@ struct args {
 static struct args args = {
 	.vol_id = -1,
 	.devn = -1,
+	.mtdn = -1,
 	.all = 0,
 	.node = NULL,
 	.vol_name = NULL,
@@ -55,6 +57,7 @@ static const char doc[] = PROGRAM_NAME " version " VERSION
 
 static const char optionsstr[] =
 "-d, --devn=<UBI device number>  UBI device number to get information about\n"
+"-m, --mtdn=<MTD device number>  or alternatively, MTD device number\n"
 "-n, --vol_id=<volume ID>        ID of UBI volume to print information about\n"
 "-N, --name=<volume name>        name of UBI volume to print information about\n"
 "-a, --all                       print information about all devices and volumes,\n"
@@ -77,6 +80,7 @@ static const char usage[] =
 
 static const struct option long_options[] = {
 	{ .name = "devn",      .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
 	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
 	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
@@ -90,7 +94,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "an:N:d:hV", long_options, NULL);
+		key = getopt_long(argc, argv, "an:N:d:m:hV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -116,6 +120,13 @@ static int parse_opt(int argc, char * const argv[])
 
 			break;
 
+		case 'm':
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
+				return errmsg("bad MTD device number: \"%s\"", optarg);
+
+			break;
+
 		case 'h':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
@@ -390,6 +401,15 @@ int main(int argc, char * const argv[])
 		return sys_errmsg("cannot open libubi");
 	}
 
+	if (args.mtdn >= 0) {
+		err = mtd_num2ubi_dev(libubi, args.mtdn, &args.devn);
+		if (err) {
+			sys_errmsg("cannot find UBI device attached to the MTD %d",
+				   args.mtdn);
+			goto out_libubi;
+		}
+	}
+
 	if (args.node) {
 		/*
 		 * A character device was specified, translate this into UBI
-- 
1.8.4.5
