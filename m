Received: from mail-pa0-f42.google.com ([209.85.220.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQCyS-0001B5-26
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 08:35:16 +0000
Received: by mail-pa0-f42.google.com with SMTP id kq13so787027pab.15
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 01:35:14 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 3/3] mtd: nand: reword nand_chip bad block interface
 comments
Date: Thu, 11 Apr 2013 01:34:59 -0700
Message-Id: <1365669299-6830-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
References: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This remedies a few problems:

(1) The use of "the" vs. "a" is a little confusing, IMO.

(2) nand_chip.block_bad is used exclusively for checking the OOB bad
    block markers of a NAND. Any BBT functionality is handled in
    nand_bbt.c, so this description should differentiate itself from
    nand_bbt.c.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: no change

 include/linux/mtd/nand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6184cc0..2126837 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -392,8 +392,8 @@ struct nand_buffers {
  * @write_buf:		[REPLACEABLE] write data from the buffer to the chip
  * @read_buf:		[REPLACEABLE] read data from the chip into the buffer
  * @select_chip:	[REPLACEABLE] select chip nr
- * @block_bad:		[REPLACEABLE] check, if the block is bad
- * @block_markbad:	[REPLACEABLE] mark the block bad
+ * @block_bad:		[REPLACEABLE] check if a block is bad, using OOB markers
+ * @block_markbad:	[REPLACEABLE] mark a block bad
  * @cmd_ctrl:		[BOARDSPECIFIC] hardwarespecific function for controlling
  *			ALE/CLE/nCE. Also used to write command and address
  * @init_size:		[BOARDSPECIFIC] hardwarespecific function for setting
-- 
1.8.2
