Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEvUV-0003g6-6C
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 09:27:35 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Aleksei Mamlin <mamlinav@gmail.com>, valdis.kletnieks@vt.edu
Subject: [PATCH v3 01/16] mtd: nand: Fix nand_command_lp() for 8bits opcodes
Date: Mon, 20 Jun 2016 11:26:47 +0200
Message-Id: <1466414822-18948-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

8 bits opcodes should be followed by a single address cycle. Make the
2nd address cycle dependent of !nand_opcode_8bits(command).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b0dc29d2af7..c2f832360871 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -745,7 +745,10 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 				column >>= 1;
 			chip->cmd_ctrl(mtd, column, ctrl);
 			ctrl &= ~NAND_CTRL_CHANGE;
-			chip->cmd_ctrl(mtd, column >> 8, ctrl);
+
+			/* Only ouput a single addr cycle for 8bits opcodes. */
+			if (!nand_opcode_8bits(command))
+				chip->cmd_ctrl(mtd, column >> 8, ctrl);
 		}
 		if (page_addr != -1) {
 			chip->cmd_ctrl(mtd, page_addr, ctrl);
-- 
2.7.4
