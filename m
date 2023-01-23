Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A6C05027
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fdna8ZL0i2zooGCqv69mj35kTBZVhTo2NmDHufOZjyI=; b=yHez77cMdzhumj
	oC+JiQPW9eTj15h90v7NF0sPS8fZy2bNvnaFGOBH7r1Abbx82M0jxX2SsBjnzX/iakSNnFwNbZaOY
	YM7eZNuWnumqL+CDKoRg+es09RC70b8XWy6BljcPMSKx10HE0h/l3n45vqDAo1/Jvs+Hqg3zeAa6s
	S7ZJ8VmEHUCHU0SaX2ImuUx2w+9avbBmBm7gt4Vafn3CWO/87XSsJnIbEoNt6dqSMD3snpiQSVF10
	f5duaEeqKdpIWiWxB/fZ/lKhQekUr/0KBkE+WN8Mqz0BcIt912r3RveiP9Tgp8ky1ioNRd1zVGgqO
	6oB0OYR7oydgXYaVKLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrNp-00GF9v-8e; Mon, 23 Jan 2023 07:36:49 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrNm-00GF9Q-1r
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 07:36:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674459357; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H7BwwRZ01ZN1U1RMbNO1pzm8QIU76QnpD1Vo+T4QfTTTFJsT3KYL8TyQM5QLd8ot6lcCeraREJkrjla9Pa6uiBnni+LDreRm299NAp8epsAvhspRIBy8yb7emmnYILSR1hTvSerkrPNB0a4jIcLQa8+6JHBBEJJiU+215wfLyRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674459357; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject; 
	bh=HkG+SmbIjA7sw7BLtfWk5YKVQYC6xM4eS1D5oo5HkRg=; 
	b=CkpUrhKdNV6tLpuCqRjAYMct1rnU7+6ddITri4lxt2d1A0BgOASuGBeLothybj6CdE0RNaUqOMD6Ew9qaPweozGL+no3AP/39+41YOI77glP8KAOxpOowicvsncnZyL9ct6An7d8w5sVdtjg+1TXPy6fh9BJDFgR/8+8+W5EcZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<lchen@ambarella.com>
Received: from shbuild9.ambarella.net (116.246.37.178 [116.246.37.178]) by mx.zohomail.com
	with SMTPS id 1674459355500620.8753836206259; Sun, 22 Jan 2023 23:35:55 -0800 (PST)
From: Li Chen <lchen@ambarella.com>
To: 
Cc: Li Chen <lchen@ambarella.com>,
	=?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Brian Norris <briannorris@chromium.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daniel Palmer <daniel@0x0f.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Jean Delvare <jdelvare@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Li Chen <lchen@ambarella.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-serial@vger.kernel.org (open list:SERIAL DRIVERS),
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Rickard x Andersson <rickaran@axis.com>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH 00/15] Ambarella S6LM SoC bring-up
Date: Mon, 23 Jan 2023 15:32:15 +0800
Message-Id: <20230123073305.149940-1-lchen@ambarella.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_233646_167569_92AB1AB5 
X-CRM114-Status: GOOD (  12.16  )
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

This series brings up initial support for the Ambarella S6LM
SoC.

The following features are supported in this initial port:

- UART with console support
- Pinctrl with GPIO controller
- Nand flash controller
- Devicetree

