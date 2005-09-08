Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDSOj-0001Lv-NH
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 15:49:34 -0400
Date: Thu, 8 Sep 2005 21:49:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kaigai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050908194915.GG20668@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <431E772B.9090004@ak.jp.nec.com>
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 September 2005 14:14:19 +0900, Kaigai Kohei wrote:
> 
> This attached patch enables XATTR support in JFFS2. (take-2)
> # The contribution has slowed due to the trouble related to GC :-(
> 
> The my first patch posted in Aug 23 is revised at the points as follows.
> 
> - get/setxattr are implemented as a method of generic XATTR handler.
> - new methods for "user.*" and "trusted.*" prefix were added.
> 
> - Time to retrieve the duplicate XATTR-cache shortened, when setxattr().
>   In first implementation, we must scan all XATTR-cache to find the 
>   duplicate
>   one, and it's so expensive. Now, we cau use the hash-list of XATTR-cache
>   which is indexed by own contents.
> 
> - Now, Garbage Collector can deal JFFS2_NODETYPE_XATTR and 
> JFFS2_NODETYPE_XREF.
>   It seems to me that GC can mark unconditionally any nodes without inode
>   as obsolete. But new JFFS2_NODETYPE_XATTR/XREF should be an exception.
>   GC must not mark them as obsolete, although their "next_in_ino" is NULL.
> 
>   ----[ jffs2_garbage_collect_pass() in gc.c ]------------------------
>   249  if (!raw->next_in_ino) {       <-- unconditionally mark it as 
>   obsolete.
>   250      /* Inode-less node. Clean marker, snapshot or something like 
>   that */
>   251      /* FIXME: If it's something that needs to be copied, including 
>   something
>   252         we don't grok that has JFFS2_NODETYPE_RWCOMPAT_COPY, we 
>   should do so */
>   253      spin_unlock(&c->erase_completion_lock);
>   254      jffs2_mark_node_obsolete(c, raw);
>   255      up(&c->alloc_sem);
>   256      goto eraseit_lock;
>   257  }
>   --------------------------------------------------------------------
> 
>   I added a new variable 'owner' into jffs2_raw_node_ref to resolve this.
>   It refers jffs2_xattr_cache or jffs2_xattr_ref object when raw-node 
>   reflect
>   XATTR-node. Thus, we can distinguish XATTR-node and others by whether 
>   'owner'
>   is NULL or not.
> 
> - Consistency has improved.
>   check_xattr_ref_ilist() checks XATTRs which are binded to same inode.
>   If multiple XATTR has same name exist, older one is marked as obsolete.
>   In first implementation, there are possibilities to be created multiple
>   XATTRs have same name in an inode, when system-crash happens durling 
>   setxattr()

Sounds good.

It appears as if your patch or something based on it will win.  So
let's have a look...

I notice that you make a couple of mistakes by copying them from
existing jffs2 code.  You are excused for that, no doubt.  But I still
don't want copies of old mistakes to go in, just because we have a bad
example.

Review is just partial.  It's late enough already and I need to get
some sleep.

