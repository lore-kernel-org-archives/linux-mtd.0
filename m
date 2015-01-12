Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAeCM-0003EV-H0
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 12:34:23 +0000
Date: Mon, 12 Jan 2015 13:33:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 04/12] block_dev: only write bdev inode on close
Message-ID: <20150112123351.GA29325@lst.de>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-5-git-send-email-hch@lst.de>
 <20150111173209.GK25319@htj.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150111173209.GK25319@htj.dyndns.org>
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

On Sun, Jan 11, 2015 at 12:32:09PM -0500, Tejun Heo wrote:
> Is this an optimization or something necessary for the following
> changes?  If latter, maybe it's a good idea to state why this is
> necessary in the description?  Otherwise,

It gets rid of a bdi reassignment, and thus makes life a lot simpler.
I'll update the commit message.
