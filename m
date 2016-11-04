Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwo-00037o-8w
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:42:10 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 22/22] mtd: nand: socrates: use nand_scan() for
 nand_scan_ident/tail() combo
Date: Fri,  4 Nov 2016 19:43:10 +0900
Message-Id: <1478256190-7452-23-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For this driver, there is nothing between nand_scan_ident() and
nand_scan_tail().  They can be merged into nand_scan().

Also, nand_scan() returns an appropriate error value when it fails.
Use it instead of the fixed error code -ENXIO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/socrates_nand.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 888fd31..72369bd 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -187,17 +187,9 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(&ofdev->dev, host);
 
-	/* first scan to find the device and get the page size */
-	if (nand_scan_ident(mtd, 1, NULL)) {
-		res = -ENXIO;
+	res = nand_scan(mtd, 1);
+	if (res)
 		goto out;
-	}
-
-	/* second phase scan */
-	if (nand_scan_tail(mtd)) {
-		res = -ENXIO;
-		goto out;
-	}
 
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
-- 
1.9.1