> diff -rpNU3 mtd-0829/fs/Kconfig mtd-0829.xattr/fs/Kconfig
> --- mtd-0829/fs/Kconfig	2005-05-09 18:00:10.000000000 -0400
> +++ mtd-0829.xattr/fs/Kconfig	2005-09-06 10:30:52.000000000 -0400
> @@ -64,6 +64,22 @@ config JFFS2_FS_WRITEBUFFER
>  	    - NOR flash with transparent ECC
>  	    - DataFlash
>  
> +config JFFS2_XATTR
> +	bool "JFFS2 XATTR support (EXPERIMENTAL)"
> +	depends on JFFS2_FS
> +	default n
> +	help
> +	  This enables the XATTR support in JFFS2.
> +	  
> +	  It's neccesary for persistent security context in SELinux.
> +	  Now, we can use the following kinds of prefix.
> +	  
> +	  - security.*
> +	  - user.*
> +	  - trust.*
> +	  
> +	  - system.posix_acl_{access|default} are in TODO list now.
> +
>  config JFFS2_COMPRESSION_OPTIONS
>  	bool "Advanced compression options for JFFS2"
>  	default n
> diff -rpNU3 mtd-0829/fs/jffs2/Makefile.common mtd-0829.xattr/fs/jffs2/Makefile.common
> --- mtd-0829/fs/jffs2/Makefile.common	2005-07-17 18:00:13.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/Makefile.common	2005-09-06 10:31:26.000000000 -0400
> @@ -12,6 +12,7 @@ jffs2-y	+= symlink.o build.o erase.o bac
>  jffs2-y	+= super.o debug.o
>  
>  jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
> +jffs2-$(CONFIG_JFFS2_XATTR)	+= xattr.o
>  jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
>  jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
>  jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
> diff -rpNU3 mtd-0829/fs/jffs2/build.c mtd-0829.xattr/fs/jffs2/build.c
> --- mtd-0829/fs/jffs2/build.c	2005-07-30 18:00:11.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/build.c	2005-09-06 10:28:53.000000000 -0400
> @@ -165,6 +165,7 @@ static int jffs2_build_filesystem(struct
>  		ic->scan_dents = NULL;
>  		cond_resched();
>  	}
> +	jffs2_build_xattr_caches(c);
>  	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
>  	
>  	D1(printk(KERN_DEBUG "Pass 3 complete\n"));
> @@ -184,6 +185,7 @@ exit:
>  				jffs2_free_full_dirent(fd);
>  			}
>  		}
> +		jffs2_clear_xattr_caches(c);
>  	}
>  
>  	return ret;
> diff -rpNU3 mtd-0829/fs/jffs2/dir.c mtd-0829.xattr/fs/jffs2/dir.c
> --- mtd-0829/fs/jffs2/dir.c	2005-08-17 18:00:11.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/dir.c	2005-09-06 10:28:53.000000000 -0400
> @@ -57,7 +57,12 @@ struct inode_operations jffs2_dir_inode_
>  	.rmdir =	jffs2_rmdir,
>  	.mknod =	jffs2_mknod,
>  	.rename =	jffs2_rename,
> +	.permission =	jffs2_permission,
>  	.setattr =	jffs2_setattr,
> +	.setxattr =	jffs2_setxattr,
> +	.getxattr =	jffs2_getxattr,
> +	.listxattr =	jffs2_listxattr,
> +	.removexattr =	jffs2_removexattr
>  };
>  
>  /***********************************************************************/
> diff -rpNU3 mtd-0829/fs/jffs2/file.c mtd-0829.xattr/fs/jffs2/file.c
> --- mtd-0829/fs/jffs2/file.c	2005-07-06 18:00:13.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/file.c	2005-09-06 10:28:53.000000000 -0400
> @@ -57,7 +57,12 @@ struct file_operations jffs2_file_operat
>  
>  struct inode_operations jffs2_file_inode_operations =
>  {
> -	.setattr =	jffs2_setattr
> +	.permission =	jffs2_permission,
> +	.setattr =	jffs2_setattr,
> +	.setxattr =	jffs2_setxattr,
> +	.getxattr =	jffs2_getxattr,
> +	.listxattr =	jffs2_listxattr,
> +	.removexattr =	jffs2_removexattr
>  };
>  
>  struct address_space_operations jffs2_file_address_operations =
> diff -rpNU3 mtd-0829/fs/jffs2/fs.c mtd-0829.xattr/fs/jffs2/fs.c
> --- mtd-0829/fs/jffs2/fs.c	2005-08-06 18:00:16.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/fs.c	2005-09-06 10:28:53.000000000 -0400
> @@ -217,6 +217,8 @@ void jffs2_clear_inode (struct inode *in
>  	
>  	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
>  
> +	if (f->inocache && !f->inocache->nlink)
> +		jffs2_xattr_clear_inode(c, f->inocache);

Move the test into jffs2_xattr_clear_inode().

>  	jffs2_do_clear_inode(c, f);
>  }
>  
> @@ -504,6 +506,9 @@ int jffs2_do_fill_super(struct super_blo
>  	}
>  	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
>  
> +	if ((ret = jffs2_init_xattr_caches(c)))
> +		goto out_inohash;
> +

	ret = jffs2_init_xattr_caches(c);
	if (ret)
		goto out_inohash;

