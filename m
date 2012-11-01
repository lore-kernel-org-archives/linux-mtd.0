Date: Thu, 1 Nov 2012 14:28:46 +0100
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 2/3] mm: Only enforce stable page writes if the backing
 device requires it
Message-ID: <20121101132846.GB23132@quack.suse.cz>
References: <20121101075805.16153.64714.stgit@blackbox.djwong.org>
 <20121101075821.16153.38301.stgit@blackbox.djwong.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121101075821.16153.38301.stgit@blackbox.djwong.org>
Cc: lucho@ionkov.net, jack@suse.cz, neilb@suse.de, david@fromorbit.com,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, bharrosh@panasas.com,
 v9fs-developer@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 sage@inktank.com, ericvh@gmail.com, mfasheh@suse.com, jlbec@evilplan.org,
 ceph-devel@vger.kernel.org, axboe@kernel.dk, tytso@mit.edu,
 martin.petersen@oracle.com, dedekind1@gmail.com, adrian.hunter@intel.com,
 sfrench@samba.org, linux-fsdevel@vger.kernel.org, rminnich@sandia.gov,
 ocfs2-devel@oss.oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 01-11-12 00:58:21, Darrick J. Wong wrote:
> Create a helper function to check if a backing device requires stable page
> writes and, if so, performs the necessary wait.  Then, make it so that all
> points in the memory manager that handle making pages writable use the helper
> function.  This should provide stable page write support to most filesystems,
> while eliminating unnecessary waiting for devices that don't require the
> feature.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
>  fs/buffer.c             |    2 +-
>  fs/ext4/inode.c         |    2 +-
>  include/linux/pagemap.h |    1 +
>  mm/filemap.c            |    3 ++-
>  mm/page-writeback.c     |   11 +++++++++++
>  5 files changed, 16 insertions(+), 3 deletions(-)
> 
..
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 830893b..916dae1 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2275,3 +2275,14 @@ int mapping_tagged(struct address_space *mapping, int tag)
>  	return radix_tree_tagged(&mapping->page_tree, tag);
>  }
>  EXPORT_SYMBOL(mapping_tagged);
> +
> +void wait_on_stable_page_write(struct page *page)
> +{
> +	struct backing_dev_info *bdi = page->mapping->backing_dev_info;
> +
> +	if (!bdi_cap_stable_pages_required(bdi))
> +		return;
> +
> +	wait_on_page_writeback(page);
> +}
> +EXPORT_SYMBOL_GPL(wait_on_stable_page_write);
  Just one nit: Maybe "wait_if_stable_write()" would describe the function
better? Otherwise the patch looks OK.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
