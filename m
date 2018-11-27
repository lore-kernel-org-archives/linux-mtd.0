Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRY3U-0005oW-9A
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 07:45:14 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
CC: Schrempf Frieder <frieder.schrempf@kontron.de>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Date: Tue, 27 Nov 2018 07:44:52 +0000
Message-ID: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the size of the buffer allocated to store the in-memory BBT.
This bug was previously hidden by a different bug, that was fixed in
d098093ba06e.

Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND =
devices")
Cc: <stable@vger.kernel.org>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/bbt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index 56cde38..c12497f 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -27,7 +27,8 @@ int nanddev_bbt_init(struct nand_device *nand)
 	unsigned int nwords =3D DIV_ROUND_UP(nblocks * bits_per_block,
 					   BITS_PER_LONG);
=20
-	nand->bbt.cache =3D kzalloc(nwords, GFP_KERNEL);
+	nand->bbt.cache =3D kzalloc(nwords * (BITS_PER_LONG / BITS_PER_BYTE),
+				  GFP_KERNEL);
 	if (!nand->bbt.cache)
 		return -ENOMEM;
=20
--=20
2.7.4
