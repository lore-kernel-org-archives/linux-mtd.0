Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Kjsg-0001tV-00
	for mtd-list@infradead.org; Fri, 04 Aug 2000 16:59:30 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Kjse-0001tP-00
	for mtd@infradead.org; Fri, 04 Aug 2000 16:59:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: jffs-dev@axis.com
Cc: mtd@infradead.org, linux@handhelds.org
Subject: JFFS in 2.2 - Call for testing.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Aug 2000 16:59:22 +0100
Message-ID: <13576.965404762@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ok. I've committed to my CVS the crap-but-safe fix to jffs_file_write() - 
it kmalloc's a bounce buffer and copies the data into it, before passing it 
to jffs_write_node().

Hopefully someone will do the 'proper' fix fairly soon - writes through the
page cache - but at the moment, I'm aware of no outstanding bugs in 2.2
JFFS.

I'm not sure I'd claim it's quite ready for production use, but it's getting 
there. Suck it and see.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
