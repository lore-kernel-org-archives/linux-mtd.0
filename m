Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H7jZ-0000zy-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 17:39:09 +0100
Received: from [216.84.103.11] (helo=coolexchange.coollogic.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H7jY-0000zW-00
	for mtd@infradead.org; Tue, 25 Jul 2000 17:39:08 +0100
Message-ID: <397DC47C.E8E8E364@coollogic.com>
Date: Tue, 25 Jul 2000 16:46:52 +0000
From: Ian Thompson <ithompson@coollogic.com>
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: 64M DOC2000
References: <397DA945.60FED4FA@coollogic.com>  <397DA681.1DBEC4DA@coollogic.com> <2943.964535514@cygnus.co.uk> <4349.964536318@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Actually I had to play with the code to get it to recognise the device.
This 
is probably due to my test setup.

I boot from a hard drive and set the DOC up from within Linux. This
means contending
with the LILO/DOC interaction so I use DOC2.FFF to blank out the
conflicting region.
The detection code misses the device when using this, because it reads
FFs instead of the
55 and AA signature. I took out that detection and restricted
doc_locations[] to 
the actual location of the DOC and the device is found. 

Kernel output to follow.

Ian T.


David Woodhouse wrote:
> 
> ithompson@coollogic.com said:
> > The part is recognised by the mtd driver with 2.4.0. I can partition
> > it with fdisk /dev/nftl and create  ext2 disks.
> 
> Good.
> 
> > However, when I try
> > to copy data to it I start getting input/output errors after I've got
> > a certain amount of data (yet to be determined) on it.
> 
> Urgh. That may be normal though :(
> 
> Can you post the whole of the kernel's output while you're doing this,
> including what it says when it probes and finds the device?
> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
