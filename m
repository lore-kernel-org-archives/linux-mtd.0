Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITFHl-0005PQ-Kd
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 07:12:38 -0400
Subject: Re: General performance of NAND operations i.e mount and ls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <1189069864.14370.34.camel@sauron>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Sep 2007 14:11:59 +0300
Message-Id: <1189077119.14370.52.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-06 at 12:11 +0300, Artem Bityutskiy wrote:

> > Okay, I wanted to check if the time is okay for 520MHz core with 104MHz
> > Bus and 8Bit flash. If this is the case my Hardware driver is okay.
> > There is no urge to improve this stat() time and fragtree building at
> > the moment. If it takes so long and the driver is okay it wioll take so
> > long (arguing with boss and customers :-)).
>=20
> Try to measure raw R/W, e.g with dd. But beware dd will fail at the
> first met bad block. Something like:
>=20
> Read: dd if=3D/dev/mtd4 of=3D/dev/null bs=3D4096 count=3D512
> Write: dd if=3D/dev/zero of=3D/dev/mtd4 bs=3D4096 count=3D512
>=20
> It'll print raw R/W speed.  But beware dd will fail at the first bad
> block, so yo may have to play with count=3D or skip=3D for read and seek=
=3D
> for write to find a large enough contiguous area without bad blocks.

Konste,

may you please go to Device Drivers--->Memory Technology Device (MTD)
support--->UBI - Unsorted block images---> in menuconfig and enable "UBI
debugging", "UBI debugging messages", and "Extra self-checks" and try
again? Then send what UBI prints. I'll try to figure out what is wrong.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
