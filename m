Received: from gv-out-0910.google.com ([216.239.58.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nu5qo-0004oS-FM
	for linux-mtd@lists.infradead.org; Tue, 23 Mar 2010 15:17:07 +0000
Received: by gv-out-0910.google.com with SMTP id n29so81442gve.5
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Mar 2010 08:17:00 -0700 (PDT)
Sender: Jon Ringle <jonringle@gmail.com>
From: Jon Ringle <jon@ringle.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [ubinfo] Add -N option to get info by name of ubi volume
Date: Tue, 23 Mar 2010 11:16:12 -0400
Message-Id: <1269357372-24497-1-git-send-email-jon@ringle.org>
Cc: Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jon Ringle <jon@ringle.org>
---
 ubi-utils/src/ubinfo.c |   28 +++++++++++++++++++++++++++-
 1 files changed, 27 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
index 8c5a1a9..cd011c5 100644
--- a/ubi-utils/src/ubinfo.c
+++ b/ubi-utils/src/ubinfo.c
@@ -39,6 +39,7 @@ struct args {
 	int vol_id;
 	int all;
 	const char *node;
+	const char *vol_name;
 };
 
 static struct args args = {
@@ -46,6 +47,7 @@ static struct args args = {
 	.devn = -1,
 	.all = 0,
 	.node = NULL,
+	.vol_name = NULL,
 };
 
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
@@ -87,7 +89,7 @@ static int parse_opt(int argc, char * const argv[])
 		int key;
 		char *endp;
 
-		key = getopt_long(argc, argv, "an:d:hV", long_options, NULL);
+		key = getopt_long(argc, argv, "an:N:d:hV", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -102,6 +104,10 @@ static int parse_opt(int argc, char * const argv[])
 				return errmsg("bad volume ID: " "\"%s\"", optarg);
 			break;
 
+		case 'N':
+			args.vol_name = optarg;
+			break;
+
 		case 'd':
 			args.devn = strtoul(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg || args.devn < 0)
@@ -174,6 +180,20 @@ static int translate_dev(libubi_t libubi, const char *node)
 	return 0;
 }
 
+static int get_vol_id_by_name(libubi_t libubi, int dev_num, const char *name)
+{
+	int err;
+	struct ubi_vol_info vol_info;
+
+	err = ubi_get_vol_info1_nm(libubi, dev_num, name, &vol_info);
+	if (err)
+		return sys_errmsg("cannot get information about volume \"%s\" on ubi%d\n", name, dev_num);
+
+	args.vol_id = vol_info.vol_id;
+
+	return 0;
+}
+
 static int print_vol_info(libubi_t libubi, int dev_num, int vol_id)
 {
 	int err;
@@ -377,6 +397,12 @@ int main(int argc, char * const argv[])
 			goto out_libubi;
 	}
 
+	if (args.vol_name) {
+		err = get_vol_id_by_name(libubi, args.devn, args.vol_name);
+		if (err)
+			goto out_libubi;
+	}
+
 	if (args.vol_id != -1 && args.devn == -1) {
 		errmsg("volume ID is specified, but UBI device number is not "
 		       "(use -h for help)\n");
-- 
1.7.0.2.182.ge007
