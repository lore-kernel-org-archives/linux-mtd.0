Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYpus-0001IY-6e
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 09:09:56 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: tests: nandbiterrs: Fix read_page return value
Date: Tue,  9 Jan 2018 10:09:38 +0100
Message-Id: <20180109090938.29760-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The number of corrected bitflips is not correctly reported by
the test until the bitflip threshold is reached.

read_page() shall return the number of corrected bitflips, but
mtd_read() returns 0 or a negative error, so we can't forward
its return value. In the absence of an error we always have
calculate the number of bitflips ourselves.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/tests/nandbiterrs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
index 5f03b8c885a9..11e39ab4a810 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -152,15 +152,16 @@ static int read_page(int log)
 
 	err = mtd_read(mtd, offset, mtd->writesize, &read, rbuffer);
 	if (err == -EUCLEAN)
-		err = mtd->ecc_stats.corrected - oldstats.corrected;
+		err = 0;
 
 	if (err < 0 || read != mtd->writesize) {
 		pr_err("error: read failed at %#llx\n", (long long)offset);
 		if (err >= 0)
 			err = -EIO;
+		return err;
 	}
 
-	return err;
+	return mtd->ecc_stats.corrected - oldstats.corrected;
 }
 
 /* Verifies rbuffer against random sequence */
-- 
2.11.0
