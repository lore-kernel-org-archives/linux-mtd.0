Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13PUcQ-0001p1-00
	for mtd-list@infradead.org; Thu, 17 Aug 2000 19:42:22 +0100
Received: from [209.64.46.121] (helo=phoenix.bmedesign.com ident=mdj)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13PUcO-0001oA-00
	for mtd@infradead.org; Thu, 17 Aug 2000 19:42:20 +0100
Received: from localhost (mdj@localhost)
	by phoenix.bmedesign.com (8.8.7/8.8.7) with ESMTP id MAA03900
	for <mtd@infradead.org>; Thu, 17 Aug 2000 12:45:58 -0600
Date: Thu, 17 Aug 2000 12:45:53 -0600 (MDT)
From: Mark Jackson <mdj@phoenix.bmedesign.com>
To: mtd@infradead.org
Subject: Procedure for mounting DOC2000
Message-ID: <Pine.LNX.4.04.10008171239060.3886-100000@phoenix.bmedesign.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>From what I've gathered by reading the mail lists, what I'm doing 
should work, but for some reason it's not.

I have a PC104 board with a DOC2000 at 0xe000; the m-systems linux
driver works fine.

# ./util/MAKEDEV
# /sbin/insmod mtdcore.o
# /sbin/insmod doc2000.o
# /sbin/insmod nftl.o
# mount /dev/nftla1 mnt
mount: /dev/nftla1 has wrong major or minor number

There is nothing in /proc/mtd

Any insight would be greatly appreciated.  There is really very
little documentation which describes how to get this working...

Regards,

Mark


--
Mark Jackson
Senior Engineer
BME Design, LLC.
724 Whalers Way Bldg H Suite 200
Ft. Collins, CO 80525
Phone: (970) 377-4134
email mdj@phoenix.bmedesign.com

-- The ideas expressed in this email do not necessarily reflect those
of my employer.  Come to think of it, they don't really reflect mine 
either!




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
