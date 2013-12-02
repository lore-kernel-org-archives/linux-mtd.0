Received: from ipmail07.adl2.internode.on.net ([2001:44b8:8060:ff02:300:1:2:7])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vnd1A-00051X-JT
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 23:35:09 +0000
Date: Tue, 3 Dec 2013 10:34:44 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 14/18] xfs: use generic posix ACL infrastructure
Message-ID: <20131202233444.GH10988@dastard>
References: <20131201115903.910559036@bombadil.infradead.org>
 <20131201120656.194735588@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131201120656.194735588@bombadil.infradead.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Mark Fasheh <mfasheh@suse.com>, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, xfs@oss.sgi.com, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 01, 2013 at 03:59:17AM -0800, Christoph Hellwig wrote:
> Also create inodes with the proper mode instead of fixing it up later.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice cleanup work, Christoph.

Reviewed-by: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
david@fromorbit.com
