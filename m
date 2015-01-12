Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAeEU-0005OF-NT
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 12:36:35 +0000
Date: Mon, 12 Jan 2015 13:36:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 07/12] fs: export inode_to_bdi and use it in favor of
 mapping->backing_dev_info
Message-ID: <20150112123606.GB29325@lst.de>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-8-git-send-email-hch@lst.de>
 <20150111181651.GN25319@htj.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150111181651.GN25319@htj.dyndns.org>
Cc: David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 Jens Axboe <axboe@fb.com>, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 11, 2015 at 01:16:51PM -0500, Tejun Heo wrote:
> > +struct backing_dev_info *inode_to_bdi(struct inode *inode)
> >  {
> >  	struct super_block *sb = inode->i_sb;
> >  #ifdef CONFIG_BLOCK
> > @@ -75,6 +75,7 @@ static inline struct backing_dev_info *inode_to_bdi(struct inode *inode)
> >  #endif
> >  	return sb->s_bdi;
> >  }
> > +EXPORT_SYMBOL_GPL(inode_to_bdi);
> 
> This is rather trivial.  Maybe we wanna make this an inline function?

Without splitting backing-dev.h this leads recursive includes.  With
the split of that file in your series we could make it inline again.

Another thing I've through of would be to always dynamically allocate
bdis instead of embedding them.  This would stop the need to have
backing-dev.h included in blkdev.h and would greatly simply the filesystems
that allocated bdis on their own.
