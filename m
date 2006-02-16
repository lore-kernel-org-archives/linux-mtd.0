Received: from smtp108.sbc.mail.mud.yahoo.com ([68.142.198.207])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F9cez-00084H-HL
	for linux-mtd@lists.infradead.org; Thu, 16 Feb 2006 01:30:39 -0500
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_7pB9DtIC9qYW9LZ"
Message-Id: <200602152223.55786.david-b@pacbell.net>
Subject: [patch 2.6.16-git] mtd_dataflash, fix block vs page erase
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 16 Feb 2006 06:30:41 -0000

--Boundary-00=_7pB9DtIC9qYW9LZ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The "<=" should be ">=", but it wouldn't matter with JFFS2.

--Boundary-00=_7pB9DtIC9qYW9LZ
Content-Type: text/x-diff;
  charset="us-ascii";
  name="data-0209.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="data-0209.patch"

Fix a bug in the block-erase optimization for Dataflash; it was using
block erase even for smaller segments that need page erase.

That wouldn't matter for JFFS2, which never erases less than one block
(sometimes several blocks), but for other callers it might.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>


--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -178,7 +178,7 @@ static int dataflash_erase(struct mtd_in
 		 * we're at a block boundary and need to erase the whole block.
 		 */
 		pageaddr = instr->addr / priv->page_size;
-		do_block = (pageaddr & 0x7) == 0 && instr->len <= blocksize;
+		do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
 		pageaddr = pageaddr << priv->page_offset;
 
 		command[0] = do_block ? OP_ERASE_BLOCK : OP_ERASE_PAGE;

--Boundary-00=_7pB9DtIC9qYW9LZ--
