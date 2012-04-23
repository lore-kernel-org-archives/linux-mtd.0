Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMPfk-0005Qq-Ju
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 20:15:45 +0000
Received: by pbcun4 with SMTP id un4so4669818pbc.36
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 13:15:40 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
Date: Mon, 23 Apr 2012 13:14:27 -0700
Message-Id: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 prabhakar@freescale.com, Mike Dunn <mikedunn@newsguy.com>,
 Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
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

Hello again,

This is v2 of my patches to change the nand_chip and nand_ecc_ctrl interfaces
so that the nand_ecc_ctrl functions have information about whether the higher
layers actually need OOB data to be read/written from/to the NAND device. Per
some suggestions I have received, I have settled on using a boolean 'use_oob'
argument that tells the callee function whether the calling function is using
chip->oob_poi for OOB data.

Please refer to previous communications for other details.

Similar notes from last time:

I could not compile all the affected drivers, since some required ARCH-specific
builds that I am not familiar with.

Artem: can you perform your regular compile tests? I compile-tested as many as
I could.

Others: if you care about your driver, please compile test and review to be
sure I'm doing things safely for you. Because most in-kernel drivers seem to be
perfecly happy using nand_chip.oob_poi for OOB data unconditionally, I have not
struggled to port most of them to take advantage of this full change. However,
some developers have noted that certain drivers could benefit from utilizing
this 'use_oob' parameter. Fell free to write/submit/review any code on top of
these patches, assuming they are eventually accepted.

Thanks for reviewing!

Brian

Brian Norris (2):
  mtd: nand: add 'use_oob' argument to NAND {read,write}_page
    interfaces
  mtd: nand: nand_base - pass proper 'use_oob' parameter

 drivers/mtd/nand/atmel_nand.c          |    3 +-
 drivers/mtd/nand/bcm_umi_bch.c         |   10 +++--
 drivers/mtd/nand/bcm_umi_nand.c        |    2 +-
 drivers/mtd/nand/bf5xx_nand.c          |    4 +-
 drivers/mtd/nand/cafe_nand.c           |   13 ++++---
 drivers/mtd/nand/denali.c              |    8 ++--
 drivers/mtd/nand/docg4.c               |   12 +++---
 drivers/mtd/nand/fsl_elbc_nand.c       |   11 ++----
 drivers/mtd/nand/fsl_ifc_nand.c        |   10 ++---
 drivers/mtd/nand/fsmc_nand.c           |    3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    6 ++--
 drivers/mtd/nand/nand_base.c           |   58 ++++++++++++++++++++-----------
 drivers/mtd/nand/pxa3xx_nand.c         |    4 +-
 drivers/mtd/nand/sh_flctl.c            |    4 +-
 include/linux/mtd/nand.h               |   11 +++---
 15 files changed, 89 insertions(+), 70 deletions(-)

-- 
1.7.5.4.2.g519b1
