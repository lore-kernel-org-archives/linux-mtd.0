Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU3Oy-0007uY-0A
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2015 01:19:36 +0000
Received: by pabli10 with SMTP id li10so55804594pab.13
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2015 17:19:15 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Fri,  6 Mar 2015 17:18:46 -0800
Message-Id: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
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

This adds (long in coming) support for the Broadcom BCM7xxx Set-Top Box NAND
controller. This controller has been used in a variety of Broadcom SoCs.

There are a few more features I'd like add in the near future, mostly to
support more SoCs, but this is the base set, which should only need relatively
minor additions to support chips like BCM63138, BCM3384, and Cygnus/iProc.
Particularly, we may need to straighten out some endianness issues for the data
path on iProc, and interrupt enabling/acking on iProc, BCM63xxx, BCM3xxx, and
others.

TODO: add this to the DTS(I) files for BCM7445.

Happy reviewing! (Speaking of which, I need to catch up on reviewing everybody
else's MTD submissions...)

Brian

Brian Norris (3):
  mtd: nand: add common DT init code
  Documentation: devicetree: add binding doc for Broadcom NAND
    controller
  mtd: nand: add NAND driver for Broadcom STB NAND controller

 .../devicetree/bindings/mtd/brcmstb_nand.txt       |  109 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmstb_nand.c                    | 2182 ++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |   41 +
 include/linux/mtd/nand.h                           |    5 +
 6 files changed, 2346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcmstb_nand.txt
 create mode 100644 drivers/mtd/nand/brcmstb_nand.c

-- 
1.9.1
