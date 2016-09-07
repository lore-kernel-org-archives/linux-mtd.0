Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhVyE-0004St-Gj
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 06:04:27 +0000
Message-ID: <1473228233.30217.32.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Matt Weber
 <matthew.weber@rockwellcollins.com>
Cc: Ronak Desai <ronak.desai@rockwellcollins.com>,
 linux-mtd@lists.infradead.org, prabhakar.kushwaha@nxp.com
Date: Wed, 07 Sep 2016 01:03:53 -0500
In-Reply-To: <20160906215003.1b6eb095@bbrezillon>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-09-06 at 21:50 +0200, Boris Brezillon wrote:
> On Tue,  6 Sep 2016 14:13:17 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> 
> > 
> > This patch adds random output enable command support in IFC nand
> > controller driver. This command implements change read
> > column (05h-E0h).
> > 
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> > ---
> >  drivers/mtd/nand/fsl_ifc_nand.c | 30 +++++++++++++++++++++++++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c
> > b/drivers/mtd/nand/fsl_ifc_nand.c
> > index 4e9e5fd..230919f 100644
> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > @@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd,
> > unsigned int command,
> >  
> >  		/*
> >  		 * although currently it's 8 bytes for READID, we always
> > read
> > -		 * the maximum 256 bytes(for PARAM)
> > +		 * the maximum 8192 bytes(for PARAM) supported by IFC
> > controller
> > +		 * as extended page may be available for some NAND
> > devices.
> >  		 */
> > -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> > -		ifc_nand_ctrl->read_bytes = 256;
> > +		ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole
> > page */
> > +		ifc_nand_ctrl->read_bytes = 8192; /* Maximum supported
> > page by IFC */

Are you sure that reading 8192 bytes will work if the configured page size is
smaller?

> And this exactly why letting drivers implement their own ->cmdfunc()
> method is a bad idea.
> ->cmdfunc() does not provide enough information to guess how much data
> should be read or written. Actually it's not supposed to be used this
> way, but drivers usually abuse it.

It would be even uglier if we used the standard nand_command_lp() and had to
abuse cmd_ctrl() instead. :-P

The current NAND driver interface is too low level for controllers that expose
higher level interfaces.  If we can't/shouldn't replace cmdfunc() then we need
to replace the things that call cmdfunc().  Yes, we probably should have
pushed for a better interface back then rather than just "making it work"...

> I know you're just adding support for a new feature here, and I don't
> blame you, but this kind of things make the whole NAND framework
> impossible to maintain.
> 
> > 
> >  
> >  		set_addr(mtd, 0, 0, 0);
> >  		fsl_ifc_run_command(mtd);
> > @@ -530,6 +531,29 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd,
> > unsigned int command,
> >  		fsl_ifc_run_command(mtd);
> >  		return;
> >  
> > +	case NAND_CMD_RNDOUT: {
> > +		__le16 Tccs = 0;
> > +		chip->onfi_version ? (Tccs = chip->onfi_params.t_ccs)
> > +					: (Tccs = chip-
> > >jedec_params.t_ccs);

Please don't put assignments inside a conditional.  An if-statement would work
just fine here.

> > +		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
> > +				(IFC_FIR_OP_CA0 <<
> > IFC_NAND_FIR0_OP1_SHIFT) |
> > +				(IFC_FIR_OP_CMD1 <<
> > IFC_NAND_FIR0_OP2_SHIFT) |
> > +				(IFC_FIR_OP_NWAIT <<
> > IFC_NAND_FIR0_OP3_SHIFT),
> > +				&ifc->ifc_nand.nand_fir0);
> > +
> > +		ifc_out32((NAND_CMD_RNDOUT << IFC_NAND_FCR0_CMD0_SHIFT) |
> > +				(NAND_CMD_RNDOUTSTART <<
> > IFC_NAND_FCR0_CMD1_SHIFT),
> > +				&ifc->ifc_nand.nand_fcr0);
> > +
> > +		/* Wait for minimum change column set-up time. But it
> > does not harm
> > +		 * to wait more time, so calculated based on 333.3 MHz
> > input IFC clock
> > +		 */
> Can't you know the clk rate at runtime instead of basing your
> calculation on the hypothetic clk rate?

If we really need to know the clock rate, we could add a clocks property to
the IFC node.  But we haven't needed to deal with clocking anywhere else in
this driver, so I'm not too happy about introducing it for this.  In
particular, I don't think we should be sending a real RNDOUT command at the
device here -- it breaks the model of self-contained operations.  The read
command is over and the chipselect has been dropped (do all ONFI chips support
"CE don't care"?).  If the new offset (plus size to be read) fits within the
page buffer, we could just adjust ifc_nand_ctrl->index to the desired
location.

OTOH, if we need to read parameter data beyond the size of the page buffer,
then we'd need to send another read command (possibly from read_buf)... or we
can do the sane thing and introduce an interface function to read a certain
number of parameter bytes from a certain offset.  Which we should do anyway if
we want to move in the direction of a better interface with less cmdfunc
abuse.

> 
> > +		ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc-
> > >ifc_nand.ncfgr);
> Why is it done in ->cmdfunc()? I mean, this timing parameter should be
> set for all operations, and applied as soon as ->select_chip() is
> called.

select_chip() is a no-op[1].  IFC normally handles the delays internally when
running a command sequence.

-Scott

[1]  In any case, this is the time between RNDOUT and reading the data, not
the time between asserting the chipselect and issuing a command -- and I don't
see other drivers doing a delay in select_chip().
