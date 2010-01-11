Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUSgl-0004k0-1g
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 22:24:47 +0000
Received: by bwz4 with SMTP id 4so14197361bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Jan 2010 14:24:35 -0800 (PST)
Subject: Re: RFC: [PATCH V2 0/9 Integration of SmartMedia/xD into mtd subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20100109002600.GA3258@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<20100108160404.GE31872@logfs.org>
	<1262972429.20060.4.camel@maxim-laptop>
	<20100109002600.GA3258@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Jan 2010 00:24:31 +0200
Message-ID: <1263248671.24201.7.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-01-09 at 01:26 +0100, Jörn Engel wrote: 
> On Fri, 8 January 2010 19:40:29 +0200, Maxim Levitsky wrote:
> > 
> > Btw, your cards aren't Type M, right?
> > However I use here a Type M card, and its likely to include an FTL
> > inside, thus, it might explain the low speeds I get there partially...
> 
> No, mine were the old ones before marketing invented the two types.
> 
> Jörn
> 

I finally located the source of slowdown.
It appears to be caused by too large caching I did (5 erase blocks).
If I cache one block, write speed nears 1 MB/s.
As a bonus that makes the FTL much simplified.

Another small flaw that currently exists in my FTL is that it ignores
the underlying badblock support from mtd driver and requeres it to
expose the two bad block bytes in the oob layout, I think I can avoid
that after all.

Other that that, everything is just perfect.

I post updated patchset soon.

Best regards,
Maxim Levitsky
