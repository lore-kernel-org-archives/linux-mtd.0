Received: from mail.fh-wedel.de ([213.39.232.194])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BrgIg-0007Zw-EK
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2004 13:08:42 -0400
Date: Mon, 2 Aug 2004 19:08:24 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040802170824.GC26115@wohnheim.fh-wedel.de>
References: <20040731135955.GA10803@wohnheim.fh-wedel.de>
	<1091363581.12594.122.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1091363581.12594.122.camel@imladris.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Volatile data device vor jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 1 August 2004 13:33:01 +0100, David Woodhouse wrote:
> On Sat, 2004-07-31 at 15:59 +0200, Jörn Engel wrote:
> > With a ram based volatile device, there is danger of data loss, so
> > garbage collection would have to be forced from time to time, similar
> > to the current wbuf approach for nand.
> 
> I wouldn't do it like this -- why have a separate nvram device with
> JFFS2 nodes in it, when we could just use the page cache and inode
> cache. It's going to be _very_ hard to get fsync() et al right if we
> implement our own caching.

Your approach doesn't always work for me because sometimes people care
a lot about the last log entries.  They need to be inside a
non-volatile medium, either nvram or flash.  Unless you want to move
the page cache to nvram... ;)

Also, fsync can just do the same as sync.  If the helper device is
nvram, nothing at all.  If it's dram, flush it all to flash.

> The reason this hasn't been done is because it requires space
> reservations, and that's not trivial. You have to ensure that you have
> enough free flash space to make room for everything that's currently
> outstanding in the cache. It shouldn't be _that_ hard though.
>
> Doing this right should fix the problem you describe, of extremly
> short-lived files hitting the medium when ideally they wouldn't ever get
> written out. It would also help a lot with coalescing frequent short
> writes to log files into larger nodes, and it would help us with
> implementing shared writable mmap too.

All these problems should be fixed with my approach as well.  Plus it
is trivial to switch from dram to nvram if customers care.  And I
know customers that might ;)

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
