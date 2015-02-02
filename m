Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIC2F-0007mO-2K
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 08:07:07 +0000
Date: Mon, 2 Feb 2015 09:06:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: backing_dev_info cleanups & lifetime rule fixes V2
Message-ID: <20150202080635.GB9851@lst.de>
References: <1421228561-16857-1-git-send-email-hch@lst.de>
 <54BEC3C2.7080906@fb.com> <20150201063116.GP29656@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150201063116.GP29656@ZenIV.linux.org.uk>
Cc: David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, Jens Axboe <axboe@fb.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>,
 ceph-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 01, 2015 at 06:31:16AM +0000, Al Viro wrote:
> And at that point we finally can make sb_lock and super_blocks static in
> fs/super.c.  Do you want that in your tree, or would you rather have it
> done via vfs.git during the merge window after your tree goes in?  It's
> as trivial as this:
> 
> Make super_blocks and sb_lock static
> 
> The only user outside of fs/super.c is gone now
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

I'd say merge it through the block tree..

Acked-by: Christoph Hellwig <hch@lst.de>
