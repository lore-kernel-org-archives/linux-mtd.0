Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRbY-00028o-No
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:44:37 +0000
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 david.oberhollenzer@sigma-star.at,
 Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v2 3/4] ubi-utils: ubimkvol: add support for skipping CRC
 check of a static volume when opening
Date: Thu, 28 Jun 2018 09:43:43 +0200
Message-Id: <20180628074344.10249-4-quentin.schulz@bootlin.com>
In-Reply-To: <20180628074344.10249-1-quentin.schulz@bootlin.com>
References: <20180628074344.10249-1-quentin.schulz@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let's let the user create static UBI volume with CRC checking at opening
disabled if desired.

Introduce the `--skipcheck` or `-k` option for such feature.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 ubi-utils/ubimkvol.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
index b81fc99..6c641e5 100644
--- a/ubi-utils/ubimkvol.c
+++ b/ubi-utils/ubimkvol.c
@@ -44,6 +44,7 @@ struct args {
 	const char *name;
 	const char *node;
 	int maxavs;
+	int skipcheck;
 };
 
 static struct args args = {
@@ -68,16 +69,17 @@ static const char optionsstr[] =
 "                              eraseblocks\n"
 "-m, --maxavsize               set volume size to maximum available size\n"
 "-t, --type=<static|dynamic>   volume type (dynamic, static), default is dynamic\n"
+"-k, --skipcheck               skip the CRC check done at volume open time\n"
 "-h, -?, --help                print help message\n"
 "-V, --version                 print program version";
 
 
 static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [-h] [-a <alignment>] [-n <volume ID>] [-N <name>]\n"
-"\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m]\n"
+"\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m] [-k]\n"
 "\t\t\t[--alignment=<alignment>][--vol_id=<volume ID>] [--name=<name>]\n"
 "\t\t\t[--size=<bytes>] [--lebs=<LEBs>] [--type=<static|dynamic>] [--help]\n"
-"\t\t\t[--version] [--maxavsize]\n\n"
+"\t\t\t[--version] [--maxavsize] --[skipcheck]\n\n"
 "Example: " PROGRAM_NAME " /dev/ubi0 -s 20MiB -N config_data - create a 20 Megabytes volume\n"
 "         named \"config_data\" on UBI device /dev/ubi0.";
 
@@ -91,6 +93,7 @@ static const struct option long_options[] = {
 	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ .name = "maxavsize", .has_arg = 0, .flag = NULL, .val = 'm' },
+	{ .name = "skipcheck", .has_arg = 0, .flag = NULL, .val = 'k' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -113,6 +116,9 @@ static int param_sanity_check(void)
 	if (len > UBI_MAX_VOLUME_NAME)
 		return errmsg("too long name (%d symbols), max is %d", len, UBI_MAX_VOLUME_NAME);
 
+	if (args.skipcheck && args.vol_type != UBI_STATIC_VOLUME)
+		return errmsg("skipcheck is only valid for static volumes");
+
 	return 0;
 }
 
@@ -121,7 +127,7 @@ static int parse_opt(int argc, char * const argv[])
 	while (1) {
 		int key, error = 0;
 
-		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vm", long_options, NULL);
+		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vmk", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -183,6 +189,10 @@ static int parse_opt(int argc, char * const argv[])
 			args.maxavs = 1;
 			break;
 
+		case 'k':
+			args.skipcheck = 1;
+			break;
+
 		case ':':
 			return errmsg("parameter is missing");
 
@@ -266,6 +276,9 @@ int main(int argc, char * const argv[])
 	req.vol_type = args.vol_type;
 	req.name = args.name;
 
+	if (args.skipcheck)
+		req.flags |= UBI_VOL_SKIP_CRC_CHECK_FLG;
+
 	err = ubi_mkvol(libubi, args.node, &req);
 	if (err < 0) {
 		sys_errmsg("cannot UBI create volume");
-- 
2.14.1
