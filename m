Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J53U8-0000uT-KM
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 18:17:42 +0000
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200712191657.24027.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191517.18166.arnd@arndb.de> <1198075329.18962.70.camel@sauron>
	<200712191657.24027.arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Dec 2007 19:41:00 +0200
Message-Id: <1198086060.18962.120.camel@sauron>
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

On Wed, 2007-12-19 at 16:57 +0100, Arnd Bergmann wrote:
> >=20
> > If the MTD device is already UBI-formatted, the numbers may be read fro=
m
> > the media. Otherwise, not.
>=20
> Ok, let me suggest an idea, it probably needs more refinement, but maybe =
we
> can come up with something better based on this:
>=20
> You can have a simple attribute named 'ubi-probe' in each MTD device in s=
ysfs.

Err, why should MTD know something about what sits on top of it? Today
it is UBI, tommorrow it is something new and better, e.g., more
scalable.

> this is only readable, and contains either '0' or '1' in ascii, telling y=
ou
> whether a UBI device could be found for this device.

So MTD maintains ubi-probe attribute, and has some knowlege about UBI.
Well, it is technically possible, but I do not think it would be good
design. The same way we could teach MTD to probe if it has JFFS2 on it,
or something else...

> This only works for UBI formatted media, and the kernel does not format t=
he
> media itself.
> IF you want to UBI-format a medium, use a user space tool that writes the
> appropriate blocks directly to the /dev/mtd* character device.

Yeah, user-space tools could format media. But it is so much appropriate
facility to have UBI being able to format it itself. It is really very
convenient. Flashes have special state - empty flash, and if the flash
is empty - UBI make it UBI-formatted. If the flash has some garbage -
UBI does not format it.=20

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
