Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11yj9R-0004SO-00
	for mtd-list@infradead.org; Thu, 16 Dec 1999 22:13:33 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=michalk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11yj9P-0004SI-00
	for mtd@infradead.org; Thu, 16 Dec 1999 22:13:31 +0000
From: "Brian K. Michalk" <michalk@sisko.awpi.com>
Message-Id: <199912162211.QAA23498@sisko.awpi.com>
Subject: Re: Beginner with DoC
To: dviro@ibm.net (Dvir Oren)
Date: Thu, 16 Dec 1999 16:11:27 -0600 (CST)
Cc: mtd@infradead.org
In-Reply-To: <199912162127.PAA21998@sisko.awpi.com> from "Dvir Oren" at Dec 16, 99 11:31:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> > insmod mtd -- cool
> > insmod doc2000 -- cool
> 
> You'll need to insmod nftl, as well.
> 
> > Okay, now I want to see if I can see them with fdisk, but I've
> > 	got only a few clues as to the nodes.  I tried
> > 	mknod fla b 62 0 through fla4 for major IDs 62, 90, 31, 93,
> > 	and 44.  Fdisk never finds any of the devices.
> 
> Instead of that, run the MAKEDEV script included in mtd.
> fla are for M-Systems drivers, not MTD.


Ahhh.  I was just about to send you my log, then I thought, hmmm, 
I ought to try fdisk /dev/nftla1.  Bingo.  It works.

Interesting thing is that fdisk shows four partitions already on the
chip.  I'll delete them and see what sort of damage I can do now
Thanks for the help.

-- 
Brian Michalk  <http://www.awpi.com/michalk>
Life is what you make of it ... never wish you had done something.
Aviator, experimental aircraft builder, motorcyclist, SCUBA diver
musician, home-brewer, entrepreneur and SINGLE!


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
