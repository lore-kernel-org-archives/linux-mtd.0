Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d4OLW-0002Eh-Fb
 for linux-mtd@lists.infradead.org; Sat, 29 Apr 2017 09:07:21 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Kumar Gala <galak@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 0/5] mtd: nand: add support for on-die ECC
Date: Sat, 29 Apr 2017 11:06:41 +0200
Message-Id: <1493456806-18898-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series adds support for on-die ECC, i.e ECC performed by
the NAND chip itself, as opposed to having the ECC calculated by the
NAND controller or in software.

It is useful in situations where the NAND chip has an ECC requirement
that is not met by the ECC capabilities of the NAND controller.

Patch 1 adjusts the NAND generic DT binding to add "on-die" as an
nand-ecc-mode.

Patch 2 adds the core support for on-die ECC, which is really simple
and minimal: all the work is really done in the vendor-specific NAND
code.

Patch 3 and 4 adds the on-die ECC implementation for Micron NANDs.

Patch 5 allows the FSMC NAND driver to use on-die ECC.

This series was tested on a SPEAr600 platform, with a Micron
MT29F1G08ABADAWP NAND. The mtd_nandbiterrs.ko test is passing
successfully, which shows that the on-die ECC is correcting bitflips
as expected.

This series is based on the current nand-next branch, as it depends on
the rework from Boris of the vendor-specific NAND code.

Many thanks to Boris from providing lots of useful feedback and
discussion during the development of this patch series.

Changes since v1:

 - Rebased on the latest nand/next branch.

 - Reworked the mechanism to detect if the Micron NAND suppors on-die
   ECC. We realized that the READ_ID command only indicates if on-die
   ECC is currently enabled or not, not whether it is supported by the
   NAND. After discussion with Bean Huo from Micron we came up with a
   logic to determine if the NAND has on-die ECC support, which PATCH
   4/5 implements.

   Note that we intentionally only support cases that we could
   test. Therefore, we error out if the NAND has an on-die ECC that
   cannot be disabled, and we error out if the NAND uses a 8 bits per
   512 bytes on-die ECC, since it requires a slightly different
   handling than the 4 bits per 512 bytes on-die ECC our NAND is
   using.

 - Added Acked-by from Rob Herring on PATCH 1/5 (DT binding)

 - Added Acked-by from Richard Weinberger on all patches, except PATCH
   4/5 since it was significantly changed.

Best regards,

Thomas


Thomas Petazzoni (5):
  dt-bindings: mtd: document new "on-die" nand-ecc-mode
  mtd: nand: add core support for on-die ECC
  mtd: nand: export nand_{read,write}_page_raw()
  mtd: nand: add support for Micron on-die ECC
  mtd: nand: fsmc_nand: handle on-die ECC case

 Documentation/devicetree/bindings/mtd/nand.txt |   2 +-
 drivers/mtd/nand/fsmc_nand.c                   |   3 +
 drivers/mtd/nand/nand_base.c                   |  23 ++-
 drivers/mtd/nand/nand_micron.c                 | 215 +++++++++++++++++++++++++
 include/linux/mtd/nand.h                       |  11 ++
 5 files changed, 249 insertions(+), 5 deletions(-)

-- 
2.7.4
