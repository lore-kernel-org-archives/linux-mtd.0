Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GTqV-0002Ab-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 22:35:55 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14GTqU-0002AU-00
	for mtd@infradead.org; Wed, 10 Jan 2001 22:35:54 +0000
Date: Wed, 10 Jan 2001 22:35:42 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
cc: <mtd@infradead.org>,  <nico@cam.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <3A5CCEDA.407726CF@colubris.com>
Message-ID: <Pine.LNX.4.30.0101102225060.1062-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 10 Jan 2001, [iso-8859-1] St=E9phane Laroche wrote:

> Although using buswidth =3D=3D 8 in that specific case may work in that s=
pecific
> case, you would read 4 bytes too many, which are invalid addresses for
> 16bit/32bit CFI devices in x8 mode (I guess nothing bad happens by readin=
g
> those but you never know).

I'd expect the chips to just ignore the A0 line completely, so those
addresses are just aliases for the first 4 bytes. And I think that the
whole point in the map driver was to eliminate such aliasing and stuff,
and just to present the address space of the chip linearly.

It's arguable either way, really - perhaps you could claim that the CFI
code ought to know about such things and _expect_ the LSbit of the
'offset' it passes to the map driver to be equivalent to the A0 line of
the chip, even if the A0 line of the chip isn't valid. But I think doing
it in the map driver keeps the code simpler, and is probably worth it.
Shifts are cheap enough, aren't they?



NB: Some time in the future I may optimise away some of the map drivers'
access functions in certain cases - so many of them are so trivial, and so
many people compile with only one map driver.

#ifdef MAP_DRIVER_OPTIMISE_HACK
#define MAP_WRITE8(map, d, ofs) do { *(__u8 *)map->map_priv_1 + ofs =3D d }=
 while(0)
#else
#define MAP_WRITE8(map, d, ofs) map->write8(map, d, ofs)

etc.

For this case, it'd be
#define MAP_WRITE32(map, d, ofs) do { *(__u32 *)map->map_priv_1 + (ofs>>1) =
=3D d } while(0)

At that point, you'd have the shift in the same function block as the
original calculation of 'ofs' and it ought to get completely optimised
away anyway.

--=20
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
