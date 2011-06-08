Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNrh-0002SE-Od
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:52:30 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id B25EF1B4022
	for <linux-mtd@lists.infradead.org>;
	Wed,  8 Jun 2011 18:52:25 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdinfo: remove now unused ubigen info
Date: Wed,  8 Jun 2011 14:52:28 -0400
Message-Id: <1307559148-28483-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A previous commit moved the code using this var into a diff func.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/src/mtdinfo.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index ca0ad71..38b63ca 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -185,7 +185,6 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 {
 	int err;
 	struct mtd_dev_info mtd;
-	struct ubigen_info ui;
 
 	err = mtd_get_dev_info1(libmtd, mtdn, &mtd);
 	if (err) {
-- 
1.7.5.3
