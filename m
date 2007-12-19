Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J51K7-0006fJ-Og
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 15:59:15 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
Date: Wed, 19 Dec 2007 16:57:23 +0100
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191517.18166.arnd@arndb.de>
	<1198075329.18962.70.camel@sauron>
In-Reply-To: <1198075329.18962.70.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200712191657.24027.arnd@arndb.de>
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19 December 2007, Artem Bityutskiy wrote:
> On Wed, 2007-12-19 at 15:17 +0100, Arnd Bergmann wrote:
> > > +struct ubi_attach_req {
> > > + =C2=A0 =C2=A0 =C2=A0 int32_t vid_hdr_offset;
> > > + =C2=A0 =C2=A0 =C2=A0 int32_t data_offset;
> > > + =C2=A0 =C2=A0 =C2=A0 int32_t mtd_num;
> > > + =C2=A0 =C2=A0 =C2=A0 uint8_t padding[12];
> > > =C2=A0};
> >=20
> > Can you explain why you need to pass vid_hdr_offset /and/ data_offset h=
ere?
> > What is the difference between the two? Can't you autoprobe them if you
> > have the device?
>=20
> vid_hdr_offset is the offset of the VID header withing an eraseblock.
> data_offs is where the data starts. We want to be able to let users
> select the VID header offset. Vs data offset - indeed it is redundant
> and might be dropped because UBI may just assume data starts at the next
> min. I/O unit after the VID header.
>=20
> We can autoprobe the VID header offset, unless the MTD device is empty,
> in which case UBI automatically formats it.

ok, thanks for the explanation.

> > The reason I'm asking is that I'd really like to make this a simple
> > attribute in sysfs, in the mtd object. The question there is what a
> > user would need to store into that attribute. The device is identified
> > implicitly already, but this looks like you still need two distint
> > integers in order to create an UBI device.
>=20
> If the MTD device is already UBI-formatted, the numbers may be read from
> the media. Otherwise, not.

Ok, let me suggest an idea, it probably needs more refinement, but maybe we
can come up with something better based on this:

You can have a simple attribute named 'ubi-probe' in each MTD device in sys=
fs.
this is only readable, and contains either '0' or '1' in ascii, telling you
whether a UBI device could be found for this device.
This only works for UBI formatted media, and the kernel does not format the
media itself.
IF you want to UBI-format a medium, use a user space tool that writes the
appropriate blocks directly to the /dev/mtd* character device.

	Arnd <><
