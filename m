Return-path: <David.Woodhouse@mvhi.com>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111F5v-0004kK-00
	for mtd@infradead.org; Mon, 5 Jul 1999 21:12:03 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: Disk-On-Chip 2000 and Linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Jul 1999 21:12:02 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111F5u-0002Mc-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  I was unclear :> The physical device is just an ordinary AMD flash
> chip with a paginging mechanism. They are using a filesystem on it
> called TrueFFS (which sounds to me like a take off on FTL). The
> CardTrick bios seems to provide int 13 services using this TrueFFS to
> fake a hard drive. 

Yep. Sounds a lot like M-Systems' old devices, except they used Intel flash. 
I'd be very surprised if this TrueFFS was different to the TrueFFS which I 
had working before with David Hinds' FTL code.

I'll take a look at combining your drivers with the existing MTD stuff, which 
has FTL support - then I'll send it back to you for testing - do you currently 
have TrueFFS on any of these devices?

Can you send me a dump of one of these 'TrueFFS' filesystems? 

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
