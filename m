Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139Ooe-0006ok-00
	for mtd-list@infradead.org; Tue, 04 Jul 2000 10:16:28 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 139Ood-0006oe-00
	for mtd@infradead.org; Tue, 04 Jul 2000 10:16:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-kernel@vger.rutgers.edu
Cc: mtd@infradead.org, linux-router-devel@linuxrouter.org,
  linux@handhelds.org, linux-embedded@waste.org
Subject: Memory Technology Device code 2000-07-04 release.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 04 Jul 2000 10:20:19 +0100
Message-ID: <9972.962702419@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've been lazy for a long time and not bothered to tar it up and make 
releases - ever since I set up anoncvs access. 

But here's the release you've all been waiting for. It features sexy new 
code for driving Common Flash Interface chips, 2.2 and 2.4 ports of Axis' 
Journalling Flash Filesystem, updated FTL code, and lots and lots of code 
cleanups for the places where I'd been particularly stupid. There's even a 
little bit of documentation, which is still mostly relevant despite my best 
efforts to obsolete it.

Get it from ftp://ftp.linux-mtd.infradead.org/pub/mtd/mtd-20000704.tar.gz
or preferably:

	cvs -d :pserver:anoncvs@infradead.org:/home/cvs login
		(password "anoncvs")
	cvs -d :pserver:anoncvs@infradead.org:/home/cvs co mtd

A slightly more detailed changelog is on the web page at
http://www.linux-mtd.infradead.org/ along with the mailing list 
archive.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
