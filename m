Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KpHG5-0007pX-UG
	for linux-mtd@lists.infradead.org; Mon, 13 Oct 2008 06:50:26 +0000
Subject: Re: Understanding UBIFS flash overhead
From: Artem Bityutskiy <dedekind@infradead.org>
To: dsaxena@plexity.net
In-Reply-To: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
References: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
Content-Type: text/plain; charset=utf-8
Date: Mon, 13 Oct 2008 09:48:47 +0300
Message-Id: <1223880527.3395.53.camel@sauron>
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

On Fri, 2008-10-10 at 14:00 -0700, Deepak Saxena wrote:
> I'm working on getting UBIFS going on the OLPC XO and am trying to
> understand what I am seeing in regards to file system size.=20

Nice. I think UBIFS is quite suitable for OLPC and should improve its
boot time and, presumably, performance.

> I have partitioned the 1GiB mtd device into a 32MiB JFFS boot partition
> for OFW, a 128KiB partition to hold the Redboot partition table,
> and the remainder (991.625) for use by UBI.

OK.

> The NAND device has 128KiB EBs with a 2KiB pages and we are running w/o
> sub-page writes.

Right. Last time I looked at this I found out that your NAND supports
sub-pages, but your Marvell controller does not, unfortunately.

>  Plugging this into the overhead calculation, we get:
>=20
> SP	PEB Size		128KiB
> SL	LEB Size		128KiB - 2 * 2KiB =3D 124 KiB
> P	Total PEBs 		991.625MiB / 128KiB =3D 7933
> B	Reserved PEBsg		79(1%)
> O	Overhead=3D SP - SL	4KiB
>=20
>=20
> UBI Overhead =3D (B + 4) * SP + O * (P - B - 4)=20
>              =3D (79 + 4) * 128Kib + 4 KiB * (7933 - 79 - 4)
>              =3D 42024 KiB=20
>              =3D 329.3125 PEBs (round to 329)
>=20
> This leaves us with 7604 PEBs or 973312KiB available for user data.=20

OK.

> At boot up, I see:
>=20
> UBIFS: file system size: 995237888 bytes (971912 KiB, 949 MiB,
> UBIFS: journal size: 9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)

Note, this FS size (949 MiB) is the size which UBIFS will use for its
"main area". Main area includes all the FS, the index, and the journal.
So this does not mean you'll have 949MiB for your FS data. You'll have
slightly less.

> 'df' returns:
>=20
> Filesystem             Size   Used  Avail Use% Mounted on
> mtd0                   822M   242M   581M  30% /
>=20
> I expect some overhead, but I'm really wondering where over 100MiB of
> space went!
>=20
> This is 2.6.25 with UBI 2.6.25 tree merged in. Does that tree have
> any bugfixes from 2.6.26+ backported?

I have several comments.

1. We've improved df reporting, but we have not updated the back-port
trees for long time, so the improvements were not there. I've just
updated all back-ports and they contain all the recent patches we
consider stable. It is basically identical to ubifs-2.6.git now. Please,
update, things will become better. However, do not expect df to tell you
precise information anyway. See below.

2. Let me first describe JFFS2 experience we have had. In statfs() (and
thus, df) JFFS2 reports physical flash space. There are some challenges
in calculating this space, and JFFS2 often lies in df. For example, it
may say it has 20MiB free, but if you start writing on it, you'll be
able to write only 16MiB file. Our user-space developers complained
about this several times. So in UBIFS we decided to report _worst-case_
flash space because we thought it is better not to tell less, but to be
honest.

Please, read here for information about UBIFS flash space prediction
challenges: http://www.linux-mtd.infradead.org/doc/ubifs.html#L_spaceacc
This should shed some light.

In short, I'll conclude with few items here:
  * I most of the cases UBIFS reports _less_ space that it really has.
    This is because it reports worst-case digits, and worst-case
    scenario happens very-very rarely. Just try to write a file and see.
  * It is very difficult to report precise flash space. This was the =20
    issue in JFFS2, but it is even more of the issue in UBIFS because
    of write-back.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
