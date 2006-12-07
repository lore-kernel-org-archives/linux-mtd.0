Received: from rubidium.solidboot.com ([81.22.244.175] helo=mail.solidboot.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GsGH6-0004oG-W3
	for linux-mtd@lists.infradead.org; Thu, 07 Dec 2006 05:14:47 -0500
Date: Thu, 7 Dec 2006 12:13:20 +0200
From: Timo Teras <timo.teras@solidboot.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] OneNAND: Update OOB free table
Message-ID: <20061207101320.GA17898@mail.solidboot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: timo.teras@solidboot.com
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do not use bytes managed by OneNAND ECC logic for Logical Sector Number
data.

Signed-off-by: Timo Teras <timo.teras@solidboot.com>
---
The OneNAND specification says that the three bytes at offsets 2, 18, 34
and 50 are managed by internal ecc logic. The effect is obvious as
modifying these bytes, it also modifies ECC code for spare area.

 drivers/mtd/onenand/onenand_base.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index d9f7940..778e4bc 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -31,10 +31,7 @@ static struct nand_ecclayout onenand_oob
 		40, 41, 42, 43, 44,
 		56, 57, 58, 59, 60,
 		},
-	.oobfree	= {
-		{2, 3}, {14, 2}, {18, 3}, {30, 2},
-		{34, 3}, {46, 2}, {50, 3}, {62, 2}
-	}
+	.oobfree	= { {14, 2}, {30, 2}, {46, 2}, {62, 2} }
 };
 
 /**
-- 
1.4.3.3
