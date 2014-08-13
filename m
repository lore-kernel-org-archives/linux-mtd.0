Received: from mail-ig0-f169.google.com ([209.85.213.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHUbq-0001Mn-9X
 for linux-mtd@lists.infradead.org; Wed, 13 Aug 2014 09:12:42 +0000
Received: by mail-ig0-f169.google.com with SMTP id r2so10583956igi.4
 for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2014 02:12:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] mtd: nand: Support for new DT NAND driver
Date: Wed, 13 Aug 2014 10:11:59 +0100
Message-Id: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Pekon,

I believe all of your queries have either been answered or addressed
and I am hoping this will be the last submission. :)

/me crosses fingers!

Kind regards,
Lee

Lee Jones (8):
  ARM: multi-v7: Enable ST BCH NAND
  ARM: sti: Add two new clock definitions for use with ST's NAND
    controllers
  ARM: sti: Add BCH (NAND Flash) Controller support for STiH41x (Orly)
    SoCs
  ARM: sti: Enable BCH NAND for STiH416 B2020-RevE
  mtd: nand: stm_nand_bch: provide Device Tree documentation
  mtd: nand: add shared register defines for ST's NAND Controller
    drivers
  mtd: nand: stm_nand_bch: add support for ST's BCH NAND controller
  mtd: nand: stm_nand_bch: provide ST's implementation of Back Block
    Table

 Documentation/devicetree/bindings/mtd/stm-nand.txt |   74 +
 arch/arm/boot/dts/stih416-b2020e.dts               |    8 +
 arch/arm/boot/dts/stih41x-b2020.dtsi               |   38 +
 arch/arm/configs/multi_v7_defconfig                |    2 +
 drivers/mtd/nand/Kconfig                           |   15 +
 drivers/mtd/nand/Makefile                          |    2 +
 drivers/mtd/nand/stm_nand_bbt.c                    |  601 ++++++++
 drivers/mtd/nand/stm_nand_bch.c                    | 1618 ++++++++++++++++++++
 drivers/mtd/nand/stm_nand_dt.c                     |  109 ++
 drivers/mtd/nand/stm_nand_dt.h                     |   24 +
 drivers/mtd/nand/stm_nand_regs.h                   |  304 ++++
 include/dt-bindings/clock/stih416-clks.h           |    2 +
 include/linux/mtd/stm_nand.h                       |  147 ++
 include/linux/mtd/stm_nand_bbt.h                   |   17 +
 14 files changed, 2961 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm-nand.txt
 create mode 100644 drivers/mtd/nand/stm_nand_bbt.c
 create mode 100644 drivers/mtd/nand/stm_nand_bch.c
 create mode 100644 drivers/mtd/nand/stm_nand_dt.c
 create mode 100644 drivers/mtd/nand/stm_nand_dt.h
 create mode 100644 drivers/mtd/nand/stm_nand_regs.h
 create mode 100644 include/linux/mtd/stm_nand.h
 create mode 100644 include/linux/mtd/stm_nand_bbt.h

-- 
1.9.1
