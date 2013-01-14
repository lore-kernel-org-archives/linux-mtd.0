Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tuf98-00086I-T2
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2013 08:11:55 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: apply tPROG delay for ONFI nand's page program
Date: Mon, 14 Jan 2013 15:17:33 +0800
Message-ID: <1358147853-31826-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With some latest Micron's onfi nand(such as MT29F64G08CBABAWP),
I find that if we do not apply the tPROG delay as the datasheet tells us,
the page program may fails. You will read out the all 0xff from this page
in this case.

This patch adds the tPROG delay for page program when it is an onfi nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8323ac9..b628dd5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -841,6 +841,10 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	 */
 	ndelay(100);
 
+	/* Apply the tPROG delay for ONFI nand program. */
+	if (chip->onfi_version && state == FL_WRITING)
+		udelay(le16_to_cpu(chip->onfi_params.t_prog));
+
 	if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
 		chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
 	else
-- 
1.7.0.4
