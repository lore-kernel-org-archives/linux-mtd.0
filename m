Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYRr-0004Cw-Mp
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 06/12] mtd: nand: remove a bunch of unused commands
Date: Mon,  4 Mar 2013 18:42:23 +0200
Message-Id: <1362415349-7107-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/cafe_nand.c   |    6 ------
 drivers/mtd/nand/nand_base.c   |   10 ----------
 drivers/mtd/nand/nandsim.c     |    8 --------
 drivers/mtd/nand/nuc900_nand.c |    9 ---------
 include/linux/mtd/nand.h       |   20 --------------------
 5 files changed, 53 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 010d612..a01ccb9 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -303,13 +303,7 @@ static void cafe_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_RNDIN:
 	case NAND_CMD_STATUS:
-	case NAND_CMD_DEPLETE1:
 	case NAND_CMD_RNDOUT:
-	case NAND_CMD_STATUS_ERROR:
-	case NAND_CMD_STATUS_ERROR0:
-	case NAND_CMD_STATUS_ERROR1:
-	case NAND_CMD_STATUS_ERROR2:
-	case NAND_CMD_STATUS_ERROR3:
 		cafe_writel(cafe, cafe->ctl2, NAND_CTRL2);
 		return;
 	}
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0e28f55..760ee49 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -669,16 +669,6 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_RNDIN:
 	case NAND_CMD_STATUS:
-	case NAND_CMD_DEPLETE1:
-		return;
-
-	case NAND_CMD_STATUS_ERROR:
-	case NAND_CMD_STATUS_ERROR0:
-	case NAND_CMD_STATUS_ERROR1:
-	case NAND_CMD_STATUS_ERROR2:
-	case NAND_CMD_STATUS_ERROR3:
-		/* Read error status commands require only a short delay */
-		udelay(chip->chip_delay);
 		return;
 
 	case NAND_CMD_RESET:
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 891c52a..7199acc 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -218,7 +218,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define STATE_CMD_READOOB      0x00000005 /* read OOB area */
 #define STATE_CMD_ERASE1       0x00000006 /* sector erase first command */
 #define STATE_CMD_STATUS       0x00000007 /* read status */
-#define STATE_CMD_STATUS_M     0x00000008 /* read multi-plane status (isn't implemented) */
 #define STATE_CMD_SEQIN        0x00000009 /* sequential data input */
 #define STATE_CMD_READID       0x0000000A /* read ID */
 #define STATE_CMD_ERASE2       0x0000000B /* sector erase second command */
@@ -406,8 +405,6 @@ static struct nandsim_operations {
 	{OPT_ANY, {STATE_CMD_ERASE1, STATE_ADDR_SEC, STATE_CMD_ERASE2 | ACTION_SECERASE, STATE_READY}},
 	/* Read status */
 	{OPT_ANY, {STATE_CMD_STATUS, STATE_DATAOUT_STATUS, STATE_READY}},
-	/* Read multi-plane status */
-	{OPT_SMARTMEDIA, {STATE_CMD_STATUS_M, STATE_DATAOUT_STATUS_M, STATE_READY}},
 	/* Read ID */
 	{OPT_ANY, {STATE_CMD_READID, STATE_ADDR_ZERO, STATE_DATAOUT_ID, STATE_READY}},
 	/* Large page devices read page */
@@ -1079,8 +1076,6 @@ static char *get_state_name(uint32_t state)
 			return "STATE_CMD_ERASE1";
 		case STATE_CMD_STATUS:
 			return "STATE_CMD_STATUS";
-		case STATE_CMD_STATUS_M:
-			return "STATE_CMD_STATUS_M";
 		case STATE_CMD_SEQIN:
 			return "STATE_CMD_SEQIN";
 		case STATE_CMD_READID:
@@ -1145,7 +1140,6 @@ static int check_command(int cmd)
 	case NAND_CMD_RNDOUTSTART:
 		return 0;
 
-	case NAND_CMD_STATUS_MULTI:
 	default:
 		return 1;
 	}
@@ -1171,8 +1165,6 @@ static uint32_t get_state_by_command(unsigned command)
 			return STATE_CMD_ERASE1;
 		case NAND_CMD_STATUS:
 			return STATE_CMD_STATUS;
-		case NAND_CMD_STATUS_MULTI:
-			return STATE_CMD_STATUS_M;
 		case NAND_CMD_SEQIN:
 			return STATE_CMD_SEQIN;
 		case NAND_CMD_READID:
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index a619119..cd6be2e 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -177,15 +177,6 @@ static void nuc900_nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_RNDIN:
 	case NAND_CMD_STATUS:
-	case NAND_CMD_DEPLETE1:
-		return;
-
-	case NAND_CMD_STATUS_ERROR:
-	case NAND_CMD_STATUS_ERROR0:
-	case NAND_CMD_STATUS_ERROR1:
-	case NAND_CMD_STATUS_ERROR2:
-	case NAND_CMD_STATUS_ERROR3:
-		udelay(chip->chip_delay);
 		return;
 
 	case NAND_CMD_RESET:
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2aba049..69097e8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -86,7 +86,6 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_CMD_READOOB	0x50
 #define NAND_CMD_ERASE1		0x60
 #define NAND_CMD_STATUS		0x70
-#define NAND_CMD_STATUS_MULTI	0x71
 #define NAND_CMD_SEQIN		0x80
 #define NAND_CMD_RNDIN		0x85
 #define NAND_CMD_READID		0x90
@@ -105,25 +104,6 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_CMD_RNDOUTSTART	0xE0
 #define NAND_CMD_CACHEDPROG	0x15
 
-/* Extended commands for AG-AND device */
-/*
- * Note: the command for NAND_CMD_DEPLETE1 is really 0x00 but
- *       there is no way to distinguish that from NAND_CMD_READ0
- *       until the remaining sequence of commands has been completed
- *       so add a high order bit and mask it off in the command.
- */
-#define NAND_CMD_DEPLETE1	0x100
-#define NAND_CMD_DEPLETE2	0x38
-#define NAND_CMD_STATUS_MULTI	0x71
-#define NAND_CMD_STATUS_ERROR	0x72
-/* multi-bank error status (banks 0-3) */
-#define NAND_CMD_STATUS_ERROR0	0x73
-#define NAND_CMD_STATUS_ERROR1	0x74
-#define NAND_CMD_STATUS_ERROR2	0x75
-#define NAND_CMD_STATUS_ERROR3	0x76
-#define NAND_CMD_STATUS_RESET	0x7f
-#define NAND_CMD_STATUS_CLEAR	0xff
-
 #define NAND_CMD_NONE		-1
 
 /* Status bits */
-- 
1.7.10.4
