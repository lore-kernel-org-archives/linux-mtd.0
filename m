Received: from michel.telenet-ops.be ([195.130.137.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn2WA-0007LR-Np
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 10:13:33 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/5] ARM: shmobile: dts: Add "nor-jedec" compatible value
Date: Tue, 28 Apr 2015 12:12:53 +0200
Message-Id: <1430215978-31087-1-git-send-email-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hi Simon, Magnus,

This patch series adds the "nor-jedec" compatible value to all device
nodes for JEDEC-compliant SPI FLASHes on Renesas shmobile boards,
It allows the driver to bind against the generic name, cfr. commit
8ff16cf77ce314c2 ("Documentation: devicetree: m25p80: add "nor-jedec"
binding").
	        
This was tested on r8a7791/koelsch. I verified that it also works with
"nor-jedec" only, without the specific compatible value.

Thanks for applying!

Geert Uytterhoeven (5):
  ARM: shmobile: koelsch dts: Add "nor-jedec" compatible value
  ARM: shmobile: lager dts: Add "nor-jedec" compatible value
  ARM: shmobile: henninger dts: Add "nor-jedec" compatible value
  ARM: shmobile: bockw-reference dts: Add "nor-jedec" compatible value
  ARM: shmobile: bockw dts: Add "nor-jedec" compatible value

 arch/arm/boot/dts/r8a7778-bockw-reference.dts | 2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts           | 2 +-
 arch/arm/boot/dts/r8a7790-lager.dts           | 2 +-
 arch/arm/boot/dts/r8a7791-henninger.dts       | 2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
