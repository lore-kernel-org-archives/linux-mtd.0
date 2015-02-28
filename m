From: Colin King <colin.king@canonical.com>
To: Josh Wu <josh.wu@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: atmel_nand: fix typo in dev_err error message
Date: Sat, 28 Feb 2015 20:27:56 +0000
Message-Id: <1425155276-8039-1-git-send-email-colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Fix typo, "Unkown" -> "Unknown"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/atmel_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index d93c849..1310450 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1719,7 +1719,7 @@ static int nfc_wait_interrupt(struct atmel_nand_host *host, u32 flag)
 		comp[index++] = &host->nfc->comp_cmd_done;
 
 	if (index == 0) {
-		dev_err(host->dev, "Unkown interrupt flag: 0x%08x\n", flag);
+		dev_err(host->dev, "Unknown interrupt flag: 0x%08x\n", flag);
 		return -EINVAL;
 	}
 
-- 
2.1.4
