Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkxds-000830-Cn
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 11:46:29 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p13BkOIl005444
	for <linux-mtd@lists.infradead.org>; Thu, 3 Feb 2011 13:46:24 +0200
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: tests : move ebcnt and pgcnt definitions before usage in
	printing.
Date: Thu,  3 Feb 2011 13:45:56 +0200
Message-Id: <1296733556-22196-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: Roman Tereshonkov <roman.tereshonkov@nokia.com>, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ebcnt and pgcnt variable initialization is moved before printk which
uses them.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/tests/mtd_subpagetest.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 11204e8..334eae5 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -394,6 +394,11 @@ static int __init mtd_subpagetest_init(void)
 	}
 
 	subpgsize = mtd->writesize >> mtd->subpage_sft;
+	tmp = mtd->size;
+	do_div(tmp, mtd->erasesize);
+	ebcnt = tmp;
+	pgcnt = mtd->erasesize / mtd->writesize;
+
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, subpage size %u, count of eraseblocks %u, "
 	       "pages per eraseblock %u, OOB size %u\n",
@@ -413,11 +418,6 @@ static int __init mtd_subpagetest_init(void)
 		goto out;
 	}
 
-	tmp = mtd->size;
-	do_div(tmp, mtd->erasesize);
-	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
-
 	err = scan_for_bad_eraseblocks();
 	if (err)
 		goto out;
-- 
1.7.0.4
