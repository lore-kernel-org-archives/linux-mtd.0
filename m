Received: from brick.kernel.dk ([87.55.233.238] helo=kernel.dk)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhkPd-0003dJ-Gn
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 11:48:53 +0000
Date: Fri, 4 Apr 2008 13:46:00 +0200
From: Jens Axboe <jens.axboe@oracle.com>
To: joern@logfs.org
Subject: Re: [patch 0/15] LogFS take five
Message-ID: <20080404114600.GD29686@kernel.dk>
References: <20080401181308.512473173@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080401181308.512473173@logfs.org>
Cc: linux-fsdevel@vger.kernel.org, Nick Piggin <npiggin@suse.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 01 2008, joern@logfs.org wrote:
> And it is currently reasonably simple to run into a deadlock when
> using logfs on a block device.  The problem appears to be the block
> layer allocating memory for its cache without GFP_NOFS, so that under
> memory pressure logfs writes through block layer may recurse back to
> logfs writes.

So you mean for writes through the page cache, you are seeing pages
allocated with __GFP_FS set?

> Not entirely sure who is to blame for this bug and how to
> solve it.

A good starting point would be doing a stack trace dump in logfs if you
see such back recursion into the fs. A quick guess would be a missing
setting of mapping gfp mask?

-- 
Jens Axboe
