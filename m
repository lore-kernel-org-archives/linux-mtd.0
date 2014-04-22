Received: from mail-bn1on0139.outbound.protection.outlook.com
 ([157.56.110.139] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcbJ3-0001QA-Bu
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 14:04:20 +0000
From: Graham Moore <grmoore@altera.com>
To: <ggrahammoore@gmail.com>
Subject: [PATCH V3] Add support for flag status register on Micron chips.
Date: Tue, 22 Apr 2014 09:03:15 -0500
Message-ID: <1398175396-7560-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ZY - marex <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Graham Moore <grmoore@altera.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I rebased this patch onto the l2-mtd spinor branch.  Sorry it took so long, had to patch for our SoC, corporate network issues, etc.

The change to read the flag status register is, afaik, specific to Micron chips.  So, imo, the fsr ready check should be in the m25p80.c file.  But I put it into the spin-nor.c file, because I need to call the read_sr() function, which is declared static in spi-nor.c.

I *could* duplicate the read_sr code and put the wait_till_fsr_ready in m25p80, but I'm pretty sure that would attract some critique :)  Suggestions most welcome.

I also used n25q512ax3 for the id because there are two part numbers for the 512MB part with FSR, n25q512a13 and n25qa512a83.  The '83' version has a reset line.

Graham Moore (1):
  Add support for flag status register on Micron chips.

 drivers/mtd/spi-nor/spi-nor.c |   51 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |    4 ++++
 2 files changed, 55 insertions(+)

-- 
1.7.9.5
