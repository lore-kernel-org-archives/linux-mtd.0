Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbnqJ-0004IA-2m
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:01:44 +0000
Received: by pzk28 with SMTP id 28so701170pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:01:35 -0700 (PDT)
Subject: Re: [PATCH 09/10] mtdinfo: kill -m option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 29 Jun 2011 09:02:25 +0300
In-Reply-To: <1309199247-19248-10-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
	<1309199247-19248-10-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309327350.23597.96.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-27 at 11:27 -0700, Brian Norris wrote:
> According to feature-removal-schedule, we shouldn't use `-m', since
> it relies on a specific device-naming pattern.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  feature-removal-schedule.txt |    8 --------
>  ubi-utils/mtdinfo.c          |   25 ++++++-------------------
>  2 files changed, 6 insertions(+), 27 deletions(-)

Pushed the series, thanks! I would also like to add the following patch
on top of your series, is ok with you?

From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Wed, 29 Jun 2011 08:56:39 +0300
Subject: [PATCH] mtdinfo: remove -m leftovers

We have removed the -m option, but did not remove args.mtdn which represents
the -m parameters. Kill args.mtdn as well.

Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
---
 ubi-utils/mtdinfo.c |   22 +++++++++-------------
 1 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index dd5da53..4631f37 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -128,10 +128,8 @@ static int parse_opt(int argc, char * const argv[])
 	else if (optind < argc)
 		return errmsg("more then one MTD device specified (use -h for help)");
 
-	if (args.all && (args.node || args.mtdn != -1)) {
-		args.mtdn = -1;
+	if (args.all && args.node)
 		args.node = NULL;
-	}
 
 	if (args.map && !args.node)
 		return errmsg("-M requires MTD device node name");
@@ -153,8 +151,7 @@ static int translate_dev(libmtd_t libmtd, const char *node)
 				  "device \"%s\"", node);
 	}
 
-	args.mtdn = mtd.mtd_num;
-	return 0;
+	return mtd.mtd_num;
 }
 
 static void print_ubi_info(const struct mtd_info *mtd_info,
@@ -406,20 +403,19 @@ int main(int argc, char * const argv[])
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
1.7.5.4


-- 
Best Regards,
Artem Bityutskiy
