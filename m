Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CjUj-0003BH-00
	for mtd-list@infradead.org; Thu, 13 Jul 2000 14:57:41 +0100
Message-ID: <396DCB00.D5F26E57@matrox.com>
Date: Thu, 13 Jul 2000 09:58:24 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: MTD Mailing List <mtd@infradead.org>,
        Michael Elizabeth Chastain <mec@shout.net>,
        David Weinehall <tao@acc.umu.se>
Subject: Re: Config.in
References: <396DBBB1.A5494318@matrox.com>  <21454.963389948@cygnus.co.uk> <20000711212323.21257.qmail@web5302.mail.yahoo.com> <32068.963394509@cygnus.co.uk> <17260.963495837@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
>=20
> Hmmm. Talk to David and Michael.
>=20
> scote1@matrox.com said:
> > Running make xconfig on 2.2.15, I get the following
> > drivers/mtd/Config.in: 14: unknown command
>=20
> > However, make menuconfig doesn't generate any error.  I'm not a kerne=
l
> > config specialist so I don't know if define_tristate was introduced i=
n
> > 2.3 or why in doesn't work only with xconfig, but this is definitly a
> > bug of some sort.

Another thing I just noticed is that the links in linux/modules are
wrong for MTD.  They point to linux/Lost/mtd*.  But the link for jffs.o
is correct! I didn't notice this before because I linked all my JFFS and
MTD stuff directly in /lib/modules/...  I didn't use the patch to
install MTD so maybe I did something wrong but where does the kernel
look to make these links ?

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
