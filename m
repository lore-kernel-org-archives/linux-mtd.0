Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11yzjE-0004qd-00
	for mtd-list@infradead.org; Fri, 17 Dec 1999 15:55:36 +0000
Received: from cust-97-194.customer.jump.net ([216.30.97.194] helo=valhalla.alerta.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11yzjC-0004qX-00
	for mtd@infradead.org; Fri, 17 Dec 1999 15:55:35 +0000
Message-ID: <004a01bf48a7$6cb4f4c0$0202010a@ns.jump.net>
From: "Brian Michalk" <michalk@alerta.net>
To: "Dvir Oren" <dviro@ibm.net>
Cc: <mtd@infradead.org>
Subject: Re: Beginner with DoC
Date: Fri, 17 Dec 1999 09:57:30 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Spoken like a person whose been bitten.

I did not get the kernel drivers to compile properly, but gave up as soon as
I found out that the patch was for the kernel drivers.
My application is pretty interesting ... at least for me.  It's for data
collection in a vehicle, and the computer is essentially a remote embedded
PC.  For years I wanted something like this with a UNIX I could afford.  Now
with DOC, I can have my computer, log in to it and do anything I would have
been able to do with a full blown computer out there.

I've always fiddled with the various stamps, flashlight controllers, and
lots of ZWorld controllers, but this is going to be much better.

PS: To whom it may concern:
May I make a suggestion (as a newcomer)?  This list has the "reply to" set
to the original author.  I'll bet there are a lot of private email
conversations going on that could answer a lot of the problems for people
like me.  It would be nice if the replyto were set to the list as well as
the original author.


-----Original Message-----
From: Dvir Oren <dviro@ibm.net>
To: Brian K. Michalk <michalk@sisko.awpi.com>
Date: Friday, December 17, 1999 9:16 AM
Subject: Re: Beginner with DoC


> Interesting thing is that fdisk shows four partitions already on the
> chip.  I'll delete them and see what sort of damage I can do now
> Thanks for the help.
>

When fdisk is concerned, if something appears odd, I don't mess
with it before I understand what has happened.  I once had to play
around with the names of the devices since I had a program that
would not install itself to anything but partitions that are named
/dev/hda-hdd.  So I renamed /dev/fla to /dev/hda, and installed it.
However, when I ran fdisk, I got confused with all the names, and
instead of destroying the flash, I destroyed my hard disk!  Luckily,
most was recovered.

If you manage to install MTD drivers in the kernel, and not as
modules, let me know.  For some reason it doesn't work for me.
---------------
Dvir Oren
<dviro@hotpop.com>
<http://thor.prohosting.com/~dviro>




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
