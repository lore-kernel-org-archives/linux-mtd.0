Message-ID: <529D05AB.7080306@oracle.com>
Date: Mon, 02 Dec 2013 16:11:55 -0600
From: Dave Kleikamp <dave.kleikamp@oracle.com>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>, viro@zeniv.linux.org.uk
Subject: Re: [Jfs-discussion] [PATCH 15/18] jfs: use generic posix ACL
 infrastructure
References: <20131201115903.910559036@bombadil.infradead.org>
 <20131201120656.391407780@bombadil.infradead.org>
In-Reply-To: <20131201120656.391407780@bombadil.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Mark Fasheh <mfasheh@suse.com>, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, Joel Becker <jlbec@evilplan.org>,
 linux-fsdevel@vger.kernel.org, xfs@oss.sgi.com, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/01/2013 05:59 AM, Christoph Hellwig wrote:
> Copy the scheme I introduced to btrfs many years ago to only use the
> xattr handler for ACLs, but pass plain attrs straight through.

Looks good.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dave Kleikamp <dave.kleikamp@oracle.com>

> ---
>  fs/jfs/acl.c       |  105 ++++++++++++++++++++------------------------------
>  fs/jfs/file.c      |    4 +-
>  fs/jfs/jfs_acl.h   |    7 +---
>  fs/jfs/jfs_xattr.h |    2 +
>  fs/jfs/namei.c     |    1 +
>  fs/jfs/super.c     |    2 +
>  fs/jfs/xattr.c     |  108 ++++++++++++++++++----------------------------------
>  7 files changed, 89 insertions(+), 140 deletions(-)
