From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: use KERN_DEBUG for ECC errors
Date: Mon, 31 Aug 2009 10:03:32 +0300
Message-Id: <1251702212-17785-1-git-send-email-dedekind@infradead.org>
Cc: Kyungmin Park <kmpark@infradead.org>,
	Adrian Hunter <Adrian.Hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

ECC errors is a normal phenomena on OneNAND and they happen quite
often. Flash-aware file-systems like JFFS2 or UBIFS are able to
handle them gracefully.

Currently OneNAND driver prints about ECC errors like this:
onenand_bbt_wait: ecc error = 0x2222, controller error 0x2400
onenand_bbt_wait: ecc error = 0x2222, controller error 0x2400
onenand_bbt_wait: ecc error = 0x2222, controller error 0x2400

These messages are scary and make users think that something serious
happened. However, they are handled nicely by UBIFS.

This patch makes this messages to be printed with KERN_DEBUG
level, so that they would not go to the console, at least, which
is currently happening in case of standard default setup.

Indeed, since ECC errors are supposed to be handled by upper
level SW, we do not really have to print these messages, and we
may consider them as debugging prints.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6e82909..994939e 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1450,7 +1450,7 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = onenand_read_ecc(this);
 		if (ecc & ONENAND_ECC_2BIT_ALL) {
-			printk(KERN_INFO "onenand_bbt_wait: ecc error = 0x%04x"
+			printk(KERN_DEBUG "onenand_bbt_wait: ecc error = 0x%04x"
 				", controller error 0x%04x\n", ecc, ctrl);
 			return ONENAND_BBT_READ_ECC_ERROR;
 		}
-- 
1.6.2.5
