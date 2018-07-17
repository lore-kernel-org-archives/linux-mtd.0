Received: from gateway23.websitewelcome.com ([192.185.49.180])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffTI8-0007yP-HD
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 16:57:37 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 374EED147
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2018 11:57:14 -0500 (CDT)
Date: Tue, 17 Jul 2018 11:56:43 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] UBIFS: use swap macro in swap_dirty_idx
Message-ID: <20180717165643.GA19225@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make use of the swap macro and remove unnecessary variable *t*. This
makes the code easier to read and maintain.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/ubifs/find.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 9571616..36198f8 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -750,10 +750,7 @@ static int cmp_dirty_idx(const struct ubifs_lprops **a,
 static void swap_dirty_idx(struct ubifs_lprops **a, struct ubifs_lprops **b,
 			   int size)
 {
-	struct ubifs_lprops *t = *a;
-
-	*a = *b;
-	*b = t;
+	swap(*a, *b);
 }
 
 /**
-- 
2.7.4