I agree with gcc, when it warns about assignments in conditions.  What
I don't agree with is the proposal to use double brackets.

>  	if ((ret = jffs2_do_mount_fs(c)))
>  		goto out_inohash;
>  
> @@ -537,6 +542,7 @@ int jffs2_do_fill_super(struct super_blo
>  		vfree(c->blocks);
>  	else
>  		kfree(c->blocks);
> +	jffs2_clear_xattr_caches(c);
>   out_inohash:
>  	kfree(c->inocache_list);
>   out_wbuf:
> diff -rpNU3 mtd-0829/fs/jffs2/gc.c mtd-0829.xattr/fs/jffs2/gc.c
> --- mtd-0829/fs/jffs2/gc.c	2005-08-17 18:00:12.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/gc.c	2005-09-06 10:28:53.000000000 -0400
> @@ -251,7 +251,12 @@ int jffs2_garbage_collect_pass(struct jf
>  		/* FIXME: If it's something that needs to be copied, including something
>  		   we don't grok that has JFFS2_NODETYPE_RWCOMPAT_COPY, we should do so */
>  		spin_unlock(&c->erase_completion_lock);
> -		jffs2_mark_node_obsolete(c, raw);
> +		if (raw->owner) {
> +			/* JFFS2_NODETYPE_XATTR or JFFS2_NODETYPE_XREF */
> +			ret = jffs2_garbage_collect_xattr(c, raw);
> +		} else {
> +			jffs2_mark_node_obsolete(c, raw);
> +		}
>  		up(&c->alloc_sem);
>  		goto eraseit_lock;
>  	}
> diff -rpNU3 mtd-0829/fs/jffs2/malloc.c mtd-0829.xattr/fs/jffs2/malloc.c
> --- mtd-0829/fs/jffs2/malloc.c	2005-07-27 18:00:18.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/malloc.c	2005-09-06 10:28:53.000000000 -0400
> @@ -26,6 +26,10 @@ static kmem_cache_t *tmp_dnode_info_slab
>  static kmem_cache_t *raw_node_ref_slab;
>  static kmem_cache_t *node_frag_slab;
>  static kmem_cache_t *inode_cache_slab;
> +#ifdef CONFIG_JFFS2_XATTR
> +static kmem_cache_t *xattr_cache_slab;
> +static kmem_cache_t *xattr_ref_slab;
> +#endif
>  
>  int __init jffs2_create_slab_caches(void)
>  {
> @@ -68,8 +72,24 @@ int __init jffs2_create_slab_caches(void
>  	inode_cache_slab = kmem_cache_create("jffs2_inode_cache",
>  					     sizeof(struct jffs2_inode_cache),
>  					     0, 0, NULL, NULL);
> -	if (inode_cache_slab)
> -		return 0;
> +	if (!inode_cache_slab)
> +		goto err;
> +
> +#ifdef CONFIG_JFFS2_XATTR
> +	xattr_cache_slab = kmem_cache_create("jffs2_xattr_cache",
> +					     sizeof(struct jffs2_xattr_cache),
> +					     0, 0, NULL, NULL);
> +	if (!xattr_cache_slab)
> +		goto err;
> +
> +	xattr_ref_slab = kmem_cache_create("jffs2_xattr_ref",
> +					   sizeof(struct jffs2_xattr_ref),
> +					   0, 0, NULL, NULL);
> +	if (!xattr_ref_slab)
> +		goto err;
> +#endif
> +
> +	return 0;
>   err:
>  	jffs2_destroy_slab_caches();
>  	return -ENOMEM;
> @@ -91,6 +111,12 @@ void jffs2_destroy_slab_caches(void)
>  		kmem_cache_destroy(node_frag_slab);
>  	if(inode_cache_slab)
>  		kmem_cache_destroy(inode_cache_slab);
> +#ifdef CONFIG_JFFS2_XATTR
> +	if(xattr_cache_slab)
> +		kmem_cache_destroy(xattr_cache_slab);
> +	if(xattr_ref_slab)
> +		kmem_cache_destroy(xattr_ref_slab);
> +#endif
>  }
>  
>  struct jffs2_full_dirent *jffs2_alloc_full_dirent(int namesize)
> @@ -169,6 +195,7 @@ struct jffs2_raw_node_ref *jffs2_alloc_r
>  	struct jffs2_raw_node_ref *ret;
>  	ret = kmem_cache_alloc(raw_node_ref_slab, GFP_KERNEL);
>  	JFFS2_DBG_MEMALLOC("%p\n", ret);
> +	memset(ret, 0, sizeof(*ret));	/* to guarantee owner==NULL */

This could be optimized a little by using the constructor/destructor
stuff in slabs.  Not too important.

>  	return ret;
>  }
>  
> @@ -205,3 +232,35 @@ void jffs2_free_inode_cache(struct jffs2
>  	JFFS2_DBG_MEMALLOC("%p\n", x);
>  	kmem_cache_free(inode_cache_slab, x);
>  }
> +
> +#ifdef CONFIG_JFFS2_XATTR
> +
> +struct jffs2_xattr_cache *jffs2_alloc_xattr_cache(void)
> +{
> +	struct jffs2_xattr_cache *xc;
                          ^^^^^^
The name doesn't make sense.  You're referring to a single object, not
the complete cache.  Quite confusing.

> +	xc = kmem_cache_alloc(xattr_cache_slab, GFP_KERNEL);
                                         ^^^^^
This is the cache.  A slab is just part of the cache.  So please
rename the two.

> +	JFFS2_DBG_MEMALLOC("%p\n", xc);
> +	return xc;
> +}
> +
> +void jffs2_free_xattr_cache(struct jffs2_xattr_cache *xc)
> +{
> +	JFFS2_DBG_MEMALLOC("%p\n", xc);
> +	kmem_cache_free(xattr_cache_slab, xc);
> +}
> +
> +struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
> +{
> +	struct jffs2_xattr_ref *ref;

This name makes sense.

> +	ref = kmem_cache_alloc(xattr_ref_slab, GFP_KERNEL);

s/slab/cache/

> +	JFFS2_DBG_MEMALLOC("%p\n", ref);
> +	return ref;
> +}
> +
> +void jffs2_free_xattr_ref(struct jffs2_xattr_ref *ref)
> +{
> +	JFFS2_DBG_MEMALLOC("%p\n", ref);
> +	kmem_cache_free(xattr_ref_slab, ref);
> +}
> +
> +#endif
> diff -rpNU3 mtd-0829/fs/jffs2/nodelist.c mtd-0829.xattr/fs/jffs2/nodelist.c
> --- mtd-0829/fs/jffs2/nodelist.c	2005-08-22 18:00:15.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/nodelist.c	2005-09-06 10:28:53.000000000 -0400
> @@ -934,6 +934,7 @@ void jffs2_free_ino_caches(struct jffs2_
>  		this = c->inocache_list[i];
>  		while (this) {
>  			next = this->next;
> +			jffs2_xattr_free_inode(c, this);
>  			jffs2_free_inode_cache(this);
>  			this = next;
>  		}
> diff -rpNU3 mtd-0829/fs/jffs2/nodelist.h mtd-0829.xattr/fs/jffs2/nodelist.h
> --- mtd-0829/fs/jffs2/nodelist.h	2005-08-17 18:00:12.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/nodelist.h	2005-09-06 10:28:53.000000000 -0400
> @@ -20,6 +20,7 @@
>  #include <linux/jffs2.h>
>  #include <linux/jffs2_fs_sb.h>
>  #include <linux/jffs2_fs_i.h>
> +#include <linux/jffs2_fs_x.h>

I p a l n.

I prefer a longer name.  jffs2_fs_xattr.h would be fine.
jffs2_xattr.h would also, the "_fs" is more redundant that "attr".

>  
>  #ifdef __ECOS
>  #include "os-ecos.h"
> @@ -80,6 +81,7 @@ struct jffs2_raw_node_ref
>  	struct jffs2_raw_node_ref *next_phys;
>  	uint32_t flash_offset;
>  	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below */
> +	void *owner;

This grows a node reference from 16/24 bytes to 20/32 bytes for 32/64
bit architectures.  I'm not entirely happy about that, but don't a
better solution either.

>  };
>  
>          /* flash_offset & 3 always has to be zero, because nodes are
> @@ -111,6 +113,10 @@ struct jffs2_inode_cache {
>  	uint32_t ino;
>  	int nlink;
>  	int state;
> +#ifdef CONFIG_JFFS2_XATTR
> +	struct list_head ilist;
> +	uint8_t ilist_checked;
> +#endif
>  };
>  
>  /* Inode states for 'state' above. We need the 'GC' state to prevent
> @@ -367,6 +373,13 @@ void jffs2_free_node_frag(struct jffs2_n
>  struct jffs2_inode_cache *jffs2_alloc_inode_cache(void);
>  void jffs2_free_inode_cache(struct jffs2_inode_cache *);
>  
> +#ifdef CONFIG_JFFS2_XATTR
> +struct jffs2_xattr_cache *jffs2_alloc_xattr_cache(void);
> +void jffs2_free_xattr_cache(struct jffs2_xattr_cache *);
> +struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void);
> +void jffs2_free_xattr_ref(struct jffs2_xattr_ref *);
> +#endif /* CONFIG_JFFS2_XATTR */
> +
>  /* gc.c */
>  int jffs2_garbage_collect_pass(struct jffs2_sb_info *c);
>  
> diff -rpNU3 mtd-0829/fs/jffs2/readinode.c mtd-0829.xattr/fs/jffs2/readinode.c
> --- mtd-0829/fs/jffs2/readinode.c	2005-08-17 18:00:12.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/readinode.c	2005-09-06 10:28:53.000000000 -0400
> @@ -902,6 +902,7 @@ int jffs2_do_read_inode(struct jffs2_sb_
>  		f->inocache->ino = f->inocache->nlink = 1;
>  		f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
>  		f->inocache->state = INO_STATE_READING;
> +		initxattr_jffs2_inode_cache(f->inocache);
>  		jffs2_add_ino_cache(c, f->inocache);
>  	}
>  	if (!f->inocache) {
> diff -rpNU3 mtd-0829/fs/jffs2/scan.c mtd-0829.xattr/fs/jffs2/scan.c
> --- mtd-0829/fs/jffs2/scan.c	2005-07-20 18:00:12.000000000 -0400
> +++ mtd-0829.xattr/fs/jffs2/scan.c	2005-09-06 10:28:53.000000000 -0400
> @@ -57,6 +57,12 @@ static int jffs2_scan_inode_node(struct 
>  				 struct jffs2_raw_inode *ri, uint32_t ofs);
>  static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
>  				 struct jffs2_raw_dirent *rd, uint32_t ofs);
> +#ifdef CONFIG_JFFS2_XATTR
> +static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
> +				 struct jffs2_raw_xattr *rx, uint32_t ofs);
> +static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
> +				struct jffs2_raw_xref *rr, uint32_t ofs);
> +#endif

