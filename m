Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ob9BS-0007oZ-49
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 09:32:19 +0000
Subject: Re: [PATCH 1/4] mtd: add new ioctl structures to be used for
	repartitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <201007201119.17747.arnd@arndb.de>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<201007182022.59590.arnd@arndb.de>
	<1279512386.16247.70.camel@localhost.localdomain>
	<201007201119.17747.arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jul 2010 12:25:44 +0300
Message-ID: <1279617944.16462.99.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-20 at 11:19 +0200, Arnd Bergmann wrote:
> On Monday 19 July 2010, Artem Bityutskiy wrote:
> > On Sun, 2010-07-18 at 20:22 +0000, Arnd Bergmann wrote:
> > > Yes, that's generally true. It would be nice if the BLKPG ioctl
> > > definition could be reused for this. It is more complicated
> > > than it should be, but not more than this suggestion, and
> > > it's an existing ioctl.
> > 
> > Thanks for reply.
> > 
> > MTD devices do not support BLKPG, do you mean we should you the same
> > data-structures and names as block devices?
> 
> Yes. I'm not sure if it should also be possible to actually repartition
> the flash using the mtdblock driver, but what I meant was to implement
> the BLKPG API in the mtdchar driver, with slightly adapted semantics.

No, using mtdblock is not feasible, because of several reasons like that
it is a debugging driver which does not handle bad blocks, and it works
on top of mtd, has no idea about mtd internals, and all the partitions
logic is inside mtd, and not available for mtdblock.

But yes, using the BLKPG API sounds like a reasonable idea, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
