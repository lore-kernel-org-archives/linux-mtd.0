Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GUKM-0002Je-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 23:06:46 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14GUKK-0002JY-00
	for mtd@infradead.org; Wed, 10 Jan 2001 23:06:45 +0000
Date: Wed, 10 Jan 2001 23:06:39 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
cc: <mtd@infradead.org>,  <nico@cam.org>
Subject: Re: CFI problems with 32bit bus and 4 devices
In-Reply-To: <3A5CE4A7.AB29F73E@colubris.com>
Message-ID: <Pine.LNX.4.30.0101102300310.1062-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 10 Jan 2001, [iso-8859-1] St=E9phane Laroche wrote:

> The only difference between the 2 modes are the CFI addresses (you have t=
o
> multiply them by 2 in x8 mode).  So you cannot cover that in the map driv=
er,
> which doesn't know the difference between a CFI and a normal operation.

"BYTE ENABLE: BYTE# low places the device in x8 mode. All data is then
input or output on DQ0-DQ7, while DQ8-DQ15 float. Address A0 selects
between the high and low byte. BYTE# high places the device in x16 mode,
and turns off the A0 input buffer. Address A1 then becomes the lowest
order address."

Yep, I was wrong. It couldn't work the way I was thinking of - you'd have
too few address lines to access the whole chip in x8 mode.

We do need to handle it in the CFI code, as we did before I broke it.

--=20
dwmw2






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
