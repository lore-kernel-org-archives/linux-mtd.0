Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c1Ux-0004q0-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 10:18:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B8CB316.4A421C81@dgt-lab.com.pl> 
References: <3B8CB316.4A421C81@dgt-lab.com.pl>  <999074214.32409.1.camel@russ> <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ> <3B8C86BD.5C4FBCF9@dgt-lab.com.pl> <999069428.31681.12.camel@russ> <3B8C9DC5.F3185B18@dgt-lab.com.pl> <21505.999075348@redhat.com> 
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 29 Aug 2001 10:24:57 +0100
Message-ID: <25302.999077097@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

krom@dgt-lab.com.pl said:
> > The erase of unclean sectors is done in the background after the mount
> > has finished. One day we'll get round to fixing the drivers so that we
> > don't busy-wait for erases to complete either.

> Please anonuce it on the list. 

It won't make your mount any faster. You have a sane CPU which can handle 
having both a cached and uncached mapping of a physical region - try doing 
that in your map driver (see ocelot.c for inspiration) and see if it helps.

You may also want to investigate burst reads from the flash chips, if your 
hardware is capable of it. 

Another possibility is to work with the people who want XIP so you can give 
the JFFS2 code a direct pointer to the flash chips and avoid the 
out-of-line function calls on every read.


--
dwmw2
