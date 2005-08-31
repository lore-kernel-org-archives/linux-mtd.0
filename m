Received: from bay17-f4.bay17.hotmail.com ([64.4.43.54] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAONU-0000Xq-UY
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 04:55:32 -0400
Message-ID: <BAY17-F41BC3A8A470FB28B1AB03E8A10@phx.gbl>
In-Reply-To: <20050830102739.GC9504@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, jaredeh@gmail.com
Date: Wed, 31 Aug 2005 16:34:01 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>	The solution
>
>Quite a few things are possible now.  But any real fix for this design
>problem will require a fixed amount of physical blocks to be part of a
>virtual block.  No matter what else changes, the number of physical
>blocks per virtual one *must not*.
>
>Imo, the best number of physical blocks per virtual one to pick is one
>(1).  Any higher number will limit scalability towards small flashes.
>JFFS2 requires 5 erase blocks in _addition_ to whatever is occupied by
>data.  With a 2:1 mapping, devices smaller than 12 physical blocks
>wouldn't work with JFFS2 at all.
>
>The rest is code and implementation details.
>
Hmm...I think I don't have a very clear picture of implementation
details. In particular I don't have a clear mind of following points:

1 compatibility issue. Let's name the JFFS2 with 1:1 mapping support
as "new", and the JFFS2 without 1:1 mapping as "old". So what's the
expected behaviour of mounting "new" JFFS2 binary upon "old" JFFS2 fs
image? What's the expected behaviour of mounting "old" JFFS2 binary 
upon "new" JFFS2 fs image?

2 Will a new node type be introduced in order to implement 1:1 mapping?

Thanks,
Forrest
