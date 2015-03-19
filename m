Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYQWy-0000Sa-J4
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 02:49:57 +0000
Received: by pdbni2 with SMTP id ni2so61668223pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2015 19:49:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/4] mtd: nand: add Broadcom NAND controller support
Date: Wed, 18 Mar 2015 19:49:14 -0700
Message-Id: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is version 2 of the (long in coming) support for the Broadcom BCM7xxx
Set-Top Box NAND controller. This controller has been used in a variety of
Broadcom SoCs.

There are a few more features I'd like add in the near future, mostly to
support more SoCs, but this is the base set, which should only need relatively
minor additions to support chips like BCM63138, BCM3384, and Cygnus/iProc.
Particularly, we may need to straighten out some endianness issues for the data
path on iProc, and interrupt enabling/acking on iProc, BCM63xxx, BCM3xxx, and
others.

I think I've addressed everybody's comments, but the delta changelog is:

v1 -> v2:
 * add NAND to DTS for BCM7445 / BCM97445SVMB
 * rename DT binding file to have 'brcm,' prefix
 * catch DMA mapping errors
 * fixup timeout / error messages (hex, remove misleading info)
 * MODULE_LICENSE("GPL v2")
 * fix incorrect comments
 * print why we fail, when checking for supported controller revisions
 * disable prefetch when using Flash DMA (see FIXME); will re-enable once we
   get a good erased-page verification scheme merged

To be clear: this does NOT yet handle some of the per-SoC quirks required for
BCM53xxx/BCM4708 and Cygnus/iProc. Those patches are still WIP, and I want to
keep this patch series going while the Cygnus guys are straightening this out.

Happy reviewing!

Brian

Brian Norris (4):
  mtd: nand: add common DT init code
  Documentation: devicetree: add binding doc for Broadcom NAND
    controller
  mtd: nand: add NAND driver for Broadcom STB NAND controller
  ARM: bcm7445: add NAND to DTS

 .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  |  109 +
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |   23 +
 arch/arm/boot/dts/bcm7445.dtsi                     |   22 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmstb_nand.c                    | 2196 ++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |   41 +
 include/linux/mtd/nand.h                           |    5 +
 8 files changed, 2405 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
 create mode 100644 drivers/mtd/nand/brcmstb_nand.c

-- 
1.9.1
