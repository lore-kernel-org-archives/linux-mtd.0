Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GS0G-0001Jz-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 20:37:52 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14GS0F-0001Jt-00
	for mtd@infradead.org; Wed, 10 Jan 2001 20:37:52 +0000
Date: Wed, 10 Jan 2001 20:37:14 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
cc: <mtd@infradead.org>,  <nico@cam.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <3A5CB4C3.41FC20D1@colubris.com>
Message-ID: <Pine.LNX.4.30.0101102011550.13913-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 10 Jan 2001, [iso-8859-1] St=E9phane Laroche wrote:

> So, for my setup, which has 4 x16 devices on a 32 bit bus (AMDs),  the
> CFI query structure is located at offsets 0x80, 0x88, 0x90, etc.
>
> cfi_read_query()  uses only the buswidth to calculate the offset, which
> is not general enough (it used to be like that before I played with the
> code a bit last summer).  It's obviously wrong in my case ( 0x10 << 2 !=
=3D
> 0x80 ).

Sorry, mea culpa. I'd forgotten - or just didn't realise this arrangement
was used. How did {amd,cfi}_send_gen_cmd() send a command to all four
chips? With two separate 32-bit writes?

> Any comments?  Is it possible that I'm the only one using that kind of
> geometry?

(reads responses) Evidently not. Hmmm.

Technically, I think this setup would fit into the original model as
buswidth =3D=3D 8, and we should be using read64/write64 for accesses to th=
e
flash.

Just how crap is gcc's long long support these days? Could we use __u64
for this?

--=20
dwmw2





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
