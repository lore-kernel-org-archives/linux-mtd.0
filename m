Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYv8p-0003fx-Iu
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 15:49:13 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Schrempf
 Frieder" <frieder.schrempf@kontron.de>
Subject: [PATCH 0/3] mtd: rawnand: Support bad block markers in first, second
 or last page
Date: Mon, 17 Dec 2018 15:48:56 +0000
Message-ID: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
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

Currently supported bad block marker positions within the block are:
* in first page only
* in last page only
* in first or second page

Some ESMT NANDs are known to have been shipped by the manufacturer
with bad block markers in the first or last page, instead of the
first or second page.

Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
first, second *and* last page needs to be checked.

Therefore we make it possible to set NAND_BBT_SCAN2NDPAGE and
NAND_BBT_SCANLASTPAGE at the same time to scan/set all three pages.

This series also contains patches for AMD/Spansion/Cypress and ESMT
chips to enable both flags at the same time.

Frieder Schrempf (3):
  mtd: rawnand: Support bad block markers in first, second or last page
  mtd: rawnand: ESMT: Also use the last page for bad block markers
  mtd: rawnand: AMD: Also use the last page for bad block markers

 drivers/mtd/nand/raw/internals.h |  1 +
 drivers/mtd/nand/raw/nand_amd.c  |  8 +++-
 drivers/mtd/nand/raw/nand_base.c | 72 ++++++++++++++++++++++++++---------
 drivers/mtd/nand/raw/nand_bbt.c  | 30 +++++++--------
 drivers/mtd/nand/raw/nand_esmt.c |  9 ++++-
 5 files changed, 83 insertions(+), 37 deletions(-)

--=20
2.7.4
