Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MwJo-0006Se-EU
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 21:54:12 +0100
Date: Mon, 2 Jun 2003 22:54:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030602205441.GA30619@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<002901c32919$ddc37000$570486da@w0a3t0>
	<20030602153656.GA679@wohnheim.fh-wedel.de>
	<1054568407.20369.382.camel@passion.cambridge.redhat.com>
	<20030602155353.GB679@wohnheim.fh-wedel.de>
	<1054569564.20369.385.camel@passion.cambridge.redhat.com>
	<20030602163704.GC679@wohnheim.fh-wedel.de>
	<1054582573.22361.6.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1054582573.22361.6.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2003 20:36:13 +0100, David Woodhouse wrote:
> 
> I was concerned briefly that the allocation could happen when we're
> trying to evict a page on memory pressure -- but in fact that's
> virtually impossible since you'd have to mount the file system and mmap
> your file without actually writing anything to the block device.

Right.  If someone gets into memory pressure before ever writing to
the device, there should be other problems in the system anyway.  No
need to fix something that is already broken elsewhere.

> And anyway, refer to earlier comments about anyone using the naïve
> read/erase/modify/writeback mtdblock translation layer for writing in
> production wanting to be shot for it :)

Right!

Jörn

-- 
More computing sins are committed in the name of efficiency (without
necessarily achieving it) than for any other single reason - including
blind stupidity.
-- W. A. Wulf 
