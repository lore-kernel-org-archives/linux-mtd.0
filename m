Return-path: <David.Woodhouse@mvhi.com>
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: Dave@infradead.org, mtd@infradead.org
Subject: Re: Disk-On-Chip 2000 and Linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Jul 1999 20:31:15 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111ESR-0002J1-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Have you had any contact with Datalight about their TrueFFS stuff? I
> hear that windows CE will use FAT on TrueFFS and I belive that my
> Octagon board's 'CardTrick' bios does the same. It would round things
> out nicely to have support for that as well.

As far as I know, Datalight's ROM-DOS doesn't support the chips at all; it just
uses the INT 13h functionality provided by the Disk-On-Chip onboard BIOS
extensions. I don't know about the CardTrick BIOS, but I expect that it just 
uses M-Systems' code. 

You could try them with the driver I wrote for the old Disk-On-Chip devices, 
and see what happens.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
