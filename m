Received: from mail-we0-f180.google.com ([74.125.82.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnkE-0002Xa-LJ
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:35 +0000
Received: by mail-we0-f180.google.com with SMTP id t61so2837597wes.39
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/47] mtd: nand: Add new driver supporting ST's BCH h/w
Date: Thu,  1 May 2014 10:56:07 +0100
Message-Id: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD Folks,

This driver is now at v1.  Suggestions from the RFC patch-set have now
been applied.  None of the framework internals are now exported for use
within the driver, as it now uses the 'ecc' call-backs provided.
Hopefully the driver now conforms to what's expected and will be suitable
to be merged.

NB: This driver is based on a patch written, but not yet submitted by
Brian Norris which renames .erase_cmd() to .erase() and places
responsibility of .waitfunc() functionality into those call-backs.

Kind regards,
Lee

 Documentation/devicetree/bindings/mtd/stm-nand.txt |  123 +
 arch/arm/boot/dts/stih41x-b2020.dtsi               |   39 +
 drivers/mtd/nand/Kconfig                           |   14 +
 drivers/mtd/nand/Makefile                          |    2 +
 drivers/mtd/nand/stm_nand_bch.c                    | 2437 ++++++++++++++++++++
 drivers/mtd/nand/stm_nand_dt.c                     |  149 ++
 drivers/mtd/nand/stm_nand_dt.h                     |   39 +
 drivers/mtd/nand/stm_nand_regs.h                   |  332 +++
 include/linux/mtd/stm_nand.h                       |  104 +
 9 files changed, 3239 insertions(+)
