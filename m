Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQliT-0005Dz-Id
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2011 20:04:18 +0000
Received: by mail-gx0-f177.google.com with SMTP id b1so116532ggn.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2011 12:04:17 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtdinfo: provide info when used without arguments
Date: Wed, 16 Nov 2011 12:03:57 -0800
Message-Id: <1321473837-27891-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the user specifies neither a MTD argument nor the `-a' flag, we print
a cryptic message; i.e.,

    # mtdinfo
    libmtd: error!: cannot get information about "(null)"
            error 14 (Bad address)
    mtdinfo: error!: cannot get information about MTD device "(null)"
             error 14 (Bad address)

This is a regression; previously, mtdinfo would give some short info
about number of devices, etc. when used without arguments. To fix this,
we revert commit d53c03b0989f8354a7e4dbb947a150fc7fe3f6d1 and call
print_general_info() when no device is specified.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index d919673..ead4bce 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -340,7 +340,8 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	return 0;
 }
 
-static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info)
+static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
+			      int all)
 {
 	int i, err, first = 1;
 	struct mtd_dev_info mtd;
@@ -367,9 +368,14 @@ static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info)
 		}
 	}
 	printf("\n");
-	printf("Sysfs interface supported:      %s\n\n",
+	printf("Sysfs interface supported:      %s\n",
 	       mtd_info->sysfs_supported ? "yes" : "no");
 
+	if (!all)
+		return 0;
+
+	printf("\n");
+
 	for (i = mtd_info->lowest_mtd_num;
 	     i <= mtd_info->highest_mtd_num; i++) {
 		err = print_dev_info(libmtd, mtd_info, i);
@@ -404,7 +410,7 @@ int main(int argc, char * const argv[])
 		return sys_errmsg("cannot get MTD information");
 	}
 
-	if (!args.all) {
+	if (!args.all && args.node) {
 		int mtdn;
 
 		/*
@@ -416,7 +422,7 @@ int main(int argc, char * const argv[])
 			goto out_libmtd;
 		err = print_dev_info(libmtd, &mtd_info, mtdn);
 	} else
-		err = print_general_info(libmtd, &mtd_info);
+		err = print_general_info(libmtd, &mtd_info, args.all);
 	if (err)
 		goto out_libmtd;
 
-- 
1.7.5.4
