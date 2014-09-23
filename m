From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>
Subject: [PATCH v3 0/3] mtd: nand: gpmi: add proper raw access support
Date: Tue, 23 Sep 2014 16:07:33 +0200
Message-Id: <1411481256-29141-1-git-send-email-boris.brezillon@free-electrons.com>
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
This series has been tested on an imx28 board.

Any suggestions are welcome.

Best Regards,

Boris

Changes since v2:
 - fixed a bug in gpmi_move_bits
 - add a raw_buffer field to be used when using raw access methods
   (experienced memory corruptions when directly using page_buffer_virt
   buffer)
 - add raw OOB access functions

Boris BREZILLON (3):
  mtd: nand: gpmi: add gpmi_move_bits function
  mtd: nand: gpmi: add proper raw access support
  mtd: nand: gpmi: add raw oob access functions

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  88 ++++++++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 144 +++++++++++++++++++++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |   6 ++
 3 files changed, 238 insertions(+)

-- 
1.9.1
