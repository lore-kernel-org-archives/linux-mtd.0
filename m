Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4zxo-0006H8-SY
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:32:07 +0000
Subject: Re: [PATCH 1/5] UBI: add UBI control device
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200712191512.00951.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<20071219154142.23264.345.sendpatchset@golum>
	<200712191512.00951.arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Dec 2007 16:31:33 +0200
Message-Id: <1198074693.18962.59.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-12-19 at 15:11 +0100, Arnd Bergmann wrote:
> >=20
> > This patch is a preparation to make UBI devices dynamic. It
> > adds an UBI control device which has dynamically allocated
> > major number and registers itself as "ubi_ctrl". It does not
> > do anything so far. The idea is that this device will allow
> > to attach/detach MTD devices from userspace.
> >=20
> > This is symilar to what the Linux device mapper has.
>=20
> I don't really like the idea of a separate device node, the
> point that device mapper does it is not a particularly strong
> argument.
>=20
> A better alternative would be probably be to do it similar
> to the loopback device, where you attach the device node itself
> with a back-end (file in case of loop).

Pardon, I do not get this. Please, explain it some more. So, we have 2
MTD devices in the system - mtd0 and mtd1, and UBI is compiled in the
kernel. How do I create UBI device on top of mtd0?

> > + * When UBI is initialized, it attaches all the MTD devices specified =
as the
> > + * module load parameters or the kernel boot parameters. If MTD device=
s were
> > + * specified, UBI does not attach any MTD device, but it is possible t=
o do
> > + * later using the "UBI control device".
> > + *
> > + * At the moment we only attach UBI devices by scanning, which will be=
come a
> > + * bottleneck when flashes reach certain large size. Then one may impr=
ove UBI
> > + * and add other methods, although it does not seem to be easy to do.
> >   */
>=20
> I'd say a more natural approach would be to use attributes in sysfs to al=
low the
> probing and destruction of the UBI devices. That way, you could use much
> simpler hooks into udev to create them, without the need of a special use=
r
> ioctl interface.

Pardon? I register ubi_ctl within this thing which is called "Linux
Device Model" and I already automatically have udev
creating /dev/ubi_ctrl. device. And everything is already simple.
Please, elaborate.

> > +/* UBI control character device major number */
> > +static int ubi_ctrl_major;
>=20
> Why do you need you own major number? I think if you really want this ioc=
tl
> interface, a misc device would be completely sufficient.

I wanted to have /dev/ubi_ctrl, why not? What's wrong with this?

> > +	/* Register the control device in the Linux device system */
> > +	ubi_ctrl_dev.release =3D ctrl_dev_release;
> > +	ubi_ctrl_dev.devt =3D MKDEV(ubi_ctrl_major, 0);
> > +	ubi_ctrl_dev.class =3D ubi_class;
> > +	sprintf(&ubi_ctrl_dev.bus_id[0], "ubi_ctrl");
> > +	err =3D device_register(&ubi_ctrl_dev);
> > +	if (err) {
> > +		printk(KERN_ERR "UBI error: cannot register device\n");
> > +		goto out_version;
> > +	}
>=20
> This looks like overengineering, you can simplify this a lot by using
> a misc device.

I will look what misc device is and if it is OK for me. And I do not see
anything complex here, to be frank :-)

>  =20
> >  	ubi_ltree_slab =3D kmem_cache_create("ubi_ltree_slab",
> >  					   sizeof(struct ubi_ltree_entry), 0,
> >  					   0, &ltree_entry_ctor);
>=20
> How many objects to you expect to have in this cache? Is it just one
> object per device? That would hardly be worth creating a special cache.

Well, this is a subject of separate patch, because I just move this code
no. But the reason to have separate slab was that I have to optimize
this by having my own constructor.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
