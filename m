Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAN4e-0006F6-8y
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 18:17:20 +0000
Received: by mail-qg0-f51.google.com with SMTP id i50so15140735qgf.10
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 10:16:54 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 11 Jan 2015 13:16:51 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/12] fs: export inode_to_bdi and use it in favor of
 mapping->backing_dev_info
Message-ID: <20150111181651.GN25319@htj.dyndns.org>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-8-git-send-email-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420739133-27514-8-git-send-email-hch@lst.de>
Cc: David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 Jens Axboe <axboe@fb.com>, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Jan 08, 2015 at 06:45:28PM +0100, Christoph Hellwig wrote:
> Now that we got ri of the bdi abuse on character devices we can always use
                  ^^^
		  rid

> sb->s_bdi to get at the backing_dev_info for a file, except for the block
> device special case.  Export inode_to_bdi and replace uses of
> mapping->backing_dev_info with it to prepare for the removal of
> mapping->backing_dev_info.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Ah, this is so much better.  Thanks a lot for doing this.  Just one
nit below.

> +struct backing_dev_info *inode_to_bdi(struct inode *inode)
>  {
>  	struct super_block *sb = inode->i_sb;
>  #ifdef CONFIG_BLOCK
> @@ -75,6 +75,7 @@ static inline struct backing_dev_info *inode_to_bdi(struct inode *inode)
>  #endif
>  	return sb->s_bdi;
>  }
> +EXPORT_SYMBOL_GPL(inode_to_bdi);

This is rather trivial.  Maybe we wanna make this an inline function?

 Reviewed-by: Tejun Heo <tj@kernel.org>

-- 
tejun
