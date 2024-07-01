Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402A3C41513
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ltb16AbrFCedIQJqyUZjfa/RTkkSXBYWZzaf5fSk2fI=; b=KakioeqX1EkBE0
	kmI72XDFpAOSpQYI6SgZn/+Mw4GGYxwrx1rgEG6RcvHE/L49X1mOpKqyYhGX2LphYz5emEiUz4RUW
	NihwjEtJAAsZTnanEPgyGN7U6813cJMqB58oIgzsJ19n+oK/yKdDMrqKd5VLAG8x2M9xttGckYSX0
	ha9biVsmwuoSSGbAj8yE9J9spmE4I43hDfNa8Zi1Xwq+NXMWD+9Jj0S9Kr7IcdONcJpurHKbg7x1i
	bv1kSS/5juniVfKTRopZwH0fElVtbFJlgYMwGyyawp1bU2Hht8RSt8n9SlQX++A6bcbMjpwjvjOkx
	G6JONM7GWjYS+1qrgmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHUA-00000003aM8-06Cu;
	Mon, 01 Jul 2024 13:54:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHU3-00000003aFK-1Mb4
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 13:54:21 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTW-0001LY-Vb; Mon, 01 Jul 2024 15:53:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/9] AT24 EEPROM MTD Support
Date: Mon, 01 Jul 2024 15:53:39 +0200
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOO0gmYC/x3MQQqEMAxG4atI1hNIpTjoVcTF9DeO2WhpVQTx7
 haX3+K9i7Im00xddVHSw7KtS4H7VIT5t/yVbSymWmovX3EcPB8NO+FtjQbecwBviDCGD2gDoI1
 4Kn1MOtn5vvvhvh826v1ZawAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 loongarch@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_065419_467967_6ADBB752 
X-CRM114-Status: GOOD (  13.89  )
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

This series adds the intial support to handle EEPROMs via the MTD layer
as well. This allow the user-space to have separate paritions since
EEPROMs can become quite large nowadays.

With this patchset applied EEPROMs can be accessed via:
  - legacy 'eeprom' device
  - nvmem device
  - mtd device(s)

The patchset targets only the AT24 (I2C) EEPROMs since I have no access
to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.

Note: I'm not familiar with Kconfig symbol migration so I don't know if
the last patch is required at the moment. Please be notified that the
list of recipients is quite large due to the defconfig changes.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (9):
      mtd: core: add nvmem_write support
      mtd: add mtd_is_master helper
      mtd: add support to handle EEPROM devices
      mtd: devices: add AT24 eeprom support
      ARM: defconfig: convert to MTD_EEPROM_AT24
      powerpc: convert to MTD_EEPROM_AT24
      MIPS: configs: convert to MTD_EEPROM_AT24
      LoongArch: convert to MTD_EEPROM_AT24
      eeprom: at24: remove deprecated Kconfig symbol

 MAINTAINERS                                 |   2 +-
 arch/arm/configs/aspeed_g4_defconfig        |   2 +-
 arch/arm/configs/aspeed_g5_defconfig        |   2 +-
 arch/arm/configs/at91_dt_defconfig          |   2 +-
 arch/arm/configs/axm55xx_defconfig          |   2 +-
 arch/arm/configs/davinci_all_defconfig      |   2 +-
 arch/arm/configs/imx_v4_v5_defconfig        |   2 +-
 arch/arm/configs/imx_v6_v7_defconfig        |   2 +-
 arch/arm/configs/ixp4xx_defconfig           |   2 +-
 arch/arm/configs/keystone_defconfig         |   2 +-
 arch/arm/configs/lpc18xx_defconfig          |   2 +-
 arch/arm/configs/lpc32xx_defconfig          |   2 +-
 arch/arm/configs/multi_v5_defconfig         |   2 +-
 arch/arm/configs/multi_v7_defconfig         |   2 +-
 arch/arm/configs/mvebu_v5_defconfig         |   2 +-
 arch/arm/configs/mvebu_v7_defconfig         |   2 +-
 arch/arm/configs/mxs_defconfig              |   2 +-
 arch/arm/configs/omap2plus_defconfig        |   2 +-
 arch/arm/configs/pxa_defconfig              |   2 +-
 arch/arm/configs/s3c6400_defconfig          |   2 +-
 arch/arm/configs/sama5_defconfig            |   2 +-
 arch/arm/configs/sama7_defconfig            |   2 +-
 arch/arm/configs/shmobile_defconfig         |   2 +-
 arch/arm/configs/socfpga_defconfig          |   2 +-
 arch/arm/configs/tegra_defconfig            |   2 +-
 arch/arm/configs/wpcm450_defconfig          |   2 +-
 arch/loongarch/configs/loongson3_defconfig  |   2 +-
 arch/mips/configs/cavium_octeon_defconfig   |   2 +-
 arch/mips/configs/db1xxx_defconfig          |   2 +-
 arch/powerpc/configs/44x/warp_defconfig     |   2 +-
 arch/powerpc/configs/mpc512x_defconfig      |   2 +-
 arch/powerpc/configs/mpc5200_defconfig      |   2 +-
 arch/powerpc/configs/ppc6xx_defconfig       |   2 +-
 arch/powerpc/configs/skiroot_defconfig      |   2 +-
 drivers/misc/eeprom/Kconfig                 |  31 -------
 drivers/misc/eeprom/Makefile                |   1 -
 drivers/mtd/devices/Kconfig                 |  31 +++++++
 drivers/mtd/devices/Makefile                |   1 +
 drivers/{misc/eeprom => mtd/devices}/at24.c | 122 +++++++++++++++-------------
 drivers/mtd/mtdcore.c                       |  49 ++++++++++-
 include/linux/mtd/mtd.h                     |   5 ++
 include/uapi/mtd/mtd-abi.h                  |   2 +
 42 files changed, 187 insertions(+), 123 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240701-b4-v6-10-topic-usbc-tcpci-c4bc9bcce604

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
