From: Huang Shijie <shijie8@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 0/4] mtd: kill the NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE
Date: Sat, 21 Dec 2013 00:02:26 +0800
Message-Id: <1387555350-989-1-git-send-email-shijie8@gmail.com>
Cc: s.hauer@pengutronix.de, akinobu.mita@gmail.com, josh@joshtriplett.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[1] Why kill them?
    As time goes on, the NAND's page size and oob size become larger and larger.
    So we have changes these two macros frequently in order to support the new
    NAND.

[2] How does this patch set do?
    There are three drivers which uses these two macros, the mxc-nand, denali,
    and the cafe-nand.

    This patch will allocate a temporary buffer for the nand_scan_ident, and 
    after it have getten the right page size and oob size, it will re-allocate
    the buffer again.

[3] I do not have the boards which have the relative NAND controller.

    I hope someone can test this patch set.

    thanks.


Huang Shijie (4):
  mtd: mxc-nand: kill the NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE
  mtd: denali: kill the NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE
  mtd: nand: kill the the NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE for
    nand_buffers{}
  mtd: nand: remove the NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE

 drivers/mtd/nand/cafe_nand.c | 49 +++++++++++++++++++++++++++++++-----------
 drivers/mtd/nand/denali.c    | 51 ++++++++++++++++++++++++++------------------
 drivers/mtd/nand/denali.h    |  4 +---
 drivers/mtd/nand/mxc_nand.c  | 18 +++++++++++++---
 drivers/mtd/nand/nand_base.c | 19 +++++++++++++----
 include/linux/mtd/nand.h     | 20 ++++++-----------
 6 files changed, 103 insertions(+), 58 deletions(-)

-- 
1.8.3.1
