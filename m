Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wend5-0001wn-A9
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 15:38:03 +0000
Received: by mail-pd0-f172.google.com with SMTP id w10so5852819pde.17
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 08:37:41 -0700 (PDT)
Date: Mon, 28 Apr 2014 23:37:32 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Graham Moore <ggrahammoore@gmail.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
Message-ID: <20140428153728.GA2020@localhost.localdomain>
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <201404260012.24311.marex@denx.de>
 <20140426031011.GA4811@localhost.localdomain>
 <201404280706.18068.marex@denx.de>
 <20140428070602.GA29525@localhost>
 <CA+iBjpS9gstvippLHzm_Tpgxx19VxnRzWEwi_tJV5d7+snnfWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+iBjpS9gstvippLHzm_Tpgxx19VxnRzWEwi_tJV5d7+snnfWg@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Yves Vandervennet <rocket.yvanderv@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Graham Moore <grmoore@altera.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Insop Song <insop.song@gainspeed.com>, David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2014 at 09:22:58AM -0500, Graham Moore wrote:
> On Mon, Apr 28, 2014 at 2:06 AM, Huang Shijie <b32955@freescale.com> wrote:
> > On Mon, Apr 28, 2014 at 07:06:17AM +0200, Marek Vasut wrote:
> >>
> >> Two things competing over the same pointer looks misdesigned to me. I will need
> >> to dig into this one more time ...
> > Please refer to the code for NAND chip, the nand_get_flash_type() :
> >
> > -----------------------------------------------------------
> >         /* Do not replace user supplied command function! */
> >         if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
> >                 chip->cmdfunc = nand_command_lp;
> > -----------------------------------------------------------
> >
> > It uses the same logic:
> >         " Do not replace user supplied command function!"
> >
> > thanks
> > Huang Shijie
> 
> I would like to set the @wait_till_ready in m25p80.c, because the
> USE_FSR flag is only for Micron chips.  But the m25p80 driver doesn't
m25p80.c is not the right place. 

we should put these code in the spi-nor.c

thanks
Huang Shijie
