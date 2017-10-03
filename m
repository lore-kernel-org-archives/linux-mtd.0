From: Vignesh R <vigneshr@ti.com>
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/6] K2G: Add QSPI support
Date: Tue, 3 Oct 2017 10:49:19 +0530
Message-ID: <20171003051925.8821-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



This series adds support for Cadence QSPI IP present in TI's 66AK2G SoC.
The patches enhance the existing cadence-quadspi driver to support
loopback clock circuit, pm_runtime support and tweaks for 66AK2G SoC.

Change log:

v4:
* New patch to fix error handling sequence in probe.

v3:
* Fix build warnings reported by kbuild test bot.

Resend:
* Rebase to latest linux-next.
* Collect Acked-bys

v2:
* Drop DT patches. Will be sent as separate series as requested by
 maintainer.
* Split binding docs into separate patches.
* Address comments by Rob Herring.

Vignesh R (6):
  mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
  mtd: spi-nor: cadence-quadspi: add a delay in write sequence
  mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back
    circuit
  mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock
    circuit
  mtd: spi-nor: cadence-quadspi: Fix error path in probe
  mtd: spi-nor: cadence-quadspi: Add runtime PM support

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  7 ++-
 drivers/mtd/spi-nor/cadence-quadspi.c              | 55 +++++++++++++++++++---
 2 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.14.1
