Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKPoF-0001XJ-Ts
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 10:09:20 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 0/4] mtd: nand: omap: optimize chip->ecc.hwctl() for H/W
 ECC schemes
Date: Mon, 3 Mar 2014 15:38:29 +0530
Message-ID: <1393841313-28214-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v4 -> v5*
This patch series is split version from earlier series [1].
This series refactors and cleans omap_enable_hwecc_bch() which configures
GPMC for BCHx ECC schemes, as part of nand_chip->ecc.hwctl()

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-November/050243.html


Pekon Gupta (4):
  mtd: nand: omap: ecc.hwctl: rename omap3_enable_hwecc_bch to
    omap_enable_hwecc_bch
  mtd: nand: omap: ecc.hwctl: refactor omap_enable_hwecc_bch for ECC
    related GPMC configs
  mtd: nand: omap: ecc.hwctl: clean omap_enable_hwecc_bch for redundant
    ECC configs
  mtd: nand: omap: remove is_elm_present flag

 drivers/mtd/nand/omap2.c | 109 ++++++++++++++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 45 deletions(-)

-- 
1.8.5.1.163.gd7aced9
