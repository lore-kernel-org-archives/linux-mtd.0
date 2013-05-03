Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY9ab-0000ju-FO
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 06:35:30 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 0/4] Export the ecc step size to user applications
Date: Fri, 3 May 2013 14:21:40 +0800
Message-ID: <1367562104-8955-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to implement the NAND boot for some Freescale's chips, such as
imx23/imx28/imx50/imx6, we use a tool (called kobs-ng) to burn the uboot
and some metadata to nand chip. And the ROM code will use the metadata to
configrate the BCH, and to find the uboot.

The ECC information(ecc step size, ecc strength) which is used to configrate
the BCH is part of the metadata. The kobs-ng can gets the ecc strength from
the sys node /sys/*/mtdX/ecc_strength now. But it can't gets the ecc step size.

This patch set is used to export the ecc step size to user applications.
With this patch set, the kobs-ng can gets the ecc step size now.


Huang Shijie (4):
  mtd: add a new field to mtd_info{}
  mtd: add a new sys node to show the ecc step size
  mtd: set the ecc step size for master/slave mtd_info
  mtd: gpmi: update the ecc step size for mtd_info{}

 drivers/mtd/mtdcore.c                  |   11 +++++++++++
 drivers/mtd/mtdpart.c                  |    1 +
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
 drivers/mtd/nand/nand_base.c           |    1 +
 include/linux/mtd/mtd.h                |    3 +++
 5 files changed, 17 insertions(+), 0 deletions(-)
