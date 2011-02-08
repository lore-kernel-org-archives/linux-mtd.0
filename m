Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkPz-0000Ir-1I
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:03:32 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/5] mtd: tests : move ebcnt and pgcnt definitions before
	usage in printing.
Date: Tue,  8 Feb 2011 12:02:41 +0200
Message-Id: <1297159362-8407-5-git-send-email-adrian.hunter@nokia.com>
In-Reply-To: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
References: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roman Tereshonkov <roman.tereshonkov@nokia.com>

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