You don't need the function definitions if you change the order inside
the file.

>  #define BLK_STATE_ALLFF		0
>  #define BLK_STATE_CLEAN		1
> @@ -552,7 +558,40 @@ scan_more:	
>  			if (err) return err;
>  			ofs += PAD(je32_to_cpu(node->totlen));
>  			break;
> -
> +#ifdef CONFIG_JFFS2_XATTR
> +		case JFFS2_NODETYPE_XATTR:
> +			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
> +				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
> +				D1(printk(KERN_DEBUG "Fewer than %d bytes (xattr node) left to end of buf."
> +				          " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
> +				err = jffs2_fill_scan_buf(c, buf, ofs, buf_len);
> +				if (err)
> +					return err;
> +				buf_ofs = ofs;
> +				node = (void *)buf;
> +			}
> +			err = jffs2_scan_xattr_node(c, jeb, (void *)node, ofs);
> +			if (err)
> +				return err;
> +			ofs += PAD(je32_to_cpu(node->totlen));
> +			break;
> +		case JFFS2_NODETYPE_XREF:
> +			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
> +				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
> +				D1(printk(KERN_DEBUG "Fewer than %d bytes (xref node) left to end of buf."
> +				          " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
> +				err = jffs2_fill_scan_buf(c, buf, ofs, buf_len);
> +				if (err)
> +					return err;
> +				buf_ofs = ofs;
> +				node = (void *)buf;
> +			}
> +			err = jffs2_scan_xref_node(c, jeb, (void *)node, ofs);
> +			if (err)
> +				return err;
> +			ofs += PAD(je32_to_cpu(node->totlen));
> +			break;
> +#endif

By itself, this code is not too bad.  But it add a little more crap to
a function that is aching for a rewrite already.  Not sure.

>  		case JFFS2_NODETYPE_CLEANMARKER:
>  			D1(printk(KERN_DEBUG "CLEANMARKER node found at 0x%08x\n", ofs));
>  			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
> @@ -665,6 +704,7 @@ static struct jffs2_inode_cache *jffs2_s
>  
>  	ic->ino = ino;
>  	ic->nodes = (void *)ic;
> +	initxattr_jffs2_inode_cache(ic);
>  	jffs2_add_ino_cache(c, ic);
>  	if (ino == 1)
>  		ic->nlink = 1;
> @@ -820,6 +860,190 @@ static int jffs2_scan_dirent_node(struct
>  	return 0;
>  }
>  
> +#ifdef CONFIG_JFFS2_XATTR
> +static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
> +				 struct jffs2_raw_xattr *rx, uint32_t ofs)
> +{
> +	struct jffs2_raw_node_ref *raw;
> +	struct jffs2_xattr_cache *xc;
> +	uint32_t crc;
> +	int xtype, nlen, vlen;
> +
> +	crc = crc32(0, rx, sizeof(*rx)-8);
> +	if (crc != je32_to_cpu(rx->node_crc)) {
> +		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Node CRC failed"
> +		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
> +		       ofs, je32_to_cpu(rx->node_crc), crc);
> +		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
> +		return 0;
> +	}
> +
> +	nlen = JFFS2_XATTR_NAMELEN(je32_to_cpu(rx->length));
> +	vlen = JFFS2_XATTR_VALUELEN(je32_to_cpu(rx->length));

Types don't match.  nlen and vlen should become u32.

Btw, I agree with Linus.  u32 is _much_ nicer than uint32_t, not to
speak of the uint32_fast_t insanity.

> +	if (je32_to_cpu(rx->totlen) != sizeof(*rx)+PAD(nlen+1)+PAD(vlen)) {
> +		printk(KERN_NOTICE "jffs2_scan_xattr_node(): length mimatch!"
> +		       " totlen=%d length=0x%08x nlen=%d vlen=%d on 0x%08x\n",
> +		       je32_to_cpu(rx->totlen), je32_to_cpu(rx->length), nlen, vlen, ofs);
> +		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
> +		return 0;
> +	}
> +
> +	crc = crc32(0, rx->data, PAD(nlen+1)+PAD(vlen));
> +	if (crc != je32_to_cpu(rx->data_crc)) {
> +		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Data CRC failed"
> +		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
> +		       ofs, je32_to_cpu(rx->data_crc), crc);
> +		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
> +		return 0;
> +	}
> +
> +	xc = jffs2_find_xattr_cache_xid(c, je32_to_cpu(rx->xid));
> +	if (xc) {
> +		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Duplicate XID Found"
> +		       " on node at 0x%08x XID=%d Later one ignored\n", ofs, xc->xid);
> +		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
> +		return 0;
> +	}

