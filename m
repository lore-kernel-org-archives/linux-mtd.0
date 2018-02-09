Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ek5SS-0006Ty-Km
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 09:59:06 +0000
Date: Fri, 9 Feb 2018 10:58:52 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: warn if hamming layout is used with too
 large ECC
Message-ID: <20180209105852.21c5a400@bbrezillon>
In-Reply-To: <7ec8aa6337c59550f335957a34658a65@agner.ch>
References: <20180208233305.20583-1-stefan@agner.ch>
 <20180209095027.63da257d@bbrezillon>
 <7ec8aa6337c59550f335957a34658a65@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 09 Feb 2018 10:20:37 +0100
Stefan Agner <stefan@agner.ch> wrote:

> 
> But some kind of sanity check somewhere might be worthwhile, I was a bit
> surprised that this overflowing happens on a driver in operational use
> and goes unnoticed. I realize that this patch is not ideal. Maybe making
> length signed, then we could sanity check in
> mtd_ooblayout_count_bytes...

Something like that should help us detect this unexpected case:

--->8---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 66b67014508f..ada2e709743f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -201,6 +201,9 @@ static int nand_ooblayout_free_lp_hamming(struct
mtd_info *mtd, int section, oobregion->offset = 2;
                oobregion->length = ecc_offset - 2;
        } else {
+               if (ecc_offset + ecc->total > mtd->oobsize)
+                       return -EINVAL;
+
                oobregion->offset = ecc_offset + ecc->total;
                oobregion->length = mtd->oobsize - oobregion->offset;
        }
