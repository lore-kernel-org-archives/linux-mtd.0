Received: from mailbox-us-s-12.mailhostingserver.com ([75.125.101.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MNl1Z-0006Am-Tl
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 10:02:20 +0000
Date: Mon, 6 Jul 2009 12:02:08 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: dwmw2@infradead.org
Subject: [PATCH] mtdblock erase_write(): fix typo in comment
Message-ID: <20090706100208.GA26320@darwin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdblock erase_write(): fix typo in comment

Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>
---
 drivers/mtd/mtdblock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 208c6fa..515d4b0 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -82,7 +82,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 	remove_wait_queue(&wait_q, &wait);
 
 	/*
-	 * Next, writhe data to flash.
+	 * Next, write the data to flash.
 	 */
 
 	ret = mtd->write(mtd, pos, len, &retlen, buf);
-- 
1.6.3.1
