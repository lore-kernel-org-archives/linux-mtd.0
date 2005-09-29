Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKv7s-0003Xt-DP
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 05:55:58 -0400
Date: Thu, 29 Sep 2005 11:55:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050929095501.GC18741@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433BB979.7010904@inf.u-szeged.hu>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 11:52:57 +0200, Ferenc Havasi wrote:
> >
> >How is the CS information found during mount?  Special location?
> 
> There is two way (can be selected via kernel config):
> 
> The first way stores a reference in the first (usable) erase block. (If
> it is not free, it moves the data to somewhere else, and reserve). It
> stores only a reference to it at umount, and a "mount-log" at mount
> (just to mark that it is invalid in case of unclean umount). It means
> one page write at mount, one page write at umount. If the erase block
> consist 16 pages than it is necesarry to erase the first erase block
> after every 8 mounts. So the typical timelife of it is about 8*100.000
> mounting, I think it is big enough.
> 
> The other way is to specify the cenratlized summary information with
> mount option (not to use the first erase block to store this pointer).
> In this case some other system have to store it (typically on an other
> file system), and the new location after umount can be read using sysfs.

Sounds sane.  100k clean unmounts should be fine for most people.  I
know a couple of testers that would immediatly create a simple
while true; do mount mtd0 /mnt -t jffs2; umount /mnt; done
testcase just to prove you wrong, but apart from that...

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
