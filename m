Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YALxr-00048t-FP
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 17:06:13 +0000
Received: by mail-qg0-f51.google.com with SMTP id i50so15023621qgf.10
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 09:05:49 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 11 Jan 2015 12:05:46 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/12] fs: kill BDI_CAP_SWAP_BACKED
Message-ID: <20150111170546.GI25319@htj.dyndns.org>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-3-git-send-email-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420739133-27514-3-git-send-email-hch@lst.de>
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

On Thu, Jan 08, 2015 at 06:45:23PM +0100, Christoph Hellwig wrote:
> This bdi flag isn't too useful - we can determine that a vma is backed by
> either swap or shmem trivially in the caller.
> 
> This also allows removing the backing_dev_info instaces for swap and shmem
> in favor of noop_backing_dev_info.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
