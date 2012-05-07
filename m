Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRCYn-00036f-0T
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 01:16:21 +0000
Received: by dadm1 with SMTP id m1so2038646dad.36
 for <linux-mtd@lists.infradead.org>; Sun, 06 May 2012 18:16:19 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND 0/9] Enable pinctrl support for mach-mxs
Date: Mon,  7 May 2012 09:16:05 +0800
Message-Id: <1336353374-28939-1-git-send-email-shawn.guo@linaro.org>
Cc: linux-fbdev@vger.kernel.org, Chris Ball <cjb@laptop.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Wolfram Sang <w.sang@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Resend to have subsystem lists Cc-ed]

With pinctrl-mxs driver (DT only) applied on pinctrl tree, the mxs
device tree conversion can start basing on that support.  This series
adopts pinctrl support for mxs device drivers with a dummy pinctrl
state provided for non-DT boot, so that the pinctrl call in the device
drivers will be bypassed for non-DT probe while it starts working for
DT probe.

To ease the merge process, I would like to ask Arnd and Olof to pull
pinctrl tree as a dependency in arm-soc and have this series go through
arm-soc.

Regards,
Shawn

Shawn Guo (9):
  ARM: mxs: enable pinctrl dummy states
  serial: amba-pl011: adopt pinctrl support
  serial: mxs-auart: adopt pinctrl support
  mmc: mxs-mmc: adopt pinctrl support
  mtd: nand: gpmi: adopt pinctrl support
  i2c: mxs: adopt pinctrl support
  ASoC: mxs-saif: adopt pinctrl support
  video: mxsfb: adopt pinctrl support
  ARM: mxs: enable pinctrl support

 arch/arm/Kconfig                        |    1 +
 arch/arm/mach-mxs/Kconfig               |    2 ++
 arch/arm/mach-mxs/include/mach/common.h |    2 ++
 arch/arm/mach-mxs/mach-apx4devkit.c     |    2 ++
 arch/arm/mach-mxs/mach-m28evk.c         |    2 ++
 arch/arm/mach-mxs/mach-mx23evk.c        |    2 ++
 arch/arm/mach-mxs/mach-mx28evk.c        |    2 ++
 arch/arm/mach-mxs/mach-stmp378x_devb.c  |    2 ++
 arch/arm/mach-mxs/mach-tx28.c           |    2 ++
 arch/arm/mach-mxs/mm.c                  |   11 +++++++++++
 drivers/i2c/busses/i2c-mxs.c            |    6 ++++++
 drivers/mmc/host/mxs-mmc.c              |    8 ++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c  |    9 +++++++++
 drivers/tty/serial/amba-pl011.c         |    8 ++++++++
 drivers/tty/serial/mxs-auart.c          |    8 ++++++++
 drivers/video/mxsfb.c                   |    9 +++++++++
 sound/soc/mxs/mxs-saif.c                |    8 ++++++++
 17 files changed, 84 insertions(+), 0 deletions(-)

-- 
1.7.5.4
