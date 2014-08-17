Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIvqo-0004vz-Pn
 for linux-mtd@lists.infradead.org; Sun, 17 Aug 2014 08:30:07 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mtd: nand: fix DocBook warnings on nand_sdr_timings doc
Date: Sun, 17 Aug 2014 10:29:42 +0200
Message-Id: <1408264182-31830-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the comment type (from /** to /*) to prevent DocBook from
complaining about missing description for nand_sdr_timings fields.

There is currently no need in documenting those fields because they are
fully described in the ONFI specification (which is pointed out in the
comment).

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3083c53..c300db3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -949,7 +949,7 @@ static inline int jedec_feature(struct nand_chip *chip)
 		: 0;
 }
 
-/**
+/*
  * struct nand_sdr_timings - SDR NAND chip timings
  *
  * This struct defines the timing requirements of a SDR NAND chip.
-- 
1.8.3.2
