Received: from mout.web.de ([217.72.192.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPrl-0008Mx-Ii
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:51:31 +0000
Subject: [PATCH 10/18] mtd-cfi_cmdset_0002: One function call less in
 cfi_amdstd_setup() after error detection
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <46aa5810-8f5d-b35e-17a5-137228cb9720@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:45:21 +0100
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
Date: Wed, 11 Jan 2017 18:32:06 +0100

The kfree() function was called in one case by the cfi_amdstd_setup()
function during error handling even if the passed data structure member
contained a null pointer.

Adjust a jump target according to the Linux coding style convention
so that memory will be also released for members of a data structure
before the container "mtd" in the error handling case.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3bed67e35692..25d485f6d2ff 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -692,7 +692,7 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 					  sizeof(*mtd->eraseregions),
 					  GFP_KERNEL);
 	if (!mtd->eraseregions)
-		goto setup_err;
+		goto free_priv;
 
 	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
@@ -721,9 +721,10 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 
  setup_err:
 	kfree(mtd->eraseregions);
-	kfree(mtd);
+free_priv:
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
+	kfree(mtd);
 	return NULL;
 }
 
-- 
2.11.0
