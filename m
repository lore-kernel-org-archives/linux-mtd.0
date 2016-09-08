Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhsLJ-0006X2-Ps
 for linux-mtd@lists.infradead.org; Thu, 08 Sep 2016 05:57:47 +0000
Date: Thu, 8 Sep 2016 07:57:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Scott Wood <oss@buserror.net>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>, linux-mtd@lists.infradead.org,
 prabhakar.kushwaha@nxp.com, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Marc Gonzalez
 <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
Message-ID: <20160908075708.4014aef3@bbrezillon>
In-Reply-To: <1473290339.30217.78.camel@buserror.net>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
 <20160907092257.77915c23@bbrezillon>
 <1473290339.30217.78.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 07 Sep 2016 18:18:59 -0500
Scott Wood <oss@buserror.net> wrote:

> On Wed, 2016-09-07 at 09:22 +0200, Boris Brezillon wrote:
> > Hi Scott,
> >=20
> > On Wed, 07 Sep 2016 01:03:53 -0500
> > Scott Wood <oss@buserror.net> wrote:
> >  =20
> > >=20
> > > On Tue, 2016-09-06 at 21:50 +0200, Boris Brezillon wrote: =20
> > > >=20
> > > > On Tue,=C2=A0=C2=A06 Sep 2016 14:13:17 -0500
> > > > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> > > > =C2=A0=C2=A0 =20
> > > > >=20
> > > > >=20
> > > > > This patch adds random output enable command support in IFC nand
> > > > > controller driver. This command implements change read
> > > > > column (05h-E0h).
> > > > >=20
> > > > > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > > > > Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> > > > > ---
> > > > > =C2=A0drivers/mtd/nand/fsl_ifc_nand.c | 30 ++++++++++++++++++++++=
+++++---
> > > > > =C2=A01 file changed, 27 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c
> > > > > b/drivers/mtd/nand/fsl_ifc_nand.c
> > > > > index 4e9e5fd..230919f 100644
> > > > > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > > > > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > > > > @@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info
> > > > > *mtd,
> > > > > unsigned int command,
> > > > > =C2=A0
> > > > > =C2=A0		/*
> > > > > =C2=A0		=C2=A0* although currently it's 8 bytes for READID, we
> > > > > always
> > > > > read
> > > > > -		=C2=A0* the maximum 256 bytes(for PARAM)
> > > > > +		=C2=A0* the maximum 8192 bytes(for PARAM) supported by IFC
> > > > > controller
> > > > > +		=C2=A0* as extended page may be available for some NAND
> > > > > devices.
> > > > > =C2=A0		=C2=A0*/
> > > > > -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> > > > > -		ifc_nand_ctrl->read_bytes =3D 256;
> > > > > +		ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole
> > > > > page */
> > > > > +		ifc_nand_ctrl->read_bytes =3D 8192; /* Maximum
> > > > > supported
> > > > > page by IFC */=C2=A0=C2=A0 =20
> > > Are you sure that reading 8192 bytes will work if the configured page=
 size
> > > is
> > > smaller? =20
> > I'm pretty sure it will, but you will either get garbage or have the
> > same content duplicated in your buffer. =20
>=20
> Or the controller might ignore the upper bits in the byte count, or exhib=
it
> other undefined behavior. =C2=A0The manual doesn't explicitly address it =
but
> telling the controller to load data into a region of the buffer that has =
no
> SRAM backing it up seems like a bad thing. =C2=A0Even if it seems to "wor=
k fine"
> when tested. :-P

I think there was a misunderstanding here. I was talking about the NAND
chip behavior, not the NAND controller.

>=20
> Plus, if we properly limit this based on the buffer configuration, we'd g=
et an
> error message if we try to read beyond the end of the buffer, rather than
> silently getting garbage. =C2=A0Another option is to temporarily configur=
e the
> buffer for 8K pages when reading param data.
>=20
> > > > And this exactly why letting drivers implement their own ->cmdfunc()
> > > > method is a bad idea.=C2=A0=C2=A0 =20
> > > > ->cmdfunc() does not provide enough information to guess how much d=
ata=C2=A0=C2=A0 =20
> > > > should be read or written. Actually it's not supposed to be used th=
is
> > > > way, but drivers usually abuse it.=C2=A0=C2=A0 =20
> > > It would be even uglier if we used the standard nand_command_lp() and=
 had
> > > to
> > > abuse cmd_ctrl() instead. :-P =20
> > Well, I can't say, I haven't read the whole driver. But I've been said
> > so many times that ->cmd_ctrl() was not a good solution and in the end
> > it appeared to be untrue (you don't necessarily have to issue the CMD
> > and ADDR cycles right away, you can cache them and send the whole
> > sequence once the command parameter is CMD_NONE).
> >=20
> > Anyway, the problem is not really whether ->cmd_ctrl() should be used
> > instead of ->cmdfunc() here. The thing is, you're doing the I/Os in a
> > place where you don't know how many bytes should be retrieved. =20
>=20
> Right. =C2=A0Normally there's a reasonable upper bound (read the whole pa=
ge, and
> don't allow subpage writes) but it's not obvious with param data.

