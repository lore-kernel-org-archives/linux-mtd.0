Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAfSC-0004QJ-3H
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 16:36:09 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] mtd: nand: Support 'EXIT GET STATUS' command in
 nand_command_lp()
Date: Tue, 16 May 2017 18:35:45 +0200
Message-Id: <1494952545-5089-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

READ0 is sometimes used to exit GET STATUS mode. When this is the case
no address cycles are requested, and we can use this information to
detect that READSTART should not be issued after READ0 or that we
shouldn't wait for the chip to be ready.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 08ff98c47e1f..fe87bd3513fa 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -753,6 +753,16 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 		return;
 
 		/* This applies to read commands */
+	case NAND_CMD_READ0:
+		/*
+		 * READ0 is sometimes used to exit GET STATUS mode. When this
+		 * is the case no address cycles are requested, and we can use
+		 * this information to detect that we should not wait for the
+		 * device to be ready.
+		 */
+		if (column == -1 && page_addr == -1)
+			return;
+
 	default:
 		/*
 		 * If we don't have access to the busy pin, we apply the given
@@ -887,6 +897,15 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		return;
 
 	case NAND_CMD_READ0:
+		/*
+		 * READ0 is sometimes used to exit GET STATUS mode. When this
+		 * is the case no address cycles are requested, and we can use
+		 * this information to detect that READSTART should not be
+		 * issued.
+		 */
+		if (column == -1 && page_addr == -1)
+			return;
+
 		chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
 			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-- 
2.7.4
