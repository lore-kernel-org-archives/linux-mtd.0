Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10qvtV-0001YH-00
	for mtd@imladris.demon.co.uk; Mon, 7 Jun 1999 10:40:37 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Mon, 07 Jun 1999 10:40:37 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 928748335:10:14288:30; Mon, 07 Jun 99 09:38:55 GMT
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: Linux-MTD mailing list <mtd@imladris.demon.co.uk>
Subject: Re: RFC: kernel-based PCMCIA ... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Jun 1999 10:38:22 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10qvrK-00038e-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Has there been an talk of a FFS driver for linux? 

There's already an FTL driver for Linux, and has been for some time. 
M-Systems' new version of 'TrueFFS' doesn't appear to be FTL, and so there 
isn't (yet) a driver for it. I'm unlikely to be looking into that - I'm going 
to just put FTL on the device when I can eventually get it working properly.

> Also, has anyone done any work on writing drivers for ordinary flash chips 
> (ie on embedded systems)  

Look in ftp://imladris.2001ad.net/pub/mtd/flash.diff




----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
