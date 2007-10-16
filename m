Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ihgt1-0005QZ-AX
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 08:30:45 +0100
Subject: Re: mtd support for large NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200710161327.15290.manningc2@actrix.gen.nz>
References: <200710110911.58596.manningc2@actrix.gen.nz>
	<1192087361.21337.3.camel@sauron>
	<49eab5c80710120136m557b0df1ye3bd4e04d345d222@mail.gmail.com>
	<200710161327.15290.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=utf-8
Date: Tue, 16 Oct 2007 10:27:23 +0300
Message-Id: <1192519643.3421.2.camel@sauron>
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

On Tue, 2007-10-16 at 13:27 +1300, Charles Manning wrote:
> On Friday 12 October 2007 21:36:09 falls huang wrote:
> > Hello !
> >
> >   How can I simulate a large nandflash(>4G) in linux PC ? I want to
> > take a look at it, but I don't have any develop-board that has 4G
>=20
> There are a few problems you face here. Firstly, mtd does not support >4G=
=20
> which will need fixing.
>=20
> Secondly, even if your system has > 4G it might not be all simultaneously=
=20
> accessible and you will need to use highmem as a way to do temporary mapp=
ings=20
> to access this memory.
>=20
> I might be tempted to try do this using some sort of userspace driver the=
n=20
> just backing the driver with regular files (eg. 8x1G files to simulate 8G=
 of=20
> NAND).

Or create something like blk2mtd.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
