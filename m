Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uMjx-0004Gc-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 00:06:02 +0100
Date: Tue, 1 May 2001 00:06:11 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?)
In-Reply-To: <3AEDE678.51C6F94E@daniel.com>
Message-ID: <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 30 Apr 2001, Vipin Malik wrote:

> Obviously, not all sectors are being "cycled" evenly. As a matter of
> fact, none of the sectors below 0x380000 are being cycled at all.
>
> Now, one thing that may be tripping up the wear leveling algorithm is
> the fact that the system is being cycled every 2-3 minutes.

That's almost certainly the reason. My testing on prolonged stress tests
showed a fairly even wear levelling.

> David? What does the algorithm to "pickup" a new "less cycled" sector
> and give a over-used sector a rest depend on?

Most of the time we pick the block off the end of the dirty_list. With a
1/100 probability, we pick a block off the clean_list instead.
Freshly-dirtied blocks get put on the back of the dirty_list. Likewise,
freshly-filled blocks get put on back of the clean_list. So it tends to
use them fairly evenly.

However, when we remount the filesystem, we lose that ordering. The blocks
get put on the lists in order, and we pick the block nearest the end of
the medium.

Suggested fix: introduce some randomness to the initial list after
mounting.

Either:
	1. After scan, move the first <n> blocks in the list to the end
		of the list, where 1 < n < sizeof(list).
	2. When adding entries to the lists during scan, do something
		like: if (jiffies % 1) list_add_tail() else list_add().

-- 
dwmw2
