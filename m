Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BrFWS-00054I-Hv
	for linux-mtd@lists.infradead.org; Sun, 01 Aug 2004 08:33:05 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20040731135955.GA10803@wohnheim.fh-wedel.de>
References: <20040731135955.GA10803@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1091363581.12594.122.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 01 Aug 2004 13:33:01 +0100
Content-Transfer-Encoding: 8bit
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

On Sat, 2004-07-31 at 15:59 +0200, Jörn Engel wrote:
> With a ram based volatile device, there is danger of data loss, so
> garbage collection would have to be forced from time to time, similar
> to the current wbuf approach for nand.

I wouldn't do it like this -- why have a separate nvram device with
JFFS2 nodes in it, when we could just use the page cache and inode
cache. It's going to be _very_ hard to get fsync() et al right if we
implement our own caching.

The reason this hasn't been done is because it requires space
reservations, and that's not trivial. You have to ensure that you have
enough free flash space to make room for everything that's currently
outstanding in the cache. It shouldn't be _that_ hard though.

Doing this right should fix the problem you describe, of extremly
short-lived files hitting the medium when ideally they wouldn't ever get
written out. It would also help a lot with coalescing frequent short
writes to log files into larger nodes, and it would help us with
implementing shared writable mmap too.

-- 
dwmw2
