Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11w1RY-0005e6-00
	for mtd-list@infradead.org; Thu, 09 Dec 1999 11:09:04 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11w1RX-0005e0-00
	for mtd@imladris.mvhi.com; Thu, 09 Dec 1999 11:09:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <384ECE55.83FAD600@danielind.com> 
References: <384ECE55.83FAD600@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: Power Down] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 Dec 1999 11:10:26 +0000
Message-Id: <E11w1Ss-0005Mr-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
> > I've been rushed off my feet here with other things for a while, but
> > as soon as I get back to it, after I've fixed the NFTL and DiskOnChip 
> > Millennium support, that's what I'm intending to look at.

> Do you have an estimate for the time frame that you are looking at?

We have an EU research project coming to an end in February/March, and I'm
running our end of it.

I'm hoping to snatch a few days in the next week or two to merge in all the MTD
fixes I've been sent and look at the problems which have been reported, and
make a new release.

After that, I'm unlikely to be able to be very productive until mid-to-late 
Feb.

> I am willing to help out with coding, as I am extremely interested in
> this (and have access to lots of different embedded hardware with
> FLASH, SRAM etc. on it, and if needed I could possibly buy more :).

I have documentation on NFTL and the DiskOnChip hardware which I am permitted 
to release under NDA to someone who is serious about contributing to the 
development - your assistance would be greatly appreciated because I was 
hoping to have that completed by now.

There is also some work to be done with FTL on NOR flash, I believe. It should 
work, but apparently there are some problems with it. I don't currently have 
access to any NOR flash devices so haven't tested it recently.

Also, someone needs to provide new PCMCIA bulkmem drivers which use the MTD 
system. 

There's plenty of work to go round.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
