Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvYWT-0005ES-RS
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 18:15:11 +0000
Received: by mail-pw0-f49.google.com with SMTP id un1so605964pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 10:15:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] libmtd: fix segmentation fault on lib->mtd
Date: Thu,  9 Feb 2012 10:13:30 -0800
Message-Id: <1328811211-13653-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
References: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Legacy systems do not initialize lib->mtd, so we shouldn't perform
strlen(lib->mtd); this produces a segmentation fault. As this code isn't
used in the legacy codepath, we can just move it down to an 'else' branch.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 2bb4e57..fb4586c 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -644,13 +644,15 @@ void libmtd_close(libmtd_t desc)
 int mtd_dev_present(libmtd_t desc, int mtd_num) {
 	struct stat st;
 	struct libmtd *lib = (struct libmtd *)desc;
-	char file[strlen(lib->mtd) + 10];
 
 	if (!lib->sysfs_supported)
 		return legacy_dev_present(mtd_num);
+	else {
+		char file[strlen(lib->mtd) + 10];
 
-	sprintf(file, lib->mtd, mtd_num);
-	return !stat(file, &st);
+		sprintf(file, lib->mtd, mtd_num);
+		return !stat(file, &st);
+	}
 }
 
 int mtd_get_info(libmtd_t desc, struct mtd_info *info)
-- 
1.7.5.4
