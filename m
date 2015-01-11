Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAN86-0000OJ-CQ
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 18:20:50 +0000
Received: by mail-qa0-f53.google.com with SMTP id n4so5294386qaq.12
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 10:20:28 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 11 Jan 2015 13:20:25 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/12] fs: remove mapping->backing_dev_info
Message-ID: <20150111182025.GO25319@htj.dyndns.org>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-9-git-send-email-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420739133-27514-9-git-send-email-hch@lst.de>
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

On Thu, Jan 08, 2015 at 06:45:29PM +0100, Christoph Hellwig wrote:
> Now that we never use the backing_dev_info pointer in struct address_space
> we can simply remove it and save 4 to 8 bytes in every inode.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>

Reviewed-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
