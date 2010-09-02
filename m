Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Or61Y-0005sI-Mi
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 09:24:01 +0000
Received: from mail63-am1 (localhost.localdomain [127.0.0.1])	by
	mail63-am1-R.bigfish.com (Postfix) with ESMTP id 0FA079781B9	for
	<linux-mtd@lists.infradead.org>; Thu,  2 Sep 2010 09:23:59 +0000 (UTC)
Received: from am1ehsmhs002.bigfish.com (unknown [10.3.201.241])	by
	mail63-am1.bigfish.com (Postfix) with ESMTP id 4A999117004E	for
	<linux-mtd@lists.infradead.org>; Thu,  2 Sep 2010 09:23:57 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o828kWM8009006	for <linux-mtd@lists.infradead.org>;
	Thu, 2 Sep 2010 01:46:34 -0700 (MST)
Received: from zmy16exm20.fsl.freescale.net (zmy16exm20.ap.freescale.net
	[10.211.3.23])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	o828wg15028029	for <linux-mtd@lists.infradead.org>;
	Thu, 2 Sep 2010 03:58:43 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [spi-devel-general] [PATCH v2 3/6] mtd: m25p80: add support to
	parse the SPI flash's partitions
Date: Thu, 2 Sep 2010 16:46:28 +0800
Message-ID: <73839B4A0818E747864426270AC332C30561B6DC@zmy16exm20.fsl.freescale.net>
In-Reply-To: <AANLkTi=EpjPC8Hf6dM1att8Mjg5vmfQxs2=4aUTYTrUL@mail.gmail.com>
References: <AANLkTik9cy+at2n28U+Mut4RD6_cJ9uRZzjf+H86d-rp@mail.gmail.com>
	<796604.30863.qm@web180307.mail.gq1.yahoo.com>
	<AANLkTi=FGf9gbWDkO4qs01Z+qkip+Zm11=Jc4wHu3G8b@mail.gmail.com>
	<OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
	<AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
	<OFF5EA512A.075E51C6-ONC125777B.005D9750-C125777B.005F8CAF@transmode.se>
	<AANLkTi=EpjPC8Hf6dM1att8Mjg5vmfQxs2=4aUTYTrUL@mail.gmail.com>
From: Hu Mingkai-B21284 <B21284@freescale.com>
To: "Grant Likely" <grant.likely@secretlab.ca>,
	"Joakim Tjernlund" <joakim.tjernlund@transmode.se>
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>,
	spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf Of =
