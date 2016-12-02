Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCihY-0000Ge-FT
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 07:56:14 +0000
Date: Fri, 2 Dec 2016 08:55:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH 15/39] mtd: nand: denali: improve readability of
 handle_ecc()
Message-ID: <20161202085545.16042bcb@bbrezillon>
In-Reply-To: <CAK7LNARTE9z=mb6jA9RU-tvZOOedQDTjjqeSanp-yyOoo78xpg@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-16-git-send-email-yamada.masahiro@socionext.com>
 <20161127164235.6ad93fab@bbrezillon>
 <CAK7LNARTE9z=mb6jA9RU-tvZOOedQDTjjqeSanp-yyOoo78xpg@mail.gmail.com>
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

On Fri, 2 Dec 2016 13:26:27 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2016-11-28 0:42 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> >> +                     if (err_byte < ECC_SECTOR_SIZE) {
> >> +                             struct mtd_info *mtd =
> >> +                                     nand_to_mtd(&denali->nand);
> >> +                             int offset;
> >> +
> >> +                             offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
> >> +                                     denali->devnum + err_device;
> >> +                             /* correct the ECC error */
> >> +                             buf[offset] ^= err_correction_value;
> >> +                             mtd->ecc_stats.corrected++;
> >> +                             bitflips++;  
> >
> > Hm, bitflips is what is set in max_bitflips, and apparently the
> > implementation (which is not yours) is not doing what the core expects.
> >
> > You should first count bitflips per sector with something like that:
> >
> >                                 bitflips[err_sector]++;
> >
> >
> > And then once you've iterated over all errors do:
> >
> >         for (i = 0; i < nsectors; i++)
> >                 max_bitflips = max(bitflips[err_sector], max_bitflips);  
> 
> 
> I see.
> 
> For soft ECC fixup, we can calculate bitflips
> for each ECC sector, so I can fix the max_bitflips
> as the core framework expects.
> 
> For hard ECC fixup, the register only reports
> the number of corrected bit-flips
> in the whole page (sum from all ECC sectors).
> We cannot calculate max_bitflips, I think.
> 

That's unfortunate. This means you'll return -EUCLEAN more quickly
(which will trigger UBI eraseblock move), since the NAND framework is
basing its 'too many bitflips' detection logic on the max_bitflips per
ECC chunk and the bitflips threshold (by default 3/4 of the ECC
strength).

That doesn't mean it won't work, you'll just wear your NAND more
quickly :-(.

ITOH, doing max_bitflips = nbitflips / nsteps is not good either,
because the bitflips might be all concentrated in the same ECC chunk,
and in this case you really want to return -EUCLEAN.

> 
> 
> BTW, I noticed another problem of the current code.
> 
>       buf[offset] ^= err_correction_value;
>       mtd->ecc_stats.corrected++;
>       bitflips++;
> 
> This code is counting the number of corrected bytes,
> not the number of corrected bits.
> 
> 
> I think multiple bit-flips within one byte can happen.

Yes.

> 
> 
> Perhaps, we should add
> 
>   hweight8(buf[offset] ^ err_correction_value)
> 
> to ecc_stats.corrected and bitflips.
> 

Looks good.
