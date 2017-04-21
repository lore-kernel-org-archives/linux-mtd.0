Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d1XIo-0003Jl-2O
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 12:04:44 +0000
Date: Fri, 21 Apr 2017 14:04:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Dipen.Dudhat@freescale.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170421140419.6da8073f@bbrezillon>
In-Reply-To: <20170421100813.GA4332@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd>
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

On Fri, 21 Apr 2017 12:08:13 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> (Added driver author to the cc list, maybe he can help).
> 
> > > Hi!
> > > 
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
> Ok, took a look. __iomem is part of a problem, another part is that
> nand_check_erased_ecc_chunk() needs to actually write back 0xff's to
> undo the corruption, which would probably be bad idea to do in the
> iomem, and next one is that blank actually checks arbitrary number of
> regions, based on ecc.layout.
> 
> So this could be used to simplify the code (if nand_check_erased_buf
> was exported; it is not), but it does not fix the problem as we still
> need to undo the corruption.

Actually, there was a good reason for not directly exporting this
buffer (see Brian's comment here [1]), and I don't think we should start
exporting it. This and the fact that passing an iomem pointer sounds
like a bad idea makes me think you should modify the driver to put the
data in a buffer when you want to check for bitflips in erased pages.

> 
> Hints welcome, especially if you know right place where to put this
> checking.

Just had a quick look at the driver, and it seems like you could move
things around to check for bitflips in erased pages after you've copied
the data in the user buffer (in fsl_ifc_read_page()).

> 
> (BTW, switching to ecc.mode = ECC_SOFT will cause compatibility
> problems but should make the problem go away, right?) 

Nope, I don't think switching to ECC_SOFT is the right solution here.

Regards,

Boris

[1]https://patchwork.ozlabs.org/patch/509970/
