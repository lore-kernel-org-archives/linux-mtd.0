Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmt0V-0007xH-Vi
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 09:23:27 -0500
Date: Wed, 22 Nov 2006 17:28:05 +0300
From: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Initialization of Bad Block Pattern
Message-ID: <20061122172805.7126391f@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Second try. This patch correctly initialize badblock_pattern in
case NAND_IS_AND. Currently badblock_pattern is uninitialized and
if someone try to use it NULL pointer dereference will happen.

Signed-off-by: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>

Index: linux-2.6.18/drivers/mtd/nand/nand_bbt.c
===================================================================
--- linux-2.6.18.orig/drivers/mtd/nand/nand_bbt.c
+++ linux-2.6.18/drivers/mtd/nand/nand_bbt.c
@@ -1165,7 +1165,8 @@ int nand_default_bbt(struct mtd_info *mt
 			this->bbt_md = &bbt_mirror_descr;
 		}
 		this->options |= NAND_USE_FLASH_BBT;
-		return nand_scan_bbt(mtd, &agand_flashbased);
+		this->badblock_pattern = &agand_flashbased;
+		return nand_scan_bbt(mtd, this->badblock_pattern);
 	}
 
 	/* Is a flash based bad block table requested ? */
