Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XldXm-0003Zd-LA
 for linux-mtd@lists.infradead.org; Tue, 04 Nov 2014 12:49:07 +0000
Received: by mail-pa0-f53.google.com with SMTP id kx10so14196966pab.26
 for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2014 04:48:44 -0800 (PST)
From: Zhou Wang <wangzhou.bry@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND controller
 of hisilicon hip04 Soc
Date: Tue,  4 Nov 2014 20:46:59 +0800
Message-Id: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
Cc: mark.rutland@arm.com, Zhou Wang <wangzhou.bry@gmail.com>,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 linux-kernel@vger.kernel.org, haojian.zhuang@gmail.com,
 wangzhou1@hisilicon.com, robh+dt@kernel.org, xuwei5@hisilicon.com,
 galak@codeaurora.org, caizhiyong@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset adds the support for NAND controller of hisilicon hip04 Soc.
The NAND controller IP was developed by hisilicon and needs a new driver to
support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
controller works fine in Hip04 D01 board.

Changes in v4:
- add mtd->dev.parent = &pdev->dev, thanks Frans Klaver.  
Changes in v3:
- Modify code to eliminate some code style warnings.
- add ecc-bits input check.
- avoid using waterfall style in hisi_nfc_cmdfunc().
Changes in v2:
- Remove the patch for device tree, now patchset only has the driver and its
  device tree binding documentation.
- Change the file name: hisi_nand.c to hisi504_nand.c.
Changes in v1:
- Remove callback functions out of struct hinfc_host, and call them directly
  in relative functions.
- Change hinfc_read and hinfc_write from macros to inline functions.
- Instead of putting pointers, embed struct nand_chip and struct mtd_info in
  struct hinfc_host directly.
- rewrite some unclear lines in device tree binding document, correct some
  code style error.

Link on v3:
- https://lkml.org/lkml/2014/10/28/386
Link on v2:
- https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg750071.html
Link on v1:
- https://lkml.org/lkml/2014/7/15/198

Zhou Wang (2):
  mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
  mtd: hisilicon: add device tree binding documentation

 .../devicetree/bindings/mtd/hisi504-nand.txt       |   40 +
 drivers/mtd/nand/Kconfig                           |    5 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/hisi504_nand.c                    |  846 ++++++++++++++++++++
 4 files changed, 892 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt
 create mode 100644 drivers/mtd/nand/hisi504_nand.c

-- 
1.7.9.5
