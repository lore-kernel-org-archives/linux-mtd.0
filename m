Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyYqn-0005bJ-IR
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 08:12:04 +0000
Date: Wed, 21 Mar 2018 11:10:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: nand: fix return value in nand_erase_nand()
Message-ID: <20180321081014.GC9826@mwanda>
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

The problem is that "ret" isn't initialized on the success path.

Fixes: cc4ac09da649 ("mtd: Stop updating erase_info->state and calling mtd_erase_callback()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 13dd67106859..87b72bf626ae 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4653,6 +4653,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		}
 	}
 
+	ret = 0;
 erase_exit:
 
 	/* Deselect and wake up anyone waiting on the device */
