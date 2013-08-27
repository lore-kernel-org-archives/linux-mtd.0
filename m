Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEFgI-0006EK-TJ
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2013 09:35:23 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
Date: Tue, 27 Aug 2013 17:29:03 +0800
Message-ID: <1377595747-21033-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current gpmi-nand driver only supports one chips. But we may meet
some embarrassing situation, such as Micron MT29F32G08QAA.
This nand chip has two DIEs internally. Each die has its own chip select pin,
so this chip acts as two nand chips.

If we only scan one chip, we may find that we only get 2G for this chip,
but in actually, this chip's size is 4G.

So scan two chips by default.

In order to support two nand chips, we have to do the following:
   1.) Decouple the chip select from the DMA channel,
       We can use the dma 0 to access all the nand chips.

   2.) fix the wrong method of checking the ready/busy status.
      In the imx6, all the ready/busy pins are binding together, we
      should check ready/busy status of chip 0 for the all the chips. 

Tested this patch set with MT29F32G08QAA.

To Brian:
	My "better" solution was proved to be a bad idea. So i resend this
	patch set again.

v1 --> v2:
	[0] rebase on the latest l2-mtd tree.

Huang Shijie (4):
  mtd: gpmi: decouple the chip select from the DMA channel
  mtd: gpmi: use DMA channel 0 for all the nand chips
  mtd: gpmi: scan two nand chips
  mtd: gpmi: imx6: fix the wrong method for checking ready/busy

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   13 +++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    7 +++----
 drivers/mtd/nand/gpmi-nand/gpmi-regs.h |    3 +++
 3 files changed, 19 insertions(+), 4 deletions(-)
