Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Co0tl-00014L-I8
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 09:52:03 -0500
Date: Mon, 10 Jan 2005 15:51:54 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050110145154.GC12520@wohnheim.fh-wedel.de>
References: <20050108211842.GA17176@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501091202440.19297@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501091202440.19297@phoenix.infradead.org>
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

On Sun, 9 January 2005 12:03:54 +0000, Artem B. Bityuckiy wrote:
> Joern Engel wrote:
> > As an example, scan.c used to be really horrible (and contained one or
> > two bugs).  After removing all the printk()s, I was able to see what
> > the code was doing.  Then quite a few obvious changes were possible.
> > Some things were simple changed to my personal style.  And finally,
> > the data reading code was abstracted out of the scanning code, which
> > resulted in about 120 lines less code.
> I believe, having these debugging printk's is pretty good idea. I suspect 
> you don't want to say opposite?

I do. ;)

> But as person who develop JFFS2 for several months, I may say that it is 
> really not very readable, but that was not very big obstacle to understand 
> it for me (but this is *real* obstacle when developing it, IMHO).

Exactly.  Anything other than functional code makes it hard to read
and even harder to change.  So the chances of introducing bugs are
much higher.  In a way, the debug code is needed because of the debug
code itself.

Sure, it also serves a real purpose and not having any debug code
requires programmers that don't cause bugs.  So it is a necessary
evil.  The real art is to get by with as little debug code as
possible, yet have enough data to easily find any problems.

> > Currently, the scanning should be substantially slower, but getting
> > back to the old speed should be possible in less than 120 lines.
> Sorry, I do not quite understand what changes do you mean. Was this 
> something you previously did in scan.c?

Before my changes: jffs2_scan_eraseblock() had reading and buffer
handling code all over the place.  Horribly ugly, but relatively
optimized.

After my changes: Reading and buffer handling moved into
jffs2_scan_map().  jffs2_scan_eraseblock() is much simpler, but
optimizations are gone.

> I believe there is something which slows down scan process - the reading 
> data to buffer and then scanning that buffer, instead of reading only 
> really needed data. Seems like not very good technique.

Yes, quite a bit could be optimized here.  After my (or similar)
abstraction, it should be relatively simple to play with it.  Unless
your mtd supports point(), in that case it just doesn't matter.

> > So: Do people want something like this for jffs3?  If noone cares, I
> > will get back to my old behaviour of ignoring it.
> Personally I would be happy to see JFFS3 
> 1) reformatted
> 2) uni-styled
> 3) well commented/documented

Also personally:
1) well documented
2) as few comments, debugs, printks as possible
3) short, simple functions (function names can be enough documentation)
4) more documentation to the data structures, esp. locking hierarchy
5) strictly sticking to 80 columns

And apart from style:
6) mmap support (read: database support)
7) me running jffs3 on a 1GB flash as rootfs for my notebook

> Would be good to agree on style and use it. Of course, Linux style is the 
> main - but it is not too restrictive. People still use different styles. 
> For example, Ferenc doesn't like tabs and uses whitespaces. :-)
> This is minor, but still important, IMHO.
> 
> If you would like, just send you offers what to use (smth like JFFS2 
> coding style), and we may put it to jffs3/JFFS3.Notes file for reference 
> (after discussing).

Diff between foo.c and "Lindent foo.c" should be small.  Sometimes
Lindent makes code actually worse, but most of the time it is pretty
good.

Basically, look at mm/*.c or fs/*.c and follow about the same style.

> P.S. I hope David won't mind :-)

He'll complain loudly if he does.  I'm sure.

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
