Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OisYm-0000NE-B0
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 17:24:21 +0000
In-Reply-To: <AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
References: <AANLkTik9cy+at2n28U+Mut4RD6_cJ9uRZzjf+H86d-rp@mail.gmail.com>
	<796604.30863.qm@web180307.mail.gq1.yahoo.com>
	<AANLkTi=FGf9gbWDkO4qs01Z+qkip+Zm11=Jc4wHu3G8b@mail.gmail.com>
	<OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
	<AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
Subject: Re: [spi-devel-general] [PATCH v2 3/6] mtd: m25p80: add support to
	parse the SPI flash's partitions
To: Grant Likely <grant.likely@secretlab.ca>
Message-ID: <OFF5EA512A.075E51C6-ONC125777B.005D9750-C125777B.005F8CAF@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 10 Aug 2010 19:23:39 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: glikely@secretlab.ca, kumar.gala@freescale.com,
	David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net,
	"linuxppc-dev@ozlabs.org Mingkai Hu" <Mingkai.hu@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

glikely@secretlab.ca wrote on 2010/08/10 16:56:42:
>
> On Tue, Aug 10, 2010 at 2:29 AM, Joakim Tjernlund
> <joakim.tjernlund@transmode.se> wrote:
> >> On Tue, Aug 10, 2010 at 1:14 AM, David Brownell <david-b@pacbell.n=
et> wrote:
> >> >
> >> >
> >> > --- On Mon, 8/9/10, Grant Likely <grant.likely@secretlab.ca> wro=
te:
> >> >
> >> >
> >> >> > + =A0 =A0 =A0 nr_parts =3D
> >> >> of_mtd_parse_partitions(&spi->dev, np, &parts);
> >> >
> >> > Let's keep OF-specific logic out of drivers like
> >> > this one ... =A0intended to work without OF.
> >> >
> >> > NAK on adding dependencies like OF to drivers
> >> > and other infrastructure that starts generic.
> >
> > Agreed.
> >
> >>
> >> The OF hooks compile to no-ops when CONFIG_OF is disabled. =A0I've=
 been
> >> very careful about that.
> >
> > OF should not be in the drivers, one should be able use some other =
method
> > than OF.
>
> If a device is described in the device tree, then the code has to liv=
e
> *somewhere* to translate the data from the device tree into a form th=
e
> driver can use.  If not the driver, then where should that code live?=

>
> If it is in the machine support code, then that requires foreknowledg=
e
> about all the device specific data that needs to be translated out of=

> the device tree at device registration time, which also means that th=
e
> translation code cannot be a module and it nullifies some of the
> advantages of the device tree.  Not to mention the fact that it is
> just plain ugly!  :-)
>
> Some of it can go into the infrastructure code, but only for parsing
> common properties like irqs, address ranges, and some common bindings=

> like registering spi and i2c bus child nodes as devices.  (This
> *particular* case may fall into this category if add_mtd_device() was=

> able to call the OF partition parsing hook if a device node pointer
> was present; which does make a certain amount of sense, but I defer t=
o
> dwmw2 in this case).  However, device-specific properties cannot be
> parsed in the infrastructure code because the infrastructure has no
> knowledge of device specific bits.

I am no expert at this at all, but I can give you an example what I don=
't
want. Look at spi_mpc8xxx.c, earlier it was possible to define your own=

CS functions and register them from board code. After OF:ication one ca=
n
not and the current OF methods aren't expressive enough to do what I ne=
ed.
The spi subsystem has a general framework for dealing with SPI devices
and I think OF should be built on top of the native methods, at the
very least not disable those methods like spi_mpc8xxx.c does.

I will shut up now :)

  Regards
         Jocke=
