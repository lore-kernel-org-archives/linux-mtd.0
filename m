Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ob8z2-0007Kh-8q
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 09:19:28 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/4] mtd: add new ioctl structures to be used for
	repartitioning
Date: Tue, 20 Jul 2010 11:19:17 +0200
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<201007182022.59590.arnd@arndb.de>
	<1279512386.16247.70.camel@localhost.localdomain>
In-Reply-To: <1279512386.16247.70.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201007201119.17747.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 19 July 2010, Artem Bityutskiy wrote:
> On Sun, 2010-07-18 at 20:22 +0000, Arnd Bergmann wrote:
> > Yes, that's generally true. It would be nice if the BLKPG ioctl
> > definition could be reused for this. It is more complicated
> > than it should be, but not more than this suggestion, and
> > it's an existing ioctl.
> 
> Thanks for reply.
> 
> MTD devices do not support BLKPG, do you mean we should you the same
> data-structures and names as block devices?

Yes. I'm not sure if it should also be possible to actually repartition
the flash using the mtdblock driver, but what I meant was to implement
the BLKPG API in the mtdchar driver, with slightly adapted semantics.

	Arnd
