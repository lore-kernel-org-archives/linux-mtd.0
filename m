Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOnb0-0008Qz-FX
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 16:39:56 +0000
Date: Tue, 12 Dec 2017 17:39:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Greg Cook <greg@morpheus.ws>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@free-electrons.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
Message-ID: <20171212173930.2c0fab08@bbrezillon>
In-Reply-To: <CAAEAJfDweETzJ-nrwV2gqsF6tr5GjPDYGeK0jxBG4zs=8k3U8Q@mail.gmail.com>
References: <20171212083826.5000-1-greg@morpheus.ws>
 <20171212142033.5b19efec@bbrezillon>
 <CAAEAJfDweETzJ-nrwV2gqsF6tr5GjPDYGeK0jxBG4zs=8k3U8Q@mail.gmail.com>
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

On Tue, 12 Dec 2017 13:29:11 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 12 December 2017 at 10:20, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi Greg,
> >
> > Could you at least Cc the NAND maintainer when you submit something
> > related to NAND!
> >
> > On Tue, 12 Dec 2017 16:38:26 +0800
> > Greg Cook <greg@morpheus.ws> wrote:
> >
> > Please add a commit message explaining what your fixing.
> >  
> >> Signed-off-by: Greg Cook <greg@morpheus.ws>
> >> ---
> >>  drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> >> index 021374f..cfa8c71 100644
> >> --- a/drivers/mtd/nand/pxa3xx_nand.c
> >> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> >> @@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
> >>
> >>  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
> >>  {
> >> -     if (info->ecc_bch) {
> >> +     if (info->use_ecc && info->ecc_bch) {
> >>               u32 val;
> >>               int ret;
> >>
> >> @@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
> >>
> >>               if (info->cur_chunk < info->nfullchunks) {
> >>                       info->step_chunk_size = info->chunk_size;
> >> -                     info->step_spare_size = info->spare_size;
> >> +                     if (info->use_ecc) {
> >> +                             info->step_spare_size = info->spare_size;
> >> +                     } else {
> >> +                             info->step_spare_size = info->spare_size
> >> +                                                     + info->ecc_size;
> >> +                     }  
> >
> > Curly braces are unneeded, and I'd prefer to have the + operator at the
> > end of the line. Or it could be written like that:
> >
> >                         info->step_spare_size = info->spare_size;
> >                         if (!info->use_ecc)
> >                                 info->step_spare_size += info->ecc_size;
> >
> > Anyway, I'm still not convince this is the appropriate fix. As
> > mentioned in my previous, I wonder why we're not activating ECC when
> > reading OOB bytes. There's a good reason for having 2 different hooks
> > to read/write OOBs: one is doing it in raw mode (with the ECC engine
> > disabled), the other one is doing it with the ECC engine enabled.
> > This driver not only omit raw accessors (which is already a bad news
> > for everyone that needs to debug the driver) but it also do things
> > differently for OOB and page access: OOB bytes are read in raw mode
> > while pages are always accessed with the ECC engine enabled.
> >
> > OOB accesses are broken and should be fixed, I think we all agree on
> > that, but we should fix it correctly, don't you think?
> > And by correctly, I mean we should try to make things consistent at
> > least (read OOB bytes with the ECC engine enabled).
> >  
> >>               } else {
> >>                       info->step_chunk_size = info->last_chunk_size;
> >>                       info->step_spare_size = info->last_spare_size;  
> >
> > Can you try with the below patch and see if it fixes the timeout issue?
> >  
> 
> Well, the patch may very well fix the timeout, but it's not really
> reading any OOB.
> 
> Like I said in my previous mail, accessing the OOB doesn't
> work when ECC is enabled. This is specified in the specs,
> copying from the Armada 370 spec:
> 
> """
> 14.4.1
> Error Checking and Correction (ECC)
> [..] When ECC is enabled, the number of spare area bytes required for use by
> ECC are shown in the middle column of Table 30. These bytes are not
> available for use by the
> system software and cannot be written to or read from.
> """
> 
> I seriously doubt you are reading valid data with this change.

That's not true. Reading ECC bytes is impossible when the ECC engine
is enable, reading free OOB bytes is possible, and most of the time the
caller doesn't care about ECC bytes when asking for a non-raw OOB
access.

Actually, it's even better to read the free OOB bytes with ECC enabled
because they are ECC protected, so if you have bitflips in the free
OOB section they will be fixed or reported as uncorrectable.
