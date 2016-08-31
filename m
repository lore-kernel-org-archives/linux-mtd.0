Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf01J-00082A-Hw
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:33:28 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 2E5AB16B4CC2
 for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2016 09:32:54 +0200 (CEST)
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH 2/4] Add help and version information to nandsimctl
Date: Wed, 31 Aug 2016 09:32:42 +0200
Message-Id: <20160831073244.29106-3-dwalter@sigma-star.at>
In-Reply-To: <20160831073244.29106-1-dwalter@sigma-star.at>
References: <20160831073244.29106-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

added usage and version info.

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 nand-utils/nandsimctl.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/nand-utils/nandsimctl.c b/nand-utils/nandsimctl.c
index 0f641ab..d91fe33 100644
--- a/nand-utils/nandsimctl.c
+++ b/nand-utils/nandsimctl.c
@@ -22,11 +22,14 @@ enum action {
 };
 
 static const struct option long_options[] = {
+	/* ordering of these is important, do not change */
+	{ .name = "version",	.has_arg = 0, .flag = NULL, .val = 0},
 	{ .name = "backend",	.has_arg = 1, .flag = NULL, .val = 'b' },
 	{ .name = "id",		.has_arg = 1, .flag = NULL, .val = 'i' },
 	{ .name = "detach",	.has_arg = 1, .flag = NULL, .val = 'd' },
 	{ .name = "detach-all",	.has_arg = 0, .flag = NULL, .val = 'D' },
 	{ .name = "no-oob",	.has_arg = 0, .flag = NULL, .val = 'n' },
+	{ .name = "help",	.has_arg = 0, .flag = NULL, .val = 'h' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -54,22 +57,58 @@ static struct {
 	.no_oob = false,
 };
 
-static int do_help(void)
+static int do_help(int status)
 {
-	fprintf(stderr, "Help\n");
-	return 0;
+	fprintf(status == EXIT_SUCCESS ? stdout : stderr,
+"Usage: nandsimctl [OPTION]"
+"Control NAND simulator.\n"
+"\n"
+"  -d id, --detach=id                Detach device\n"
+"  -D, --detach-all                  Detach all devices\n"
+"  -b, --backend=file|cache|ram      Select Backend\n"
+"  -r, --backend=ram                 Use memory backend\n"
+"  -c, --backend=cache               Use cached backend\n"
+"  -f, --backend=file                Use file backend\n"
+"  -n, --no-oob                      Disable OOB data\n"
+"  -q, --quiet                       Don't display progress messages\n"
+"  -h, --help                        Display this help and exit\n"
+"      --version                     Output version information and exit\n"
+	);
+	exit(status);
+}
+
+static void display_version(void)
+{
+	printf("%1$s " VERSION "\n"
+			"\n"
+			"%1$s comes with NO WARRANTY\n"
+			"to the extent permitted by law.\n"
+			"\n"
+			"You may redistribute copies of %1$s\n"
+			"under the terms of the GNU General Public Licence.\n"
+			"See the file `COPYING' for more information.\n",
+			PROGRAM_NAME);
+	exit(EXIT_SUCCESS);
 }
 
 static int parse_args(int argc, char *argv[])
 {
 	int key, error = 0;
+	int option_index;
 
 	for (;;) {
-		key = getopt_long(argc, argv, "b:i:h?rcfwod:D", long_options, NULL);
+		key = getopt_long(argc, argv, "b:i:h?rcfwod:D", long_options, &option_index);
 		if (key == -1)
 			break;
 
 		switch (key) {
+		case 0:
+			switch(option_index) {
+			case 0: /* --version */
+				display_version();
+				break;
+			}
+			break;
 		case 'b':
 			if (args.backend != -1)
 				return errmsg("backend type already set!");
@@ -131,8 +170,10 @@ static int parse_args(int argc, char *argv[])
 		case 'D':
 			args.detach_all = true;
 		break;
+		case 'h':
+			return do_help(EXIT_SUCCESS);
 		case '?':
-			return do_help();
+			return do_help(EXIT_FAILURE);
 		break;
 		}
 	}
-- 
2.8.3
