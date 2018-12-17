Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYv92-0003h4-2M
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 15:49:25 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Schrempf
 Frieder" <frieder.schrempf@kontron.de>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: [PATCH 2/3] mtd: rawnand: ESMT: Also use the last page for bad block
 markers
Date: Mon, 17 Dec 2018 15:49:11 +0000
Message-ID: <1545061693-29216-3-git-send-email-frieder.schrempf@kontron.de>
References: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
In-Reply-To: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

It is known that some ESMT SLC NANDs have been shipped
with the factory bad block markers in the first or last page
of the block, instead of the first or second page. To be on
the safe side, let's check all three locations.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/nand_esmt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_e=
smt.c
index 96f039a..275bc8e 100644
--- a/drivers/mtd/nand/raw/nand_esmt.c
+++ b/drivers/mtd/nand/raw/nand_esmt.c
@@ -36,7 +36,14 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
 static int esmt_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->bbt_options |=3D NAND_BBT_SCAN2NDPAGE;
+		/*
+		 * It is known that some ESMT SLC NANDs have been shipped
+		 * with the factory bad block markers in the first or last page
+		 * of the block, instead of the first or second page. To be on
+		 * the safe side, let's check all three locations.
+		 */
+		chip->bbt_options |=3D NAND_BBT_SCAN2NDPAGE |
+				     NAND_BBT_SCANLASTPAGE;
=20
 	return 0;
 }
--=20
2.7.4
