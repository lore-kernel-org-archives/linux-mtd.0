Received: from web10503.mail.yahoo.com ([216.136.130.153])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19qNmJ-0005rg-Mb
	for <linux-mtd@lists.infradead.org>; Sat, 23 Aug 2003 03:05:19 +0100
Message-ID: <20030823020456.40119.qmail@web10503.mail.yahoo.com>
Date: Fri, 22 Aug 2003 19:04:56 -0700 (PDT)
From: Jared Hulbert <jaredeh@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: hardware cached reads
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I noticed the new map_info.cached in
/include/linux/mtd/map.h is only used in
/drivers/mtd/maps/ocelot.c.  I'm assuming this is just
incomplete.  It would seem the goal is to provide a
dual mapping of the flash to uncached and cached
regions.  

Am I reading this correctly?

I was planning on implementing this anyway.  I've done
this for cramfs and for filesystems under other OS's. 
It was a Good Thing, as in 2X file read perf.

Any tips, warnings, parallel efforts, flames, jokes?

-J

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
