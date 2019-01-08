Received: from gateway34.websitewelcome.com ([192.185.148.214])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggydQ-0004I9-Mz
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2019 21:10:06 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id F049195657E
 for <linux-mtd@lists.infradead.org>;
 Tue,  8 Jan 2019 15:09:48 -0600 (CST)
Date: Tue, 8 Jan 2019 15:09:46 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: lpddr: Use struct_size() in kzalloc()
Message-ID: <20190108210946.GA4014@embeddedor>
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

One of the more common cases of allocation size calculations is finding the
size of a structure that has a zero-sized array at the end, along with memory
for some number of elements for that array. For example:

struct foo {
    int stuff;
    void *entry[];
};

instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can now
use the new struct_size() helper:

instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/lpddr/qinfo_probe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/lpddr/qinfo_probe.c b/drivers/mtd/lpddr/qinfo_probe.c
index 69f2112340b1..175bdc3b72f4 100644
--- a/drivers/mtd/lpddr/qinfo_probe.c
+++ b/drivers/mtd/lpddr/qinfo_probe.c
@@ -181,8 +181,8 @@ static struct lpddr_private *lpddr_probe_chip(struct map_info *map)
 	lpddr.numchips = 1;
 
 	numvirtchips = lpddr.numchips * lpddr.qinfo->HWPartsNum;
-	retlpddr = kzalloc(sizeof(struct lpddr_private) +
-			numvirtchips * sizeof(struct flchip), GFP_KERNEL);
+	retlpddr = kzalloc(struct_size(retlpddr, chips, numvirtchips),
+			   GFP_KERNEL);
 	if (!retlpddr)
 		return NULL;
 
-- 
2.20.1
