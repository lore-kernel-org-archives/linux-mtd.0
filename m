Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S32dY-0003VH-Iu
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 09:49:25 +0000
Received: by mail-ee0-f49.google.com with SMTP id b45so151080eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2012 01:49:24 -0800 (PST)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-sh@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 4/7] mtd: sh_flctl: Implement NAND_CMD_RNDOUT command
Date: Thu,  1 Mar 2012 10:48:38 +0100
Message-Id: <1330595321-2728-4-git-send-email-hechtb@gmail.com>
In-Reply-To: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
References: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implements the command to seek and read in pages.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
changelog: the code only works for software ecc. Make this explicit in
the code

 drivers/mtd/nand/sh_flctl.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 407acb5..655ff2d 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -303,6 +303,7 @@ static void set_cmd_regs(struct mtd_info *mtd, uint32_t cmd, uint32_t flcmcdr_va
 		break;
 	case NAND_CMD_READ0:
 	case NAND_CMD_READOOB:
+	case NAND_CMD_RNDOUT:
 		addr_len_bytes = flctl->rw_ADRCNT;
 		flcmdcr_val |= CDSRC_E;
 		if (flctl->chip.options & NAND_BUSWIDTH_16)
@@ -558,6 +559,21 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		flctl->read_bytes = mtd->oobsize;
 		goto read_normal_exit;
 
+	case NAND_CMD_RNDOUT:
+		if (flctl->hwecc)
+			break;
+
+		if (flctl->page_size)
+			set_cmd_regs(mtd, command, (NAND_CMD_RNDOUTSTART << 8)
+				| command);
+		else
+			set_cmd_regs(mtd, command, command);
+
+		set_addr(mtd, column, 0);
+
+		flctl->read_bytes = mtd->writesize + mtd->oobsize - column;
+		goto read_normal_exit;
+
 	case NAND_CMD_READID:
 		set_cmd_regs(mtd, command, command);
 
-- 
1.7.5.4