Grant
> Likely
> Sent: Wednesday, August 11, 2010 2:27 AM
> To: Joakim Tjernlund
> Cc: David Brownell; David Woodhouse; Gala Kumar-B11780; linux-
> mtd@lists.infradead.org; Hu Mingkai-B21284; spi-devel-
> general@lists.sourceforge.net
> Subject: Re: [spi-devel-general] [PATCH v2 3/6] mtd: m25p80: add =
support to
> parse the SPI flash's partitions
>=20
> On Tue, Aug 10, 2010 at 11:23 AM, Joakim Tjernlund
> <joakim.tjernlund@transmode.se> wrote:
> > glikely@secretlab.ca wrote on 2010/08/10 16:56:42:
> >>
> >> On Tue, Aug 10, 2010 at 2:29 AM, Joakim Tjernlund
> >> <joakim.tjernlund@transmode.se> wrote:
> >> >> On Tue, Aug 10, 2010 at 1:14 AM, David Brownell =
<david-b@pacbell.net>
> wrote:
> >> >> >
> >> >> >
> >> >> > --- On Mon, 8/9/10, Grant Likely <grant.likely@secretlab.ca> =
wrote:
> >> >> >
> >> >> >
> >> >> >> > + =A0 =A0 =A0 nr_parts =3D
> >> >> >> of_mtd_parse_partitions(&spi->dev, np, &parts);
> >> >> >
> >> >> > Let's keep OF-specific logic out of drivers like this one ...
> >> >> > intended to work without OF.
> >> >> >
> >> >> > NAK on adding dependencies like OF to drivers and other
> >> >> > infrastructure that starts generic.
> >> >
> >> > Agreed.
> >> >
> >> >>
> >> >> The OF hooks compile to no-ops when CONFIG_OF is disabled. =
=A0I've
> >> >> been very careful about that.
> >> >
> >> > OF should not be in the drivers, one should be able use some =
other
> >> > method than OF.
> >>
> >> If a device is described in the device tree, then the code has to
> >> live
> >> *somewhere* to translate the data from the device tree into a form
> >> the driver can use. =A0If not the driver, then where should that =
code live?
> >>
> >> If it is in the machine support code, then that requires
> >> foreknowledge about all the device specific data that needs to be
> >> translated out of the device tree at device registration time, =
which
> >> also means that the translation code cannot be a module and it
> >> nullifies some of the advantages of the device tree. =A0Not to =
mention
> >> the fact that it is just plain ugly! =A0:-)
> >>
> >> Some of it can go into the infrastructure code, but only for =
parsing
> >> common properties like irqs, address ranges, and some common =
bindings
> >> like registering spi and i2c bus child nodes as devices. =A0(This
> >> *particular* case may fall into this category if add_mtd_device() =
was
> >> able to call the OF partition parsing hook if a device node pointer
> >> was present; which does make a certain amount of sense, but I defer
> >> to
> >> dwmw2 in this case). =A0However, device-specific properties cannot =
be
> >> parsed in the infrastructure code because the infrastructure has no
> >> knowledge of device specific bits.
> >
> > I am no expert at this at all, but I can give you an example what I
> > don't want. Look at spi_mpc8xxx.c, earlier it was possible to define
> > your own CS functions and register them from board code. After
> > OF:ication one can not and the current OF methods aren't expressive =
enough to
> do what I need.
> > The spi subsystem has a general framework for dealing with SPI =
devices
> > and I think OF should be built on top of the native methods, at the
> > very least not disable those methods like spi_mpc8xxx.c does.
>=20
> You're right and it's a problem.  There wasn't a good way to handle =
this when
> powerpc first moved over to use OF.  I think we've got a good solution =
now.  See
> the use of a bus notifier in arch/powerpc/platforms/512x/pdm360ng.c in =
Linus'
> current tree.  Most of the time that won't be needed, but when a =
platform
> specific callback is required, this seems to be a clean solution.
>=20

Thanks for your valuable suggestion, but where should I put the =
bus_register_notifier?
On the drivers/mtd/devices/m25p80.c or drivers/spi/spi.c? I think it =
should add in the=20
flash driver m25p80.c, but it looks like the notifier function will be =
called many times.
How does it happen?

Here is my demo code patch:
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -753,6 +753,34 @@ static const struct spi_device_id *__devinit =
jedec_probe(struct spi_device *spi)
 }

+static int m25p80_notifier_call(struct notifier_block *nb,
+                                       unsigned long event, void =
*__dev)
+{
+       printk("%s %d event =3D 0x%x:\n", __func__, __LINE__, event);
+       switch (event) {
+       case BUS_NOTIFY_ADD_DEVICE:
+               printk("BUS_NOTIFY_ADD_DEVICE\n");
+               break;
+       case BUS_NOTIFY_DEL_DEVICE:
+               printk("BUS_NOTIFY_DEL_DEVICE\n");
+               break;
+       case BUS_NOTIFY_BOUND_DRIVER:
+               printk("BUS_NOTIFY_BOUND_DRIVER\n");
+               break;
+       case BUS_NOTIFY_UNBIND_DRIVER:
+               printk("BUS_NOTIFY_UNBIND_DRIVER\n");
+               break;
+       case BUS_NOTIFY_UNBOUND_DRIVER:
+               printk("BUS_NOTIFY_UNBOUND_DRIVER\n");
+               break;
+       }
+       return NOTIFY_DONE;
+}
+
+static struct notifier_block m25p80_nb =3D {
+       .notifier_call =3D m25p80_notifier_call,
+};
+
 /*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
@@ -766,6 +794,8 @@ static int __devinit m25p_probe(struct spi_device =
*spi)
        struct flash_info               *info;
        unsigned                        i;

+       bus_register_notifier(&spi_bus_type, &m25p80_nb);
+


Thanks,
Mingkai
