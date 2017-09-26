Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwgjR-0000Vc-71
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 03:40:27 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: wait for tWHR after NAND_CMD_STATUS /
 NAND_CMD_READID
Date: Tue, 26 Sep 2017 12:39:24 +0900
Message-Id: <1506397164-3648-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read Status and Read ID require tWHR before reading the first data.
Insert a very short wait to make sure to meet the spec.

I have not seen any problem report for now, but nand_command() and
nand_command_lP() are generic hooks, so it makes sense to implement
fail-safe code here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/nand_base.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b1cf32c..55c0ba5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -742,9 +742,12 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
+	case NAND_CMD_SET_FEATURES:
+		return;
+
 	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
+		ndelay(200);	/* tWHR */
 		return;
 
 	case NAND_CMD_RESET:
@@ -871,9 +874,12 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
+	case NAND_CMD_SET_FEATURES:
+		return;
+
 	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
+		ndelay(200);	/* tWHR */
 		return;
 
 	case NAND_CMD_RNDIN:
-- 
2.7.4
