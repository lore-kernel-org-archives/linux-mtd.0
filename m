Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmRJ9-0005FR-Tp
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 21:10:57 +0000
Received: by mail-lf0-x236.google.com with SMTP id k186so6611635lfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2017 14:10:34 -0700 (PDT)
From: Marcin Wojtas <mw@semihalf.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com, broonie@kernel.org,
 thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com,
 nadavh@marvell.com, neta@marvell.com, omrii@marvell.com,
 hannah@marvell.com, mw@semihalf.com, jaz@semihalf.com, tn@semihalf.com
Subject: [PATCH 0/2] SPI NOR - force 3byte addressing mode
Date: Mon, 28 Aug 2017 23:14:12 +0200
Message-Id: <1503954854-30963-1-git-send-email-mw@semihalf.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This very short patchset introduces optional forcing via DT
3byte addressing mode for accessing the SPI flash, whose
size exceeds 16MiB.

It can be used in case the device does not support
SPI_NOR_4B_OPCODES and helps overcome an issue, when
the Boot ROM cannot handle non-default settings
that could be enabled in the kernel and remain after soft reset.

I'm looking forward to any comments or remarks.

Best regards,
Marcin

Marcin Wojtas (2):
  mtd: spi-nor: add an option to force 3byte adressing mode
  arm64: dts: marvell: Force 3byte addressing mode for SPI on A7040 DB

 Documentation/devicetree/bindings/spi/spi-bus.txt |  2 ++
 arch/arm64/boot/dts/marvell/armada-7040-db.dts    |  1 +
 drivers/mtd/spi-nor/spi-nor.c                     | 12 +++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

-- 
1.8.3.1
