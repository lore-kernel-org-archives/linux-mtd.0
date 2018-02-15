From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, oss@buserror.net,
 leoyang.li@nxp.com, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 0/4][v4] dt-bindings: mtd-physmap: Add endianness supports
Date: Thu, 15 Feb 2018 17:18:03 +0530
Message-Id: <20180215114803.23570-1-prabhakar.kushwaha@nxp.com>
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

Connection between flash and controller is not necessary to be always
of same type. It may varies from platform to platform.

Adding endianness (optional) property to provide connection type
information. This endianness property is checked in physmap_of_core.c
to decide swap type. 

This patch also set "big-endian" property for ls1021a, ls1043a
and ls1046a device tree. here connection between IFC controller
and NOR flash is big-endian.

Prabhakar Kushwaha (4):
  dt-bindings: mtd-physmap: Add endianness supports
  driver: mtd: update struct map_info's swap as per map requirement
  ARM: dts: Add NOR connection type with IFC
  ARM64: dts: Add NOR connection type with IFC

 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
 arch/arm/boot/dts/ls1021a-qds.dts                     | 1 +
 arch/arm/boot/dts/ls1021a-twr.dts                     | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts     | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts     | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts     | 1 +
 drivers/mtd/maps/physmap_of_core.c                    | 8 ++++++++
 7 files changed, 18 insertions(+)

-- 
2.14.1
