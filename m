Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZaLg-0000bD-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:18:32 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZaLe-0000b7-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:18:30 +0100
Received: from biffen.cendio.se (IDENT:alex@biffen.cendio.se [193.180.23.11])
	by brie.cendio.se (8.9.3/8.9.3) with ESMTP id QAA26140
	for <mtd@infradead.org>; Mon, 27 Mar 2000 16:18:29 +0200
Received: from localhost (alex@localhost)
	by biffen.cendio.se (8.8.7/8.8.7) with SMTP id QAA26854
	for <mtd@infradead.org>; Mon, 27 Mar 2000 16:18:29 +0200
Date: Mon, 27 Mar 2000 16:18:29 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
Subject: Re: New release of MTD code pending.
In-Reply-To: <6013.954148369@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000327161351.26450A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, David Woodhouse wrote:

> I'm intending to make a new release some time this week.
 Cool.
 
> I'm going to update the FTL code so it compiles with 2.3 kernels - probably by 
> taking David Hinds' latest version from the PCMCIA code and porting it to MTD 
> again, so I get the last 3 years' worth of bug fixes while I'm at it.
> 
> The mtdblock driver needs fixing too - volunteers?
> 
> We're now in the interesting position of having two flash filesystems present 
> in the tree - one of which (FFS2) compiles only on 2.2 kernels, and the other 
> of which (JFFS) only compiles on 2.3. It'd be nice to fix that at some point.

I saw the new FTL code uses 2.3 style module initialization, and so does
my mtdram code. Are we targeting only 2.3, or should we add some kludges
to support older versions?

I'm mostly interested in 2.4 (and 2.5) stuff, as I hope we can get MTD
included in the 2.5 release cycle. Also much of the API (i.e. modules) is
cleaner in 2.3.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
