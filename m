Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19qRc4-0006R9-3c
	for <linux-mtd@lists.infradead.org>; Sat, 23 Aug 2003 07:11:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Jared Hulbert <jaredeh@yahoo.com>
In-Reply-To: <20030823020456.40119.qmail@web10503.mail.yahoo.com>
References: <20030823020456.40119.qmail@web10503.mail.yahoo.com>
Message-Id: <1061619037.27605.20.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 23 Aug 2003 07:10:37 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: hardware cached reads
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-08-23 at 03:04, Jared Hulbert wrote:
> I noticed the new map_info.cached in
> /include/linux/mtd/map.h is only used in
> /drivers/mtd/maps/ocelot.c.  I'm assuming this is just
> incomplete.  It would seem the goal is to provide a
> dual mapping of the flash to uncached and cached
> regions.  
> 
> Am I reading this correctly?

Yes. Note that the Ocelot map driver used to handle flushing the cache
-- but did it far too often. The chip drivers need to learn when to do
it.

> Any tips, warnings, parallel efforts, flames, jokes?

We've discussed it briefly before, haven't we? Used cached mapping only
for data reads, flush it from the chip driver (probably with a new
map_info method for flushing the cache) upon write or erase.

Do remember that i386en get very unhappy if you ever map the same region
with both a cached and uncached mapping.

We may also want to investigate putting burst-capable chips (and
chipsets) into burst mode for ourselves.

-- 
dwmw2
