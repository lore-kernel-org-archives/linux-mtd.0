Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kcuh-0002yS-00
	for mtd-list@infradead.org; Wed, 04 Apr 2001 03:20:51 +0100
Received: from nw171.netaddress.usa.net ([204.68.24.71])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14kcuf-0002yM-00
	for mtd@infradead.org; Wed, 04 Apr 2001 03:20:49 +0100
Message-ID: <20010404022046.11794.qmail@nw171.netaddress.usa.net>
Date: 3 Apr 2001 19:20:46 PDT
From: Eric <ebrower@usa.net>
To: Tim Bowman <tbowman@emware.com>, Eric <ebrower@usa.net>,
  mtd mailing list <mtd@infradead.org>
Subject: Re: [Re: [RPX Classic/Lite and byte ordering]]
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Tim,

Have you verified that a kernel compiled with this io.h
change still works properly on your system?  This sounds
shakey to me if your kernel was already working as a whole
without your changes.

I would think that using __raw_writeX and __raw_readX combined
with the appropriate endian setting in cfi_endian.h would have
the same effect without such a drastic change.  I am more concerned
about the statement that other folks with the same boardset do not
experience this problem-- likely, the correct fix is an endian-map
(similar in spirit to LART) in cfi_endian.h rather than io.h in such =

a case.  If you can find a mythical RPX system that does not have this
error, perhaps you can modify the driver to read/write/read/write some
location to determine if you have an 'affected' board or not.

E

Tim Bowman <tbowman@emware.com> wrote:

> Ta-Da.... I fixed the problem in include/asm-ppc/io.h:
> ...
> #define readb(addr) in_8((volatile u8 *)(addr))
> #define writeb(b,addr) out_8((volatile u8 *)(addr), (b))
> #if defined(CONFIG_APUS) || defined(RPXCLASSIC)
> #define readw(addr) (*(volatile u16 *) (addr))
> #define readl(addr) (*(volatile u32 *) (addr))
> #define writew(b,addr) ((*(volatile u16 *) (addr)) =3D (b))
> #define writel(b,addr) ((*(volatile u32 *) (addr)) =3D (b))
> #else

[ ... ]

> This solution doesn't explain why some of you haven't had this problem.=
 =

> Maybe the flash really is wired up two different ways on RPX boards...



____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
