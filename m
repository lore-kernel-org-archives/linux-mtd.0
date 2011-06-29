Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbxKu-00013Q-9m
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 16:09:57 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2] mtdinfo: remove -m leftovers
Date: Wed, 29 Jun 2011 09:09:29 -0700
Message-ID: <1309363769-7904-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309327350.23597.96.camel@sauron>
References: <1309327350.23597.96.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <dedekind1@gmail.com>

Looks OK to me, except it seems you did everything but actually removing
the field in struct args :) So here's a quick v2 from me...

From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Wed, 29 Jun 2011 08:56:39 +0300
Subject: [PATCH v2] mtdinfo: remove -m leftovers

We have removed the -m option, but did not remove args.mtdn which represents
the -m parameters. Kill args.mtdn as well.

Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |   24 +++++++++---------------
 1 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index dd5da53..e72d69e 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -38,7 +38,6 @@
 
 /* The variables below are set by command line arguments */
 struct args {
-	int mtdn;
 	unsigned int all:1;
 	unsigned int ubinfo:1;
 	unsigned int map:1;
@@ -46,7 +45,6 @@ struct args {
 };
 
 static struct args args = {
-	.mtdn = -1,
 	.ubinfo = 0,
 	.all = 0,
 	.node = NULL,
@@ -128,10 +126,8 @@ static int parse_opt(int argc, char * const argv[])
 	else if (optind < argc)
 		return errmsg("more then one MTD device specified (use -h for help)");
 
-	if (args.all && (args.node || args.mtdn != -1)) {
-		args.mtdn = -1;
+	if (args.all && args.node)
 		args.node = NULL;
-	}
 
 	if (args.map && !args.node)
 		return errmsg("-M requires MTD device node name");
@@ -153,8 +149,7 @@ static int translate_dev(libmtd_t libmtd, const char *node)
 				  "device \"%s\"", node);
 	}
 
-	args.mtdn = mtd.mtd_num;
-	return 0;
+	return mtd.mtd_num;
 }
 
 static void print_ubi_info(const struct mtd_info *mtd_info,
@@ -406,20 +401,19 @@ int main(int argc, char * const argv[])
 		return sys_errmsg("cannot get MTD information");
 	}
 
-	if (args.node) {
+	if (!args.all) {
+		int mtdn;
+
 		/*
 		 * A character device was specified, translate this to MTD
 		 * device number.
 		 */
-		err = translate_dev(libmtd, args.node);
-		if (err)
+		mtdn = translate_dev(libmtd, args.node);
+		if (mtdn < 0)
 			goto out_libmtd;
-	}
-
-	if (args.mtdn == -1)
+		err = print_dev_info(libmtd, &mtd_info, mtdn);
+	} else
 		err = print_general_info(libmtd, &mtd_info, args.all);
-	else
-		err = print_dev_info(libmtd, &mtd_info, args.mtdn);
 	if (err)
 		goto out_libmtd;
 
-- 
1.7.0.4
