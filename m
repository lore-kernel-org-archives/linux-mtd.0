Received: from mail-oa0-f45.google.com ([209.85.219.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgxpE-0000ra-Ao
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 14:23:17 +0000
Received: by mail-oa0-f45.google.com with SMTP id m1so2287690oag.18
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 06:22:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] mtd: st_spi_fsm: Add new device
Date: Thu, 14 Nov 2013 14:22:26 +0000
Message-Id: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, linus.walleij@linaro.org,
 dwmw2@infradead.org, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First stab at getting this thing Mainlined. It doesn't do a great deal
yet, but we are able to initialise the device and dynamically set it up
correctly based on an extracted JEDEC ID.

 arch/arm/boot/dts/stih416-b2105.dts    |  10 ++
 arch/arm/boot/dts/stih416-pinctrl.dtsi |  12 +++
 drivers/mtd/devices/Kconfig            |   7 ++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/st_spi_fsm.c       | 605 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/st_spi_fsm.h       | 187 ++++++++++++++++++++++++++++++++
 6 files changed, 822 insertions(+)
