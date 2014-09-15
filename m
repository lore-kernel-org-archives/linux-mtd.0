From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>
Subject: [PATCH v2 0/2] mtd: nand: gpmi: add proper raw access support
Date: Mon, 15 Sep 2014 22:24:01 +0200
Message-Id: <1410812643-14041-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mike Voytovich <mvoytovich@paypal.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roy Lee <roylee@paypal.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang, Brian,

This is just a new proposal to support raw accesses in a more standard way
in the GPMI driver.
This series was not tested (just compile tested), and I won't be able to
test it until next week. Thus I don't expect to get it accepted, but
rather to serve as a starting point for our future discussions.

Any suggestions are welcome.

Best Regards,

Boris

Boris BREZILLON (2):
  mtd: nand: gpmi: add gpmi_move_bits function
  mtd: nand: gpmi: add proper raw access support

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  86 ++++++++++++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 118 ++++++++++++++++++++++++++++++++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |   4 ++
 3 files changed, 207 insertions(+), 1 deletion(-)

-- 
1.9.1