Li Chen (15):
  debugfs: allow to use regmap for print regs
  dt-bindings: vendor-prefixes: add Ambarella prefix
  dt-bindings: arm: ambarella: Add binding for Ambarella ARM platforms
  dt-bindings: arm: add support for Ambarella SoC
  arm64: Kconfig: Introduce CONFIG_ARCH_AMBARELLA
  soc: add Ambarella driver
  dt-bindings: clock: Add Ambarella clock bindings
  clk: add support for Ambarella clocks
  dt-bindings: serial: add support for Ambarella
  serial: ambarella: add support for Ambarella uart_port
  dt-bindings: mtd: Add binding for Ambarella
  mtd: nand: add Ambarella nand support
  dt-bindings: pinctrl: add support for Ambarella
  pinctrl: Add pinctrl/GPIO for Ambarella SoCs
  arm64: dts: ambarella: introduce Ambarella s6lm SoC

 .../devicetree/bindings/arm/ambarella.yaml    |   22 +
 .../arm/ambarella/ambarella,cpuid.yaml        |   24 +
 .../bindings/arm/ambarella/ambarella,rct.yaml |   24 +
 .../arm/ambarella/ambarella,scratchpad.yaml   |   24 +
 .../bindings/arm/ambarella/ambarella.yaml     |   22 +
 .../clock/ambarella,composite-clock.yaml      |   52 +
 .../bindings/clock/ambarella,pll-clock.yaml   |   59 +
 .../bindings/mtd/ambarella,nand.yaml          |   77 +
 .../bindings/pinctrl/ambarella,pinctrl.yaml   |  160 ++
 .../bindings/serial/ambarella_uart.yaml       |   57 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 Documentation/filesystems/debugfs.rst         |    2 +
 MAINTAINERS                                   |   29 +
 arch/arm64/Kconfig.platforms                  |    9 +
 .../boot/dts/ambarella/ambarella-s6lm.dtsi    |  332 ++++
 .../boot/dts/ambarella/s6lm_pineapple.dts     |   29 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/ambarella/Makefile                |    5 +
 drivers/clk/ambarella/clk-composite.c         |  293 +++
 drivers/clk/ambarella/clk-pll-common.c        |  308 ++++
 drivers/clk/ambarella/clk-pll-common.h        |   96 +
 drivers/clk/ambarella/clk-pll-normal.c        |  328 ++++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/ambarella_combo_nand.c   | 1519 ++++++++++++++++
 drivers/mtd/nand/raw/ambarella_combo_nand.h   |  370 ++++
 drivers/mtd/nand/raw/nand_ids.c               |    4 +
 drivers/pinctrl/Kconfig                       |    6 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-ambarella.c           | 1357 ++++++++++++++
 drivers/soc/Makefile                          |    1 +
 drivers/soc/ambarella/Makefile                |    3 +
 drivers/soc/ambarella/soc.c                   |  136 ++
 drivers/tty/serial/Kconfig                    |   16 +
 drivers/tty/serial/Makefile                   |    1 +
 drivers/tty/serial/ambarella_uart.c           | 1581 +++++++++++++++++
 drivers/tty/serial/ambarella_uart.h           |  120 ++
 fs/debugfs/file.c                             |   43 +-
 include/linux/debugfs.h                       |   11 +
 include/soc/ambarella/misc.h                  |   17 +
 40 files changed, 7149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/ambarella.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/ambarella/ambarella,cpuid.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/ambarella/ambarella,rct.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/ambarella/ambarella,scratchpad.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/ambarella/ambarella.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ambarella,composite-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ambarella,pll-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ambarella,nand.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ambarella,pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/ambarella_uart.yaml
 create mode 100644 arch/arm64/boot/dts/ambarella/ambarella-s6lm.dtsi
 create mode 100644 arch/arm64/boot/dts/ambarella/s6lm_pineapple.dts
 create mode 100644 drivers/clk/ambarella/Makefile
 create mode 100644 drivers/clk/ambarella/clk-composite.c
 create mode 100644 drivers/clk/ambarella/clk-pll-common.c
 create mode 100644 drivers/clk/ambarella/clk-pll-common.h
 create mode 100644 drivers/clk/ambarella/clk-pll-normal.c
 create mode 100644 drivers/mtd/nand/raw/ambarella_combo_nand.c
 create mode 100644 drivers/mtd/nand/raw/ambarella_combo_nand.h
 create mode 100644 drivers/pinctrl/pinctrl-ambarella.c
 create mode 100644 drivers/soc/ambarella/Makefile
 create mode 100644 drivers/soc/ambarella/soc.c
 create mode 100644 drivers/tty/serial/ambarella_uart.c
 create mode 100644 drivers/tty/serial/ambarella_uart.h
 create mode 100644 include/soc/ambarella/misc.h

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
