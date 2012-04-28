Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwV7-0002xw-Jc
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:31:06 +0000
Received: by dadn15 with SMTP id n15so2140720dad.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:31:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 00/10] mtd: nand: rework nand_ecc_ctrl interface for OOB
Date: Fri, 27 Apr 2012 18:29:44 -0700
Message-Id: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Lei Wen <leiwen@marvell.com>, Li Yang <leoli@freescale.com>,
 Mike Dunn <mikedunn@newsguy.com>, Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello again,

This is the third (final?) version of my patches to change the nand_chip and
nand_ecc_ctrl interfaces so that the nand_ecc_ctrl functions have information
about whether the higher layers actually need OOB data to be read/written
from/to the NAND device.

Changes for v3:

 This version implements the boolean parameter 'int oob_required', where a
 non-zero value indicates the driver must read/write OOB data to chip->oob_poi.
 A zero value indicates apathy from the upper layer.

 Patches 3-10 are new, where I try to utilize the 'oob_required' parameter for
 a number of different drivers. Not all were easy (or even possible), since
 software-based ECC obviously requires the OOB data in a buffer even when the
 upper layer doesn't need it. Similarly, some "hardware ECC" seems to work off
 of an in-memory buffer.

Please refer to previous communications for other info.

I could not compile all the affected drivers, since some required ARCH-specific
builds that I am not familiar with.

Developers: if you care about your driver, please compile test and review to be
sure I'm doing things safely for you.

Note to the maintainers: please do NOT accept any of the patches 3-10 without
an explicit ACK from someone who knows the driver. I think they're simple, but
I am not certain. And it is totally safe to ignore one or several of those
patches independently.

Thanks for reviewing!

Brian

Brian Norris (10):
  mtd: nand: add 'oob_required' argument to NAND {read,write}_page
    interfaces
  mtd: nand: pass proper 'oob_required' parameter
  mtd: Blackfin NFC: utilize oob_required parameter
  mtd: cafe_nand: utilize oob_required parameter
  mtd: denali: utilize oob_required parameter
  mtd: eLBD NAND: utilize oob_required parameter
  mtd: IFC NAND: utilize oob_required parameter
  mtd: gpmi-nand: utilize oob_requested parameter
  mtd: nand: utilize oob_required parameter
  mtd: pxa3xx_nand: utilize oob_required parameter

 drivers/mtd/nand/atmel_nand.c          |    5 +-
 drivers/mtd/nand/bcm_umi_bch.c         |   10 +++--
 drivers/mtd/nand/bcm_umi_nand.c        |    2 +-
 drivers/mtd/nand/bf5xx_nand.c          |   10 +++--
 drivers/mtd/nand/cafe_nand.c           |   16 +++++---
 drivers/mtd/nand/denali.c              |   12 +++--
 drivers/mtd/nand/docg4.c               |   12 +++---
 drivers/mtd/nand/fsl_elbc_nand.c       |   17 ++++----
 drivers/mtd/nand/fsl_ifc_nand.c        |   16 ++++----
 drivers/mtd/nand/fsmc_nand.c           |    3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   41 ++++++++++---------
 drivers/mtd/nand/nand_base.c           |   70 ++++++++++++++++++++------------
 drivers/mtd/nand/pxa3xx_nand.c         |   11 +++--
 drivers/mtd/nand/sh_flctl.c            |    4 +-
 include/linux/mtd/nand.h               |   11 +++--
 15 files changed, 138 insertions(+), 102 deletions(-)

-- 
1.7.5.4.2.g519b1
