Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhN4s-0003Ox-EN
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 04:17:18 -0500
Subject: Re: UBI and OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
Content-Type: text/plain; charset=utf-8
Date: Tue, 07 Nov 2006 11:16:41 +0200
Message-Id: <1162891001.31636.8.camel@sauron>
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

On Tue, 2006-11-07 at 02:35 +0000, =EB=B0=95=EA=B2=BD=EB=AF=BC wrote:
> Hi,
>=20
> Sorry for changing subject. My mail program has some problem.
>=20
> > > I think the following commands just worked:
> > >=20
> > >   mkdir /mnt/nvm
> > >   flash_eraseall /dev/mtd6
> > >   mount -t jffs2 /dev/mtdblock6 /mnt/nvm=20
> > >=20
> > >=20
> > > I wonder whether this is the first attempt to run a kernel using
> > > jffs2 and ubi and mtd and onenand and mips? First or not, it seems to=
 work.=20
>=20
> > Yes, it is.  For both onenand and MIPS.  That is good news.  Thanks for
> > testing!
>=20
> Umm. I think 'John' just mounts jffs2 without UBI.
>=20
> I also tried but I can't mount jffs2
>=20
> It is my sequence.
>=20
> # mkdir -p /mnt
> # insmod ubi.ko mtd=3D3
>=20
> UBI: attached mtd3 to ubi0
> UBI: MTD device name:            "rootfs"
> UBI: MTD device size:            16 MB
> UBI: physical eraseblock size:   131072 bytes (128 KB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: number of good PEBs:        127
> UBI: number of bad PEBs:         1
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: max. allowed volumes:       124
> UBI: wear-levelling threshold:   4096
> UBI: number of internal volumes: 2
> UBI: number of user volumes:     0
> UBI: available PEBs:             122
> UBI: total number of reserved PEBs: 5
> UBI: number of PEBs reserved for bad PEB handling: 1
>=20

May I kindly ask you to do the following:

1. Enable "UBI debugging" option
2. Go to "UBI debugging messages  --->" and enable:
   a "User interface unit messages"
   b "Messages from the gluebi sub-unit"
   c "Volume management unit messages"
   d "Eraseblock association unit messages"

Then try to mount JFFS2.

Then do:
# mount -t debugfs none /mnt/debugfs
# cat /mnt/debugfs/ubi/log > log

and send me the log file.

Also see http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug
which is a bit out-of-date but still may be helpful.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
