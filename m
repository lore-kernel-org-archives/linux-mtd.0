Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMghM-00019J-Na
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:24 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/21] mtd: nand: pxa3xx: Add multiple chunk write support
Date: Thu, 19 Sep 2013 13:01:41 -0300
Message-Id: <1379606505-2529-18-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds write support for large pages (4 KiB, 8 KiB).
Such support is implemented by issuing a multiple command sequence,
transfering a set of 2 KiB chunks per transaction.

The splitted command sequence requires to send the SEQIN command
independently of the PAGEPROG command and therefore it's set as
an execution command.

Since PAGEPROG enables ECC, each 2 KiB chunk of data is written
together with ECC code at a controller-fixed location within
the flash page.

Currently, only devices with a 4 KiB page size has been tested.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 83 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 609f66e..6392923 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -760,6 +760,20 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 	case NAND_CMD_SEQIN:
 
 		set_command_address(info, mtd->writesize, column, page_addr);
+
+		/*
+		 * Multiple page programming needs to execute the initial
+		 * SEQIN command that sets the page address.
+		 */
+		if (mtd->writesize > PAGE_CHUNK_SIZE) {
+			info->ndcb0 |= NDCB0_CMD_TYPE(0x1)
+				| NDCB0_EXT_CMD_TYPE(ext_cmd_type)
+				| addr_cycle
+				| command;
+			/* No data transfer in this case */
+			info->data_size = 0;
+			exec_cmd = 1;
+		}
 		break;
 
 	case NAND_CMD_PAGEPROG:
@@ -769,13 +783,40 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 			break;
 		}
 
-		info->ndcb0 |= NDCB0_CMD_TYPE(0x1)
-				| NDCB0_AUTO_RS
-				| NDCB0_ST_ROW_EN
-				| NDCB0_DBC
-				| (NAND_CMD_PAGEPROG << 8)
-				| NAND_CMD_SEQIN
-				| addr_cycle;
+		/* Second command setting for large pages */
+		if (mtd->writesize > PAGE_CHUNK_SIZE) {
+			/*
+			 * Multiple page write uses the 'extended command'
+			 * field. This can be used to issue a command dispatch
+			 * or a naked-write depending on the current stage.
+			 */
+			info->ndcb0 |= NDCB0_CMD_TYPE(0x1)
+					| NDCB0_LEN_OVRD
+					| NDCB0_EXT_CMD_TYPE(ext_cmd_type);
+			info->ndcb3 = info->chunk_size +
+				      info->oob_size;
+
+			/*
+			 * This is the command dispatch that completes a chunked
+			 * page program operation.
+			 */
+			if (info->data_size == 0) {
+				info->ndcb0 = NDCB0_CMD_TYPE(0x1)
+						| NDCB0_EXT_CMD_TYPE(ext_cmd_type)
+						| command;
+				info->ndcb1 = 0;
+				info->ndcb2 = 0;
+				info->ndcb3 = 0;
+			}
+		} else {
+			info->ndcb0 |= NDCB0_CMD_TYPE(0x1)
+					| NDCB0_AUTO_RS
+					| NDCB0_ST_ROW_EN
+					| NDCB0_DBC
+					| (NAND_CMD_PAGEPROG << 8)
+					| NAND_CMD_SEQIN
+					| addr_cycle;
+		}
 		break;
 
 	case NAND_CMD_PARAM:
@@ -873,6 +914,15 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, const unsigned command,
 	case NAND_CMD_READOOB:
 		ext_cmd_type = EXT_CMD_TYPE_MONO;
 		break;
+	case NAND_CMD_SEQIN:
+		ext_cmd_type = EXT_CMD_TYPE_DISPATCH;
+		break;
+	case NAND_CMD_PAGEPROG:
+		ext_cmd_type = EXT_CMD_TYPE_NAKED_RW;
+		break;
+	default:
+		ext_cmd_type = -1;
+		break;
 	}
 
 	prepare_start_command(info, command);
@@ -910,7 +960,16 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, const unsigned command,
 		}
 
 		/* Check if the sequence is complete */
-		if (info->data_size == 0)
+		if (info->data_size == 0 && command != NAND_CMD_PAGEPROG)
+			break;
+
+		/*
+		 * After a splitted program command sequence has issued
+		 * the command dispatch, the command sequence is complete.
+		 */
+		if (info->data_size == 0 &&
+		    command == NAND_CMD_PAGEPROG &&
+		    ext_cmd_type == EXT_CMD_TYPE_DISPATCH)
 			break;
 
 		if (command == NAND_CMD_READ0 || command == NAND_CMD_READOOB) {
@@ -919,6 +978,14 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, const unsigned command,
 				ext_cmd_type = EXT_CMD_TYPE_LAST_RW;
 			else
 				ext_cmd_type = EXT_CMD_TYPE_NAKED_RW;
+
+		/*
+		 * If a splitted program command has no more data to transfer,
+		 * the command dispatch must be issued to complete.
+		 */
+		} else if (command == NAND_CMD_PAGEPROG &&
+			   info->data_size == 0) {
+				ext_cmd_type = EXT_CMD_TYPE_DISPATCH;
 		}
 	} while (1);
 
-- 
1.8.1.5
