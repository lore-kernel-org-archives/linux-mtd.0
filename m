Received: from mail-db8lp0189.outbound.messaging.microsoft.com
 ([213.199.154.189] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vgqj5-0007fe-Bk
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:48:27 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 0/8] the clean-up for gpmi
Date: Thu, 14 Nov 2013 14:25:43 +0800
Message-ID: <1384410351-2169-1-git-send-email-b32955@freescale.com>
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

This patch set does some clean-up to the gpmi driver.

Huang Shijie (8):
  mtd: gpmi: do not use the local array to do the DMA transfer
  mtd: gpmi: delete the gpmi_pre_bbt_scan
  mtd: gpmi: remove the unused line
  mtd: gpmi: rename the functions from gpmi_nfc_* to gpmi_nand_*
  mtd: gpmi: use devm_ioremap_resource
  mtd: gpmi: use devm_request_irq
  mtd: gpmi: change pr_err to dev_err
  mtd: gpmi: change pr_debug to dev_dbg

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   76 +++++++++++-------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  140 ++++++++++---------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    2 -
 3 files changed, 92 insertions(+), 126 deletions(-)

-- 
1.7.2.rc3
