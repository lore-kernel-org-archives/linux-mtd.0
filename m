Received: from gateway24.websitewelcome.com ([192.185.50.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcshv-0005o5-FW
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 13:29:32 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id A671B4E54
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2018 08:29:08 -0500 (CDT)
Date: Tue, 10 Jul 2018 08:29:02 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: nuc900_nand: mark expected switch fall-through
Message-ID: <20180710132902.GA13541@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 1471717 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/nand/raw/nuc900_nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nuc900_nand.c b/drivers/mtd/nand/raw/nuc900_nand.c
index af5b32c9..53a9f6c 100644
--- a/drivers/mtd/nand/raw/nuc900_nand.c
+++ b/drivers/mtd/nand/raw/nuc900_nand.c
@@ -191,8 +191,9 @@ static void nuc900_nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		return;
 
 	case NAND_CMD_READ0:
-
 		write_cmd_reg(nand, NAND_CMD_READSTART);
+		/* fall through */
+
 	default:
 
 		if (!chip->dev_ready) {
-- 
2.7.4
