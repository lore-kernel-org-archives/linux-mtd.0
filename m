Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BamO-00086r-00
	for mtd-list@infradead.org; Mon, 10 Jul 2000 11:27:12 +0100
Received: from ncc3.infomail.es ([194.224.53.142] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13BamN-00086l-00
	for mtd@infradead.org; Mon, 10 Jul 2000 11:27:11 +0100
Date: Mon, 10 Jul 2000 12:22:48 CEST
From: Rodrigo Moya <rmoya@tsai.es>
To: Dvir Oren <dvir@lucidvon.com>
CC: MTD <mtd@infradead.org>
Subject: Re: Re: Re: Re: plilo problems
Reply-To: rmoya@tsai.es
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <E13BamN-00086l-00@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



> > 
> > > > LILO
> > > > .ccboot:
> > > > Loading linux.........................
> > 
> > It might be because you have a large kernel.  One of the effects that
> > the patch does is limit the size of the kernel you can use.  I think
> > that LILO should have warned about it, or not installed it, but I may
> > be wrong.  What size kernel are you using?  I think it should not be
> > larger than 450K or so.  Try to make a smaller kernel.
> > 
> Yes, it might be this, the kernel I'm using is 579140 bytes. I'll try
> removing some things.
> 
Well, now my kernel is 436367 bytes, and the problem is still there. But I
get a different LILO prompt:

> LILO
> )boot:

Any time I run lilo, I then boot from DOS to put the firmware (with
dupdate). Is that the correct way? Or it is needed only once?

Cheers


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
