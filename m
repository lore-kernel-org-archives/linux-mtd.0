Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1380Tm-0004Ev-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 14:05:10 +0100
Message-ID: <395C9BEC.98AC005A@matrox.com>
Date: Fri, 30 Jun 2000 09:09:00 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Status of MTD for CFI
References: <Pine.LNX.4.21.0006292149210.991-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
>=20
> On Thu, 29 Jun 2000, [iso-8859-1] S=E9bastien C=F4t=E9 wrote:
>=20
> > Hi,
> >
> > I'd like to know the status of MTD for CFI devices.  If I have a flas=
h
> > connected to the ISA bus, will I be able to access it with MTD and
> > install JFFS on it ?  If not, what needs to be done ?
>=20
> If it's a 16-bit device which is capable of the Intel Extended command
> set, all you need to do is provide a map driver which provides
> read16() and write16() functions for your board. See nora.c, vmax301.c =
and
> octagon-5066.c for examples.

I've got an Intel StrataFlash so it's both 16 bits and CFI compliant.  I
quickly checked the files you mentioned and this all seems very simple.=20
But I've got a few questions : what is nora.c for (from the name, I
guess it's a NOR flash and from the code I guess it's CFI but that's all
I know)?  and what does SBC stand for ?


--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
