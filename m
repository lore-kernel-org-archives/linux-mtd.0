Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JkGe2-0007G1-MJ
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 10:38:11 +0000
Date: Fri, 11 Apr 2008 12:37:57 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [patch 10/15] fs/logfs/memtree.c
Message-ID: <20080411103756.GF25462@logfs.org>
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833010@logfs.org>
	<200804101607.45409.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200804101607.45409.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 April 2008 16:07:44 +0200, Arnd Bergmann wrote:
> On Tuesday 01 April 2008, joern@logfs.org wrote:
> > +#if BITS_PER_LONG == 32
> > +#define BTREE_NODES 20 /* 32bit, 240 byte nodes */
> > +#else
> > +#define BTREE_NODES 16 /* 64bit, 256 byte nodes */
> > +#endif
> > +
> > +struct btree_node {
> > +       u64 key;
> > +       struct btree_node *node;
> > +};
> 
> On 32 bit platforms other than x86, your struct btree_node
> is 16 bytes long because of alignment requirements, rather
> than the 12 bytes you are assuming.

Indeed.  Will change the definition.

Long-term I'd like to generalize the btree a bit and allow three key
variants: long, u64 and u8[].  Some people want to stuff a
(u64, u64, u8) tupel into a btree.  For those it seems ideal to just
treat the key as an array and do memcmp() for comparison.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
