Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12l7vd-00040B-00
	for mtd-list@infradead.org; Fri, 28 Apr 2000 11:23:21 +0100
Received: from ncc3.infomail.es ([194.224.53.142] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12l7vc-000405-00
	for mtd@infradead.org; Fri, 28 Apr 2000 11:23:20 +0100
Message-ID: <39098136.72FA8BE1@linuxave.net>
Date: Fri, 28 Apr 2000 14:16:54 +0200
From: Rodrigo Moya <rodrigo@linuxave.net>
MIME-Version: 1.0
To: Trevor Woolven <trevw@zentropix.com>
CC: David Woodhouse <David.Woodhouse@mvhi.com>,
 	Rodrigo Moya <rmoya@tsai.es>, MTD List <mtd@infradead.org>,
 	trevorw@zentropix.com
Subject: Re: no success
References: <Pine.LNX.4.10.10004181756500.32688-100000@devel2.axiom.internal> <39080C3B.B6F3A58B@zentropix.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


> Hi,
> 
> Apologies but I've been away for 10 days or so.
> It sounds to me as if the init routines have not been set-up correctly
> as Dave suggested.
> 
> linux/init/main.c - do_basic_setup() calls init_mtd()
> mtd.c - init_mtd() calls the rest of the configured init routines.
> 
> I can't remember if there's much screen output to see, there should be
> something. If in doubt, try enabling the DBG output, (recompile with
> -DZDBG).
> 
> Hope this helps, if not get back to me with some more details
> 
It was my fault, I had applied the patch, but in a different directory,
and my makefile wasn't copying the patched init/main.c file. Sorry.

But now, I'm compiling with this fixed, and I get undefined references
to register_mtd_notifier and unregister_mtd_notifier, which are not in
the source tree I've got here. I've even dropped today the directory and
checked out from CVS a fresh copy.

And these two functions are neither in the linux source tree.

Thanks for your help!



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
