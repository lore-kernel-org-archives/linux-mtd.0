Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aDDo-0007ON-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:53:32 +0000
Message-ID: <3AA4A648.F57BEF2@inventel.fr>
Date: Tue, 06 Mar 2001 09:56:40 +0100
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: mtd with 2.0.4-test6
References: <3AA3A2FF.9E25407A@inventel.fr> <31161.983802881@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In fact, I applied the patch by hand (some modifications were already done at
the 2.4.0-test6 stage).
The kernel seems to feel happy and recognizes my flash parts (the driver should
be running) ;
I have some amd standard compatible flashes and want a cramfs on it. Between the
filesystem and the driver, a layer should be added ; is it correct that this
would be done by the mtdblock driver ?

Xavier

David Woodhouse wrote:
> 
> xde@inventel.fr said:
> > I am trying to add the mtd features to my 2.4.0-test6 system. But the
> > inter module is not available in this kernel. Is it safe to patch it
> > with the 2.2.17 inter module patch ?
> 
> Better just to remove the whole inter_module_xxx abortion from the MTD code
> and live with the extra dependencies. get_module_symbol() allowed us to
> make it nicer. With inter_module_xxx it's just not worth the trouble.
> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
