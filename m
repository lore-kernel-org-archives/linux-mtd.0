Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zbov-00013J-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 16:52:49 +0100
Message-ID: <38DF842F.DF5EF78E@zentropix.com>
Date: Mon, 27 Mar 2000 16:54:23 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Alexander Larsson <alex@cendio.se>, mtd@infradead.org
Subject: Re: New release of MTD code pending.
References: <Pine.LNX.3.96.1000327161351.26450A-100000@biffen.cendio.se> <9794.954167059@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> alex@cendio.se said:
> >  I saw the new FTL code uses 2.3 style module initialization, and so
> > does my mtdram code. Are we targeting only 2.3, or should we add some
> > kludges to support older versions?
> 
> I'd like to support 2.2 unless it's too much trouble. doc2000 and nftl already
> do (should?)
> 
> > I'm mostly interested in 2.4 (and 2.5) stuff, as I hope we can get MTD
> > included in the 2.5 release cycle. Also much of the API (i.e. modules)
> > is cleaner in 2.3.
> 
> I hope we can get it in earlier than 2.5. "New drivers that don't affect
> infrastructure are never too late."
> 
> --
> dwmw2
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
I definitely need 2.2 support as I'm very close to a customer delivery
and don't need any other hassles at this moment in time. Thanks.

Just my 4d worth

Trev.
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
