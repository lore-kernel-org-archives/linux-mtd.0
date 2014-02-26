Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIbel-0001An-On
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 10:24:04 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 0/4] mtd: nand: omap: optimize chip->ecc.calculate() for
 H/W ECC schemes
Date: Wed, 26 Feb 2014 15:53:10 +0530
Message-ID: <1393410194-15094-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes v6->v7
rebased on http://lists.infradead.org/pipermail/linux-mtd/2014-February/052092.html

This patch series is split version of earlier patch:
http://lists.infradead.org/pipermail/linux-mtd/2013-November/050240.html

chip->ecc.calculate() is used for calculating and fetching of ECC syndrome by
processing the data passed during Read/Write accesses.
Though all H/W ECC schemes in OMAP NAND use GPMC controller for ECC calculation
But each of them implements its own callback to process and fetch ECC syndrome.

This patch tries to merge common code for different BCHx_ECC schemes into single
omap_calculate_ecc_bch(). This imporves scalability for future ecc-schemes.
Following is the summary of this patch series.
 +----------------------+---------------------------+--------------------------+
 | ecc-scheme           | nand_chip->ecc.calculate  | nand_chip->ecc.calculate |
 |                      | (before this patch series)| (after this patch series)|
 +----------------------+---------------------------+--------------------------+
 | HAM1_ECC             | omap_calculate_ecc()      | omap_calculate_ecc()     |
 | BCH4_HW_DETECTION_SW | omap3_calculate_ecc_bch4()| omap_calculate_ecc_bch() |
 | BCH4_HW              | omap3_calculate_ecc_bch() | omap_calculate_ecc_bch() |
 | BCH8_HW_DETECTION_SW | omap3_calculate_ecc_bch8()| omap_calculate_ecc_bch() |
 | BCH8_HW              | omap3_calculate_ecc_bch() | omap_calculate_ecc_bch() |
 +----------------------+---------------------------+--------------------------+


Pekon Gupta (4):
  mtd: nand: omap: ecc.calculate: rename omap3_calculate_ecc_bch to
    omap_calculate_ecc_bch
  mtd: nand: omap: ecc.calculate: refactor omap_calculate_ecc_bch for
    BCHx_HW ecc-scheme
  mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4 in
    omap_calculate_ecc_bch
  mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch8 in
    omap_calculate_ecc_bch

 drivers/mtd/nand/omap2.c | 186 +++++++++++++++--------------------------------
 1 file changed, 59 insertions(+), 127 deletions(-)

-- 
1.8.5.1.163.gd7aced9
