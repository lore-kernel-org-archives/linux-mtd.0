Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11y0WL-0003CD-00
	for mtd-list@infradead.org; Tue, 14 Dec 1999 22:34:13 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=michalk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11y0WJ-0003C6-00
	for mtd@infradead.org; Tue, 14 Dec 1999 22:34:11 +0000
Received: (from michalk@localhost)
	by sisko.awpi.com (8.9.0/8.9.0) id QAA08264
	for mtd@infradead.org; Tue, 14 Dec 1999 16:31:59 -0600
From: "Brian K. Michalk" <michalk@sisko.awpi.com>
Message-Id: <199912142231.QAA08264@sisko.awpi.com>
Subject: Beginner with DoC
To: mtd@infradead.org
Date: Tue, 14 Dec 1999 16:31:58 -0600 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

My system:
Advantech biscuit PC
DoC2000, 72 megabyte
Linux (slackware) 2.2.6

Eventually I want to be able to boot off of the DoC, but for now, 
I'll settle for making the kernel modules work.  I read the 
documentation I could find, but still had problems.  Here's
what I did:

Downloaded mtd-19991025.tar.gz, extracted, compiled.
	I get a compile error for the various utilities.
Download mtd-19991025.diff, patch and compile -- no help,
	so I comment out the offending utilities.
insmod mtd -- cool
insmod doc2000 -- cool
Okay, now I want to see if I can see them with fdisk, but I've
	got only a few clues as to the nodes.  I tried
	mknod fla b 62 0 through fla4 for major IDs 62, 90, 31, 93,
	and 44.  Fdisk never finds any of the devices.

So, what nodes am I supposed to make?

Thanks for the help.

-- 
Brian Michalk  <http://www.awpi.com/michalk>
Life is what you make of it ... never wish you had done something.
Aviator, experimental aircraft builder, motorcyclist, SCUBA diver
musician, home-brewer, entrepreneur and SINGLE!


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
