From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 0/4] mtd: mxc_nand: fix 8 bit ECC and large oob
Date: Sun, 26 Apr 2015 11:16:47 +0300
Message-Id: <cover.1430034929.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series fixes mxc_nand bugs that I encountered while trying to use 8
bit ECC mode on i.MX25 with the Micron MT29F8G08ABABA flash chip.

Many thanks to Uwe Kleine-König for guiding me through the process of
debugging and fixing, and for contributing a clean-up patch to this series.

This series applies and tested on current Linus tree as of d19d133e432248.

Baruch Siach (3):
  mtd: mxc_nand: limit the size of used oob
  mtd: mxc_nand: fix truncate of unaligned oob copying
  mtd: mxc_nand: generate nand_ecclayout for 8 bit ECC

Uwe Kleine-König (1):
  mtd: nand: mxc_nand: cleanup copy_spare function

 drivers/mtd/nand/mxc_nand.c | 74 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 16 deletions(-)

-- 
2.1.4