And PARAM is not this only problem. I'm working with MLC NANDs which
implement private commands where you are asked to read/write a random
amount of bytes. If you read or write more, it won't necessarily work.

>=20
> > > The current NAND driver interface is too low level for controllers th=
at
> > > expose
> > > higher level interfaces. =20
> > That's for sure.
> >  =20
> > >=20
> > > If we can't/shouldn't replace cmdfunc() then we need
> > > to replace the things that call cmdfunc(). =C2=A0Yes, we probably sho=
uld have
> > > pushed for a better interface back then rather than just "making it
> > > work"... =20
> > No, let's not add more random hacks. =20
>=20
> I'm not suggesting "random hacks". =C2=A0I'm suggesting a higher level in=
terface
> based on complete NAND operations.

Okay, then we are on the same page.

>=20
> >  I was just complaining because I
> > see more and more drivers implementing their own ->cmdfunc() and adding
> > this kind of hacks.
> > Most of them can implement ->cmd_ctrl() and rely on the default
> > nand_command_lp(), but I agree that some controllers do not fit in this
> > model.
> >=20
> > For these ones, I was planning to provide a ->send_op(chip, nand_op)
> > method, where nand_op would contain both the CMD, ADDR cycles and
> > the data transfer. =20
>=20
> I was thinking more along the lines of specific operations (similar to
> read_page but without the preceding cmdfunc)...

I'm curious. What did you have in mind? Adding a new ->do_xxx() each
time a NAND needs a new CMD/ADDR/DATA sequence? So we'll start with
->read_param_page(), which is rather generic. But what about all those
private commands that are not generic at all. I don't think it's
reasonable to ask the NAND controller to implement all these methods.

> A generic "send_op" might
> work, though I'm curious about the details of how nand_op gets encoded, a=
nd am
> worried that it might still result in NAND drivers interpreting specific
> commands rather than passing things through in a generic way (and then th=
ings
> can break if common code sends something new).

If drivers end up doing that, this means we failed providing an
interface that is suitable for everyone.
But, from what I've seen in other drivers, it's usually just about
setting the first and second cmd cyles, specifying the address cycles
(and the number of cycles) and then the amount of data to transfer +
the direction.

There are some controllers that only understand high level commands,
and for these ones we are just screwed (the conversion from raw
commands to high-level ones is inevitable). But most controllers
support both modes, and for management operations like retrieving the
param page or setting onfi params, we don't really care about
optimizations that could be done in the controller logic when using the
high-level commands.

Where we really care is in the read_page/write_page path, and this path
already provides dedicated callbacks. This only thing that is missing
is a way to tell the core that ->cmdfunc() should not be called.
Actually, I proposed this solution to Marc (adding a flagging to
chip->options to tell the core not to send the READ_START commands), and
it seems to work.

Now, for the 'administration' operations, where we do not care about
performances, I keep thinking that implementing ->cmd_ctrl() and relying
on the default nand_command{,_lp}() implementations (or, if we introduce
this ->send_op() method, directly relying on ->send_op()) is saner.

>=20
> > > > Can't you know the clk rate at runtime instead of basing your
> > > > calculation on the hypothetic clk rate?=C2=A0=C2=A0 =20
> > > If we really need to know the clock rate, we could add a clocks prope=
rty
> > > to
> > > the IFC node. =C2=A0But we haven't needed to deal with clocking anywh=
ere else
> > > in
> > > this driver, so I'm not too happy about introducing it for this. =20
> > Will the base clk always be running at the same rate on all designs? To
> > me, it sounds a bit risky to do this assumption, but maybe I'm wrong. =
=20
>=20
> There are timing registers that the bootloader is supposed to set
> appropriately.

Okay. So you don't want to adapt these timings dynamically. I
understand.

