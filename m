From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, han.xu@nxp.com,
 festevam@gmail.com, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH 0/2] mtd: fsl-quadspi: Update slave device hwcap based on mode
 provided in dtsi file
Date: Tue, 30 Jan 2018 23:03:55 +0530
Message-Id: <1517333637-17331-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

This patch-set added support to update hwcap of slave device connected to
FSL QUADSPI controller by reading values from the device tree files.

Mode information is available via "spi-tx-bus-width" and
"spi-rx-bus-width" nodes of device tree for the connected slave device.

Update read and write hwcap capability for slave device by reading
"spi-rx-bus-width" and "spi-tx-bus-width" respectively.

Added usage example by adding support for spi-rx-bus-width
and spi-tx-bus-width binding.

Depends on
 https://patchwork.ozlabs.org/project/linux-mtd/list/?series=26084

Yogesh Gaur (2):
  mtd: fsl-quadspi: Update slave device hwcap based on mode provided in
    dtsi file
  dt-bindings: fsl-quadspi: spi-rx/tx-bus-width usage example

 .../devicetree/bindings/mtd/fsl-quadspi.txt        | 30 ++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 56 ++++++++++++++++++++--
 2 files changed, 81 insertions(+), 5 deletions(-)

-- 
1.9.1
