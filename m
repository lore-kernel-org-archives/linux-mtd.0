Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11LoXW-0000Ct-00
	for mtd@infradead.org; Tue, 31 Aug 1999 15:05:34 +0100
To: Mike Kilburn <mkilburn@ftel.net>
Cc: mtd@infradead.org
Subject: Re: Re[2]: DiskonChip2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 31 Aug 1999 15:05:32 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11LoXU-0000Qo-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


mkilburn@ftel.net said:
>  For now read only will do for my tests. The M-Systems drivers README
> indicates there may be severe blocking in kernel mode, so much so that
> mouse movements may be affected, this is unacceptable for a soft
> real-time system which is why I want to use drivers with source code.

My code also behaves the same way, at the moment - but it's also fairly high 
on the list of things to fix.

> Do you happen to know what the special Linux firmware does different
> than their normal firmware?

I wasn't aware that they had any different firmware for use with Linux.

> Also, they dont work with lilo due to where lilo loads the kernel.
> This requires a patch to lilo. Do you know of another boot loader
> which does not have this problem?

You could try grub.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
