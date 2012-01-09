Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkLn7-0004Da-AI
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 20:26:01 +0000
Received: by mail-iy0-f177.google.com with SMTP id k27so8400220iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 12:26:01 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 6/6] mtd: nand: correct comment on nand_chip badblockbits
Date: Mon,  9 Jan 2012 12:23:32 -0800
Message-Id: <1326140612-26323-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
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

The description for badblockbits is incorrect. I think someone just made
up a false description on the spot to satisfy some kerneldoc warning.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/nand.h |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3547205..a7d8f2e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -454,8 +454,9 @@ struct nand_buffers {
  *			will be copied to the appropriate nand_bbt_descr's.
  * @badblockpos:	[INTERN] position of the bad block marker in the oob
  *			area.
- * @badblockbits:	[INTERN] number of bits to left-shift the bad block
- *			number
+ * @badblockbits:	[INTERN] minimum number of set bits in a good block's
+ *			bad block marker position; i.e., BBM == 11110111b is
+ *			not bad when badblockbits == 7
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
-- 
1.7.5.4
