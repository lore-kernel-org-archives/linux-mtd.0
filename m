Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxshj-00074K-Au
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 10:39:37 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 0/2] mtd: nand: wait for tWHR,
 and fix the setup_data_interface of Denali
Date: Fri, 29 Sep 2017 19:38:38 +0900
Message-Id: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


1/2 : add NAND_WAIT_TWHR and nand_whr_delay().
      You can set this new flag if you want nand_command(_lp)
      to insert tWHR delay where needed.

2/2 : Fix Denali setup_data_interface.
      Boris' suggestion in v1 was a good reminder that
      made me realize tCCS was missing in the driver.  Fix it now.


Changes in v2:
  - Add nand_whr_delay() helper
    Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR flag
  - newly added

Masahiro Yamada (2):
  mtd: nand: wait for tWHR after NAND_CMD_STATUS / NAND_CMD_READID
  mtd: nand: denali: fix setup_data_interface to meet tCCS delay

 drivers/mtd/nand/denali.c    | 10 ++++++++--
 drivers/mtd/nand/nand_base.c | 21 +++++++++++++++++++--
 include/linux/mtd/rawnand.h  | 13 ++++++++-----
 3 files changed, 35 insertions(+), 9 deletions(-)

-- 
2.7.4
