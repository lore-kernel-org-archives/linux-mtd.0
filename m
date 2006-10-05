Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVRk4-0005oo-9U
	for linux-mtd@lists.infradead.org; Thu, 05 Oct 2006 07:50:28 -0400
Message-ID: <4524F260.1040800@dev.rtsoft.ru>
Date: Thu, 05 Oct 2006 15:54:08 +0400
From: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND nand_bbt.c: badblock_pattern initialization
Content-Type: multipart/mixed; boundary="------------090407020808060301030502"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090407020808060301030502
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

In case of AND chips(NAND_IS_AND) (struct nand_chip 
*)chip->badblock_pattern stay uninitialized, see nand_default_bbt().
It seems badblock_pattern is used only in nand_scan_bbt(), but it's 
better to initialize badblock_pattern before calling nand_scan_bbt(), 
like it's done for other chips.


--------------090407020808060301030502
Content-Type: text/x-patch;
 name="bbpattern_init.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bbpattern_init.patch"

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

--------------090407020808060301030502--
