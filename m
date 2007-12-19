Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J508J-0007Ed-S7
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:42:58 +0000
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200712191517.18166.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<20071219154158.23264.95037.sendpatchset@golum>
	<200712191517.18166.arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Dec 2007 16:42:09 +0200
Message-Id: <1198075329.18962.70.camel@sauron>
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

On Wed, 2007-12-19 at 15:17 +0100, Arnd Bergmann wrote:
> > +struct ubi_attach_req {
> > +       int32_t vid_hdr_offset;
> > +       int32_t data_offset;
> > +       int32_t mtd_num;
> > +       uint8_t padding[12];
> >  };
>=20
>=20
> Can you explain why you need to pass vid_hdr_offset /and/ data_offset her=
e?
> What is the difference between the two? Can't you autoprobe them if you
> have the device?

vid_hdr_offset is the offset of the VID header withing an eraseblock.
data_offs is where the data starts. We want to be able to let users
select the VID header offset. Vs data offset - indeed it is redundant
and might be dropped because UBI may just assume data starts at the next
min. I/O unit after the VID header.

We can autoprobe the VID header offset, unless the MTD device is empty,
in which case UBI automatically formats it.

> The reason I'm asking is that I'd really like to make this a simple
> attribute in sysfs, in the mtd object. The question there is what a
> user would need to store into that attribute. The device is identified
> implicitly already, but this looks like you still need two distint
> integers in order to create an UBI device.

If the MTD device is already UBI-formatted, the numbers may be read from
the media. Otherwise, not.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
