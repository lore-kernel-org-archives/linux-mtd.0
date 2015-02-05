Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJRQR-00063Y-Na
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 18:45:16 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so11758700pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 10:44:53 -0800 (PST)
From: Jim Kuo <jimtingkuo@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 Huang Shijie <b32955@freescale.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] m25p80, spi-nor: Add SFDP detect method for Macronix chips
Date: Fri,  6 Feb 2015 02:44:03 +0800
Message-Id: <1423161845-24282-1-git-send-email-jimtingkuo@gmail.com>
Cc: Jim Kuo <jimtingkuo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi linux-pm,

The serial flash discoverable parameters (SFDP) is needed to
spi nor devices for some specific features. I added some sfdp
structure and detect method. I have separated the chip IDs and
sfdp detect method to two patches.

Patch 1 (m25p80, spi-nor: Update id list of Macronix chips)
mainly updates the id table to support Macronix chips. Patch 2
includes the main sfdp functions and Macronix commands.

The code have been tested on lower version Linux and can
successfully work with Macronix chips.

Thanks for review!

Jim Kuo (2):
  m25p80, spi-nor: Update id list of Macronix chips
  spi-nor: Add SFDP detect method

 drivers/mtd/devices/m25p80.c  |  83 ++++-
 drivers/mtd/spi-nor/Kconfig   |  11 +
 drivers/mtd/spi-nor/spi-nor.c | 774 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h   | 201 +++++++++++
 4 files changed, 1009 insertions(+), 60 deletions(-)

-- 
1.9.1
