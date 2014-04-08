Received: from mail-by2on0123.outbound.protection.outlook.com
 ([207.46.100.123] helo=na01-by2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXYez-0008NI-19
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 16:14:06 +0000
From: <grmoore@altera.com>
To: <ggrahammoore@gmail.com>
Subject: [PATCH] Add support for flag status register on Micron chips   
Date: Tue, 8 Apr 2014 11:12:49 -0500
Message-ID: <1396973570-13995-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Marek Vasut <marex@denx.de>,
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

From: Graham Moore <grmoore@altera.com>

This is a slightly different version of the patch that Insop Song
submitted (http://marc.info/?i=201403012022.10111.marex%20()%20denx%20!%20de).

I talked to Insop, and he agreed I should submit this patch as a follow-on to his.

This patch uses a flag in the m25p_ids[] array to determine which chips need
to use the FSR (Flag Status Register).

Rationale for using the FSR:

The Micron data sheets say we have to do this, at least for the multi-die 512M 
and 1G parts (n25q512 and n25q00).  In practice, if we don't check the FSR 
for program/erase status, and we rely solely on the status register (SR), 
then we get corrupted data in the flash.

Micron told us (Altera) that for multi-die chips based on the 65nm 256MB
die, we need to check the SR first, then check the FSR, which is why the 
wait_for_fsr_ready function does that.  Future chips based on 45 nm 512MB die 
will use the FSR only.              

Thanks.

Graham Moore (1):
  Add support for flag status register on Micron chips.

 drivers/mtd/devices/m25p80.c |   94 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 14 deletions(-)

-- 
1.7.10.4
