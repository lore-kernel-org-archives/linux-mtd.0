Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAMW0-0006RF-Eu
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 17:41:29 +0000
Received: by mail-qg0-f53.google.com with SMTP id l89so15082344qgf.12
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 09:41:07 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 11 Jan 2015 12:41:03 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/12] nilfs2: set up s_bdi like the generic mount_bdev
 code
Message-ID: <20150111174103.GM25319@htj.dyndns.org>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-7-git-send-email-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420739133-27514-7-git-send-email-hch@lst.de>
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

On Thu, Jan 08, 2015 at 06:45:27PM +0100, Christoph Hellwig wrote:
> mapping->backing_dev_info will go away, so don't rely on it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>

Reviewed-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
