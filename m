Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbhjP-0000gz-2d
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 23:30:11 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/3] mtd: tests: ignore corrected bitflips in OOB on
	mtd_readtest
Date: Tue, 28 Jun 2011 16:28:59 -0700
Message-ID: <1309303740-9936-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
References: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Jim Quinlan <jim2101024@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

read_oob may now return ECC error codes. If the code is -EUCLEAN, then
we can safely ignore the error as a corrected bitflip.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/tests/mtd_readtest.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index afe71aa..de23e8e 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -75,7 +75,8 @@ static int read_eraseblock_by_page(int ebnum)
 			ops.datbuf    = NULL;
 			ops.oobbuf    = oobbuf;
 			ret = mtd->read_oob(mtd, addr, &ops);
-			if (ret || ops.oobretlen != mtd->oobsize) {
+			if (ret && ret != -EUCLEAN ||
+					ops.oobretlen != mtd->oobsize) {
 				printk(PRINT_PREF "error: read oob failed at "
 						  "%#llx\n", (long long)addr);
 				if (!err)
-- 
1.7.0.4
