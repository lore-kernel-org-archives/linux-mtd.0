Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12n4Bg-00079E-00
	for mtd-list@infradead.org; Wed, 03 May 2000 19:47:56 +0100
Received: from dwmw2 by infradead.org with local (Exim 3.03 #1)
	id 12n4Bf-000798-00
	for cvs-notify@infradead.org; Wed, 03 May 2000 19:47:55 +0100
To: cvs-notify@infradead.org
Subject: MTD CVS update: 'mtd/kernel ftl.c'
Message-Id: <E12n4Bf-000798-00@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 03 May 2000 19:47:55 +0100
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Update of /home/cvs/mtd/kernel
In directory infradead.org:/tmp/cvs-serv27452

Modified Files:
	ftl.c 
Log Message:
First attempt at fixing endianness and wordsize problems. Doesn't work,
and I can't really see how it ever did given that I'd accidentally swapped
a write() to a read() in copy_erase_unit() 
(case BLOCK_REPLACEMENT is supposed to read(src); write(dest); - not
supposed to read them both in turn :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
