Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPeN-0006UH-WC
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:37:41 +0000
Subject: [PATCH 02/18] mtd-cfi_cmdset_0001: Improve another size determination
 in cfi_intelext_partition_fixup()
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <6bc5e888-47e2-270c-10b7-9198513f1ca1@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:37:03 +0100
MIME-Version: 1.0
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 10 Jan 2017 19:09:58 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 68227aa74d22..0d7c2ef533d1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -753,7 +753,7 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
 			kfree(newcfi);
 			return -ENOMEM;
 		}
-		memcpy(newcfi, cfi, sizeof(struct cfi_private));
+		memcpy(newcfi, cfi, sizeof(*cfi));
 		newcfi->numchips = numvirtchips;
 		newcfi->chipshift = partshift;
 
-- 
2.11.0
