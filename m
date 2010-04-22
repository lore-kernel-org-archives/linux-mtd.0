Date: Thu, 22 Apr 2010 07:25:41 -0700 (PDT)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH] [MTD] Fix JFFS2 sync silent failure
In-Reply-To: <20100422062631.GC27309@logfs.org>
Message-ID: <alpine.LFD.2.00.1004220724170.9086@i5.linux-foundation.org>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
	<20100422055448.GA27309@logfs.org>
	<20100422062631.GC27309@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thu, 22 Apr 2010, Jörn Engel wrote:
>
> I think this is bad enough that you should be involved.  32a88aa1 broke
> a number of filesystems in a way that sync() would return 0 without
> doing any work.  Even politicians are better at keeping the promises.
> 
> This is caused by the two-liner in __sync_filesystem:
> 	if (!sb->s_bdi)
> 		return 0;
> s_bdi is set implicitly for all filesystems using set_bdev_super(), so
> most block device based filesystems are safe.  There are, however, a
> number of odd-balls around:

Umm. Why not just remove the two-liner? It was incorrect. The comment says 
"this should be safe", and if it wasn't, then the commit that caused this 
all was total crap to begin with.

Why even discuss any other measures?

		Linus
