Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhXCe-0005CM-Cj
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 07:23:26 +0000
Date: Wed, 7 Sep 2016 09:22:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Scott Wood <oss@buserror.net>
Cc: Matt Weber  <matthew.weber@rockwellcollins.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>, linux-mtd@lists.infradead.org,
 prabhakar.kushwaha@nxp.com, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
Message-ID: <20160907092257.77915c23@bbrezillon>
In-Reply-To: <1473228233.30217.32.camel@buserror.net>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
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

Hi Scott,

On Wed, 07 Sep 2016 01:03:53 -0500
Scott Wood <oss@buserror.net> wrote:

> On Tue, 2016-09-06 at 21:50 +0200, Boris Brezillon wrote:
> > On Tue,=C2=A0=C2=A06 Sep 2016 14:13:17 -0500
> > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> >  =20
> > >=20
> > > This patch adds random output enable command support in IFC nand
> > > controller driver. This command implements change read
> > > column (05h-E0h).
> > >=20
> > > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > > Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> > > ---
> > > =C2=A0drivers/mtd/nand/fsl_ifc_nand.c | 30 ++++++++++++++++++++++++++=
+---
> > > =C2=A01 file changed, 27 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c
> > > b/drivers/mtd/nand/fsl_ifc_nand.c
> > > index 4e9e5fd..230919f 100644
> > > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > > @@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mt=
d,
> > > unsigned int command,
> > > =C2=A0
> > > =C2=A0		/*
> > > =C2=A0		=C2=A0* although currently it's 8 bytes for READID, we always
> > > read
> > > -		=C2=A0* the maximum 256 bytes(for PARAM)
> > > +		=C2=A0* the maximum 8192 bytes(for PARAM) supported by IFC
> > > controller
> > > +		=C2=A0* as extended page may be available for some NAND
> > > devices.
> > > =C2=A0		=C2=A0*/
> > > -		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
> > > -		ifc_nand_ctrl->read_bytes =3D 256;
> > > +		ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole
> > > page */
> > > +		ifc_nand_ctrl->read_bytes =3D 8192; /* Maximum supported
> > > page by IFC */ =20
>=20
> Are you sure that reading 8192 bytes will work if the configured page siz=
e is
> smaller?

I'm pretty sure it will, but you will either get garbage or have the
same content duplicated in your buffer.

>=20
> > And this exactly why letting drivers implement their own ->cmdfunc()
> > method is a bad idea. =20
> > ->cmdfunc() does not provide enough information to guess how much data =
=20
> > should be read or written. Actually it's not supposed to be used this
> > way, but drivers usually abuse it. =20
>=20
> It would be even uglier if we used the standard nand_command_lp() and had=
 to
> abuse cmd_ctrl() instead. :-P

Well, I can't say, I haven't read the whole driver. But I've been said
so many times that ->cmd_ctrl() was not a good solution and in the end
it appeared to be untrue (you don't necessarily have to issue the CMD
and ADDR cycles right away, you can cache them and send the whole
sequence once the command parameter is CMD_NONE).

Anyway, the problem is not really whether ->cmd_ctrl() should be used
instead of ->cmdfunc() here. The thing is, you're doing the I/Os in a
place where you don't know how many bytes should be retrieved.

If we stick to the ->cmdfunc() + ->{read,write}_buf() model (which is
definitely inappropriate for most controllers), the data transfer should
be done in ->{read,write}_buf() (where you have the size information).

Actually, the PXA driver is doing pretty much the same thing as you do,
and I remember that they had to tweak the size they were reading in
->cmdfunc() because the core decided to read more data at some point.

>=20
> The current NAND driver interface is too low level for controllers that e=
xpose
> higher level interfaces.

That's for sure.

> If we can't/shouldn't replace cmdfunc() then we need
> to replace the things that call cmdfunc(). =C2=A0Yes, we probably should =
have
> pushed for a better interface back then rather than just "making it work"=
...

No, let's not add more random hacks. I was just complaining because I
see more and more drivers implementing their own ->cmdfunc() and adding
this kind of hacks.
Most of them can implement ->cmd_ctrl() and rely on the default
nand_command_lp(), but I agree that some controllers do not fit in this
model.

For these ones, I was planning to provide a ->send_op(chip, nand_op)
method, where nand_op would contain both the CMD, ADDR cycles and
the data transfer.

