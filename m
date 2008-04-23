Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoaDN-0000MH-G3
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 08:20:30 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <480EEFAB.7010304@parrot.com>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au>  <480EEFAB.7010304@parrot.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Apr 2008 11:21:04 +0300
Message-Id: <1208938864.11721.44.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd@lists.infradead.org,
	Bruce_Leonard@selinc.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2008-04-23 at 10:13 +0200, Matthieu CASTET wrote:
> > [    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsu=
ng NAND 512MiB 3,3V 8-bit)
> > [    0.960000] Scanning device for bad blocks
> > [    1.000000] Bad eraseblock 494 at 0x03dc0000
> > [    1.050000] Bad eraseblock 1300 at 0x0a280000
> > [    1.140000] Bad eraseblock 2554 at 0x13f40000
> > [    1.160000] Bad eraseblock 2923 at 0x16d60000
> > [    1.200000] Bad eraseblock 3349 at 0x1a2a0000
> > [    1.230000] Bad eraseblock 3790 at 0x1d9c0000
> > [    6.890000] UBI: attached mtd9 to ubi0
> >=20
> >=20
> >=20
> > Hamish
>=20
> Do you know when the bad block scanning finish and the ubi scan start ?

Good point Matthieu. Indeed, _at least_ 1.23 sec is spend in the driver
for scanning against bad eraseblocks to build in-memory bad block table
(BBT). And it is probably more than 1.23 sec. If you start using
on-flash bad block table, this should go away. I never used on-flash
BBT, but I know MTD supports this and for example OLPC has on-flash BBT.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
