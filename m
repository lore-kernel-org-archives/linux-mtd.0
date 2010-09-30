Received: from verein.lst.de ([213.95.11.210])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P16gN-0007ja-MB
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 00:07:32 +0000
Date: Thu, 30 Sep 2010 02:06:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: Dirtiable inode bdi default != sb bdi btrfs
Message-ID: <20100930000641.GA27865@lst.de>
References: <4C9AA546.6050201@cesarb.net>
	<20100923123849.8975fe47.akpm@linux-foundation.org>
	<20100927222548.GG3610@quack.suse.cz>
	<20100927225452.GG4270@think> <20100929081936.GA23322@lst.de>
	<20100929121808.GB3290@quack.suse.cz>
	<20100929141006.GB7439@lst.de>
	<20100929233806.GB12707@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100929233806.GB12707@quack.suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, kernel@lists.fedoraproject.org,
	Jens Axboe <jaxboe@fusionio.com>, linux-kernel@vger.kernel.org,
	stable@kernel.org, Micha?? Piotrowski <mkkp4x4@gmail.com>,
	linux-mtd@lists.infradead.org, Cesar Eduardo Barros <cesarb@cesarb.net>,
	Chuck Ebbert <cebbert@redhat.com>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-btrfs@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
	Chris Mason <chris.mason@oracle.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 30, 2010 at 01:38:07AM +0200, Jan Kara wrote:
> > No.  For one thing we don't need any exception for correctnes alone -
> > even the block device variant would work fine with the default case.
> Here I don't agree. If you don't have some kind of exception, sb->s_bdi
> for both "block" and "mtd_inodefs" filesystems points to
> noop_backing_dev_info and you get no writeback for that one. So it isn't
> just a performance issue but also a correctness one.

Indeed - for internal filesystems that require writeback the change
causes trouble if they haven't registered a s_bdi.  But for all user
visible filesystems that doesn't happen as we require s_bdi for
sync or even unmounts to work.
