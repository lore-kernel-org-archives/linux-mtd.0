Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0y54-000101-U2
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 22:28:13 +0000
Date: Thu, 20 Apr 2017 00:27:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170420002748.5c76c9b9@bbrezillon>
In-Reply-To: <20170419221507.GA24914@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd>
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

On Thu, 20 Apr 2017 00:15:07 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > > We have some problems with fsl_ifc_nand ... in the old kernels, but
> > > this one does not seem to be fixed in v4.11, either.
> > > 
> > > UBIFS complains:
> > > 
> > > UBIFS error (pid 931): ubifs_scan: corrupt empty space at LEB 282:252630
> > > UBIFS error (pid 931): ubifs_scanned_corruption: corruption at LEB 282:252630
> > > UBIFS error (pid 931): ubifs_scanned_corruption: first 1322 bytes from LEB 282:252630
> > > UBIFS error (pid 931): ubifs_scan: LEB 282 scanning failed
> > > 
> > > Possible explanation is here:
> > > 
> > > https://e2e.ti.com/support/dsp/davinci_digital_media_processors/f/716/t/289605
> > > 
> > > # I see on the forum that this issue has been raised before - my
> > > # understanding is that the omap2 nand driver does not perform ECC
> > > # detection/correction on empty pages so when UBIFS checks the empty
> > > # space data and doesn't read all 0xFF then it fails and mounts
> > > # read-only. I didn't find any good solution - only a workaround to
> > > # remove the UBIFS check..
> > > 
> > > So I checked fsl_ifc_nand.c in v4.11-rc, and yes, it seems to have the
> > > same problem:
> > > 
> > > 			if (errors == 15) {
> > > 	                        /*
> > >                                  * Uncorrectable error.
> > >                                  * OK only if the whole page is blank.
> > >                                  *
> > >                                  * We disable ECCER reporting due to...
> > >                                  * erratum IFC-A002770 -- so report it now if we
> > >                                  * see an uncorrectable error in ECCSTAT.
> > >                                  */
> > >                                 if (!is_blank(mtd, bufnum))
> > >                                         ctrl->nand_stat |=
> > >                                                 IFC_NAND_EVTER_STAT_ECCER;
> > >                                 break;
> > >                         }
> > > 
> > > is_blank() checks for all 0xff's, so single-bit 0xfe in the data will
> > > result in_blank() == 0 and uncorrectable error being signaled.
> > > 
> > > Should the driver be modified somehow?  
> > 
> > Yep, nand_check_erased_ecc_chunk() [1] is here to help you check this
> > case, unfortunately, it's not directly applicable here, because this
> > function takes regular pointers and not __iomem ones. You'll either
> > have to copy the data in an intermediate buffer before calling
> > nand_check_erased_ecc_chunk(), or cast the SRAM region to a void
> > pointer (which is usually not a good idea). The last option would be to
> > open code nand_check_erased_ecc_chunk(), but I'd really like to avoid
> > that (for maintainability concerns).  
> 
> Ok, thanks a lot for the pointer, that should be doable.
> 
> Core of the code is:
> 
> 1357         for (; len >= sizeof(long);
> 1358              len -= sizeof(long), bitmap += sizeof(long)) {
> 1359                 weight = hweight_long(*((unsigned long
> *)bitmap));
> 1360                 bitflips += BITS_PER_LONG - weight;
> 1361                 if (unlikely(bitflips > bitflips_threshold))
> 1362                         return -EBADMSG;
> 1363         }
> 
> Someone clearly optimized this code (took care to do long accesses
> etc), but afaict hweight is quite a heavy operation:
> 
> _GLOBAL(__arch_hweight32)
> BEGIN_FTR_SECTION
>         b __sw_hweight32
>         nop
>         nop
>         nop
>         nop
> 	nop
> 	nop
> FTR_SECTION_ELSE
>   BEGIN_FTR_SECTION_NESTED(51)
> 	PPC_POPCNTB(R3,R3)
> 	srdi    r4,r3,16
>         add     r3,r4,r3
>         srdi    r4,r3,8
> 	add     r3,r4,r3
> 	clrldi  r3,r3,64-8
> 	blr
>   FTR_SECTION_ELSE_NESTED(51)
> 	PPC_POPCNTW(R3,R3)
> 	clrldi  r3,r3,64-8
> 	blr
>   ALT_FTR_SECTION_END_NESTED_IFCLR(CPU_FTR_POPCNTD, 51)
> ALT_FTR_SECTION_END_IFCLR(CPU_FTR_POPCNTB)
> EXPORT_SYMBOL(__arch_hweight32)
> 
> Would it make sense to only do hweight if *bitmap != ~0ULL ? Would it
> make sense to only check for bitflips > bitflips_threshold each 128
> bytes or something like that?

I didn't go as far as you did and simply assumed hweight32/64() were
already optimized. Feel free to propose extra improvements.
