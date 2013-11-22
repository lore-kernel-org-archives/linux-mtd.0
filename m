Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjtWA-0002qV-L1
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 16:23:43 +0000
Received: by mail-pd0-f172.google.com with SMTP id g10so1456584pdj.17
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 08:23:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, angus.clark@st.com
Subject: [PATCH 00/23] mtd: st_spi_fsm: Add new device
Date: Fri, 22 Nov 2013 16:22:37 +0000
Message-Id: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
Cc: linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first bunch of these patches have been on the MLs before, but 
didn't receive a great deal of attention for the most part. We are
a little more featureful this time however. We can now successfully
setup and configure the N25Q256. We still can't read/write/erase
it though. I'll start work on that next week and will provide it in
the next instalment.

 arch/arm/boot/dts/stih416-b2105.dts     |  14 +++
 arch/arm/boot/dts/stih416-pinctrl.dtsi  |  12 ++
 drivers/mtd/devices/Kconfig             |   7 ++
 drivers/mtd/devices/Makefile            |   1 +
 drivers/mtd/devices/serial_flash_cmds.h |  91 ++++++++++++++
 drivers/mtd/devices/st_spi_fsm.c        | 737 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/st_spi_fsm.h        | 419 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 1281 insertions(+)
