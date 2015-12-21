Received: from laurent.telenet-ops.be ([195.130.137.89])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAxnQ-00019g-QY
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 10:34:35 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/9] ARM: dts: Add compatible property to "partitions" node
Date: Mon, 21 Dec 2015 11:33:44 +0100
Message-Id: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hi,

As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatible
property to "partitions" node"), which is in v4.4-rc6, the "partitions"
subnode of an SPI FLASH device node must have a compatible property. The
partitions are no longer detected if it is not present.

However, several DTSes in -next have already been converted to the
"partitions" subnode without "compatible" property, introduced by
commits 5cfdedb7b9a0fe38 ("mtd: ofpart: move ofpart partitions to a
dedicated dt node") and fe2585e9c29a650a ("doc: dt: mtd: support
partitions in a special 'partitions' subnode"). Hence all of these are
now broken in -next, and will be broken in upstream during the merge
window.

This series fixes all users in next-20151221.
Tested on r8a7791/koelsch.

Changes since v1:
  - Add Acked-by,
  - Fix new users in -next (kirkwood, ci20).

Most of these are in arm-soc/for-next. Exceptions are kirkwood (in
mvebu/for-next), and ci20 (in mips/mips-for-linux-next).

Given we're late in the v4.4-rc cycle, perhaps it's easiest if the
arm-soc maintainers take all applicable patches directly, bypassing the
mvebu and shmobile maintainers?

Thanks for queuing for v4.5!

Geert Uytterhoeven (9):
  ARM: mvebu: ix4-300d: Add compatible property to "partitions" node
  ARM: mvebu: kirkwood: Add compatible property to "partitions" node
  ARM: shmobile: bockw dts: Add compatible property to "partitions" node
  ARM: shmobile: lager dts: Add compatible property to "partitions" node
  ARM: shmobile: koelsch dts: Add compatible property to "partitions"
    node
  ARM: shmobile: porter dts: Add compatible property to "partitions"
    node
  ARM: shmobile: gose dts: Add compatible property to "partitions" node
  ARM: shmobile: silk dts: Add compatible property to "partitions" node
  MIPS: dts: jz4780/ci20: Add compatible property to "partitions" node

 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts  | 1 +
 arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts | 1 +
 arch/arm/boot/dts/r8a7778-bockw.dts              | 1 +
 arch/arm/boot/dts/r8a7790-lager.dts              | 1 +
 arch/arm/boot/dts/r8a7791-koelsch.dts            | 1 +
 arch/arm/boot/dts/r8a7791-porter.dts             | 1 +
 arch/arm/boot/dts/r8a7793-gose.dts               | 1 +
 arch/arm/boot/dts/r8a7794-silk.dts               | 1 +
 arch/mips/boot/dts/ingenic/ci20.dts              | 1 +
 9 files changed, 9 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
