Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11zRIZ-0005Xr-00
	for mtd-list@infradead.org; Sat, 18 Dec 1999 21:21:55 +0000
Received: from out4.prserv.net ([165.87.194.239] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11zRIX-0005Xl-00
	for mtd@infradead.org; Sat, 18 Dec 1999 21:21:54 +0000
From: "Dvir Oren" <dviro@ibm.net>
To: MTD <mtd@infradead.org>
Date: Sat, 18 Dec 1999 23:22:42 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: MTD compiled in the kernel
Message-Id: <E11zRIX-0005Xl-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I'm still having problems compiling MTD into the 2.2 kernel.

The drivers seem to load fine, but when I try to fdisk /dev/nftla, I get 
"unable to read /dev/nftla".  Trying to mount /dev/nftla1 won't work 
either.

Anybody got any ideas?

One other oddity, is that I get a strange error:
"Changing size of flash from 7ce0 to 7ce0 for geometry reasons"
(or something like that, quoting from memory).

David, any ideas?

---------------
Dvir Oren
<dviro@hotpop.com>
<http://thor.prohosting.com/~dviro>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
