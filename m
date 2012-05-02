Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPd9u-0002jb-TD
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:16:12 +0000
Received: by pbbrq13 with SMTP id rq13so1447669pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:16:09 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 00/10] mtd: nand: rework nand_ecc_ctrl interface for OOB
Date: Wed,  2 May 2012 10:14:54 -0700
Message-Id: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
Cc: Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 Kevin Cernekee <cernekee@gmail.com>, eric miao <eric.miao@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Bastian Hecht <hechtb@googlemail.com>, Mike Frysinger <vapier.adi@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Scott Wood <scottwood@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Bryan Wu <cooloney@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is the fourth version of my patches to change the nand_chip and
nand_ecc_ctrl interfaces so that the nand_ecc_ctrl functions have information
about whether the higher layers actually need OOB data to be read/written
from/to the NAND device.

Changes for v4, somewhat ordered by importance:
 
  Fixup unsafe behavior for Freescale NAND drivers (thanks Scott)

  Rebase on auto-increment fixes (sent separately; not accepted yet). Some of
  the nand_base support I provided was not sound for NAND that used
  auto-increment. But we always had NAND_NO_AUTOINCR set, so I killed the
  option and dropped support for auto-increment, making the nand_base changes
  sound again.

  Rebase on top of Mike Dunn's bitflip threshold patch. There wasn't really any
  conflict; just trivial automerges.

  Applied Ack's, Reviewed-by's

Please refer to previous communications for other info.

I could not compile all the affected drivers, since some required ARCH-specific
builds that I am not familiar with.

Developers: if you care about your driver, please compile test and review to be
sure I'm doing things safely for you.

Note to the maintainers: please do NOT accept any of the patches 3-10 without
an explicit ACK from someone who knows the driver (I included Ack's for 6, 7,
and 8). I think they're simple, but I am not certain. And it is totally safe to
ignore one or several of those patches independently.

Thanks for reviewing!

Brian

Brian Norris (10):
  mtd: nand: add 'oob_required' argument to NAND {read,write}_page
    interfaces
  mtd: nand: pass proper 'oob_required' parameter
  mtd: Blackfin NFC: utilize oob_required parameter
  mtd: cafe_nand: utilize oob_required parameter
  mtd: denali: utilize oob_required parameter
  mtd: eLBC NAND: utilize oob_required parameter
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
 drivers/mtd/nand/fsl_elbc_nand.c       |   14 +++----
 drivers/mtd/nand/fsl_ifc_nand.c        |   13 +++---
 drivers/mtd/nand/fsmc_nand.c           |    3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   41 ++++++++++---------
 drivers/mtd/nand/nand_base.c           |   70 ++++++++++++++++++++------------
 drivers/mtd/nand/pxa3xx_nand.c         |   11 +++--
 drivers/mtd/nand/sh_flctl.c            |    4 +-
 include/linux/mtd/nand.h               |   11 +++--
 15 files changed, 134 insertions(+), 100 deletions(-)

-- 
1.7.5.4.2.g519b1
