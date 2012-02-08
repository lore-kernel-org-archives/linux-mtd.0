Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6Sj-0001t3-OU
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 12:17:26 +0000
Received: by mail-ey0-f177.google.com with SMTP id i1so158342eaa.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 04:17:25 -0800 (PST)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 4/7] mtd: sh_flctl: Implement NAND_CMD_RNDOUT command
Date: Wed,  8 Feb 2012 13:16:48 +0100
Message-Id: <1328703411-3452-4-git-send-email-hechtb@gmail.com>
In-Reply-To: <1328703411-3452-1-git-send-email-hechtb@gmail.com>
References: <1328703411-3452-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>, magnus.damm@gmail.com,
 laurent.pinchart@ideasonboard.com
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
 drivers/mtd/nand/sh_flctl.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 407acb5..5c3e71f 100644
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
@@ -558,6 +559,18 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		flctl->read_bytes = mtd->oobsize;
 		goto read_normal_exit;
 
+	case NAND_CMD_RNDOUT:
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
