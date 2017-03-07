Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clASe-0003Xa-4T
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 08:27:14 +0000
From: Alban <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Moritz Fischer <moritz.fischer@ettus.com>,
 Alban <albeu@free.fr>
Subject: [PATCH v2 0/2] mtd: Add support for reading MTD devices via the nvmem
 API
Date: Tue,  7 Mar 2017 09:26:02 +0100
Message-Id: <1488875164-30440-1-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

First thanks to everybody for the feedback on the first series, I implemented
most of the suggestions in this new version. The biggest change is to
directly integrate in the MTD core instead of using notifiers which allow us
to simplify the code quiet a bit.

During the discussion 2 points showed up, reworking the NVMEM binding and
improving the MTD notifiers. Both are good points but not relevant for
this series, so I left that out for another time.

The NVMEM device ID bug fix found in the first series has already been
applied so I didn't include it again.

Alban (2):
  doc: bindings: Add bindings documentation for mtd nvmem
  mtd: Add support for reading MTD devices via the nvmem API

 .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++
 drivers/mtd/Kconfig                                |  9 +++
 drivers/mtd/Makefile                               |  1 +
 drivers/mtd/mtdcore.c                              | 13 ++++
 drivers/mtd/mtdnvmem.c                             | 72 ++++++++++++++++++++++
 drivers/mtd/mtdnvmem.h                             | 25 ++++++++
 include/linux/mtd/mtd.h                            |  4 ++
 7 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
 create mode 100644 drivers/mtd/mtdnvmem.c
 create mode 100644 drivers/mtd/mtdnvmem.h

-- 
2.7.4
