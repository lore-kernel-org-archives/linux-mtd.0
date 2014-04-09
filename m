Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXzmm-0003wy-Jk
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 21:11:58 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <ggrahammoore@gmail.com>
Subject: Re: [PATCH] Add support for flag status register on Micron chips
Date: Wed, 9 Apr 2014 20:31:20 +0200
References: <1396973570-13995-1-git-send-email-grmoore@altera.com>
 <20140409110933.GS11339@book.gsilab.sittig.org>
 <CA+iBjpSRftzK+eQEqtxEr+t7YNgZneB=WyJHhOkVA8Rd4SPiPg@mail.gmail.com>
In-Reply-To: <CA+iBjpSRftzK+eQEqtxEr+t7YNgZneB=WyJHhOkVA8Rd4SPiPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404092031.20439.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Insop Song <insop.song@gainspeed.com>,
 "grmoore@altera.com" <grmoore@altera.com>, Gerhard Sittig <gsi@denx.de>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 Yves Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 at 08:14:49 PM, Graham Moore wrote:
> On Wed, Apr 9, 2014 at 6:09 AM, Gerhard Sittig <gsi@denx.de> wrote:
> > On Wed, 2014-04-09 at 12:03 +0200, Marek Vasut wrote:
> >> On Tuesday, April 08, 2014 at 06:12:49 PM, grmoore@altera.com wrote:
> >> > From: Graham Moore <grmoore@altera.com>
> >> > 
> >> > This is a slightly different version of the patch that Insop Song
> >> > submitted
> >> > (http://marc.info/?i=201403012022.10111.marex%20()%20denx%20!%20de).
> >> > 
> >> > I talked to Insop, and he agreed I should submit this patch as a
> >> > follow-on to his.
> >> > 
> >> > This patch uses a flag in the m25p_ids[] array to determine which
> >> > chips need to use the FSR (Flag Status Register).
> >> > 
> >> > Rationale for using the FSR:
> >> > 
> >> > The Micron data sheets say we have to do this, at least for the
> >> > multi-die 512M and 1G parts (n25q512 and n25q00).  In practice, if we
> >> > don't check the FSR for program/erase status, and we rely solely on
> >> > the status register (SR), then we get corrupted data in the flash.
> 
> [...]
> 
> >> > Micron told us (Altera) that for multi-die chips based on the 65nm
> >> > 256MB die, we need to check the SR first, then check the FSR, which
> >> > is why the wait_for_fsr_ready function does that.  Future chips based
> >> > on 45 nm 512MB die will use the FSR only.
> > 
> > This sounds to me similar to polling the NAND's R/B pin until the
> > operation has completed, to then fetch the STATUS byte to
> > determine the execution's result.  Does this sound plausible?
> > For NOR, do you poll for the "busy" condition to deassert, and
> > check for success then?
> 
> Sounds plausible to me.  We poll the SR until not busy, then poll the
> FSR until it's not busy.  Success is when FSR busy is deasserted
> within the timeout.
> 
> Micron said we have to read the FSR "at least once", so we don't
> read it once for every die or anything like that.  I ran a quick
> test, and for both the 2-die and 4-die parts, the FSR shows not busy
> on the first read after SR not busy.

I'd love to know how this FSR-not-busy is exactly related to SR-not-busy, but I 
guess only Micron can tell :-/

Best regards,
Marek Vasut
