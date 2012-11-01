Date: Thu, 1 Nov 2012 13:36:41 +0100
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 3/3] fs: Fix remaining filesystems to wait for stable
 page writeback
Message-ID: <20121101123641.GA23132@quack.suse.cz>
References: <20121101075805.16153.64714.stgit@blackbox.djwong.org>
 <20121101075829.16153.92036.stgit@blackbox.djwong.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121101075829.16153.92036.stgit@blackbox.djwong.org>
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

On Thu 01-11-12 00:58:29, Darrick J. Wong wrote:
> Fix up the filesystems that provide their own ->page_mkwrite handlers to
> provide stable page writes if necessary.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
>  fs/9p/vfs_file.c |    1 +
>  fs/afs/write.c   |    4 ++--
>  fs/ceph/addr.c   |    1 +
>  fs/cifs/file.c   |    1 +
>  fs/ocfs2/mmap.c  |    1 +
>  fs/ubifs/file.c  |    4 ++--
>  6 files changed, 8 insertions(+), 4 deletions(-)
> 
> 
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index c2483e9..aa253f0 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -620,6 +620,7 @@ v9fs_vm_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
>  	lock_page(page);
>  	if (page->mapping != inode->i_mapping)
>  		goto out_unlock;
> +	wait_on_stable_page_write(page);
>  
>  	return VM_FAULT_LOCKED;
>  out_unlock:
> diff --git a/fs/afs/write.c b/fs/afs/write.c
> index 9aa52d9..39eb2a4 100644
> --- a/fs/afs/write.c
> +++ b/fs/afs/write.c
> @@ -758,7 +758,7 @@ int afs_page_mkwrite(struct vm_area_struct *vma, struct page *page)
>  #ifdef CONFIG_AFS_FSCACHE
>  	fscache_wait_on_page_write(vnode->cache, page);
>  #endif
> -
> +	wait_on_stable_page_write(page);
>  	_leave(" = 0");
> -	return 0;
> +	return VM_FAULT_LOCKED;
>  }
  Oh, I missed these two since I've got confused by
fscache_wait_on_page_write().

> diff --git a/fs/ocfs2/mmap.c b/fs/ocfs2/mmap.c
> index 47a87dd..a0027b1 100644
> --- a/fs/ocfs2/mmap.c
> +++ b/fs/ocfs2/mmap.c
> @@ -124,6 +124,7 @@ static int __ocfs2_page_mkwrite(struct file *file, struct buffer_head *di_bh,
>  				     fsdata);
>  	BUG_ON(ret != len);
>  	ret = VM_FAULT_LOCKED;
> +	wait_on_stable_page_write(page);
>  out:
>  	return ret;
>  }
  Actually, this is not so easy. ocfs2 doesn't use
grab_cache_page_write_begin() so you have to modify write_begin() path as
well. And then you don't have to modify __ocfs2_page_mkwrite() because it
uses ocfs2_write_begin(). Preferably teach it to use
grab_cache_page_write_begin()...

  And I think you are missing ncpfs. Because ncp_file_mmap does not set
.mkwrite - it should use filemap_page_mkwrite() I think.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
