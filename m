Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFyQY-0003GZ-9B
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 03:01:59 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v5 0/3] mtd: use the full-id as the keyword for some nand chips
Date: Thu, 14 Mar 2013 10:59:22 +0800
Message-ID: <1363229965-13128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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

v4 --> v4:
	[1] remove the id_len field.
	[2] based on Artem "mtd: nand: use more reasonable integer types"
	[3] add more comments.

v3 --> v4:
	[1] rewrite the code based on the latest l2-mtd.
	[2] add the full-id nand in the nand_flash_lds.

v2 --> v3:
	[1] remove the duplicated header.
	[2] remove the field "ecc_len" in nand_flash_dev{}.
	[3] fix some coding style warnings.
	[4] add more comments

Huang Shijie (3):
  mtd: add a new field for nand_flash_dev{}
  mtd: add the support to parse out the full-id nand type
  mtd: add 4 Toshiba nand chips for the full-id case

 drivers/mtd/nand/nand_base.c |   36 +++++++++++++++++++++++++++++++++---
 drivers/mtd/nand/nand_ids.c  |   22 ++++++++++++++++++++++
 include/linux/mtd/nand.h     |    2 ++
 3 files changed, 57 insertions(+), 3 deletions(-)
