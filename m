Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhm7w-0003V1-Fv
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 23:19:33 +0000
Message-ID: <1473290339.30217.78.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>, linux-mtd@lists.infradead.org,
 prabhakar.kushwaha@nxp.com, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 07 Sep 2016 18:18:59 -0500
In-Reply-To: <20160907092257.77915c23@bbrezillon>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
 <20160907092257.77915c23@bbrezillon>
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

On Wed, 2016-09-07 at 09:22 +0200, Boris Brezillon wrote:
> Hi Scott,
> 
> On Wed, 07 Sep 2016 01:03:53 -0500
> Scott Wood <oss@buserror.net> wrote:
> 
> > 
> > On Tue, 2016-09-06 at 21:50 +0200, Boris Brezillon wrote:
> > > 
> > > On Tue,  6 Sep 2016 14:13:17 -0500
> > > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> > >   
> > > > 
> > > > 
> > > > This patch adds random output enable command support in IFC nand
> > > > controller driver. This command implements change read
> > > > column (05h-E0h).
> > > > 
> > > > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > > > Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> > > > ---
> > > >  drivers/mtd/nand/fsl_ifc_nand.c | 30 +++++++++++++++++++++++++++---
> > > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c
> > > > b/drivers/mtd/nand/fsl_ifc_nand.c
> > > > index 4e9e5fd..230919f 100644
> > > > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > > > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > > > @@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info
> > > > *mtd,
> > > > unsigned int command,
> > > >  
> > > >  		/*
> > > >  		 * although currently it's 8 bytes for READID, we
> > > > always
> > > > read
> > > > -		 * the maximum 256 bytes(for PARAM)
> > > > +		 * the maximum 8192 bytes(for PARAM) supported by IFC
> > > > controller
> > > > +		 * as extended page may be available for some NAND
> > > > devices.
> > > >  		 */
> > > > -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> > > > -		ifc_nand_ctrl->read_bytes = 256;
> > > > +		ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole
> > > > page */
> > > > +		ifc_nand_ctrl->read_bytes = 8192; /* Maximum
> > > > supported
> > > > page by IFC */  
> > Are you sure that reading 8192 bytes will work if the configured page size
> > is
> > smaller?
> I'm pretty sure it will, but you will either get garbage or have the
> same content duplicated in your buffer.

Or the controller might ignore the upper bits in the byte count, or exhibit
other undefined behavior.  The manual doesn't explicitly address it but
telling the controller to load data into a region of the buffer that has no
SRAM backing it up seems like a bad thing.  Even if it seems to "work fine"
when tested. :-P

Plus, if we properly limit this based on the buffer configuration, we'd get an
error message if we try to read beyond the end of the buffer, rather than
silently getting garbage.  Another option is to temporarily configure the
buffer for 8K pages when reading param data.

> > > And this exactly why letting drivers implement their own ->cmdfunc()
> > > method is a bad idea.  
> > > ->cmdfunc() does not provide enough information to guess how much data  
> > > should be read or written. Actually it's not supposed to be used this
> > > way, but drivers usually abuse it.  
> > It would be even uglier if we used the standard nand_command_lp() and had
> > to
> > abuse cmd_ctrl() instead. :-P
> Well, I can't say, I haven't read the whole driver. But I've been said
> so many times that ->cmd_ctrl() was not a good solution and in the end
> it appeared to be untrue (you don't necessarily have to issue the CMD
> and ADDR cycles right away, you can cache them and send the whole
> sequence once the command parameter is CMD_NONE).
> 
> Anyway, the problem is not really whether ->cmd_ctrl() should be used
> instead of ->cmdfunc() here. The thing is, you're doing the I/Os in a
> place where you don't know how many bytes should be retrieved.

Right.  Normally there's a reasonable upper bound (read the whole page, and
don't allow subpage writes) but it's not obvious with param data.

> > The current NAND driver interface is too low level for controllers that
> > expose
> > higher level interfaces.
> That's for sure.
> 
> > 
> > If we can't/shouldn't replace cmdfunc() then we need
> > to replace the things that call cmdfunc().  Yes, we probably should have
> > pushed for a better interface back then rather than just "making it
> > work"...
> No, let's not add more random hacks.

I'm not suggesting "random hacks".  I'm suggesting a higher level interface
based on complete NAND operations.

>  I was just complaining because I
> see more and more drivers implementing their own ->cmdfunc() and adding
> this kind of hacks.
> Most of them can implement ->cmd_ctrl() and rely on the default
> nand_command_lp(), but I agree that some controllers do not fit in this
> model.
> 
> For these ones, I was planning to provide a ->send_op(chip, nand_op)
> method, where nand_op would contain both the CMD, ADDR cycles and
> the data transfer.

