Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFxBl-00072v-St
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 19:47:42 +0000
Date: Fri, 18 Jan 2008 18:20:46 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080118182046.GB21136@shareable.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080117162601.GA6677@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> > If we do a ls without waiting that jffs2_garbage_collect_pass finish, ls 
> > takes 12 minutes to complete.
> 
> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
> sure who cares enough to look at this.  My approach would be to 
> $ echo t > /proc/sysrq_trigger
> several times during those 12 minutes and take a close look at the code
> paths showing up.  Most likely it will spend 99% of the time in one
> place.

I have seen similar slow GCs with JFFS2 on a 2.4.26-uc0 kernel (which
is very old now), just 1MB size, and of course no summary support.  In
this case it wasn't 12 minutes, but about 1 minute with the GC thread
using 100% CPU.  I saw it a couple of times.  But that's much slower
than erasing and writing the whole 1MB, so it's possible there has
been a GC bug doing excessive flash operations which remains unfixed
for a very long time.

-- Jamie
