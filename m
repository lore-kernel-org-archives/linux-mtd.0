Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IKTt0-0004yr-V0
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 02:58:49 -0400
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1IKTsu-0000wo-RI
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 08:58:40 +0200
Received: from mail.inf.u-szeged.hu ([160.114.37.227])
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.67)
	(envelope-from <weth@inf.u-szeged.hu>) id 1IKTsu-0000wk-IZ
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 08:58:40 +0200
Received: from [160.114.37.115] (osl01.inf.u-szeged.hu [160.114.37.115])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 558A164802C
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Aug 2007 08:58:40 +0200 (CEST)
Message-ID: <46C0010A.8070808@inf.u-szeged.hu>
Date: Mon, 13 Aug 2007 08:58:18 +0200
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Added -m option to ubimkvol
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zoltan Sogor <weth@inf.u-szeged.hu>

Creates the volume with maximum available size

Signed-off-by: Zoltan Sogor <weth@inf.u-szeged.hu>
---
  ubi-utils/src/ubimkvol.c |   35 ++++++++++++++++++++++++++++++-----
  1 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/src/ubimkvol.c
index 1368671..db57a93 100644
--- a/ubi-utils/src/ubimkvol.c
+++ b/ubi-utils/src/ubimkvol.c
@@ -55,6 +55,7 @@ struct args {
  	char *name;
  	int nlen;
  	char node[256];
+	int maxavs;

  	/* special stuff needed to get additional arguments */
  	char *arg1;
@@ -69,6 +70,7 @@ static struct args myargs = {
  	.vol_id = UBI_VOL_NUM_AUTO,
  	.name = NULL,
  	.nlen = 0,
+	.maxavs = 0,
  };

  static int param_sanity_check(struct args *args, libubi_t libubi);
@@ -85,6 +87,7 @@ static const char *optionsstr =
  "  -N, --name=<name>          volume name\n"
  "  -s, --size=<bytes>         volume size volume size in bytes, 
kilobytes (KiB)\n"
  "                             or megabytes (MiB)\n"
+"  -m, --maxavsize            set volume size to maximum available size\n"
  "  -t, --type=<static|dynamic>   volume type (dynamic, static), 
default is\n"
  "                             dynamic\n"
  "  -?, --help                 Give this help list\n"
@@ -93,10 +96,10 @@ static const char *optionsstr =

  static const char *usage =
  "Usage: ubimkvol [-?V] [-a <alignment>] [-d <devn>] [-n <volume id>]\n"
-"            [-N <name>] [-s <bytes>] [-t <static|dynamic>]\n"
+"            [-N <name>] [-s <bytes>] [-t <static|dynamic>] [-m]\n"
  "            [--alignment=<alignment>] [--devn=<devn>] 
[--vol_id=<volume id>]\n"
  "            [--name=<name>] [--size=<bytes>] 
[--type=<static|dynamic>] [--help]\n"
-"            [--usage] [--version]\n";
+"            [--usage] [--version] [--maxavsize]\n";

  struct option long_options[] = {
  	{ .name = "alignment", .has_arg = 1, .flag = NULL, .val = 'a' },
@@ -108,6 +111,7 @@ struct option long_options[] = {
  	{ .name = "help", .has_arg = 0, .flag = NULL, .val = '?' },
  	{ .name = "usage", .has_arg = 0, .flag = NULL, .val = 0 },
  	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "maxavsize", .has_arg = 0, .flag = NULL, .val = 'm' },
  	{ NULL, 0, NULL, 0}
  };

@@ -129,7 +133,7 @@ parse_opt(int argc, char **argv, struct args *args)
  	while (1) {
  		int key;

-		key = getopt_long(argc, argv, "a:d:n:N:s:t:?V", long_options, NULL);
+		key = getopt_long(argc, argv, "a:d:n:N:s:t:?Vm", long_options, NULL);
  		if (key == -1)
  			break;

@@ -216,6 +220,10 @@ parse_opt(int argc, char **argv, struct args *args)
  				exit(0);
  				break;

+			case 'm':
+				args->maxavs = 1;
+				break;
+
  			default:
  				fprintf(stderr, "%s", usage);
  				exit(-1);
@@ -232,7 +240,7 @@ static int param_sanity_check(struct args *args, 
libubi_t libubi)
  	int err, len;
  	struct ubi_info ubi;

-	if (args->bytes == 0) {
+	if (args->bytes == 0 && !args->maxavs) {
  		fprintf(stderr, "Volume size was not specified\n");
  		goto out;
  	}
@@ -297,7 +305,24 @@ int main(int argc, char * const argv[])

  	req.vol_id = myargs.vol_id;
  	req.alignment = myargs.alignment;
-	req.bytes = myargs.bytes;
+
+	if (myargs.maxavs) {
+		struct ubi_dev_info ubi_dev;
+
+		err = ubi_get_dev_info1(libubi, myargs.devn, &ubi_dev);
+		if (err) {
+			perror("Can't get UBI device info");
+			goto out_libubi;
+		}
+		req.bytes = ubi_dev.avail_bytes;
+		if (!req.bytes) {
+			fprintf(stderr, "There is no available free space on device!\n");
+			goto out_libubi;
+		}
+		printf("Setting the volume size to %lld\n", req.bytes);
+	} else
+		req.bytes = myargs.bytes;
+
  	req.vol_type = myargs.vol_type;
  	req.name = myargs.name;

-- 
1.4.4.4
