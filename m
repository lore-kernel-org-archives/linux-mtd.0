Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S32dW-0003VH-IS
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 09:49:23 +0000
Received: by eekb45 with SMTP id b45so151080eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2012 01:49:21 -0800 (PST)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-sh@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/7] mtd: sh_flctl: Reorder empty_fifo() calls
Date: Thu,  1 Mar 2012 10:48:36 +0100
Message-Id: <1330595321-2728-2-git-send-email-hechtb@gmail.com>
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

Reorders the calls to make it a bit shorter and match the calling
procedure displayed in the datasheet.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
changelog: There was an inconsistency between patch 2/7 and 3/7. An empty_fifo() call has been moved around to correct it.

 drivers/mtd/nand/sh_flctl.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 93b1f74..9291066 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -525,7 +525,6 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			execmd_read_page_sector(mtd, page_addr);
 			break;
 		}
-		empty_fifo(flctl);
 		if (flctl->page_size)
 			set_cmd_regs(mtd, command, (NAND_CMD_READSTART << 8)
 				| command);
@@ -547,7 +546,6 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			break;
 		}
 
-		empty_fifo(flctl);
 		if (flctl->page_size) {
 			set_cmd_regs(mtd, command, (NAND_CMD_READSTART << 8)
 				| NAND_CMD_READ0);
@@ -560,12 +558,12 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		goto read_normal_exit;
 
 	case NAND_CMD_READID:
-		empty_fifo(flctl);
 		set_cmd_regs(mtd, command, command);
 		set_addr(mtd, 0, 0);
 
 		flctl->read_bytes = 4;
 		writel(flctl->read_bytes, FLDTCNTR(flctl)); /* set read size */
+		empty_fifo(flctl);
 		start_translation(flctl);
 		read_datareg(flctl, 0);	/* read and end */
 		break;
@@ -654,6 +652,7 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned int command,
 
 read_normal_exit:
 	writel(flctl->read_bytes, FLDTCNTR(flctl));	/* set read size */
+	empty_fifo(flctl);
 	start_translation(flctl);
 	read_fiforeg(flctl, flctl->read_bytes, 0);
 	wait_completion(flctl);
-- 
1.7.5.4
