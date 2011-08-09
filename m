Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqtzF-0001aa-F9
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 21:37:22 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 2/5] mtdinfo: refactor code to remove "args.all" dependency
Date: Tue, 9 Aug 2011 14:36:43 -0700
Message-ID: <1312925806-15929-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
References: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index b4a2f4c..0a20c76 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -338,8 +338,7 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	return 0;
 }
 
-static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
-			      int all)
+static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info)
 {
 	int i, err, first = 1;
 	struct mtd_dev_info mtd;
@@ -366,15 +365,9 @@ static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
 		}
 	}
 	printf("\n");
-	printf("Sysfs interface supported:      %s\n",
+	printf("Sysfs interface supported:      %s\n\n",
 	       mtd_info->sysfs_supported ? "yes" : "no");
 
-	if (!all)
-		return 0;
-
-	first = 1;
-	printf("\n");
-
 	for (i = mtd_info->lowest_mtd_num;
 	     i <= mtd_info->highest_mtd_num; i++) {
 		err = print_dev_info(libmtd, mtd_info, i);
@@ -421,7 +414,7 @@ int main(int argc, char * const argv[])
 			goto out_libmtd;
 		err = print_dev_info(libmtd, &mtd_info, mtdn);
 	} else
-		err = print_general_info(libmtd, &mtd_info, args.all);
+		err = print_general_info(libmtd, &mtd_info);
 	if (err)
 		goto out_libmtd;
 
-- 
1.7.0.4
