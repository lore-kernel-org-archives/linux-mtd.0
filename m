Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12kl89-0001Oz-00
	for mtd-list@infradead.org; Thu, 27 Apr 2000 11:02:45 +0100
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12kl87-0001Ot-00
	for mtd@infradead.org; Thu, 27 Apr 2000 11:02:43 +0100
Message-ID: <39080C3B.B6F3A58B@zentropix.com>
Date: Thu, 27 Apr 2000 10:45:31 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: David Woodhouse <David.Woodhouse@mvhi.com>
CC: Rodrigo Moya <rmoya@tsai.es>, MTD List <mtd@infradead.org>,
        trevorw@zentropix.com
Subject: Re: no success
References: <Pine.LNX.4.10.10004181756500.32688-100000@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> On Mon, 17 Apr 2000, Rodrigo Moya wrote:
> 
> > yes, all the nftla* devices have 93 as major number. Another thing, is
> > that the kernel displays no messages about the MTD drivers. Should it
> > show something?
> 
> It should. Are you sure you patched the init routines in properly? The
> patch in the CVS patches (?) directory ought to work. Anyway, I'm
> supposed to be on holiday. Trevor?
> 
> --
> dwmw2
Hi,

Apologies but I've been away for 10 days or so.
It sounds to me as if the init routines have not been set-up correctly
as Dave suggested.

linux/init/main.c - do_basic_setup() calls init_mtd()
mtd.c - init_mtd() calls the rest of the configured init routines.

I can't remember if there's much screen output to see, there should be
something. If in doubt, try enabling the DBG output, (recompile with
-DZDBG).

Hope this helps, if not get back to me with some more details

Cheers

Trev.
-- 
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
