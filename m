Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYd2k-0008BO-GA
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 16:11:35 +0000
Received: by wibdy8 with SMTP id dy8so122206683wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2015 09:11:11 -0700 (PDT)
Message-ID: <550AF51C.9000600@plexistor.com>
Date: Thu, 19 Mar 2015 18:11:08 +0200
From: Boaz Harrosh <boaz@plexistor.com>
MIME-Version: 1.0
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] fs: cleanup slight list_entry abuse
References: <1426764485-13637-1-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1426764485-13637-1-git-send-email-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/19/2015 01:28 PM, Rasmus Villemoes wrote:
> list_entry is just a wrapper for container_of, but it is arguably
> wrong (and slightly confusing) to use it when the pointed-to struct
> member is not a struct list_head. Use container_of directly instead.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> Most of these predate git. If I'm the only one who has been confused
> by this in 10 years, maybe it's not worth the churn.
> 

No you are not alone here. I have seen this once as well but did not have
the gumption to send a fix. (The sysv.h one)

I totally agree with this patch. (So many of them, bread crumbs of copy/paste
for you ;0)

Reviewed-by: Boaz Harrosh <boaz@plexistor.com>

>  fs/affs/affs.h              | 2 +-
>  fs/befs/befs.h              | 2 +-
>  fs/coda/coda_linux.h        | 2 +-
>  fs/hfs/hfs_fs.h             | 2 +-
>  fs/hfsplus/hfsplus_fs.h     | 2 +-
>  fs/hpfs/hpfs_fn.h           | 2 +-
>  fs/jffs2/os-linux.h         | 2 +-
>  fs/jfs/jfs_incore.h         | 2 +-
>  fs/minix/minix.h            | 2 +-
>  fs/ntfs/inode.h             | 2 +-
>  fs/squashfs/squashfs_fs_i.h | 2 +-
>  fs/sysv/sysv.h              | 2 +-
>  fs/udf/udf_i.h              | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/affs/affs.h b/fs/affs/affs.h
> index c8764bd7497d..64469527d445 100644
> --- a/fs/affs/affs.h
> +++ b/fs/affs/affs.h
> @@ -64,7 +64,7 @@ struct affs_inode_info {
>  /* short cut to get to the affs specific inode data */
>  static inline struct affs_inode_info *AFFS_I(struct inode *inode)
>  {
> -	return list_entry(inode, struct affs_inode_info, vfs_inode);
> +	return container_of(inode, struct affs_inode_info, vfs_inode);
>  }
>  
>  /*
> diff --git a/fs/befs/befs.h b/fs/befs/befs.h
> index 3a7813ab8c95..c69f62f9207b 100644
> --- a/fs/befs/befs.h
> +++ b/fs/befs/befs.h
> @@ -114,7 +114,7 @@ BEFS_SB(const struct super_block *super)
>  static inline befs_inode_info *
>  BEFS_I(const struct inode *inode)
>  {
> -	return list_entry(inode, struct befs_inode_info, vfs_inode);
> +	return container_of(inode, struct befs_inode_info, vfs_inode);
>  }
>  
>  static inline befs_blocknr_t
> diff --git a/fs/coda/coda_linux.h b/fs/coda/coda_linux.h
> index d6f7a76a1f5b..f829fe963f5b 100644
> --- a/fs/coda/coda_linux.h
> +++ b/fs/coda/coda_linux.h
> @@ -79,7 +79,7 @@ void coda_sysctl_clean(void);
>  
>  static inline struct coda_inode_info *ITOC(struct inode *inode)
>  {
> -	return list_entry(inode, struct coda_inode_info, vfs_inode);
> +	return container_of(inode, struct coda_inode_info, vfs_inode);
>  }
>  
>  static __inline__ struct CodaFid *coda_i2f(struct inode *inode)
> diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
> index 95d255219b1e..1f1c7dcbcc2f 100644
> --- a/fs/hfs/hfs_fs.h
> +++ b/fs/hfs/hfs_fs.h
> @@ -252,7 +252,7 @@ extern void hfs_mark_mdb_dirty(struct super_block *sb);
>  #define __hfs_u_to_mtime(sec)	cpu_to_be32(sec + 2082844800U - sys_tz.tz_minuteswest * 60)
>  #define __hfs_m_to_utime(sec)	(be32_to_cpu(sec) - 2082844800U  + sys_tz.tz_minuteswest * 60)
>  
> -#define HFS_I(inode)	(list_entry(inode, struct hfs_inode_info, vfs_inode))
> +#define HFS_I(inode)	(container_of(inode, struct hfs_inode_info, vfs_inode))
>  #define HFS_SB(sb)	((struct hfs_sb_info *)(sb)->s_fs_info)
>  
>  #define hfs_m_to_utime(time)	(struct timespec){ .tv_sec = __hfs_m_to_utime(time) }
> diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
> index b0441d65fa54..f91a1faf819e 100644
> --- a/fs/hfsplus/hfsplus_fs.h
> +++ b/fs/hfsplus/hfsplus_fs.h
> @@ -263,7 +263,7 @@ struct hfsplus_inode_info {
>  
>  static inline struct hfsplus_inode_info *HFSPLUS_I(struct inode *inode)
>  {
> -	return list_entry(inode, struct hfsplus_inode_info, vfs_inode);
> +	return container_of(inode, struct hfsplus_inode_info, vfs_inode);
>  }
>  
>  /*
> diff --git a/fs/hpfs/hpfs_fn.h b/fs/hpfs/hpfs_fn.h
> index b63b75fa00e7..bb04b58d1d69 100644
> --- a/fs/hpfs/hpfs_fn.h
> +++ b/fs/hpfs/hpfs_fn.h
> @@ -304,7 +304,7 @@ extern const struct address_space_operations hpfs_symlink_aops;
>  
>  static inline struct hpfs_inode_info *hpfs_i(struct inode *inode)
>  {
> -	return list_entry(inode, struct hpfs_inode_info, vfs_inode);
> +	return container_of(inode, struct hpfs_inode_info, vfs_inode);
>  }
>  
>  static inline struct hpfs_sb_info *hpfs_sb(struct super_block *sb)
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index d200a9b8fd5e..824e61ede465 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -19,7 +19,7 @@
>  struct kstatfs;
>  struct kvec;
>  
> -#define JFFS2_INODE_INFO(i) (list_entry(i, struct jffs2_inode_info, vfs_inode))
> +#define JFFS2_INODE_INFO(i) (container_of(i, struct jffs2_inode_info, vfs_inode))
>  #define OFNI_EDONI_2SFFJ(f)  (&(f)->vfs_inode)
>  #define JFFS2_SB_INFO(sb) (sb->s_fs_info)
>  #define OFNI_BS_2SFFJ(c)  ((struct super_block *)c->os_priv)
> diff --git a/fs/jfs/jfs_incore.h b/fs/jfs/jfs_incore.h
> index fa7e795bd8ae..1f26d1910409 100644
> --- a/fs/jfs/jfs_incore.h
> +++ b/fs/jfs/jfs_incore.h
> @@ -206,7 +206,7 @@ struct jfs_sb_info {
>  
>  static inline struct jfs_inode_info *JFS_IP(struct inode *inode)
>  {
> -	return list_entry(inode, struct jfs_inode_info, vfs_inode);
> +	return container_of(inode, struct jfs_inode_info, vfs_inode);
>  }
>  
>  static inline int jfs_dirtable_inline(struct inode *inode)
> diff --git a/fs/minix/minix.h b/fs/minix/minix.h
> index 1ebd11854622..01ad81dcacc5 100644
> --- a/fs/minix/minix.h
> +++ b/fs/minix/minix.h
> @@ -84,7 +84,7 @@ static inline struct minix_sb_info *minix_sb(struct super_block *sb)
>  
>  static inline struct minix_inode_info *minix_i(struct inode *inode)
>  {
> -	return list_entry(inode, struct minix_inode_info, vfs_inode);
> +	return container_of(inode, struct minix_inode_info, vfs_inode);
>  }
>  
>  static inline unsigned minix_blocks_needed(unsigned bits, unsigned blocksize)
> diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
> index 76b6cfb579d7..b3c3469de6cb 100644
> --- a/fs/ntfs/inode.h
> +++ b/fs/ntfs/inode.h
> @@ -239,7 +239,7 @@ typedef struct {
>   */
>  static inline ntfs_inode *NTFS_I(struct inode *inode)
>  {
> -	return (ntfs_inode *)list_entry(inode, big_ntfs_inode, vfs_inode);
> +	return (ntfs_inode *)container_of(inode, big_ntfs_inode, vfs_inode);
>  }
>  
>  static inline struct inode *VFS_I(ntfs_inode *ni)
> diff --git a/fs/squashfs/squashfs_fs_i.h b/fs/squashfs/squashfs_fs_i.h
> index 73588e7700ed..d09fcd6fb85d 100644
> --- a/fs/squashfs/squashfs_fs_i.h
> +++ b/fs/squashfs/squashfs_fs_i.h
> @@ -49,6 +49,6 @@ struct squashfs_inode_info {
>  
>  static inline struct squashfs_inode_info *squashfs_i(struct inode *inode)
>  {
> -	return list_entry(inode, struct squashfs_inode_info, vfs_inode);
> +	return container_of(inode, struct squashfs_inode_info, vfs_inode);
>  }
>  #endif
> diff --git a/fs/sysv/sysv.h b/fs/sysv/sysv.h
> index 69d488986cce..766f00b46aa2 100644
> --- a/fs/sysv/sysv.h
> +++ b/fs/sysv/sysv.h
> @@ -73,7 +73,7 @@ struct sysv_inode_info {
>  
>  static inline struct sysv_inode_info *SYSV_I(struct inode *inode)
>  {
> -	return list_entry(inode, struct sysv_inode_info, vfs_inode);
> +	return container_of(inode, struct sysv_inode_info, vfs_inode);
>  }
>  
>  static inline struct sysv_sb_info *SYSV_SB(struct super_block *sb)
> diff --git a/fs/udf/udf_i.h b/fs/udf/udf_i.h
> index b5cd8ed2aa12..b1b9a63d8cf3 100644
> --- a/fs/udf/udf_i.h
> +++ b/fs/udf/udf_i.h
> @@ -56,7 +56,7 @@ struct udf_inode_info {
>  
>  static inline struct udf_inode_info *UDF_I(struct inode *inode)
>  {
> -	return list_entry(inode, struct udf_inode_info, vfs_inode);
> +	return container_of(inode, struct udf_inode_info, vfs_inode);
>  }
>  
>  #endif /* _UDF_I_H) */
> 
