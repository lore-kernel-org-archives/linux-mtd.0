Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B483DC77B61
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/xKSqUstRESVQhQozs0QqbDUx4mRKd0SmKD2G/lB4Ow=; b=Vr/cMxq9tOoWzS
	JCu39x+13mKRV5P3mk5XnObT5YrjnUQDTtyACKNK9X2pZbQmybrGP7KcBwkRO7HjjRDLZod4FOX7t
	c7BmQv88l7XRjWu4EDvMZ7S13TXytFiYlmQ/zjvfB0O8ZEzmrgTFiH0swXmAJS9SkoZmmkqiQiurv
	Ck0nxrodHoPVMmkeh3v0/w+Qqwz1r1IoD7BVpR8v6zuoEAwIXupj37YRs7/4Fm72b64oaGTZEKRcx
	Rv7hDbN6clBvTyJNl8EM6cr5qsp+l4I6epOAwNTulTXfXXB4VFLZu3KNyT/KX4AUzs8miWYMKU2ka
	M7hA9UFAB6F0LmmD27vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsbo-00FoFD-0K;
	Mon, 24 Apr 2023 09:35:44 +0000
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsbh-00FoBq-1p;
	Mon, 24 Apr 2023 09:35:40 +0000
Received: from mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:261e:0:640:2e3d:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTP id B34EC60119;
	Mon, 24 Apr 2023 12:35:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JZBb1pbWwKo0-gTOTU7I1;
	Mon, 24 Apr 2023 12:35:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1682328927;
	bh=1BUnzucVZIOur2ZqkDwi3tGjasPWJzQYz0Qjtg3w2ik=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=UgghrdamwAlliyfWMNgpgIf/GA2CaDnIf8J4N707ddvflunc8oYkhwckHZhBR6hJy
	 fXHcpXI0SVojxzFFPeHKSa59FaYAQzj5QfnSgkXsyZJrYJL3ZPWStgaVY/FmuCCqhd
	 giyDCppN4p4mDYomopXewIMVn6BrcHYAuV04xe30=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Brian Norris <briannorris@chromium.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jean Delvare <jdelvare@suse.de>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Le Moal <damien.lemoal@opensource.wdc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lukasz Majewski <lukma@denx.de>,
	Lv Ruyi <lv.ruyi@zte.com.cn>,
	Mark Brown <broonie@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Qin Jian <qinjian@cqplus1.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Reichel <sre@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Stephen Boyd <sboyd@kernel.org>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	netdev@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH 00/43] ep93xx device tree conversion
