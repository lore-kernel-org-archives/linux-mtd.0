Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esFow-0002Hn-0V
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2018 22:40:04 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, linux-mtd@lists.infradead.org,
 stefan@agner.ch
Subject: [PATCH mtd-utils] mtd: tests: check erase block count in page test
Date: Sat,  3 Mar 2018 23:39:46 +0100
Message-Id: <20180303223946.18636-1-stefan@agner.ch>
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
 tests/mtd-tests/nandpagetest.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest.c
index c6812df..115cedb 100644
--- a/tests/mtd-tests/nandpagetest.c
+++ b/tests/mtd-tests/nandpagetest.c
@@ -551,8 +551,12 @@ int main(int argc, char **argv)
 	}
 	printf("verified %u eraseblocks\n", i);
 
-	if (crosstest())
-		goto out;
+	if (ebcnt > 1) {
+		if (crosstest())
+			goto out;
+	} else {
+		printf("skipping erasecrosstest, 2 erase blocks needed\n");
+	}
 
 	if (erasecrosstest())
 		goto out;
-- 
2.16.2
