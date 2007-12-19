Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J52nh-0005yy-4C
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 17:33:51 +0000
Subject: Re: [PATCH 1/5] UBI: add UBI control device
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200712191651.10608.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191512.00951.arnd@arndb.de> <1198074693.18962.59.camel@sauron>
	<200712191651.10608.arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Dec 2007 19:21:25 +0200
Message-Id: <1198084885.18962.110.camel@sauron>
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

On Wed, 2007-12-19 at 16:51 +0100, Arnd Bergmann wrote:=20
> > Pardon, I do not get this. Please, explain it some more. So, we have 2
> > MTD devices in the system - mtd0 and mtd1, and UBI is compiled in the
> > kernel. How do I create UBI device on top of mtd0?
>=20
> with the "/dev/loop"-like method, you'd do something like
>=20
> 	struct ubi_attach_req req =3D {
> 		.vid_hdr_offset =3D vid_hdr,
> 		.data_offset =3D data,
> 		.mtd_num =3D 0,
> 	};
> 	int fd =3D open("/dev/ubi0", ...);
> 	ioctl(fd, UBI_IOCATT, &req);

Err, we do not have /dev/ubi0 and we want to create it, so we cannot
open it, because it does not exist. I may be very stupid, please,
explain more.

> same as before, but instead of /dev/ubictrl, you'd use the actual ubi
> device directly. Since this wasn't obvious, I may have misunderstood
> something about ubi. Is there actually a device node for each ubi device?
> Is it a block or character device?

It's neither block not character, although the device nodes are
character devices.

UBI device is similar to LVM in a sense. But it is not a block device.

MTD device - a physical flash. Just like HDD.
Example: /dev/mtd0, /dev/mtd1.

UBI device - a volume management system on top of MTD device - just like
volume group in LVM. UBI device may have UBI volumes.
Example, /dev/ubi0, dev/ubi1.

UBI volume - an entity within UBI device. Similar to logical volume
within volume group of LVM. Example: /dev/ubi0_0, /dev/ubi0_1.

> > > I'd say a more natural approach would be to use attributes in sysfs t=
o allow the
> > > probing and destruction of the UBI devices. That way, you could use m=
uch
> > > simpler hooks into udev to create them, without the need of a special=
 user
> > > ioctl interface.
> >=20
> > Pardon? I register ubi_ctl within this thing which is called "Linux
> > Device Model" and I already automatically have udev
> > creating /dev/ubi_ctrl. device. And everything is already simple.
> > Please, elaborate.
>=20
> The Linux device model is really good for actual devices. One thing it
> does not handle that well is artificial interfaces that are not really
> physical devices in your system.

It actually works for UBI pretty well. I really, do not see any troubles
with it - it works fine for UBI.

> The MTD devices are already represented in the device model. If you
> want to represent UBI well, it should be connected to that.

This is not true. MTD is still out of this model (struct mtd_info does
not have a struct device object). And even if it were, UBI would just
have a reference to it as to a parent device, otherwise it would stay
the same.

UBI is connected to an MTD device similarly, as LVM volume group is
connected to HDD(s).

> A major number gives you a space of 2**32 devices, where you would only
> need a single device.=20
> If you just call misc_register(), you get the exact same semantics for
> /dev/ubi_ctrl, but need less code.

Hmm, looks ok - I just did not know about this. Will try it, thanks!

> Note that I'm talking about three different alternatives here:
>=20
> 1. Use the ubi device node directly instead of a separate control
>    device.

This does not really make sense for me to create /dev/ubi0 by means of
opening /dev/ubi0. Surely you do not suggest UBI to register all the
possible /dev/ubiX in the system, and then handle a "create yourself"
ioctl? What for?

> 2. Replace the control device with text based attributes in the MTD
>    objects in sysfs.

MTD is not is sysfs. And even if it were, I do not really see how would
it be possible.

> 3. Do everything like you have already, just replace a full character
>    device with the simpler misc_device.

I like this :-) Of course I did not mean I need so many device numbers -
its just lack of knowledge.

>=20
> You should only use one of these.
>=20
> > > >  	ubi_ltree_slab =3D kmem_cache_create("ubi_ltree_slab",
> > > >  					   sizeof(struct ubi_ltree_entry), 0,
> > > >  					   0, &ltree_entry_ctor);
> > >=20
> > > How many objects to you expect to have in this cache? Is it just one
> > > object per device? That would hardly be worth creating a special cach=
e.
> >=20
> > Well, this is a subject of separate patch, because I just move this cod=
e
> > no. But the reason to have separate slab was that I have to optimize
> > this by having my own constructor.
>=20
> I thought constructors have mostly been deprecated, now that destructors
> are no longer part of the kernel. At least they don't have any advantage
> over a simple wrapper around kzalloc/initialize.

Well, I do not at all insist this slab cache makes sense. The objects of
the slab are used to implement per-LEB locking, and each object has a
counter and a semaphore, and I did not want to set the counter to 0 and
initialize semaphore on _every_ allocation. But you may argue that LEBs
are locked when there is I/O on them, and it makes zero sense to save
few CPU cycles. Let me remove this as a separate patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
