Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192vSg-000414-Uf
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 16:56:39 +0100
Date: Tue, 8 Apr 2003 17:56:37 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20030408155637.GA5065@wohnheim.fh-wedel.de>
References: <3E92D5C7.8020603@imc-berlin.de>
	<20030408141952.GA30313@wohnheim.fh-wedel.de> <3E92DDC9.7030000@imc-berlin.de>
	<20030408150331.GA32580@wohnheim.fh-wedel.de> <3E92E57A.5000900@imc-berlin.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E92E57A.5000900@imc-berlin.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 uncompressed?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 April 2003 17:06:34 +0200, Steven Scholz wrote:
> 
> It's working! :o)

The good thing about clean code is that it's so easy to add ugly code
on top of it. :)

> Would you like a define like
> 
> #define USE_COMPRESSION
> 
> or rather
> 
> #define DONT_USE_COMP
> or something like that!?

The change is simple enough already, no neef for more #ifdefs.

There is currently ongoing discussion about implementing conditional
compression in several places. Either per compile, as you did it, per
mount point or per inode.

Per inode is the most flexible, was already prepared a long time ago
and is imo the way. If/when this is done, the only reason to use your
simpler approach is to shrink the kernel image.

In short: don't bother.

> BTW: Where could I put it so mkfs.jffs2 will find it?
> Or should we add a command line option to mkfs.jffs2?

I'd prefer a command line option.

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
