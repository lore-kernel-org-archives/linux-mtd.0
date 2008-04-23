Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JofFU-00008H-H6
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 13:43:00 +0000
Date: Wed, 23 Apr 2008 23:42:54 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC] slight UBI scan time improvement
Message-ID: <20080423134254.GA17867@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
	<1208955467.11721.69.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208955467.11721.69.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 03:57:47PM +0300, Artem Bityutskiy wrote:
> On Wed, 2008-04-23 at 22:40 +1000, Hamish Moffatt wrote:
> > Well I think from past use of "time ubiattach ..." that most of
> > the missing time is in the attach. 
> Sure, UBI takes most of the time. Its just if you want to save 1.2+ sec,
> you may try to play with on-flash BBT.

I'm not sure what this means.. ? Instead of having to scan each block
to check the marker, it has a central table? And that table is created
once by an initial scan and then added to when UBI declares a block bad?
How do I access this feature?

> > What sort of speed do you get using
> > dd if=/dev/mtdblock9 of=/tmp/foo bs=128K count=64
> > (where mtdblock9 is your raw mtd NAND device). I'm seeing about 6
> > seconds to read that 8Mb, which is quite long I guess.
> I have busybox so stuff like 128K does not work. Here are my results:

Hmm I have busybox (1.9.x) also, 128K works ok for me.

> # time dd if=/dev/mtd4 of=/dev/null bs=131072 count=64
> 64+0 records in
> 64+0 records out
> real    0m 0.28s
> user    0m 0.00s
> sys     0m 0.28s

Very good. It's about 6.1 seconds for me :-(

(Worse on my previous hardware which had compact flash on IDE without a
hardware IDE controller: over 11 seconds.)


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
