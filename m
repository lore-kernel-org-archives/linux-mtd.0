Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SqvAh-0007RE-M7
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 23:57:48 +0000
Date: Tue, 17 Jul 2012 01:57:42 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 7/8] mtd: nand_bbt: use string library
Message-ID: <20120716235742.GC10244@parrot.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
 <20120626163738.14201df3@pixies.home.jungo.com>
 <CAN8TOE9GmFmsdOhJTVsBhaiU1VELcTA3UbgfyPkbSigbbM9FHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAN8TOE9GmFmsdOhJTVsBhaiU1VELcTA3UbgfyPkbSigbbM9FHQ@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, Sukumar Ghorai <s-ghorai@ti.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 16, 2012 at 08:06:31AM +0200, Brian Norris wrote:
> Add Ivan, as omap2.c is one of the only NAND_BBT_SCANEMPTY users.
> 
> On Tue, Jun 26, 2012 at 6:37 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
> > On Fri, 22 Jun 2012 16:35:44 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> >>  static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
> >>  {
> >> -     int i, end = 0;
> >> +     int end = 0;
> >>       uint8_t *p = buf;
> >>
> >>       if (td->options & NAND_BBT_NO_OOB)
> >>               return check_pattern_no_oob(buf, td);
> >>
> >>       end = paglen + td->offs;
> >> -     if (td->options & NAND_BBT_SCANEMPTY) {
> >> -             for (i = 0; i < end; i++) {
> >> -                     if (p[i] != 0xff)
> >> -                             return -1;
> >> -             }
> >> -     }
> >> +     if (td->options & NAND_BBT_SCANEMPTY)
> >> +             if (memchr_inv(p, 0xff, end))
> >> +                     return -1;
> >>       p += end;
> >>
> >
> > A question regarding the original code:
> 
> This is another instance of a NAND_BBT_* option that I don't really
> understand, but I'll provide my thoughts...
> 
> > Why the region validated for 0xff is [0 , paglen+td->of) ?
> > I assume this buffer region contains the inband data. Why verify inband
> > data is all 0xff?
> 
> If used on a flash-based BBT page, then it checks for an empty table
> (why would you need this?), and if used for factory-marked bad blocks,
> then it checks that all the non-marker locations are 0xff. I guess the
> latter is at least more reasonable, but that still doesn't really
> answer "why?" So I'm guessing this another ill-conceived option.
> 
> > Shouldn't the region validated be [paglen , paglen+td->of) ?
> 
> Dunno.
> 
> Anyway, it's only used in a single driver (omap2.c) in
> "bb_descrip_flashbased" which, despite its name, does not use a
> flash-based BBT - also used in "agand_flashbased". So the option is
> *only* used for OOB bad block markers, ensuring that the non-marker
> positions are 0xff. But I don't see how it's valid to assume that the
> data will be 0xff, nor do I know why someone would want to check that.
> 
> Finally, I think that some of the "use" of NAND_BBT_SCANEMPTY is
> obscured by the fact that omap2.c's main codepath involves
> (permanently) clearing NAND_BBT_SCANEMPTY in nand_memory_bbt(). See:
> bd->options &= ~NAND_BBT_SCANEMPTY;
> 
> So, is this another candidate for removal, as it is practically unused
> and unmaintained? Or any comments on its purpose, Ivan?

Hi Brian,

I haven't really had a detailed look at this bbt structure while writing my ECC patches.
I think it is indeed a candidate for removal.

My guess is that a specific OOB layout compatible with the OMAP ROM ECC was added at some point,
and this legacy bbt structure found its way into the same commit... ?

Since omap2.c also disables bbt scan in omap_nand_probe():
      info->nand.options    |= NAND_SKIP_BBTSCAN;
I guess it does not really make a difference ?

Adding Sukumar Ghorai in CC, as he introduced this in f040d33253b2daf6f305fc35fca2399047ced028:

    omap3: nand: making ecc layout as compatible with romcode ecc
    
    This patch overrides nand ecc layout and bad block descriptor (for 8-bit
    device) to support hw ecc in romcode layout. So as to have in sync with ecc
    layout throughout; i.e. x-loader, u-boot and kernel.
    
    This enables to flash x-loader, u-boot, kernel, FS images from kernel itself
    and compatiable with other tools.
    
    This patch does not enables this feature by default and need to pass from
    board file to enable for any board.

Ghorai, do you remember why option NAND_BBT_SCANEMPTY is used ?
Thanks,

BR,
-- 
Ivan
