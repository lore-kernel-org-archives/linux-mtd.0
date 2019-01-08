Received: from gateway21.websitewelcome.com ([192.185.45.163])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggtQH-0001ws-V7
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2019 15:36:11 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 29471400C7430
 for <linux-mtd@lists.infradead.org>; Tue,  8 Jan 2019 09:36:08 -0600 (CST)
Date: Tue, 8 Jan 2019 09:36:01 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: gen_probe: Use struct_size() in kmalloc()
Message-ID: <20190108153601.GA11557@embeddedor>
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

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
    int stuff;
    void *entry[];
};

instance = kmalloc(sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = kmalloc(struct_size(instance, entry, count), GFP_KERNEL);

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/chips/gen_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 837b04ab96a9..839ed40625d6 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -135,7 +135,7 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 	 * our caller, and copy the appropriate data into them.
 	 */
 
-	retcfi = kmalloc(sizeof(struct cfi_private) + cfi.numchips * sizeof(struct flchip), GFP_KERNEL);
+	retcfi = kmalloc(struct_size(retcfi, chips, cfi.numchips), GFP_KERNEL);
 
 	if (!retcfi) {
 		kfree(cfi.cfiq);
-- 
2.20.1
