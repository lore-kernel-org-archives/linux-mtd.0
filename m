Received: from smtp23.services.sfr.fr ([93.17.128.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIKTg-0002aD-KU
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 11:13:09 +0000
From: Eric Benard <eric@eukrea.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mxc_nand : add RESET command support
Date: Wed,  9 Dec 2009 12:12:43 +0100
Message-Id: <1260357163-5367-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1260347150.19669.1206.camel@localhost>
References: <1260347150.19669.1206.camel@localhost>
Cc: s.hauer@pengutronix.de, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mxc_nand driver must support the RESET Command in order to support
Micron NAND which need a reset before any other command.

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 drivers/mtd/nand/mxc_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d5445cd..0207525 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -638,6 +638,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 
 	case NAND_CMD_ERASE1:
 	case NAND_CMD_ERASE2:
+	case NAND_CMD_RESET:
 		send_cmd(host, command, false);
 		mxc_do_addr_cycle(mtd, column, page_addr);
 
-- 
1.6.3.3
