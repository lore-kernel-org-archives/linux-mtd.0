Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmRJC-0005Fk-Bt
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 21:11:00 +0000
Received: by mail-lf0-x232.google.com with SMTP id k186so6612007lfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2017 14:10:38 -0700 (PDT)
From: Marcin Wojtas <mw@semihalf.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com, broonie@kernel.org,
 thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com,
 nadavh@marvell.com, neta@marvell.com, omrii@marvell.com,
 hannah@marvell.com, mw@semihalf.com, jaz@semihalf.com, tn@semihalf.com
Subject: [PATCH 2/2] arm64: dts: marvell: Force 3byte addressing mode for SPI
 on A7040 DB
Date: Mon, 28 Aug 2017 23:14:14 +0200
Message-Id: <1503954854-30963-3-git-send-email-mw@semihalf.com>
In-Reply-To: <1503954854-30963-1-git-send-email-mw@semihalf.com>
References: <1503954854-30963-1-git-send-email-mw@semihalf.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Armada 7040 DB boards can be shipped with various models of
boot SPI flash devices. An issue can emerge, when their size
exceeds 16MB - in such case the kernel driver will switch automatically
to 4B addressing mode. Later, in case of soft reset, the Boot ROM
will fail to fetch the firmware during the board initialization.

In order to prevent such behavior, this patch forces 3B addressing
mode used on affected boards by adding newly introduced
'spi-3byte-addressing' property to the SPI flash nodes.

Signed-off-by: Marcin Wojtas <mw@semihalf.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 92c761c..d0bd296 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -116,6 +116,7 @@
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-max-frequency = <20000000>;
+		spi-3byte-addressing;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
1.8.3.1