I was thinking more along the lines of specific operations (similar to
read_page but without the preceding cmdfunc)...  A generic "send_op" might
work, though I'm curious about the details of how nand_op gets encoded, and am
worried that it might still result in NAND drivers interpreting specific
commands rather than passing things through in a generic way (and then things
can break if common code sends something new).

> > > Can't you know the clk rate at runtime instead of basing your
> > > calculation on the hypothetic clk rate?  
> > If we really need to know the clock rate, we could add a clocks property
> > to
> > the IFC node.  But we haven't needed to deal with clocking anywhere else
> > in
> > this driver, so I'm not too happy about introducing it for this.
> Will the base clk always be running at the same rate on all designs? To
> me, it sounds a bit risky to do this assumption, but maybe I'm wrong.

There are timing registers that the bootloader is supposed to set
appropriately.

> > In
> > particular, I don't think we should be sending a real RNDOUT command at
> > the
> > device here -- it breaks the model of self-contained operations.  The read
> > command is over and the chipselect has been dropped (do all ONFI chips
> > support
> > "CE don't care"?).  If the new offset (plus size to be read) fits within
> > the
> > page buffer, we could just adjust ifc_nand_ctrl->index to the desired
> > location.
> It should be supported (releasing the CE after the PARAM command and
> then sending a RNDOUT), but who knows what NAND vendors decide to
> implement.
> 
> > 
> > 
> > OTOH, if we need to read parameter data beyond the size of the page
> > buffer,
> > then we'd need to send another read command (possibly from read_buf)... or
> > we
> > can do the sane thing and introduce an interface function to read a
> > certain
> > number of parameter bytes from a certain offset.
> No please, do not add any complex logic in read_buf() (like resending a
> NAND cmd from there), it will just make the whole thing worst.

I agree.  I was pointing out where the road we're currently on leads, to
demonstrate why we need to do something different.

> > 
> > Which we should do anyway if
> > we want to move in the direction of a better interface with less cmdfunc
> > abuse.
> Not really. Ideally, ->read_buf() should just launch the I/O transfer
> (same for ->write_buf()), nothing more. It shouldn't have to test which
> command was sent before and adapt its behavior.

"Which we should do anyway" refers to "or we can do the sane thing and
introduce an interface function...", not to complicating read_buf.

> Now, I know that some controllers are not able to dissociate the
> CMD/ADDR cycles from the DATA transfers, which is why a new interface
> is needed.

In theory we could separate them but not without dropping CE.  Some NAND data
sheets I have indicate that support for that is an optional feature, and we do
have some older NAND chips being used by this driver.  In any case we'd be
fighting against the way the controller was intended to be used, and we'd be
adding more CPU overhead to wake up after the command has been issued but
before the transfer has begun.

> > > > +		ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc-  
> > > > > 
> > > > > ifc_nand.ncfgr);  
> > > Why is it done in ->cmdfunc()? I mean, this timing parameter should be
> > > set for all operations, and applied as soon as ->select_chip() is
> > > called.  
> > select_chip() is a no-op[1].
> Maybe it is in your implementation, but this is where you should have
> all the CHIP specific settings (switching from one NAND chip to another
> requires adapting the timing, setting a new CS line, ...).
> The what the sunxi_nand driver is doing if you want an example where
> the driver is tweaking the timing config at chip selection time.
>
> > IFC normally handles the delays internally when
> > running a command sequence.
> Same for a lot of controllers out there, but that doesn't prevent you
> from configuring the timings (on the controller side) when a chip is
> selected.
> 
> Note that ->select_chip() is not implying that you assert the CE line,
> it's here to inform your controller driver that the core wants to
> interact with a different NAND chip. What's done in there is completely
> controller dependent.
[snip]
> It's not about applying the delay in ->select_chip() it's about
> configuring the chip specific timings on the controller side. I guess
> the first byte of the ncfgr register is always encoding the tCCS
> timing, not something different depending on the command that is sent.
> If that's the case, then you don't need to reconfigure the register
> each time you send the RNDOUT command, only once, when you activate a
> chip.
> 
> But again, I don't know this controller, so I might be wrong.

This controller has separate timing registers for each chipselect.  Each
chipselect maps to a struct mtd_info.  We don't support multiple chips per
mtd_info.

NCFGR[NUM_WAIT] is an exception to this -- it's an arbitrary delay that can be
requested via the FIR NWAIT opcode (this patch is the the first usage of NWAIT
in the driver).  It doesn't have any meaning outside of a particular FIR
sequence that uses NWAIT.

I suppose we could use select_chip() to write the NAND_CSEL register instead
of doing it in fsl_ifc_run_command()...  This driver was patterned after the
eLBC driver, where writing the register that sets the chipselect also triggers
the operation to start.

-Scott
