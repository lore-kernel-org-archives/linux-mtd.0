Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198Ehz-0002Bw-HB
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 08:30:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030422093342.GA20257@wohnheim.fh-wedel.de>
References: <001301c30745$438c1e60$0365a8c0@leeyang>
	 <20030422093342.GA20257@wohnheim.fh-wedel.de>
Message-Id: <1051083025.13999.20.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 23 Apr 2003 08:30:25 +0100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
cc: leeyang <leeyang@ycig.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: mmap on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-04-22 at 10:33, Jörn Engel wrote:
> AFAIK (someone please correct me) jffs2 does not support mmap. I don't
> remember any technical reason, so it seems as if noone cared enough to
> implement it.

We support readonly mmap. What we don't support is shared writable mmap,
where any time you change a byte in your mapped version, you end up
writing the _whole_ page out to flash, because we can't tell how dirty
the page is.

This is for three reasons -- firstly it's hard to ensure that we'll
actually have enough space on the flash to write out a page when it's
dirty. Secondly it's _very_ hard to make sure we've allocated all the
memory in advance that we'll need for node information, because the
writepage() function would get called under memory pressure and we
mustn't reenter the allocation routines, and thirdly if you're writing
to a flash file system you really ought to be paying more attention and
limiting your writes.

I suggest you do what Berkeley DB does -- mmap the file readonly for
direct access, but do writes with a write() system call. It does that on
all file systems anyway, for reasons of reliability.

> You can do the work yourself, pay someone to do it or wait and hope
> that someone else does it. As always.

It's a _lot_ of work, for little perceivable gain.

-- 
dwmw2
