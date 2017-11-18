Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
 ([18.194.220.216] helo=sysam.it)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eGC2Y-0005Sz-1K
 for linux-mtd@lists.infradead.org; Sat, 18 Nov 2017 22:56:48 +0000
Date: Sat, 18 Nov 2017 23:56:15 +0100
From: Angelo Dureghello <angelo@sysam.it>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
Subject: Re: [PATCH v2] mtd: spi-nor: add support for ISSI is25lp128
Message-ID: <20171118225615.sdvwbvii5daz664s@jerusalem>
References: <20171116190950.odsscmakabyi26cc@jerusalem>
 <429524c9-8534-fcef-5d5c-133eb4cb468d@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <429524c9-8534-fcef-5d5c-133eb4cb468d@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Fri, Nov 17, 2017 at 06:10:05PM +0100, Cyrille Pitchen wrote:
> Hi Angelo,
> 
> Le 16/11/2017 à 20:09, Angelo Dureghello a écrit :
> > Add support for ISSI is25lp128 spi nor flash.
> > 
> > Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 19c000722cbc..88cd10a0ee9e 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
> >  
> >  	/* ISSI */
> >  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> > +	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256, SECT_4K) },
> 
> I've checked both datasheets for is25cd512 and is25lp128 because I was
> surprised to see different manufacturer IDs in the JEDEC IDs: I suspected
> some mistake in one of the two entries above.
> 
> Then I found this old discussion on patchwork:
> https://patchwork.ozlabs.org/patch/581017/
> 
> I looked closer at the is25cd512 datasheet and actually I confirmed that it
> is stated that the manufacturer ID is received as the 2nd data byte after
> the 9Fh op code. So both entries are correct and this is not a bug of the
> is25cd512 memory part: it is documented so it is a feature, right?
> 

Yes. I believe the reason for this is that is25cd512 was originally a
PMC-Sierra device so a different silicon design approach from ISSI.
ISSI bought PMC so i am supposing ISSI maintained the jedec id "way"
as it was for convenience and for back-compatibility.

> Anyway, I plan to add another patch on top of yours just to add a comment
> otherwise it might not be the last time that someone is puzzled with this
> quirk.
>
Sure, fine.
 
> Then back to your patch, is25lp128's datasheet states that this memory
> parts support the Fast Read 1-1-2 (Dual Output), the Fast Read 1-4-4 (Quad
> I/O) but strangely not the Fast Read 1-1-4 (Quad Output). Also I see that
> the Read SFDP (5Ah) op code is supported too.
> So could you please add the SPI_NOR_DUAL_READ flag but _not_ the
> SPI_NOR_QUAD_READ flag in your new entry for is25lp128 ?
> 
> Indeed, currently at least one of the two SPI_NOR_{DUAL|QUAD}_READ flags is
> needed to enabled the parsing of SFDP tables and I would like this parsing
> to be enabled for this memory part since its datasheet claims that SFDP is
> supported. Right now, this is the only mean to allow using SPI 1-4-4 with
> SPI controllers that support this SPI protocol too.
> 

Sure. Will send in short a v3 patch with SPI_NOR_DUAL_READ.
I cannot test quad mode right now, since my hardware here (the
mainlined arch/m68k/coldfire/stmark2 board) is wired as simple spi.
But i believe the flag cannot harm in anyway until someone can test it.

> Best regards,
> 
> Cyrille
> 

Thanks,
Best regards,
Angelo Dureghello


> >  
> >  	/* Macronix */
> >  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> > 
> 
