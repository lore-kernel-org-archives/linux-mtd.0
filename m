Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X9bb-00042u-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 21:20:55 +0000
Received: from out4.prserv.net ([32.97.166.34] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12X9bX-00042f-00
	for mtd@infradead.org; Mon, 20 Mar 2000 21:20:52 +0000
From: Dvir Oren <dviro@ibm.net>
To: Trevor Woolven <trevw@zentropix.com>, , MTD <mtd@infradead.org>
Subject: Re: Request for kernel with DOC2000
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8BIT
Date: Mon, 20 Mar 2000 21:43:44 +0200
Sender: owner-mtd@imladris.demon.co.uk
Message-Id: <E12X9bb-00042u-00@infradead.org>
List-ID: <linux-mtd.lists.infradead.org>

>From Trever Woolven:

>2	I'm getting an error, where I cannot mount the DOC device > as the driver complains about the major/minor number. I am 
> investigating  whether or not this is due to uninitialised data 
> structures. 
> 3	My collegue had a lot of problems with this driver: failing 
> during 'fdisk'; DOC read/writes; e2fsck; mke2fs; etc, etc. 
> The big problem I'm having so far (apart from understanding the 
> sequence of events and what the code's actually doing) is that 
> none of  these errors is repeatable, (except the one I mentioned
> in 2 above)

More or less my problems.  Though I was able to compile the 
drivers for 2.2.14, I can't seem to mount, or fdisk, or do anything.  It 
seems to me like the 2.3 initialization does not work under 2.2.  I've 
compared it to m-systems' code, and to a book I have, and it what 
is written should work for modules, not for kernel drivers, which is 
exactly what happens.

If anybody was able to fix this, I'll be glad to see what they did.  I'll 
work on it myself, when I have the time.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
