Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al38E-000824-Nj
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 09:34:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3brorf4hg.fsf@maxwell.lnxi.com>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	 <1075099329.17157.97.camel@lapdancer.baythorne.internal>
	 <m3bror89u9.fsf@maxwell.lnxi.com>
	 <1075102799.17157.209.camel@lapdancer.baythorne.internal>
	 <m3brorf4hg.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1075109506.19924.45.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 09:31:46 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 02:23 -0700, Eric W. Biederman wrote:
> Compression is an interesting question.  Do you encode the uncompressed
> size of a block in bytes. 

Yes.

>  If so I don't think it would be too difficult to get your uncompressed
>  block size > page size. 

It wouldn't be difficult -- but that's not really at all relevant to the
above question. By 'uncompressed block size' here I'm assuming you're
talking of the amount of data payload we attach to any given node (log
entry). The rule is currently that it mustn't cross a page boundary --
and hence, by inference, obviously can't exceed a page in size.

That assumption did allow a little simplification of bits of the code,
but actually it turned out to be less useful than I originally thought,
so it might be worth ditching in order to let us get better compression
by compressing larger chunks at a time.

>  With the page cache there is real reason a block size <= page size. 
>  You just need what amounts to scatter/gather support.

Yes. It's been done for zisofs -- if we have to decompress, for example,
16KiB to satisfy a single 4KiB readpage, we can prefetch the other data
which we had to decompress anyway. 

Fix up some other assumptions about the first byte in any given page
also being the first byte in a node, and fix up the garbage-collection
which will need to have enough workspace to decompress and recompress
the largest block it may encounter, and it should work.

> My real question here is how difficult is it to disable compression?
> Or can compression be deliberately disabled on a per file basis?

It's not too hard. To disable it completely you just need to change a
few #defines in os-linux.h. The support for disabling it on a per-file
basis isn't complete, but there are flags allocated in the inode
structure to keep track of it.

> I have a truly perverse case I would like to ask your opinion about.
> A filesystem composed of 2 8K erase blocks?  That is one of the
> weird special cases that flash chips often support.  I could
> only store my parameter file in there but it would be interesting.

To be honest, at that size I'd just do it directly via /dev/mtd0. Put
the file directly on the flash with a checksum. Alternate between the
eraseblocks each time it changes, then erase the old copy.

> And a last question. jffs2 rounds all erase blocks up to a common size
> doesn't it?

Yes.

-- 
dwmw2
