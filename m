Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZchOo-0003n8-6T
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 22:11:27 +0000
Received: by wicge5 with SMTP id ge5so9186147wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2015 15:11:04 -0700 (PDT)
Sender: Luis de Bethencourt <bethencourt@gmail.com>
Date: Fri, 18 Sep 2015 00:11:02 +0200
From: Luis de Bethencourt <luis@debethencourt.com>
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/5] mtd: Fix module autoload for OF platform drivers
Message-ID: <20150917221102.GA9119@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

These patches add the missing MODULE_DEVICE_TABLE() for OF to export
the information so modules have the correct aliases built-in and
autoloading works correctly.

A longer explanation by Javier Canillas can be found here:
https://lkml.org/lkml/2015/7/30/519

Thanks,
Luis

Luis de Bethencourt (5):
  mtd: fsl_elbc_nand: Fix module autoload for OF platform driver
  mtd: fsl_ifc_nand: Fix module autoload for OF platform driver
  mtd: mpc5121_nfc: Fix module autoload for OF platform driver
  mtd: mxc_nand: Fix module autoload for OF platform driver
  mtd: orion_nand: Fix module autoload for OF platform driver

 drivers/mtd/nand/fsl_elbc_nand.c | 1 +
 drivers/mtd/nand/fsl_ifc_nand.c  | 1 +
 drivers/mtd/nand/mpc5121_nfc.c   | 1 +
 drivers/mtd/nand/mxc_nand.c      | 1 +
 drivers/mtd/nand/orion_nand.c    | 1 +
 5 files changed, 5 insertions(+)

-- 
2.4.6
