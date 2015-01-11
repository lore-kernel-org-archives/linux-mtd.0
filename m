Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YANL9-0006wN-4G
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 18:34:20 +0000
Received: by mail-qg0-f43.google.com with SMTP id z107so15214356qgd.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 10:33:57 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 11 Jan 2015 13:33:54 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] fs: don't reassign dirty inodes to
 default_backing_dev_info
Message-ID: <20150111183354.GP25319@htj.dyndns.org>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-12-git-send-email-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420739133-27514-12-git-send-email-hch@lst.de>
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

On Thu, Jan 08, 2015 at 06:45:32PM +0100, Christoph Hellwig wrote:
> If we have dirty inodes we need to call the filesystem for it, even if the
> device has been removed and the filesystem will error out early.  The
> current code does that by reassining all dirty inodes to the default
> backing_dev_info when a bdi is unlinked, but that's pretty pointless given
> that the bdi must always outlive the super block.

It's also shifting writeback shutdown to destroy time from
unregistration time.  This is part of fixing the bdi lifetime issue,
right?  It hink It'd be worthwhile to mention that in the commit
message.

Other than that,

 Reviewed-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
