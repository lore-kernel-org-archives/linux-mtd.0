Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zslc-00033y-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 10:58:32 +0100
Date: Tue, 28 Mar 2000 12:03:13 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: =?ISO-8859-1?Q?Bj=F6rn_Wes=E9n?= <bjorn.wesen@axis.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Scott Anderson <sanders@mvista.com>,
        Alexander Larsson <alex@cendio.se>,
        SeokKuon Kwon <kwonsk@mutech.co.kr>
cc: mtd@infradead.org
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD 
In-Reply-To: <Pine.LNX.3.96.1000327165250.31589K-100000@fafner.axis.se>
Message-ID: <Pine.LNX.4.21.0003281115580.17037-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, Bjorn Wesen wrote:

> On Mon, 27 Mar 2000, David Woodhouse wrote:
> > >  The flash is not divided into blocks in our JFFS. The flash is
> > > logically a single circular append-only file (but with random acces=
s
> > > of course). Wear-leveling comes implicitely in that model, since th=
e
> > > log-file is circular.=20
> >=20
> > When you append to your circular log, you end up eating your tail. Wh=
at if the=20
> > erase block you're about to 'eat' doesn't contain any data that needs=
 to be=20
> > changed. Do you leave it alone and skip it, or do you erase it anyway=
?
>=20
> The garbage-collector is invoked when the amount of headroom starts to =
get
> low compared to the amount of redundant areas in the flash. It will sta=
rt
> to erase sectors, and if they contain non-redundant info, it is moved t=
o
> the head first. Finn can fill in here in more detail.
>=20
> As you see it's important that the GC is triggered at the right time. I=
f
> you end up with 1 byte head-room before the GC, you cannot move data ou=
t
> of the way of the sector-erase.=20

Yes. There must always be enough room to perform garbage collects. The
room absolutely needed in JFFS is more than 1,5 sectors. This means
that at least 1,5 sectors of the flash device are unused.

Before every write to the flash, we make sure there is enough space
left on the device. Deletions are always allowed though.

After every completed write to the flash we check if we have to issue
a garbage collect.


> The parameters of the GC are chosen so they work for us, but they are
> subject to tuning of course.

There is a function in JFFS called jffs_garbage_collect which contains
the criteria for garbage collects that, for the moment, suit our
products. As Bj=F6rn stated, this function could be used as is, but could
of course be tuned to fulfil slightly different requirements.

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
