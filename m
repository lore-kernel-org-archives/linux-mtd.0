Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19LnuJ-00082X-D9
	for <linux-mtd@lists.infradead.org>; Fri, 30 May 2003 18:43:11 +0100
Date: Fri, 30 May 2003 19:43:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: James Morris <jmorris@intercode.com.au>
Message-ID: <20030530174319.GA16687@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "David S. Miller" <davem@redhat.com>
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 31 May 2003 01:29:42 +1000, James Morris wrote:
> 
> In 2.5 (and soon 2.4), the crypto/deflate.c module makes use of zlib as
> well.  This is typically used in ipsec for ipcomp.  Each ipcomp security
> association has a zlib context, and access to the workspace is serialized 
> by the security association's bh lock.
> 
> (Something needs to be done for this particular case in general: a box
> with 1000 tunnels could use use 450MB of atomic kernel memory just for
> zlib workspaces alone.  A solution I've been looking at for this is to
> allow workspaces to be dynamically sized based on the compression
> parameters instead of using worst-case figures.  The memory savings may be
> up to 90% in this case).

Or 99.9%, if you map all those workspaces to one, similar to my patch.
The softirq context requires another set of workspaces, but in
principle the same could be done.  Downside is that the Init- and End-
functions have to be called more often, which will surely cost cpu
time.  I haven't done any benchmarks yet, so it remains to be shown if
this is relevant.

Your approach basically reintroduces the zmalloc() and zfree()
functions and makes behaviour under memory pressure interesting.  It
is not impossible to get it right, but quite hard for sure.

> > This patch creates an extra workspace of 400k per cpu, that is used for
> > both inflate and deflate.  One of the central workspaces is used for
> > users that don't provide their own.  Semaphore protection is done in
> > zlib_(in|de)flateInit() and zlib_(in|de)flateEnd, so the user has to
> > call those functions more often to release the semaphores before
> > returning to userspace.
> 
> This won't work for the bh lock protected case outlined above, and will
> cause contention between different users of zlib.

Image a 2-cpu machine that does reads and writes to jffs2 on two
devices simultaneously.  When one process is reading and one is
writing, everything is fine.  When both perform the same operation,
the current design makes one wait at the semaphore, while one cpu is
idle.  In my design, you have one workspace per cpu, so both can work
simultaneously.

What contention were you talking about? :)

The bh lock is another issue.  Here we need another set of workspaces,
independent of the existing one (with or without my patch).  But in
principly, the same should be possible.

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
