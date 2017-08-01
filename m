Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcVSk-0001us-9l
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 11:35:49 +0000
Received: by mail-pg0-x242.google.com with SMTP id y129so2275680pgy.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 04:35:25 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, narmstrong@baylibre.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Handle clk_prepare_enable/clk_disable_unprepare.
Date: Tue,  1 Aug 2017 17:05:08 +0530
Message-Id: <1501587309-20900-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clk_prepare_enable() can fail here and we must check its return value.
*_probe() can fail here and we must disable clock.

Arvind Yadav (6):
  [PATCH 1/6] mtd: nand: denali: Handle return value of clk_prepare_enable.
  [PATCH 2/6] mtd: oxnas_nand: Handle clk_prepare_enable/clk_disable_unprepare.
  [PATCH 3/6] mtd: nand: lpc32xx_slc: Handle return value of clk_prepare_enable.
  [PATCH 4/6] mtd: nand: vf610_nfc: Handle return value of clk_prepare_enable.
  [PATCH 5/6] mtd: nand: lpc32xx_mlc: Handle return value of clk_prepare_enable.
  [PATCH 6/6] mtd: st_spi_fsm: Handle clk_prepare_enable/clk_disable_unprepare.

 drivers/mtd/devices/st_spi_fsm.c | 20 ++++++++++++--------
 drivers/mtd/nand/denali_dt.c     |  4 +++-
 drivers/mtd/nand/lpc32xx_mlc.c   |  9 +++++++--
 drivers/mtd/nand/lpc32xx_slc.c   |  9 +++++++--
 drivers/mtd/nand/oxnas_nand.c    | 25 ++++++++++++++++++-------
 drivers/mtd/nand/vf610_nfc.c     |  5 ++++-
 6 files changed, 51 insertions(+), 21 deletions(-)

-- 
1.9.1
