Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12l6De-0003rQ-00
	for mtd-list@infradead.org; Fri, 28 Apr 2000 09:33:50 +0100
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12l6Dd-0003rK-00
	for mtd@infradead.org; Fri, 28 Apr 2000 09:33:49 +0100
Received: from zentropix.com ([195.166.67.91])
	by colo.asti-usa.com (8.9.3/8.9.3) with ESMTP id EAA11239
	for <mtd@infradead.org>; Fri, 28 Apr 2000 04:43:25 -0400
Message-ID: <39094DF8.7BD43B12@zentropix.com>
Date: Fri, 28 Apr 2000 09:38:16 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: TODO List
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi Everyone,

Dave Woodhouse and I had a meeting yesterday and we came up with the
following list of things that need doing to/fixing in the MTD code:

1	Write Support
	a	ECC
	b	Bad block handling (static)
	c	Bad block detection and handling (dynamic)
	d	Timing constraints
	e	Asynchronous writes

2	FTL fix

3	Support for NOR flash/PCMCIA

4	Support utilities
	a	Formatting
	b	Bad sector/block detection
	c	Consistency checking

5	Documentation
	a	Architectural description
	b	User Guide and API listing
	c	...

6	DOC Millenium support

7	Fix the character device memory copy to/from user space

8	JFFS/FFS2 support

9	GRUB
	a	Filesystem support (NFTL, JFFS etc)
	b	MTD support

10	Execute-in-place

We attempted to prioritize them as we saw fit with the following two
goals: 
	a)	submission to the main-stream linux kernel (2.4/2.5)
	b)	production of a fully GPL alternative to what M-Systems offer

Since Dave's still officially on holiday I agreed to post this to the
list. We're after your opinions and suggestions regarding the TODO list
and the two immediate goals for this work. We're also after volunteers
to take on various parts of the development. Please feel free to comment
upon the above.

Thanks,

Trevor.

--
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
