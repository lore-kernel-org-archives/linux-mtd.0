Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKi9h-00049v-M0
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 11:07:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH 0/7] mtd: spi-nor: fixes found when debugging smpt
Date: Thu, 8 Nov 2018 11:07:05 +0000
Message-ID: <20181108110653.21063-1-tudor.ambarus@microchip.com>
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

Bunch of fixes that we found while debugging the roll back to
SPINOR_OP_READ_1_1_4_4B in case smpt parser fails.

Boris, Yogesh,

Now I'm looking for a fix in case the smpt detection commands
define variable address length and dummy bytes. Will follow.

Tudor Ambarus (7):
  mtd: spi-nor: don't drop sfdp data if optional parsers fail
  mtd: spi-nor: fix iteration over smpt array
  mtd: spi-nor: add restriction for nmaps in smpt parser
  mtd: spi-nor: don't overwrite errno in spi_nor_get_map_in_use()
  mtd: spi_nor: pass DMA-able buffer to spi_nor_read_raw()
  mtd: spi-nor: ensure memory used for nor->read() is DMA safe
  mtd: spi-nor: remove unneeded smpt zeroization

 drivers/mtd/spi-nor/spi-nor.c | 98 ++++++++++++++++++++++++++++++++-------=
----
 1 file changed, 74 insertions(+), 24 deletions(-)

--=20
2.9.4
