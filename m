Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DasmI-0007l9-VK
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 06:06:20 -0400
Date: Wed, 25 May 2005 12:06:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050525100614.GA17002@wohnheim.fh-wedel.de>
References: <429320D1.2060003@elsoft.ch>
	<20050524145511.GA24361@wohnheim.fh-wedel.de>
	<429430FA.1080006@elsoft.ch>
	<1117009669.13088.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1117009669.13088.2.camel@sauron.oktetlabs.ru>
Cc: David =?iso-8859-1?Q?M=FCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>,
	linux-mtd@lists.infradead.org
Subject: Re: JFFS2 access delay
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 May 2005 12:27:49 +0400, Artem B. Bityuckiy wrote:
> 
> > Do you know if JFFS3 or Yaffs show a similar behaviour?
> > 
> JFFS3 doesn't really exist.
> I haven't ever tried YAFFS, but Charles said it is OK.

If you read the design, you notice the same scalability problem JFFS2
suffers from.  Yaffs is maybe 10x or 100x better.  Which means, it
will be just as bad as JFFS2 is today once the flash sizes have grown
by 10x or 100x.

And in exchange it suffers a bunch of other limittions.  Basically,
only use it if you have an embedded device with raw nand flash access.

WRT. flash filesystems, you're currently sitting between a rock and a
hard place.  Traditional disk-based filesystems like ext2 will kill
your flash in a few month or even weeks, but show decent performance.
Dedicated flash filesystems are near-optimal for flash survival and
perform like a snail on an uphill race.

For now, go with JFFS2 or Yaffs (if you have NAND and don't need
compression).

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
