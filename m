Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBJvn-0001Tv-H8
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 12:53:57 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] Changes in Marvell NAND controller DT parsing code
Date: Wed, 25 Apr 2018 14:53:28 +0200
Message-Id: <20180425125331.8234-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

At first I just wanted to send a fix to avoid timeouts at boot time when
using old bindings (harmless):

[    1.367460] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x00000080)
[    1.474292] marvell-nfc f2720000.nand: Timeout on CMDD (NDSR: 0x00000280)

This is addressed in the first patch and comes from the DT parsing of
the number of Chip Select lines.

While working on it, Boris pointed another issue with the 'num-cs'
property (legacy bindings) in some code that should not exist anyway. I
removed that code in patch 2.

Finally, while writing the second patch, I discovered a better way to handle
the code besides (that handles the CS count for new bindings) by using
of_property_count_elems_of_size(). Patch 3 makes the switch.

Regards,
Miquèl


Miquel Raynal (3):
  mtd: rawnand: marvell: fix the chip-select DT parsing logic
  mtd: rawnand: marvell: fix CS pin count with old bindings
  mtd: rawnand: marvell: use OF helper to read a property element count

 drivers/mtd/nand/raw/marvell_nand.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

-- 
2.14.1
