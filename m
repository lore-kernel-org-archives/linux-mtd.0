Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from out5.prserv.net ([165.87.194.243] helo=prserv.net)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11r6qH-000895-00
	for mtd@imladris.mvhi.com; Thu, 25 Nov 1999 21:54:17 +0000
From: "Dvir Oren" <dviro@hotpop.com>
To: MTD <mtd@imladris.mvhi.com>
Date: Fri, 26 Nov 1999 00:03:10 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: (Fwd) DoC2000 Kernel problems
Message-Id: <E11r6qH-000895-00@imladris.mvhi.com>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


------- Forwarded message follows -------
From:           	Dvir Oren <dviro@hotpop.com>
To:             	Majordomo@imladris.mvhi.com
Subject:        	DoC2000 Kernel problems
Date sent:      	Sat, 20 Nov 1999 21:35:27 +0200

I have two questions that I hoped you might be able to help me with:

1.  I'm not able to compile the files into the kernel.  For some 
reason, when I compile the drivers into the kernel, I can't reach 
/dev/nftla with fdisk, and I can't mount /dev/nftla1.  I applied the 
patch from this mailing list, and still the same thing.  Anybody got 
any ideas?

2.  I'm trying to create a diskless system using DoC2000 flash.  
My problem is initializing the flash with the root file system, and 
stuff that I need there, without connecting a disk to it.  I thought 
about using Etherboot, however it has the same problem that lilo 
has with M-Systems' firmware, that does not allow it to boot.  
Anybody has any ideas?

------- End of forwarded message -------
---------------
Dvir Oren
<dviro@hotpop.com>
<http://thor.prohosting.com/~dviro>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
