Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esFbx-0005r7-6O
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2018 22:26:38 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, linux-mtd@lists.infradead.org,
 stefan@agner.ch
Subject: [PATCH v2] mtd: tests: check erase block count in page test
Date: Sat,  3 Mar 2018 23:26:22 +0100
Message-Id: <20180303222622.2941-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When there is only a single erase block, the cross erase test
does not report sensible errors. Warn in case there is only
a single erase block instead of executing the test.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/tests/pagetest.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index ff1e0565b020..bc303cac9f43 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -435,9 +435,13 @@ static int __init mtd_pagetest_init(void)
 	if (err)
 		goto out;
 
-	err = erasecrosstest();
-	if (err)
-		goto out;
+	if (ebcnt > 1) {
+		err = erasecrosstest();
+		if (err)
+			goto out;
+	} else {
+		pr_info("skipping erasecrosstest, 2 erase blocks needed\n");
+	}
 
 	err = erasetest();
 	if (err)
-- 
2.16.2
