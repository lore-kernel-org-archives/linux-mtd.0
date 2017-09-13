Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ds7nX-0001G9-Nb
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 13:33:50 +0000
Date: Wed, 13 Sep 2017 15:33:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [DEBUG] mtd: spi-nor: dump DWORDs of the Basic Flash Parameter
 Table
Message-ID: <20170913153305.6cf50c4f@bbrezillon>
In-Reply-To: <CAMuHMdXu4zWRev4nTnAfnAqwrZwDRwF3cuC_qEYr96q=C6osZw@mail.gmail.com>
References: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
 <20170907185456.4631-1-cyrille.pitchen@wedev4u.fr>
 <e9e925ab-e543-23fd-a738-a9ce433de713@wedev4u.fr>
 <CAMuHMdVgdLt5yhgJnDamcMDUv+-JhLEuO9Gj3trmXZwPhhP2tg@mail.gmail.com>
 <20170912151236.33c5ad8f@bbrezillon>
 <CAMuHMdXu4zWRev4nTnAfnAqwrZwDRwF3cuC_qEYr96q=C6osZw@mail.gmail.com>
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

Adding back original recipients (you seem to have trimmed the Cc-list).

Hi Geert,

On Tue, 12 Sep 2017 15:29:23 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Tue, Sep 12, 2017 at 3:12 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Mon, 11 Sep 2017 10:58:36 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> >> On Thu, Sep 7, 2017 at 9:28 PM, Cyrille Pitchen
> >> <cyrille.pitchen@wedev4u.fr> wrote:  
> >> >> Can you apply this patch on your tree then report me what was printed, please?
> >> >> I have an idea of the root cause of your issue then a potential work-around
> >> >> but I first need to validate my assumption to confirm that the work-around
> >> >> would actually work.  
> >>
> >> +m25p80 spi0.0: DWORD1 = 0xffffffff
> >> +m25p80 spi0.0: DWORD2 = 0xffffffff
> >> +m25p80 spi0.0: DWORD3 = 0xffffffff
> >> +m25p80 spi0.0: DWORD4 = 0xffffffff
> >> +m25p80 spi0.0: DWORD5 = 0xffffffff
> >> +m25p80 spi0.0: DWORD6 = 0xffffffff
> >> +m25p80 spi0.0: DWORD7 = 0xffffffff
> >> +m25p80 spi0.0: DWORD8 = 0xffffffff
> >> +m25p80 spi0.0: DWORD9 = 0xffffffff
> >> +m25p80 spi0.0: DWORD10 = 0x00000000
> >> +m25p80 spi0.0: DWORD11 = 0x00000000
> >> +m25p80 spi0.0: DWORD12 = 0x00000000
> >> +m25p80 spi0.0: DWORD13 = 0x00000000
> >> +m25p80 spi0.0: DWORD14 = 0x00000000
> >> +m25p80 spi0.0: DWORD15 = 0x00000000
> >> +m25p80 spi0.0: DWORD16 = 0x00000000
> >> +m25p80 spi0.0: BFPT version 1.0 (length = 9)
> >>  
> >> > If you could also dump the value of the 'addr' argument of
> >> > spi_nor_read_sfdp_dma_unsafe() just before the for () loop below in the
> >> > very same function. Actually, I suspect the SFDP tables of your SPI NOR  
> >>
> >> +m25p80 spi0.0: addr = 0x448
> >>  
> >> > memory sample to have been programmed with invalid values, neither
> >> > compliant with the JEDEC JESD216 specification nor with the Cypress
> >> > datasheet for this memory part.  
> >>
> >> Sounds plausible.
> >> I get the same values when disabling DMA, so it's not due to bad DMA handling.
> >> All Renesas boards I have local or remote access to have spansion,s25fl512s.  
> >
> > Can you try with the following patch?  
> 
> Thanks, that fixes it:
> 
> -m25p80 spi0.0: s25fl512s (0 Kbytes)
> +m25p80 spi0.0: s25fl512s (65536 Kbytes)
>  3 ofpart partitions found on MTD device spi0.0
>  Creating 3 MTD partitions on "spi0.0":
>  0x000000000000-0x000000080000 : "loader"
> -mtd: partition "loader" is out of reach -- disabled
>  0x000000080000-0x000000600000 : "user"
> -mtd: partition "user" is out of reach -- disabled
>  0x000000600000-0x000004000000 : "flash"
> -mtd: partition "flash" is out of reach -- disabled
> 
> BTW, perhaps the driver should print a warning, so the user knows his
> FLASH isn't SFDP compliant?

Yep, but I'll let Cyrille fix this aspect in a follow-up patch since
I'm not sure how specific the error message should be (a generic
"failed to read/decode SFDP" error or something more specific for each
error case).

> 
> > --->8---  
> > From 000ff63fdb149d87d755483f5edc0aba010da6b4 Mon Sep 17 00:00:00 2001
> > From: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Date: Tue, 12 Sep 2017 15:10:35 +0200
> > Subject: [PATCH] mtd: spi-nor: Check consistency of the memory size extracted
> >  from the SFDP
> >
> > One field of the flash parameter table contains information about the
> > flash device size.
> > Most of the time the data extracted from this field is valid, but
> > sometimes the BFPT section of the SFDP table is corrupted or invalid and
> > this field is set to 0xffffffff, thus resulting in an integer overflow
> > when setting params->size.
> >
> > Since NOR devices are anayway always smaller than 2^64 bytes, we can
> > easily stop the BFPT parsing if the size reported in this table is
> > invalid.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm just waiting for a review from Cyrille or Marek and if they are okay
I'll queue both patches to l2-mtd and send a PR to Linus (hopefully
before -rc1 is out).

Thanks for your help with this bug.

Regards,

Boris
