From: malat@debian.org (Mathieu Malaterre)
Date: Wed, 16 Jan 2019 20:50:03 +0100
Subject: [PATCH 1/2] mtd: Annotate implicit fall through in
 nand_command/nand_command_lp
Message-ID: <20190116195004.2499-1-malat@debian.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

There is a plan to build the kernel with -Wimplicit-fallthrough and
these places in the code produced warnings (W=1).

This commit removes the following warnings:

  drivers/mtd/nand/raw/nand_legacy.c:332:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
  drivers/mtd/nand/raw/nand_legacy.c:483:3: warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 drivers/mtd/nand/raw/nand_legacy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 43575943f13b..f2526ec616a6 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -331,6 +331,7 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
 		 */
 		if (column == -1 && page_addr == -1)
 			return;
+		/* fall through */
 
 	default:
 		/*
@@ -483,7 +484,7 @@ static void nand_command_lp(struct nand_chip *chip, unsigned int command,
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
 
-		/* This applies to read commands */
+		/* fall through - This applies to read commands */
 	default:
 		/*
 		 * If we don't have access to the busy pin, we apply the given
-- 
2.19.2