Date: Mon, 24 Apr 2023 15:34:16 +0300
Message-Id: <20230424123522.18302-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_023538_353567_EF8031E0 
X-CRM114-Status: GOOD (  18.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series aims to convert ep93xx from platform to full device tree support.

Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.

Thank you Linus and Arnd for your support, review and comments, sorry if i missed something -
these series are quite big for me.

Big thanks to Alexander Sverdlin for his testing, support, review, fixes and patches.

Alexander Sverdlin (4):
  ARM: dts: ep93xx: Add ADC node
  ARM: dts: ep93xx: Add I2S and AC97 nodes
  ARM: dts: ep93xx: Add EDB9302 DT
  ASoC: cirrus: edb93xx: Delete driver

Nikita Shubin (39):
  gpio: ep93xx: split device in multiple
  soc: Add SoC driver for Cirrus ep93xx
  dt-bindings: pinctrl: Add DT bindings ep93xx pinctrl
  pinctrl: add a Cirrus ep93xx SoC pin controller
  dt-bindings: timers: add DT bindings for Cirrus EP93xx
  clocksource: ep93xx: Add driver for Cirrus Logic EP93xx
  dt-bindings: rtc: add DT bindings for Cirrus EP93xx
  rtc: ep93xx: add DT support for Cirrus EP93xx
  dt-bindings: watchdog: add DT bindings for Cirrus EP93x
  watchdog: ep93xx: add DT support for Cirrus EP93xx
  dt-bindings: clock: add DT bindings for Cirrus EP93xx
  clk: ep93xx: add DT support for Cirrus EP93xx
  power: reset: Add a driver for the ep93xx reset
  dt-bindings: pwm: Add DT bindings ep93xx PWM
  pwm: ep93xx: add DT support for Cirrus EP93xx
  dt-bindings: spi: Add DT bindings ep93xx spi
  spi: ep93xx: add DT support for Cirrus EP93xx
  dt-bindings: net: Add DT bindings ep93xx eth
  net: cirrus: add DT support for Cirrus EP93xx
  dt-bindings: dma: Add DT bindings ep93xx dma
  dma: cirrus: add DT support for Cirrus EP93xx
  dt-bindings: mtd: add DT bindings for ts7250 nand
  mtd: ts72xx_nand: add platform helper
  dt-bindings: ata: Add DT bindings ep93xx pata
  pata: cirrus: add DT support for Cirrus EP93xx
  dt-bindings: input: Add DT bindings ep93xx keypad
  input: keypad: ep93xx: add DT support for Cirrus EP93xx
  dt-bindings: rtc: Add DT binding m48t86 rtc
  rtc: m48t86: add DT support for m48t86
  dt-bindings: wdt: Add DT binding ts72xx wdt
  wdt: ts72xx: add DT support for ts72xx
  dt-bindings: gpio: Add DT bindings ep93xx gpio
  gpio: ep93xx: add DT support for gpio-ep93xx
  ARM: dts: add device tree for ep93xx Soc
  ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms
  pwm: ep93xx: drop legacy pinctrl
  input: keypad: ep93xx: drop legacy pinctrl
  ARM: ep93xx: soc: drop defines
  ARM: ep93xx: delete all boardfiles

 .../devicetree/bindings/arm/ep93xx.yaml       |   99 +
 .../bindings/ata/cirrus,ep93xx-pata.yaml      |   40 +
 .../bindings/dma/cirrus,ep93xx-dma-m2m.yaml   |   66 +
 .../bindings/dma/cirrus,ep93xx-dma-m2p.yaml   |  102 +
 .../devicetree/bindings/gpio/gpio-ep93xx.yaml |  161 ++
 .../bindings/input/cirrus,ep93xx-keypad.yaml  |  123 ++
 .../bindings/mtd/technologic,nand.yaml        |   56 +
 .../bindings/net/cirrus,ep93xx_eth.yaml       |   51 +
 .../pinctrl/cirrus,ep93xx-pinctrl.yaml        |   66 +
 .../bindings/pwm/cirrus,ep93xx-pwm.yaml       |   45 +
 .../bindings/rtc/cirrus,ep93xx-rtc.yaml       |   32 +
 .../bindings/rtc/dallas,rtc-m48t86.yaml       |   33 +
 .../devicetree/bindings/spi/spi-ep93xx.yaml   |   68 +
 .../bindings/timer/cirrus,ep93xx-timer.yaml   |   41 +
 .../bindings/watchdog/cirrus,ep93xx-wdt.yaml  |   38 +
 .../watchdog/technologic,ts72xx-wdt.yaml      |   39 +
 arch/arm/Makefile                             |    1 -
 arch/arm/boot/dts/Makefile                    |    1 +
 arch/arm/boot/dts/ep93xx-bk3.dts              |   96 +
 arch/arm/boot/dts/ep93xx-edb9302.dts          |  150 ++
 arch/arm/boot/dts/ep93xx-ts7250.dts           |  113 ++
 arch/arm/boot/dts/ep93xx.dtsi                 |  466 +++++
 arch/arm/mach-ep93xx/Kconfig                  |   20 +-
 arch/arm/mach-ep93xx/Makefile                 |   11 -
 arch/arm/mach-ep93xx/core.c                   | 1017 ----------
 arch/arm/mach-ep93xx/dma.c                    |  114 --
 arch/arm/mach-ep93xx/edb93xx.c                |  344 ----
 arch/arm/mach-ep93xx/ep93xx-regs.h            |   38 -
 arch/arm/mach-ep93xx/gpio-ep93xx.h            |  111 --
 arch/arm/mach-ep93xx/hardware.h               |   25 -
 arch/arm/mach-ep93xx/irqs.h                   |   76 -
 arch/arm/mach-ep93xx/platform.h               |   42 -
 arch/arm/mach-ep93xx/soc.h                    |  212 --
 arch/arm/mach-ep93xx/ts72xx.c                 |  422 ----
 arch/arm/mach-ep93xx/ts72xx.h                 |   94 -
 arch/arm/mach-ep93xx/vision_ep9307.c          |  311 ---
 drivers/ata/pata_ep93xx.c                     |    9 +
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 .../clock.c => drivers/clk/clk-ep93xx.c       |  491 +++--
 drivers/clocksource/Kconfig                   |   11 +
 drivers/clocksource/Makefile                  |    1 +
 .../clocksource}/timer-ep93xx.c               |  143 +-
 drivers/dma/ep93xx_dma.c                      |  119 +-
 drivers/gpio/gpio-ep93xx.c                    |  329 ++--
 drivers/input/keyboard/ep93xx_keypad.c        |   25 +-
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/ts72xx_nand.c            |   94 +
 drivers/net/ethernet/cirrus/ep93xx_eth.c      |   49 +-
 drivers/pinctrl/Kconfig                       |    7 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-ep93xx.c              | 1698 +++++++++++++++++
 drivers/power/reset/Kconfig                   |   10 +
 drivers/power/reset/Makefile                  |    1 +
 drivers/power/reset/ep93xx-restart.c          |   65 +
 drivers/pwm/pwm-ep93xx.c                      |   24 +-
 drivers/rtc/rtc-ep93xx.c                      |    8 +
 drivers/rtc/rtc-m48t86.c                      |   10 +
 drivers/soc/Kconfig                           |    1 +
 drivers/soc/Makefile                          |    1 +
 drivers/soc/cirrus/Kconfig                    |   11 +
 drivers/soc/cirrus/Makefile                   |    2 +
 drivers/soc/cirrus/soc-ep93xx.c               |  134 ++
 drivers/spi/spi-ep93xx.c                      |   31 +-
 drivers/watchdog/ep93xx_wdt.c                 |    8 +
 drivers/watchdog/ts72xx_wdt.c                 |    8 +
 .../dt-bindings/clock/cirrus,ep93xx-clock.h   |   53 +
 include/linux/platform_data/dma-ep93xx.h      |    3 +
 include/linux/soc/cirrus/ep93xx.h             |   28 +-
 sound/soc/cirrus/Kconfig                      |    9 -
 sound/soc/cirrus/Makefile                     |    4 -
 sound/soc/cirrus/edb93xx.c                    |  119 --
 73 files changed, 4796 insertions(+), 3453 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/ep93xx.yaml
 create mode 100644 Documentation/devicetree/bindings/ata/cirrus,ep93xx-pata.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/cirrus,ep93xx-dma-m2m.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/cirrus,ep93xx-dma-m2p.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ep93xx.yaml
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,ep93xx-keypad.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/technologic,nand.yaml
 create mode 100644 Documentation/devicetree/bindings/net/cirrus,ep93xx_eth.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cirrus,ep93xx-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/cirrus,ep93xx-pwm.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/cirrus,ep93xx-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/dallas,rtc-m48t86.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/spi-ep93xx.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/cirrus,ep93xx-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/cirrus,ep93xx-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts72xx-wdt.yaml
 create mode 100644 arch/arm/boot/dts/ep93xx-bk3.dts
 create mode 100644 arch/arm/boot/dts/ep93xx-edb9302.dts
 create mode 100644 arch/arm/boot/dts/ep93xx-ts7250.dts
 create mode 100644 arch/arm/boot/dts/ep93xx.dtsi
 delete mode 100644 arch/arm/mach-ep93xx/Makefile
 delete mode 100644 arch/arm/mach-ep93xx/core.c
 delete mode 100644 arch/arm/mach-ep93xx/dma.c
 delete mode 100644 arch/arm/mach-ep93xx/edb93xx.c
 delete mode 100644 arch/arm/mach-ep93xx/ep93xx-regs.h
 delete mode 100644 arch/arm/mach-ep93xx/gpio-ep93xx.h
 delete mode 100644 arch/arm/mach-ep93xx/hardware.h
 delete mode 100644 arch/arm/mach-ep93xx/irqs.h
 delete mode 100644 arch/arm/mach-ep93xx/platform.h
 delete mode 100644 arch/arm/mach-ep93xx/soc.h
 delete mode 100644 arch/arm/mach-ep93xx/ts72xx.c
 delete mode 100644 arch/arm/mach-ep93xx/ts72xx.h
 delete mode 100644 arch/arm/mach-ep93xx/vision_ep9307.c
 rename arch/arm/mach-ep93xx/clock.c => drivers/clk/clk-ep93xx.c (60%)
 rename {arch/arm/mach-ep93xx => drivers/clocksource}/timer-ep93xx.c (51%)
 create mode 100644 drivers/mtd/nand/raw/ts72xx_nand.c
 create mode 100644 drivers/pinctrl/pinctrl-ep93xx.c
 create mode 100644 drivers/power/reset/ep93xx-restart.c
 create mode 100644 drivers/soc/cirrus/Kconfig
 create mode 100644 drivers/soc/cirrus/Makefile
 create mode 100644 drivers/soc/cirrus/soc-ep93xx.c
 create mode 100644 include/dt-bindings/clock/cirrus,ep93xx-clock.h
 delete mode 100644 sound/soc/cirrus/edb93xx.c

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
