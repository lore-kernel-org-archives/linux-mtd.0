Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14n416-00005O-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 20:41:32 +0100
Received: from ru.oro.net ([204.212.106.70])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14n414-00005D-00
	for mtd@infradead.org; Tue, 10 Apr 2001 20:41:30 +0100
Received: from d3.front.oro.net (D3.front.oro.net [204.212.104.71])
	by Ru.oro.net (8.9.3+3.2W/8.9.3/Debian 8.9.3-21) with ESMTP id MAA25651
	for <mtd@infradead.org>; Tue, 10 Apr 2001 12:40:56 -0700
Received: (from ralph@localhost)
        by d3.front.oro.net (8.12.0.Beta5/8.12.0.Beta5/Debian 8.12.0-1) id f3AJdrJn000566
        for mtd@infradead.org; Tue, 10 Apr 2001 12:39:53 -0700
Date: Tue, 10 Apr 2001 12:39:52 -0700
From: Ralph Jennings <ralph@oro.net>
To: mtd@infradead.org
Subject: MTD LiLo for DOC 2000/Milenium chips
Message-ID: <20010410123952.A32766@d3.front>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


We've switched over to compact flash now, so we probably won't be
using the DOC stuff anymore.

Since I won't be using this anymore, I'm sending it to the list.
I got the origional mtd-lilo patch from somebody on this list,
and hacked it up to work the stock Debian lilo-21.7-1.  I've also
included the stock Debian orig.tar.gz, and 21.7-1.diff file in my
.tgz file.  But you can find it on www.debian.org (not sure the
exact URL though).  Instructions are in the README file.  Whoever
gave me the patch origionally might want to take a look at this
one.  I have made no major changes though, only munged it up to
work with 21.7-1, so any bugs in your origional patch probably
still exist (though I have found none).

Hope this is of use to some out there.

 -Ralph



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
