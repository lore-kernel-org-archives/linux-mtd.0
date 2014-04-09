Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpPv-0004Dk-TK
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 10:07:47 +0000
From: Marek Vasut <marex@denx.de>
To: grmoore@altera.com
Subject: Re: [PATCH] Add support for flag status register on Micron chips
Date: Wed, 9 Apr 2014 12:03:24 +0200
References: <1396973570-13995-1-git-send-email-grmoore@altera.com>
In-Reply-To: <1396973570-13995-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091203.24956.marex@denx.de>
Cc: ggrahammoore@gmail.com, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Gerhard Sittig <gsi@denx.de>,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, April 08, 2014 at 06:12:49 PM, grmoore@altera.com wrote:
> From: Graham Moore <grmoore@altera.com>
> 
> This is a slightly different version of the patch that Insop Song
> submitted
> (http://marc.info/?i=201403012022.10111.marex%20()%20denx%20!%20de).
> 
> I talked to Insop, and he agreed I should submit this patch as a follow-on
> to his.
> 
> This patch uses a flag in the m25p_ids[] array to determine which chips
> need to use the FSR (Flag Status Register).
> 
> Rationale for using the FSR:
> 
> The Micron data sheets say we have to do this, at least for the multi-die
> 512M and 1G parts (n25q512 and n25q00).  In practice, if we don't check
> the FSR for program/erase status, and we rely solely on the status
> register (SR), then we get corrupted data in the flash.

I talked to Gerhard yesterday and he told me there is something like that on 
ONFI NAND. I think I now understand why that new register is in-place. 
Apparently, in the ONFI NAND case, there is a READY and TRUE-READY signal and 
one of those reflects that _all_ the dies have finished their operation. This is 
in my opinion seriously misdesigned as it breaks any kind of backward 
compatibility.

> Micron told us (Altera) that for multi-die chips based on the 65nm 256MB
> die, we need to check the SR first, then check the FSR, which is why the
> wait_for_fsr_ready function does that.  Future chips based on 45 nm 512MB
> die will use the FSR only.

Can these SPI flash makers screw the design even more? OT: Why don't we have a 
single standard for all the SF chips which won't need all these crappy quirks 
:-(

Best regards,
Marek Vasut