>=20
> > > In
> > > particular, I don't think we should be sending a real RNDOUT command =
at
> > > the
> > > device here -- it breaks the model of self-contained operations. =C2=
=A0The read
> > > command is over and the chipselect has been dropped (do all ONFI chips
> > > support
> > > "CE don't care"?). =C2=A0If the new offset (plus size to be read) fit=
s within
> > > the
> > > page buffer, we could just adjust ifc_nand_ctrl->index to the desired
> > > location. =20
> > It should be supported (releasing the CE after the PARAM command and
> > then sending a RNDOUT), but who knows what NAND vendors decide to
> > implement.
> >  =20
> > >=20
> > >=20
> > > OTOH, if we need to read parameter data beyond the size of the page
> > > buffer,
> > > then we'd need to send another read command (possibly from read_buf).=
.. or
> > > we
> > > can do the sane thing and introduce an interface function to read a
> > > certain
> > > number of parameter bytes from a certain offset. =20
> > No please, do not add any complex logic in read_buf() (like resending a
> > NAND cmd from there), it will just make the whole thing worst. =20
>=20
> I agree. =C2=A0I was pointing out where the road we're currently on leads=
, to
> demonstrate why we need to do something different.
>=20
> > >=20
> > > Which we should do anyway if
> > > we want to move in the direction of a better interface with less cmdf=
unc
> > > abuse. =20
> > Not really. Ideally, ->read_buf() should just launch the I/O transfer
> > (same for ->write_buf()), nothing more. It shouldn't have to test which
> > command was sent before and adapt its behavior. =20
>=20
> "Which we should do anyway" refers to "or we can do the sane thing and
> introduce an interface function...", not to complicating read_buf.
>=20
> > Now, I know that some controllers are not able to dissociate the
> > CMD/ADDR cycles from the DATA transfers, which is why a new interface
> > is needed. =20
>=20
> In theory we could separate them but not without dropping CE. =C2=A0Some =
NAND data
> sheets I have indicate that support for that is an optional feature, and =
we do
> have some older NAND chips being used by this driver. =C2=A0In any case w=
e'd be
> fighting against the way the controller was intended to be used, and we'd=
 be
> adding more CPU overhead to wake up after the command has been issued but
> before the transfer has begun.

Well, as I said above, it's not about getting best perfs for this kind
of operations. It's only happening once at init time. As I said, the
whole NAND framework has become unmaintainable for this very reason.
Say one solder a new NAND on a new board. It's not guaranteed to work,
because the controller might not support some of important functions in
its ->cmdfunc() implementation.
And each time we want to add a new NAND operation, we have to go over
all drivers and check if it's supported. That's really a pain.

I'd prefer to have all drivers implement a generic method to send any
kind of CMD/ADDR/DATA sequence, and then have a few methods for
operations where perfs really matters (read/write_page()).

>=20
> > > > > +		ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc-=C2=A0=C2=A0 =20
> > > > > >=20
> > > > > > ifc_nand.ncfgr);=C2=A0=C2=A0 =20
> > > > Why is it done in ->cmdfunc()? I mean, this timing parameter should=
 be
> > > > set for all operations, and applied as soon as ->select_chip() is
> > > > called.=C2=A0=C2=A0 =20
> > > select_chip() is a no-op[1]. =20
> > Maybe it is in your implementation, but this is where you should have
> > all the CHIP specific settings (switching from one NAND chip to another
> > requires adapting the timing, setting a new CS line, ...).
> > The what the sunxi_nand driver is doing if you want an example where
> > the driver is tweaking the timing config at chip selection time.
> > =20
> > > IFC normally handles the delays internally when
> > > running a command sequence. =20
> > Same for a lot of controllers out there, but that doesn't prevent you
> > from configuring the timings (on the controller side) when a chip is
> > selected.
> >=20
> > Note that ->select_chip() is not implying that you assert the CE line,
> > it's here to inform your controller driver that the core wants to
> > interact with a different NAND chip. What's done in there is completely
> > controller dependent. =20
> [snip]
> > It's not about applying the delay in ->select_chip() it's about
> > configuring the chip specific timings on the controller side. I guess
> > the first byte of the ncfgr register is always encoding the tCCS
> > timing, not something different depending on the command that is sent.
> > If that's the case, then you don't need to reconfigure the register
> > each time you send the RNDOUT command, only once, when you activate a
> > chip.
> >=20
> > But again, I don't know this controller, so I might be wrong. =20
>=20
> This controller has separate timing registers for each chipselect. =C2=A0=
Each
> chipselect maps to a struct mtd_info. =C2=A0We don't support multiple chi=
ps per
> mtd_info.
>=20
> NCFGR[NUM_WAIT] is an exception to this -- it's an arbitrary delay that c=
an be
> requested via the FIR NWAIT opcode (this patch is the the first usage of =
NWAIT
> in the driver). =C2=A0It doesn't have any meaning outside of a particular=
 FIR
> sequence that uses NWAIT.

Okay, that answers my question. Thanks.

>=20
> I suppose we could use select_chip() to write the NAND_CSEL register inst=
ead
> of doing it in fsl_ifc_run_command()... =C2=A0This driver was patterned a=
fter the
> eLBC driver, where writing the register that sets the chipselect also tri=
ggers
> the operation to start.

That's fine. Just keep the existing logic for now.

Regards,

Boris
