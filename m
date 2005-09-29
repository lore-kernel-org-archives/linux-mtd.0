Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvP4-0004BG-SL
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:14:15 -0400
Date: Thu, 29 Sep 2005 12:12:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050929101247.GD18741@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433BBB19.9060905@yandex.ru>
Cc: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 13:59:53 +0400, Artem B. Bityutskiy wrote:
> Ferenc Havasi wrote:
> >The first way stores a reference in the first (usable) erase block. (If
> >it is not free, it moves the data to somewhere else, and reserve). It
> >stores only a reference to it at umount, and a "mount-log" at mount
> >(just to mark that it is invalid in case of unclean umount). It means
> >one page write at mount, one page write at umount. If the erase block
> >consist 16 pages than it is necesarry to erase the first erase block
> >after every 8 mounts. So the typical timelife of it is about 8*100.000
> >mounting, I think it is big enough.
> This spoils the overall wear-leveling, which is no good. But should work.

Dummy argument.  Wear levelling is just a means to avoid the real
problem - early wear-out of specific blocks.  Spending one erase block
for cs is pretty sane, as long as this block doesn't wear-out well
before the rest.

> >The other way is to specify the cenratlized summary information with
> >mount option (not to use the first erase block to store this pointer).
> >In this case some other system have to store it (typically on an other
> >file system), and the new location after umount can be read using sysfs.
> This also spoils wear-levelling...

How?

> And I don't like CS in general as it is not tolerant to unclean 
> reboots... Albeit, if this does not matter to a specific system - this 
> will work.
> 
> Nevertheless, I don't believe CS will make JFFS2 usable on 256MB 
> flashes, due to memory consumprion issues. Nor it will not (IMO) make it 
> scalable, which is sad :-(

CS definitely doesn't solve all problems and it trades the mount time
for additional writes - plus the special first erase block.  Still, it
may have its place.

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
