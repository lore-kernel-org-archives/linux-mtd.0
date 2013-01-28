Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tzhgb-0001my-Tz
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 05:55:19 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V3 0/3] mtd: use the full-id as the keyword
Date: Mon, 28 Jan 2013 12:57:16 +0800
Message-ID: <1359349039-11510-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <b32955@freescale.com>

I ever submitted a patch to use the full-id as the keyword for
some unparsable nand chips. This is the second tries.

As time goes on, we begin to meet the situation that we can not
get enough information from some nand chips's id data.
Take some Toshiba's nand chips for example.
I have 4 Toshiba's nand chips in my hand:
	TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2

When we read these chips' datasheets, we will get the geometry of these chips:
	TC58NVG2S0F : 4096 + 224
	TC58NVG3S0F : 4096 + 232
	TC58NVG5D2  : 8192 + 640
	TC58NVG6D2  : 8192 + 640

But we can not parse out the correct oob size for these chips from the id data.
So it is time to add some new fields to the nand_flash_dev{},
and update the detection mechanisms.

v2 --> v3:
	[1] remove the duplicated header.
	[2] remove the field "ecc_len" in nand_flash_dev{}.
	[3] fix some coding style warnings.
	[4] add more comments

Huang Shijie (3):
  mtd: add new fields to nand_flash_dev{}
  mtd: add a new table for the unparsable nand chips
  mtd: add the new detection method for the unparsable nand chips

 drivers/mtd/devices/doc2000.c     |    2 +-
 drivers/mtd/devices/doc2001.c     |    2 +-
 drivers/mtd/devices/doc2001plus.c |    2 +-
 drivers/mtd/nand/nand_base.c      |   35 ++++++-
 drivers/mtd/nand/nand_ids.c       |  217 +++++++++++++++++++++----------------
 drivers/mtd/nand/nandsim.c        |    2 +-
 drivers/mtd/nand/pxa3xx_nand.c    |    2 +-
 drivers/mtd/nand/sm_common.c      |   61 +++++------
 include/linux/mtd/nand.h          |    9 ++-
 9 files changed, 201 insertions(+), 131 deletions(-)
