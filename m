Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDkjw-0004C1-4u
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 04:51:14 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: check ecc->total sanity in nand_scan_tail
Date: Thu, 25 May 2017 13:50:20 +0900
Message-Id: <1495687820-30692-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drivers are supposed to set correct ecc->{size,strength,bytes} before
calling nand_scan_tail(), but it does not complain about ecc->total
bigger than oobsize.

In this case, chip->scan_bbt() crashes due to memory corruption, but
it is hard to debug.  It would be kind to fail it earlier with a clear
message.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I was actually hit by this case.

I wasted half a day until I figured out my coding mistake in my
Denali driver.  It will be helpful to check this in NAND core.


 drivers/mtd/nand/nand_base.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f4d686192717..14d6a5aa3ee8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4970,6 +4970,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 		goto err_free;
 	}
 	ecc->total = ecc->steps * ecc->bytes;
+	if (ecc->total > mtd->oobsize) {
+		WARN(1, "Total number of ECC bytes exceeded oobsize\n");
+		ret = -EINVAL;
+		goto err_free;
+	}
 
 	/*
 	 * The number of bytes available for a client to place data into
-- 
2.7.4
