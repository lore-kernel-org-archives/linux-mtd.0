Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137lQk-00020D-00
	for mtd-list@infradead.org; Thu, 29 Jun 2000 22:01:02 +0100
Date: Thu, 29 Jun 2000 22:03:10 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
cc: mtd@infradead.org
Subject: Re: Status of MTD for CFI
In-Reply-To: <395BA756.ED363C95@matrox.com>
Message-ID: <Pine.LNX.4.21.0006292149210.991-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 29 Jun 2000, [iso-8859-1] S=E9bastien C=F4t=E9 wrote:

> Hi,
>=20
> I'd like to know the status of MTD for CFI devices.  If I have a flash
> connected to the ISA bus, will I be able to access it with MTD and
> install JFFS on it ?  If not, what needs to be done ?

If it's a 16-bit device which is capable of the Intel Extended command
set, all you need to do is provide a map driver which provides
read16() and write16() functions for your board. See nora.c, vmax301.c and
octagon-5066.c for examples.

If it's not a 16-bit device, or if it doesn't talk the Intel command set,
then you'll actualy need to code up read/write/erase support for it too.
See cfi_cmdset_0001.c for a vague idea.

If it's something that cfi_cmdset_0001.c will drive (i.e. 16-bit Intel
device), you need to check out the version from the 26th - while it was at
least working, albeit busy waiting for erases and writes. I've since
broken it to get it slightly more well-behaved, and haven't finished that
task yet.

You'll want revision 1.8 of 2000/06/26 16:18:58 - the revision before the
one with the changelog entry that says "First attempt at doing locking and
per-chip access. I'll eat my hat if this works - but it compiles!"

It's work in progress at the moment - but I've had an FTL root filesystem
running off it, and there's no real reason why I shouldn't have had
JFFS-root too if the embedded board that I'm working on wasn't such a PITA
to use.

I'm hoping to get the current CVS code in working order again tomorrow.

Jgg is apparently looking at support for JEDEC flash chips which aren't
CFI-compliant.

--=20
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
