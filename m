Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fhyP-0003m0-00
	for mtd-list@infradead.org; Thu, 13 Apr 2000 12:39:49 +0100
Received: from ncc2.infomail.es ([194.224.53.135] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fhyO-0003ls-00
	for mtd@infradead.org; Thu, 13 Apr 2000 12:39:48 +0100
Message-ID: <38F5B150.112227EE@tsai.es>
Date: Thu, 13 Apr 2000 13:36:48 +0200
From: Rodrigo Moya <rmoya@tsai.es>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>
Subject: Re: problems compiling
References: <38F5ADF6.30B89174@tsai.es>  <38F4D0AA.3FEA3BCF@tsai.es> <16135.955614336@devel2.axiom.internal> <17190.955625589@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> rmoya@tsai.es said:
> >  'cvs update -A' and 'cvs -z3 diff' do nothing, just:
> 
> Very very odd. Can you try checking it out again from scratch?
> 
Yes, I've checked it out again, and now, at least the mtd.h is correct.
I'll look at the other ones. But what could have happened?


> rmoya@tsai.es said:
> > What is not working? I don't know if I'll be able to do it, but as I
> > really need the drivers, I can have a try.
> 
> It's the blkdev_dequeue_request and nftl_end_request code that's not
> working somehow. I need to look more closely at some other block devices
> and work out what it's doing wrong.
> 
I'll have a look at it!

> Actually, 1.24 is the last version which worked.
>


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
