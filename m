Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Co1wa-0002F1-V2
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 10:59:05 -0500
Date: Mon, 10 Jan 2005 16:58:38 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050110155838.GE12520@wohnheim.fh-wedel.de>
References: <20050108211842.GA17176@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501091202440.19297@phoenix.infradead.org>
	<20050110145154.GC12520@wohnheim.fh-wedel.de>
	<1105369990.5698.95.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105369990.5698.95.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 simplifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 January 2005 15:13:10 +0000, David Woodhouse wrote:
> On Mon, 2005-01-10 at 15:51 +0100, Jörn Engel wrote:
> > Exactly.  Anything other than functional code makes it hard to read
> > and even harder to change.  So the chances of introducing bugs are
> > much higher.  In a way, the debug code is needed because of the debug
> > code itself.
> > 
> > Sure, it also serves a real purpose and not having any debug code
> > requires programmers that don't cause bugs.  So it is a necessary
> > evil.  The real art is to get by with as little debug code as
> > possible, yet have enough data to easily find any problems.
> 
> I don't really see how printks make the code harder to read. You can
> probably convince your editor to hide them from you automatically if
> they really offend you.

if (foo)
	printk();
else
	functional code;

vs.

if (!foo)
	functional code;

No editor I've ever seen can do the above.  There were quite a few
cases like this.

> I prefer to optimise for the common case -- which is the _user_ not the
> developer. The level of verbosity if you enable CONFIG_JFFS2_FS_DEBUG is
> high, but it means that I can take a log from a clueless end-user and
> see precisely what's going on. I can look at a log from someone who's
> having problems, see precisely what's happening, and provide a patch in
> reply. While there are certainly some printks which can go, and even
> more could be demoted to level 2 from level 1 (which is all that's ever
> really useful), I wouldn't want to see it completely stripped of
> debugging output. Not unless you want to take over the task of
> supporting users ;)

Agreed.  Right now _I_ need them removed to understand what the code
does and change it where it doesn't look that good.  In most code I
took ownership for, most output (not all) was permanently removed.
Jffs2 doesn't fall into that category, though.

Basically, I expect to work in three steps:

1. Remove all output and change the code where necessary.  Should
compile, that's all.  Will surely introduce new bugs.

2. Start from mainline again and redo those changes that actually make
a difference.  scan.c is a candidate.  Make it work on my machine.

3. Send you patches.  If my new version of scan.c doesn't have any
output anymore, you'll surely complain and want some back.  Find some
sort of agreement.


So in the end, I won't even touch most files.  I might bitch about the
verbosity here and there.  Without the bitching, I wouldn't be able to
make radical changes, so it is necessary.  Losing friends over the
bitching is definitely not wanted, but may be a side-effect.  Hope you
can take some of it.


Really, jffs2 is something that may warrant a software patent - if
anything is.  Log-structured file systems are long-known and have some
issues.  The idea to split the fs into chunks and do the
log-structured thing per chunk is the stroke of a genius.  Most of the
implementation is extremely nice as well, better than what I could
have done for sure.

But I focus on the bad parts that need work, so most comments from me
will be negative.  Please don't take it the wrong way.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
