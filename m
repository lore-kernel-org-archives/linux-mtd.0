Received: from nm14-vm1.bullet.mail.sp2.yahoo.com ([98.139.91.247])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qik8X-0004C1-NW
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2011 09:29:17 +0000
Message-ID: <1310981348.24634.YahooMailClassic@web30207.mail.mud.yahoo.com>
Date: Mon, 18 Jul 2011 02:29:08 -0700 (PDT)
From: Lars Michael <lh_post@yahoo.com>
Subject: Re: U-Boot: using nand write to flash an ubi image, ubi part fails
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <BANLkTimKSzpAqZ2e7TFgFwp3Cx=v==wq-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ben,=0A=0A--- On Wed, 1/6/11, Ben Gardiner <bengardiner@nanometrics.c=
a> wrote:=0A> > Using mkfs.ubifs and ubinize I have created an image=0A> wi=
th 5 volumes. In Linux I could flash it using "ubiformat=0A> /dev/mtd1 -f /=
root/ubi.img" and attach it using "ubiattach=0A> /dev/ubi_ctrl -m 1". It wo=
rked.=0A> >=0A> > In production I would prefer to write the image from=0A> =
U-Boot. So in U-Boot I used "nand erase" then "nand write"=0A> to flash the=
 image. Then I want to attach by "ubi part"=0A> command - but this fails: "=
UBI error: ubi_init: UBI error:=0A> cannot initialize UBI, error -17"=0A> >=
 [...]=0A> > I realize that the U-Boot 'nand erase' does not=0A> preserve t=
he erase counters. So what would be the correct=0A> way to erase and write =
in U-Boot? And why is the ubiformat=0A> not able to correct the problems?=
=0A> =0A> It's true that the ECs are not preserved. But it's also=0A> true =
that=0A> trailing pages of 0xff are not trimmed either. You=0A> definitely =
need to=0A> drop trailing 0xff pages when writing ubinized images=0A> conta=
ining UBIFS=0A> volumes. To do this you can use either the new 'nand write'=
=0A> variant,=0A> .trimffs [1] which is currently patches that have been=0A=
> Acked. Or you=0A> can use the free-space-fixup feature which is available=
 in=0A> the=0A> ubifs-2.6 tree and requires that you use a mkfs.ubifs built=
=0A> from the=0A> the mtd-utils tree.=0A=0AOk, I have updated my mtd-utils =
and recompiled the mkfs.ubifs to get=0Asupport for the free-space-fixup fea=
ture. Next I have pulled=0Aall ubi updates from the 2.6.29 backport tree wh=
ich gave med 154 patches=0Aincluding the fixup.=0A=0ANow I can build the im=
age, ubiformat, ubiattach and mount with success.=0AAfter a reboot I can ub=
iattach and mount with success.=0A=0ANext step is to get it to work in U-Bo=
ot too.=0A=0AThanks and regards,=0A- Lars=0A
