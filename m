Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9J21-0006xJ-TZ
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 14:55:46 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co202.xi-lite.net (Postfix) with ESMTPS id BF056260334
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 17:21:38 +0200 (CEST)
Message-ID: <4CC1A5EE.9080605@parrot.com>
Date: Fri, 22 Oct 2010 16:55:42 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [RFC] write bad block marker even with BBT
Content-Type: multipart/mixed; boundary="------------020102000309020207050504"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------020102000309020207050504
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

do you think a patch like that make sense ?

This allow to solve problem where bootloader don't support reading BBT.

We could also add a new flag and do this only if this flag is set.


Matthieu

--------------020102000309020207050504
Content-Type: text/x-diff; name="btt.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="btt.diff"

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ddffe76..71052d0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -409,7 +409,10 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	/* Do we have a flash based bad block table ? */
 	if (chip->options & NAND_USE_FLASH_BBT)
 		ret = nand_update_bbt(mtd, ofs);
-	else {
+	/* put also the bad block marker in case we loose BBT or
+	   the bootloader doesn't support reading it
+	 */
+	{
 		nand_get_device(chip, mtd, FL_WRITING);
 
 		/* Write to first two pages and to byte 1 and 6 if necessary.

--------------020102000309020207050504--
