Return-path: <David.Woodhouse@mvhi.com>
Date: Mon, 5 Jul 1999 14:05:16 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: Dave@infradead.org, mtd@infradead.org
Subject: Re: Disk-On-Chip 2000 and Linux 
In-Reply-To: <E111ESR-0002J1-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990705140256.5069A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 5 Jul 1999, David Woodhouse wrote:

> jgg@deltatee.com said:
> >  Have you had any contact with Datalight about their TrueFFS stuff? I
> > hear that windows CE will use FAT on TrueFFS and I belive that my
> > Octagon board's 'CardTrick' bios does the same. It would round things
> > out nicely to have support for that as well.
> 
> As far as I know, Datalight's ROM-DOS doesn't support the chips at all; it just
> uses the INT 13h functionality provided by the Disk-On-Chip onboard BIOS
> extensions. I don't know about the CardTrick BIOS, but I expect that it just 
> uses M-Systems' code. 

I was unclear :> The physical device is just an ordinary AMD flash chip
with a paginging mechanism. They are using a filesystem on it called
TrueFFS (which sounds to me like a take off on FTL). The CardTrick bios
seems to provide int 13 services using this TrueFFS to fake a hard drive.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
