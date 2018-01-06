Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXnrJ-0001AF-P9
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 12:45:59 +0000
Subject: [PATCH 1/3] mtd/nftlmount: Delete two error messages for a failed
 memory allocation in find_boot_record()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
Message-ID: <e07f94b5-3589-2fe3-3058-8fcf83a77af0@users.sourceforge.net>
Date: Sat, 6 Jan 2018 13:45:35 +0100
MIME-Version: 1.0
In-Reply-To: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 11:04:59 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nftlmount.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 184c8fbfe465..6b9634a70229 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -201,15 +201,12 @@ device is already correct.
 
 		/* memory alloc */
 		nftl->EUNtable = kmalloc(nftl->nb_blocks * sizeof(u16), GFP_KERNEL);
-		if (!nftl->EUNtable) {
-			printk(KERN_NOTICE "NFTL: allocation of EUNtable failed\n");
+		if (!nftl->EUNtable)
 			return -ENOMEM;
-		}
 
 		nftl->ReplUnitTable = kmalloc(nftl->nb_blocks * sizeof(u16), GFP_KERNEL);
 		if (!nftl->ReplUnitTable) {
 			kfree(nftl->EUNtable);
-			printk(KERN_NOTICE "NFTL: allocation of ReplUnitTable failed\n");
 			return -ENOMEM;
 		}
 
-- 
2.15.1
