Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmPLg-0008Gn-Li
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 15:51:49 +0000
From: Ionela Voinescu <ionela.voinescu@imgtec.com>
To: <computersforpeace@gmail.com>, <gregkh@linuxfoundation.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
Date: Thu, 6 Nov 2014 15:51:17 +0000
Message-ID: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ionela Voinescu <ionela.voinescu@imgtec.com>, abrestic@chromium.org,
 dehrenberg@chromium.org, ezequiel.garcia@imgtec.com, sourav.poddar@ti.com,
 james.hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

These patches add support for GigaDevice 4Gb SPI NAND flash.
This is an initial version, adding it to staging, as there is no existing 
framework for SPI NAND as there is for SPI NOR in MTD.

Therefore, I want to start an early discussion about this in order to find 
the best way to integrate it. I am at the beginning regarding both upstreaming 
and understanding all of the MTD layer, so your comments and ideas are 
welcomed.

I've structured this driver similar to the existing Micron SPI NAND 
(mt29f_spinand), in order to make it easier to understand the common code.
I know there is an atempt to add support for a generic SPI NAND based 
framework from Sourav Poddar but that never got merged, and it would be 
a valid option to consider.

http://lists.infradead.org/pipermail/linux-mtd/2013-July/047373.html

This initial version does not implement all the functionality and I will 
add to it once we decide on a structure. This is based on linux-next. 

Thank you and I welcome all comments,
Ionela. 

Ionela Voinescu (2):
  staging: mtd: GigaDevice 4Gb SPI NAND driver
  Documentation: staging: mtd: Binding document for GigaDevice SPI NAND

 .../bindings/staging/mtd/gd5f_spinand.txt          |   13 +
 drivers/staging/Kconfig                            |    2 +
 drivers/staging/Makefile                           |    1 +
 drivers/staging/gd5f_spinand/Kconfig               |   15 +
 drivers/staging/gd5f_spinand/Makefile              |    1 +
 drivers/staging/gd5f_spinand/gd5f_spinand.c        | 1056 ++++++++++++++++++++
 drivers/staging/gd5f_spinand/gd5f_spinand.h        |  182 ++++
 7 files changed, 1270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/mtd/gd5f_spinand.txt
 create mode 100644 drivers/staging/gd5f_spinand/Kconfig
 create mode 100644 drivers/staging/gd5f_spinand/Makefile
 create mode 100644 drivers/staging/gd5f_spinand/gd5f_spinand.c
 create mode 100644 drivers/staging/gd5f_spinand/gd5f_spinand.h

-- 
1.7.9.5
