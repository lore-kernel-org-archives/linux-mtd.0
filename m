Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBSjl-0005vO-2i
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 15:50:53 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: docg4: ecc.read_page() returns 0 on uncorrectible
 errors
Date: Tue, 11 Sep 2012 08:50:50 -0700
Message-Id: <1347378650-3522-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently the docg4's ecc.read_page() method returns -EBADMSG when uncorrectible
bitflips occur.  This is wrong; 0 should be returned in this case.  An error
code should only be returned by this method in the case of a hardware error
(probably -EIO).

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/docg4.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 793921e..deb718c 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -776,6 +776,8 @@ static int read_page(struct mtd_info *mtd, struct nand_chip *nand,
 	}
 
 	writew(0, docptr + DOC_DATAEND);
+	if (bits_corrected == -EBADMSG)	  /* uncorrectible errors */
+		return 0;
 	return bits_corrected;
 }
 
-- 
1.7.3.4
