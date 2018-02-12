Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elJPy-0001wc-SE
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 19:05:36 +0000
Received: by mail-wr0-x242.google.com with SMTP id b52so16269619wrd.10
 for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2018 11:05:21 -0800 (PST)
From: Antonio Cardace <anto.cardace@gmail.com>
To: boris.brezillon@free-electrons.com,
	cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 Antonio Cardace <anto.cardace@gmail.com>
Subject: [PATCH] mtd: st_spi_fsm: use %*ph to print small buffer
Date: Mon, 12 Feb 2018 18:41:30 +0000
Message-Id: <20180212184130.10238-1-anto.cardace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use %*ph format to print small buffer as hex string.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Antonio Cardace <anto.cardace@gmail.com>
---
 drivers/mtd/devices/st_spi_fsm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 7bc29d725200..a33f5fd6818c 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -1868,8 +1868,7 @@ static struct flash_info *stfsm_jedec_probe(struct stfsm *fsm)
 	 */
 	ext_jedec = id[3] << 8  | id[4];
 
-	dev_dbg(fsm->dev, "JEDEC =  0x%08x [%02x %02x %02x %02x %02x]\n",
-		jedec, id[0], id[1], id[2], id[3], id[4]);
+	dev_dbg(fsm->dev, "JEDEC =  0x%08x [%5ph]\n", jedec, id);
 
 	for (info = flash_types; info->name; info++) {
 		if (info->jedec_id == jedec) {
-- 
2.15.1.354.g95ec6b1b3
