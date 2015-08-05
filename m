From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 0/5] MTD: nandsim: simulate multiple chips
Date: Wed, 5 Aug 2015 08:55:49 +0000
Message-ID: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, folks,

These patchset add a new module parameter, numchips, to supports to
simulate NAND flash with multiple chips.

This simulation helps to test and improve generic NAND driver on
multiple chips NAND flash.

MTD test (except for mtd_nandbiterr) are passed. 

Thanks,
Sheng

Sheng Yong (5):
  MTD: nandsim: add numchips module parameter
  MTD: nandsim: fix column address size of large page
  MTD: nandsim: fix page address size
  MTD: nandsim: add ADJUST_ROW() to find the real page number
  MTD: nandsim: extent outprint messages

 drivers/mtd/nand/nandsim.c | 632 +++++++++++++++++++++++++++------------------
 1 file changed, 377 insertions(+), 255 deletions(-)

-- 
1.8.3.4
