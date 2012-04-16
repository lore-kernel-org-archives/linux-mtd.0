Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJuXU-0001pG-93
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 22:36:53 +0000
Received: by pbcun4 with SMTP id un4so7486560pbc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Apr 2012 15:36:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
Date: Mon, 16 Apr 2012 15:35:53 -0700
Message-Id: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
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

I made a proposal to change the nand_chip and nand_ecc_ctrl interfaces a few
weeks ago to address a problem I see with a new NAND controller I'm working
with. This new controller does not return OOB data easily when performing page
reads/writes. However, currently these interfaces assume that OOB data is
read/written to/from the nand_chip.oob_poi buffer, even when the high-level
user did not request OOB data. I need to break that assumption with my NAND
driver, and so I have developed the following changes to the NAND interfaces
(see patch descriptions for more info).

You can see the original proposal and a little discussion here:

  http://lists.infradead.org/pipermail/linux-mtd/2012-March/040441.html

Note that I could not compile all the affected drivers, since some required
ARCH-specific builds that I am not familiar with.

Artem: can you perform your regular compile tests? I compile-tested as many as
I could.

Others: if you care about your driver, please compile test and review to be
sure I'm doing things safely for you. Because most in-kernel drivers seem to be
perfecly happy using nand_chip.oob_poi for OOB data unconditionally, I have not
struggled to port most of them to take advantage of this full change. However,
I might make an attempt eventually, if I can get the proper amount of review
support. I cannot test most of these drivers properly, and so I *need* your
reviewing and testing to prevent breakage.

Thanks for reviewing!

Brian

Brian Norris (2):
  mtd: nand: add OOB argument to NAND {read,write}_page interfaces
  mtd: nand: nand_do_{read,write}_ops - pass OOB buffer through

 drivers/mtd/nand/atmel_nand.c          |    7 +-
 drivers/mtd/nand/bcm_umi_bch.c         |   10 ++-
 drivers/mtd/nand/bcm_umi_nand.c        |    2 +-
 drivers/mtd/nand/bf5xx_nand.c          |    4 +-
 drivers/mtd/nand/cafe_nand.c           |   26 ++++---
 drivers/mtd/nand/denali.c              |    8 +-
 drivers/mtd/nand/docg4.c               |   12 ++--
 drivers/mtd/nand/fsl_elbc_nand.c       |    7 +-
 drivers/mtd/nand/fsl_ifc_nand.c        |    4 +-
 drivers/mtd/nand/fsmc_nand.c           |    3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    5 +-
 drivers/mtd/nand/nand_base.c           |  131 ++++++++++++++++++--------------
 drivers/mtd/nand/pxa3xx_nand.c         |    4 +-
 drivers/mtd/nand/sh_flctl.c            |    4 +-
 include/linux/mtd/nand.h               |   11 ++-
 15 files changed, 132 insertions(+), 106 deletions(-)

-- 
1.7.5.4.2.g519b1
