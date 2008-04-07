Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JinNR-0001wL-Lj
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 09:10:58 +0000
Date: Mon, 7 Apr 2008 11:10:47 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [patch 0/15] LogFS take five
Message-ID: <20080407091047.GD22431@logfs.org>
References: <20080401181308.512473173@logfs.org>
	<20080404114600.GD29686@kernel.dk>
	<20080407082235.GB22431@logfs.org>
	<20080407082841.GL12774@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080407082841.GL12774@kernel.dk>
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

On Mon, 7 April 2008 10:28:41 +0200, Jens Axboe wrote:
> > 
> >  fs/block_dev.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- linux-2.6.24logfs/fs/block_dev.c~blockdev_nofs	2008-04-07 10:19:08.627413077 +0200
> > +++ linux-2.6.24logfs/fs/block_dev.c	2008-04-07 10:20:56.927117162 +0200
> > @@ -586,7 +586,7 @@ struct block_device *bdget(dev_t dev)
> >  		inode->i_rdev = dev;
> >  		inode->i_bdev = bdev;
> >  		inode->i_data.a_ops = &def_blk_aops;
> > -		mapping_set_gfp_mask(&inode->i_data, GFP_USER);
> > +		mapping_set_gfp_mask(&inode->i_data, GFP_USER & ~__GFP_FS);
> >  		inode->i_data.backing_dev_info = &default_backing_dev_info;
> >  		spin_lock(&bdev_lock);
> >  		list_add(&bdev->bd_list, &all_bdevs);
> 
> It's not the right fix, generally GFP_FS is fine here. So do that in
> logfs when you cannot traverse back into the fs, eg
> 
>         mapping_gfp_mask(mapping) & ~__GFP_FS;
> 
> locally.

	struct address_space *mapping;

	/* Prevent bdev from calling back into fs */
	mapping = &logfs_super(sb)->s_bdev->bd_inode->i_data;
	mapping_set_gfp_mask(mapping, mapping_gfp_mask(mapping) & ~__GFP_FS);

bd_inode has an interesting comment:
	struct inode *		bd_inode;	/* will die */

Should I be worried about that?  It seems to predate git history, so
I'm not too concerned about immediate changes.

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle
