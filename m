Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cy8QH-0004Pd-Bp
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 07:55:26 -0500
Date: Mon, 7 Feb 2005 13:55:01 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Victor <andrew@sanpeople.com>
Message-ID: <20050207125500.GA25504@wohnheim.fh-wedel.de>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
	<20050202124043.GB23156@wohnheim.fh-wedel.de>
	<1107421396.32163.53.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107421396.32163.53.camel@fuzzie.sanpeople.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 February 2005 11:03:16 +0200, Andrew Victor wrote:
> 
> > > +	/* and Dataflash */
> > > +	if (jffs2_dataflash(c)) {
> > > +		ret = jffs2_dataflash_setup(c);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > 
> > This can be a bit simpler:
> > 	ret = jffs2_dataflash_setup()
> > 	if (ret)
> > 		return ret;
> 
> I just copied the way it was done for the the NOR ECC flash.

That's a good explantion, but not a good excuse. ;)

> > > -	return BLK_STATE_ALLFF;	/* OK to erase if all blocks are like this */
> > > +	if (c->cleanmarker_size == 0)
> > > +		return BLK_STATE_CLEANMARKER;	/* don't bother with re-erase */
> 
> If a cleanmarker is not detected (within the first EMPTY_SCAN_SIZE bytes
> of a block), the block is added to the 'erase_pending_list' to be
> re-erased (and have a new cleanmarker written).
> 
> Since we don't need cleanmarkers on DataFlash, we return
> BLK_STATE_CLEANMARKER from jffs2_scan_eraseblock() so that the block
> rather gets added directly to the 'free_list'.

Why don't you need cleanmarkers?

With all other flash types, cleanmarkers catch the case where your
power fails during flash erase.  If that happens, you cannot trust the
eraseblock.  It could be fully erased, it could also just _look_ as if
it was and fail later on.  Bad.

Now you claim that this is not the case for DataFlash.  So I'd like
some explanation before I trust your code.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
