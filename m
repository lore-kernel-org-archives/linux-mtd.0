Received: from 0122700014.0.fullrate.dk ([95.166.99.235] helo=kernel.dk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4zFB-0000fq-Tl
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 16:27:14 +0000
Date: Thu, 22 Apr 2010 18:27:10 +0200
From: Jens Axboe <jens.axboe@oracle.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [MTD] Fix JFFS2 sync silent failure
Message-ID: <20100422162709.GJ27497@kernel.dk>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
	<20100422055448.GA27309@logfs.org>
	<20100422062631.GC27309@logfs.org>
	<alpine.LFD.2.00.1004220724170.9086@i5.linux-foundation.org>
	<alpine.LFD.2.00.1004220730280.9086@i5.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1004220730280.9086@i5.linux-foundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 22 2010, Linus Torvalds wrote:
> 
> 
> On Thu, 22 Apr 2010, Linus Torvalds wrote:
> >
> > Umm. Why not just remove the two-liner? It was incorrect. The comment says 
> > "this should be safe", and if it wasn't, then the commit that caused this 
> > all was total crap to begin with.
> 
> Grr. Ok, so we do need it. Because Jens made it not work without it, and 
> didn't fix up the filesystems, just added a random comment saying "we 
> shouldn't need to".
> 
> Double-grr. I hate misleading comments. It makes the patch and the code 
> look like people knew what they were doing.

Yeah sorry, that part was apparently not well thought through. It did go
through review and testing, but at least the latter was not good enough.

> Jens - please help fix this up.

Of course, I already posted a series of patches to fix this up. I want
to test them a bit, and I'll send them in tomorrow.

-- 
Jens Axboe
