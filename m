Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BXsm-0007se-00
	for mtd-list@infradead.org; Mon, 10 Jul 2000 08:21:36 +0100
Received: from ncc1.infomail.es ([194.224.53.134] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13BXsk-0007sY-00
	for mtd@infradead.org; Mon, 10 Jul 2000 08:21:34 +0100
Date: Mon, 10 Jul 2000 09:17:20 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: Dvir Oren <dvir@lucidvon.com>
CC: MTD <mtd@infradead.org>
Subject: Re: Re: Re: plilo problems
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E13BXsk-0007sY-00@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>




On Thu,  6 Jul 2000, Dvir Oren wrote:
> Date: Thu,  6 Jul 2000 16:36:49 +0300 (IDT)
> To: rmoya@tsai.es
> From: Dvir Oren <dvir@lucidvon.com>
> Subject: Re: Re: plilo problems
> 
> Rodrigo Moya writes ("Re: Re: plilo problems"):
> 
> > > LILO
> > > .ccboot:
> > > Loading linux.........................
> 
> It might be because you have a large kernel.  One of the effects that
> the patch does is limit the size of the kernel you can use.  I think
> that LILO should have warned about it, or not installed it, but I may
> be wrong.  What size kernel are you using?  I think it should not be
> larger than 450K or so.  Try to make a smaller kernel.
> 
Yes, it might be this, the kernel I'm using is 579140 bytes. I'll try
removing some things.

Thanks


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