How do you deal with xattr reference counting and lifetime?

> +	xtype = jffs2_xattr_prefix_to_xtype(rx->data, nlen);
> +	if (JFFS2_XATTRTYPE_INVALID==xtype) {
> +		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Unsupported xattr type"
> +		       " on node at 0x%08x\n", ofs);
> +		USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
> +		return 0;
> +	}

Why is it required that JFFS2 knows the type of the xattr?

> +
> +	raw = jffs2_alloc_raw_node_ref();
> +	if (!raw)
> +		return -ENOMEM;
> +
> +	xc = jffs2_alloc_xattr_cache();
> +	if (!xc) {
> +		jffs2_free_raw_node_ref(raw);
> +		return -ENOMEM;
> +	}
> +	initxattr_jffs2_xattr_cache(xc);
> +
> +	xc->xid = je32_to_cpu(rx->xid);
> +	if (xc->xid > c->highest_xid)
> +		c->highest_xid = xc->xid;
> +	xc->xtype = xtype;
> +	xc->node = raw;
> +	xc->name_len = nlen;
> +	xc->value_len = vlen;
> +	xc->data_crc = crc;
> +
> +	raw->__totlen = PAD(je32_to_cpu(rx->totlen));
> +	raw->flash_offset = ofs | REF_PRISTINE;
> +	raw->next_phys = NULL;
> +	raw->next_in_ino = NULL;
> +	if (!jeb->first_node)
> +		jeb->first_node = raw;
> +	if (jeb->last_node)
> +		jeb->last_node->next_phys = raw;
> +	jeb->last_node = raw;
> +	USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
> +
> +	jffs2_attach_xattr_cache(c, xc);
> +
> +	D1(printk(KERN_NOTICE "XATTR_CACHE: XID=%d inserted\n", xc->xid));
> +	return 0;
> +}
> +
> +static inline int jffs2_scan_xref_node_helper(struct jffs2_sb_info *c,
> +			struct jffs2_xattr_ref *new, struct jffs2_xattr_ref *old)
> +{
> +	/* (uint32_t)new->xc == (uint32_t)old->xc has been made sure. */
> +	if ((uint32_t)new->ic == (uint32_t)old->ic) {

Why the casts?  How can this be safe on 64bit machines?

> +		if (new->seqno > old->seqno) {
> +			jffs2_mark_node_obsolete(c, old->node);
> +			old->seqno = new->seqno;
> +			old->node = new->node;
> +		} else {
> +			jffs2_mark_node_obsolete(c, new->node);
> +		}
> +		return 1; /* 'new' should be released. */
> +	}
> +	return 0;
> +}
> +
> +static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
> +				struct jffs2_raw_xref *rr, uint32_t ofs)
> +{
> +	struct jffs2_raw_node_ref *raw;
> +	struct jffs2_xattr_ref *ref, *pos, *pos2;
> +	uint32_t crc;
> +
> +	crc = crc32(0, rr, sizeof(*rr)-4);
> +	if (crc != je32_to_cpu(rr->node_crc)) {
> +		printk(KERN_NOTICE "jffs2_scan_xref_node(): Node CRC failed"
> +		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
> +		       ofs, je32_to_cpu(rr->node_crc), crc);
> +		DIRTY_SPACE(PAD(je32_to_cpu(rr->totlen)));
> +		return 0;
> +	}
> +
> +	ref = jffs2_alloc_xattr_ref();
> +	if (!ref)
> +		return -ENOMEM;
> +	initxattr_jffs2_xattr_ref(ref);
> +
> +	raw = jffs2_alloc_raw_node_ref();
> +	if (!raw) {
> +		jffs2_free_xattr_ref(ref);
> +		return -ENOMEM;
> +	}
> +
> +	ref->seqno = je32_to_cpu(rr->seqno);
> +	if (ref->seqno > c->highest_seqno)
> +		c->highest_seqno = ref->seqno;
> +	ref->ic = (void *)je32_to_cpu(rr->ino);
> +	ref->xc = (void *)je32_to_cpu(rr->xid);

WTF?!?

You read a je32 from flash and use that as a pointer?!?

Please tell me I'm wrong.

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
