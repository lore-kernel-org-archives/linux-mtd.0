Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sKwR-0005x2-0P
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 12:27:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Hall <john-news1@cambridgetechgroup.com>
In-Reply-To: <696f.3f4dd944.a899d@irwin2.crw.uk.net>
References: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
	 <1062066193.8465.1571.camel@hades.cambridge.redhat.com>
	 <696f.3f4dd944.a899d@irwin2.crw.uk.net>
Message-Id: <1062070043.8465.1615.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 28 Aug 2003 12:27:23 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Lost space on JFFS2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-28 at 11:28 +0100, John Hall wrote:
> I wasn't sure how JFFS2 does its writes, i.e. whether it did each write
> immediately to the flash, or whether it would build a page or block's
> worth before writing to the flash. Now I see that each write is done
> immediately.

Not on NAND. We _can't_ just write out every tiny node as it happens,
since we could violate the writes-per-page limit for NAND. We batch
writes with a write-behind buffer, flushing it if it's got dirty data in
after a certain amount of time. It was that flushing which was causing
the problem. Now we trigger garbage-collection to fill it, instead of
just padding and wasting the space.


-- 
dwmw2