>=20
> > I know you're just adding support for a new feature here, and I don't
> > blame you, but this kind of things make the whole NAND framework
> > impossible to maintain.
> >  =20
> > >=20
> > > =C2=A0
> > > =C2=A0		set_addr(mtd, 0, 0, 0);
> > > =C2=A0		fsl_ifc_run_command(mtd);
> > > @@ -530,6 +531,29 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd,
> > > unsigned int command,
> > > =C2=A0		fsl_ifc_run_command(mtd);
> > > =C2=A0		return;
> > > =C2=A0
> > > +	case NAND_CMD_RNDOUT: {
> > > +		__le16 Tccs =3D 0;
> > > +		chip->onfi_version ? (Tccs =3D chip->onfi_params.t_ccs)
> > > +					: (Tccs =3D chip- =20
> > > >jedec_params.t_ccs); =20
>=20
> Please don't put assignments inside a conditional. =C2=A0An if-statement =
would work
> just fine here.
>=20
> > > +		ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
> > > +				(IFC_FIR_OP_CA0 <<
> > > IFC_NAND_FIR0_OP1_SHIFT) |
> > > +				(IFC_FIR_OP_CMD1 <<
> > > IFC_NAND_FIR0_OP2_SHIFT) |
> > > +				(IFC_FIR_OP_NWAIT <<
> > > IFC_NAND_FIR0_OP3_SHIFT),
> > > +				&ifc->ifc_nand.nand_fir0);
> > > +
> > > +		ifc_out32((NAND_CMD_RNDOUT << IFC_NAND_FCR0_CMD0_SHIFT) |
> > > +				(NAND_CMD_RNDOUTSTART <<
> > > IFC_NAND_FCR0_CMD1_SHIFT),
> > > +				&ifc->ifc_nand.nand_fcr0);
> > > +
> > > +		/* Wait for minimum change column set-up time. But it
> > > does not harm
> > > +		=C2=A0* to wait more time, so calculated based on 333.3 MHz
> > > input IFC clock
> > > +		=C2=A0*/ =20
> > Can't you know the clk rate at runtime instead of basing your
> > calculation on the hypothetic clk rate? =20
>=20
> If we really need to know the clock rate, we could add a clocks property =
to
> the IFC node. =C2=A0But we haven't needed to deal with clocking anywhere =
else in
> this driver, so I'm not too happy about introducing it for this.

Will the base clk always be running at the same rate on all designs? To
me, it sounds a bit risky to do this assumption, but maybe I'm wrong.

> In
> particular, I don't think we should be sending a real RNDOUT command at t=
he
> device here -- it breaks the model of self-contained operations. =C2=A0Th=
e read
> command is over and the chipselect has been dropped (do all ONFI chips su=
pport
> "CE don't care"?). =C2=A0If the new offset (plus size to be read) fits wi=
thin the
> page buffer, we could just adjust ifc_nand_ctrl->index to the desired
> location.

It should be supported (releasing the CE after the PARAM command and
then sending a RNDOUT), but who knows what NAND vendors decide to
implement.

>=20
> OTOH, if we need to read parameter data beyond the size of the page buffe=
r,
> then we'd need to send another read command (possibly from read_buf)... o=
r we
> can do the sane thing and introduce an interface function to read a certa=
in
> number of parameter bytes from a certain offset.

No please, do not add any complex logic in read_buf() (like resending a
NAND cmd from there), it will just make the whole thing worst.

> Which we should do anyway if
> we want to move in the direction of a better interface with less cmdfunc
> abuse.

Not really. Ideally, ->read_buf() should just launch the I/O transfer
(same for ->write_buf()), nothing more. It shouldn't have to test which
command was sent before and adapt its behavior.
Now, I know that some controllers are not able to dissociate the
CMD/ADDR cycles from the DATA transfers, which is why a new interface
is needed.

>=20
> >=C2=A0 =20
> > > +		ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc- =20
> > > >ifc_nand.ncfgr); =20
> > Why is it done in ->cmdfunc()? I mean, this timing parameter should be
> > set for all operations, and applied as soon as ->select_chip() is
> > called. =20
>=20
> select_chip() is a no-op[1].

Maybe it is in your implementation, but this is where you should have
all the CHIP specific settings (switching from one NAND chip to another
requires adapting the timing, setting a new CS line, ...).
The what the sunxi_nand driver is doing if you want an example where
the driver is tweaking the timing config at chip selection time.

> IFC normally handles the delays internally when
> running a command sequence.

Same for a lot of controllers out there, but that doesn't prevent you
from configuring the timings (on the controller side) when a chip is
selected.

Note that ->select_chip() is not implying that you assert the CE line,
it's here to inform your controller driver that the core wants to
interact with a different NAND chip. What's done in there is completely
controller dependent.

>=20
> -Scott
>=20
> [1] =C2=A0In any case, this is the time between RNDOUT and reading the da=
ta, not
> the time between asserting the chipselect and issuing a command -- and I =
don't
> see other drivers doing a delay in select_chip().

It's not about applying the delay in ->select_chip() it's about
configuring the chip specific timings on the controller side. I guess
the first byte of the ncfgr register is always encoding the tCCS
timing, not something different depending on the command that is sent.
If that's the case, then you don't need to reconfigure the register
each time you send the RNDOUT command, only once, when you activate a
chip.

But again, I don't know this controller, so I might be wrong.

Regards,

Boris
