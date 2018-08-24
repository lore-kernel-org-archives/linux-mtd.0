Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ftDsA-0005PM-94
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 15:19:40 +0000
Date: Fri, 24 Aug 2018 17:19:26 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali: do not pass zero maxchips to
 nand_scan()
Message-ID: <20180824171926.2e3af016@bbrezillon>
In-Reply-To: <CAK7LNAQwqkhSkGK6vpFTvxd_ppdMpQzMY-C4ZJgaVMuzEA_b3w@mail.gmail.com>
References: <1534839799-14112-1-git-send-email-yamada.masahiro@socionext.com>
 <20180824145519.330133a4@bbrezillon>
 <CAK7LNAQwqkhSkGK6vpFTvxd_ppdMpQzMY-C4ZJgaVMuzEA_b3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 25 Aug 2018 00:04:43 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 2018-08-24 21:55 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> > Hi Masahiro,
> >
> > On Tue, 21 Aug 2018 17:23:19 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> Commit 49aa76b16676 ("mtd: rawnand: do not execute nand_scan_ident()
> >> if maxchips is zero") gave a new meaning for calling nand_scan_ident()
> >> with maxchips=0.
> >>
> >> It is a special usage for some drivers such as docg4, but in fact
> >> the Denali driver may pass maxchips=0 to nand_scan() when the driver
> >> is enabled but no NAND chip is found on the board for some reasons.
> >>
> >> If nand_scan_with_ids() is called with maxchips=0, nand_scan_ident()
> >> is skipped, i.e. nand_set_defaults() is skipped.  Therefore, the
> >> driver must have set chip->controller beforehand.  Otherwise,
> >> nand_attach() causes NULL pointer dereference.
> >>
> >> In fact, the Denali controller knows the number of connected chips
> >> before calling nand_scan_ident(); if DEVICE_RESET fails, there is no
> >> chip in that chip select.  Then, denali_reset_banks() sets the maxchips
> >> to the number of detected chips.  If no chip is found, it is zero.
> >>
> >> The reason of this trick was, as commit f486287d2372 ("mtd: nand:
> >> denali: fix bank reset function to detect the number of chips")
> >> explained, nand_scan_ident() issued Set Features (0xEF) command
> >> to all CS lines, some of which may not be connected with a chip.
> >> Then, the driver would wait until R/B# response, which never happens.
> >>
> >> This problem was solved by commit 107b7d6a7ad4 ("mtd: rawnand: avoid
> >> setting again the timings to mode 0 after a reset").  In the current
> >> code, nand_setup_data_interface() is called from nand_scan_tail(),
> >> which is after the chip detection is done.
> >>
> >> Remove the code that is causing NULL pointer dereference.  Now, the
> >> maxchips passed to nand_scan() is the maximum number of chip selects
> >> supported by the IP (typically 4 or 8).  Leave all the chip detection
> >> process to nand_scan_ident().
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> ---
> >>
> >>  drivers/mtd/nand/raw/denali.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> >> index ca18612..3e4b8e1 100644
> >> --- a/drivers/mtd/nand/raw/denali.c
> >> +++ b/drivers/mtd/nand/raw/denali.c
> >> @@ -1086,7 +1086,6 @@ static void denali_reset_banks(struct denali_nand_info *denali)
> >>       }
> >>
> >>       dev_dbg(denali->dev, "%d chips connected\n", i);
> >> -     denali->max_banks = i;  
> >
> > Shouldn't we instead avoid calling nand_scan() when
> > denali->max_banks=0? I mean, what's the point of calling this function
> > if you know for sure it will fail.  
> 
> 
> Right.  If no chip is found, it should error out with -ENODEV or something.
> 
> 
> 
> > Last question: do we still need this denali_reset_banks()? If it's only
> > about resetting the chip to detect how many are actually present,
> > that's already done by nand_scan().  
> 
> I thought this too.
> 
> Please give me time to answer this question.
> I need to check the datasheet and test on my boards.
> 
> If I can remove denali_reset_banks() entirely,
> it would be the best.

I'd like the fix to be as simple as possible, so that I can queue it
for -rc2. Please consider the solution where nand_scan() is skipped
when denali->max_banks=0 first. We can then decide to remove
denali_reset_banks() if that's appropriate.

Thanks,

Boris
