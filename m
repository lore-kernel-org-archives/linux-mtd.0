From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v5 0/3] mtd: nand: gpmi: add proper raw access support
Date: Wed, 26 Nov 2014 17:53:10 +0100
Message-Id: <1417020793-3354-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mike Voytovich <mvoytovich@paypal.com>, linux-kernel@vger.kernel.org,
 Roy Lee <roylee@paypal.com>, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series provides an implementation for raw accesses taking care of
hidding the specific layout used by the GPMI controller.

Best Regards,

Boris

Changes since v4:
 - fixed a few corner cases in gpmi_move_bits (tested it with:
   https://github.com/bbrezillon/gpmi-move-bits-test/blob/master/gpmi-move-bits-test.c)
 - add documentation and comments for the new gpmi functions

Changes since v3:
 - add comments to the gpmi_move_bits function
 - extend raw read/write documentation
 - move last part of the raw_page_read function into a conditional block

Changes since v2:
 - fixed a bug in gpmi_move_bits
 - add a raw_buffer field to be used when using raw access methods
   (experienced memory corruptions when directly using page_buffer_virt
   buffer)
 - add raw OOB access functions


Boris Brezillon (3):
  mtd: nand: gpmi: add gpmi_move_bits function
  mtd: nand: gpmi: add proper raw access support
  mtd: nand: gpmi: add raw oob access functions

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 151 +++++++++++++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 201 +++++++++++++++++++++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |   6 +
 3 files changed, 358 insertions(+)

-- 
1.9.1
