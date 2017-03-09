Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cls8J-0003RK-EX
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 07:05:10 +0000
Date: Thu, 9 Mar 2017 16:04:39 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <david.oberhollenzer@sigma-star.at>,
 <linux-kernel@vger.kernel.org>, <dedekind1@gmail.com>, <kernel-team@lge.com>
Subject: Re: [PATCH 2/4] ubifs: Fix unlink code wrt. double hash lookups
Message-ID: <20170309070439.GA31469@sebu>
References: <20170209212837.14197-1-richard@nod.at>
 <20170209212837.14197-2-richard@nod.at>
MIME-Version: 1.0
In-Reply-To: <20170209212837.14197-2-richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

this patch works well. but i found some trivial mistakes.

On Thu, Feb 09, 2017 at 10:28:35PM +0100, Richard Weinberger wrote:
> When removing an encrypted file with a long anem and without having
> the key we have to be able to locate and remove the directory entry
> via a double hash. This corner case was simply forgotten.
> 
> Reported-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/journal.c |  10 ++++-
>  fs/ubifs/tnc.c     | 129 ++++++++++++++++++++++++++++++++++++++++++++---------
>  fs/ubifs/ubifs.h   |   2 +
>  3 files changed, 117 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index f3b620cbdda4..7aef413ea2a9 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -585,7 +585,10 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>  
>  	if (!xent) {
>  		dent->ch.node_type = UBIFS_DENT_NODE;
> -		dent_key_init(c, &dent_key, dir->i_ino, nm);
> +		if (nm->hash)
> +			dent_key_init_hash(c, &dent_key, dir->i_ino, nm->hash);
> +		else
> +			dent_key_init(c, &dent_key, dir->i_ino, nm);
>  	} else {
>  		dent->ch.node_type = UBIFS_XENT_NODE;
>  		xent_key_init(c, &dent_key, dir->i_ino, nm);
> @@ -629,7 +632,10 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>  	kfree(dent);
>  
>  	if (deletion) {
> -		err = ubifs_tnc_remove_nm(c, &dent_key, nm);
> +		if (nm->hash)
> +			err = ubifs_tnc_remove_dh(c, &dent_key, nm->minor_hash);
> +		else
> +			err = ubifs_tnc_remove_nm(c, &dent_key, nm);
>  		if (err)
>  			goto out_ro;
>  		err = ubifs_add_dirt(c, lnum, dlen);
> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
> index 709aa098dd46..d84f4ba467a3 100644
> --- a/fs/ubifs/tnc.c
> +++ b/fs/ubifs/tnc.c
> @@ -1880,48 +1880,65 @@ int ubifs_tnc_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
>  	return do_lookup_nm(c, key, node, nm);
>  }
>  
> -static int do_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
> -			struct ubifs_dent_node *dent, uint32_t cookie)
> +static int search_dh_cookie(struct ubifs_info *c, const union ubifs_key *key,
> +			    struct ubifs_dent_node *dent, uint32_t cookie,
> +			    struct ubifs_znode **zn, int *n)
>  {
> -	int n, err, type = key_type(c, key);
> -	struct ubifs_znode *znode;
> +	int err;

i guess that err should be initialized with -ENOENT to avoid the first call of  
tnc_next(c, &znode, n). 

> +	struct ubifs_znode *znode = *zn;
>  	struct ubifs_zbranch *zbr;
> -	union ubifs_key *dkey, start_key;
> -
> -	ubifs_assert(is_hash_key(c, key));
> -
> -	lowest_dent_key(c, &start_key, key_inum(c, key));
> -
> -	mutex_lock(&c->tnc_mutex);
> -	err = ubifs_lookup_level0(c, &start_key, &znode, &n);
> -	if (unlikely(err < 0))
> -		goto out_unlock;
> +	union ubifs_key *dkey;
>  
>  	for (;;) {
>  		if (!err) {
> -			err = tnc_next(c, &znode, &n);
> +			err = tnc_next(c, &znode, n);
>  			if (err)
> -				goto out_unlock;
> +				goto out;
>  		}
>  
> -		zbr = &znode->zbranch[n];
> +		zbr = &znode->zbranch[*n];
>  		dkey = &zbr->key;
>  
>  		if (key_inum(c, dkey) != key_inum(c, key) ||
> -		    key_type(c, dkey) != type) {
> +		    key_type(c, dkey) != key_type(c, key)) {
>  			err = -ENOENT;
> -			goto out_unlock;
> +			goto out;
>  		}
>  
>  		err = tnc_read_hashed_node(c, zbr, dent);
>  		if (err)
> -			goto out_unlock;
> +			goto out;
>  
>  		if (key_hash(c, key) == key_hash(c, dkey) &&
> -		    le32_to_cpu(dent->cookie) == cookie)
> -			goto out_unlock;
> +		    le32_to_cpu(dent->cookie) == cookie) {
> +			*zn = znode;
> +			goto out;
> +		}
>  	}
>  
> +out:
> +
> +	return err;
> +}
> +
> +static int do_lookup_dh(struct ubifs_info *c, const union ubifs_key *key,
> +			struct ubifs_dent_node *dent, uint32_t cookie)
> +{
> +	int n, err;
> +	struct ubifs_znode *znode;
> +	union ubifs_key start_key;
> +
> +	ubifs_assert(is_hash_key(c, key));
> +
> +	lowest_dent_key(c, &start_key, key_inum(c, key));
> +
> +	mutex_lock(&c->tnc_mutex);
> +	err = ubifs_lookup_level0(c, &start_key, &znode, &n);
> +	if (unlikely(err < 0))
> +		goto out_unlock;
> +
> +	err = search_dh_cookie(c, key, dent, cookie, &znode, &n);
> +
>  out_unlock:
>  	mutex_unlock(&c->tnc_mutex);
>  	return err;
> @@ -2663,6 +2680,74 @@ int ubifs_tnc_remove_nm(struct ubifs_info *c, const union ubifs_key *key,
>  }
>  
>  /**
> + * ubifs_tnc_remove_dh - remove an index entry for a "double hashed" node.
> + * @c: UBIFS file-system description object
> + * @key: key of node
> + * @cookie: node cookie for collision resolution
> + *
> + * Returns %0 on success or negative error code on failure.
> + */
> +int ubifs_tnc_remove_dh(struct ubifs_info *c, const union ubifs_key *key,
> +			uint32_t cookie)
> +{
> +	int n, err;
> +	struct ubifs_znode *znode;
> +	struct ubifs_dent_node *dent;
> +	struct ubifs_zbranch *zbr;
> +
> +	if (!c->double_hash)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&c->tnc_mutex);
> +	err = lookup_level0_dirty(c, key, &znode, &n);
> +	if (err <= 0)
> +		goto out_unlock;
> +
> +	zbr = &znode->zbranch[n];
> +	dent = kmalloc(UBIFS_MAX_DENT_NODE_SZ, GFP_NOFS);
> +	if (!dent) {
> +		err = -ENOMEM;
> +		goto out_unlock;
> +	}
> +
> +	err = tnc_read_hashed_node(c, zbr, dent);
> +	if (err)
> +		goto out_free;
> +
> +	/* If the cookie does not match, we're facing a hash collision. */
> +	if (le32_to_cpu(dent->cookie) != cookie) {
> +		union ubifs_key start_key;
> +
> +		lowest_dent_key(c, &start_key, key_inum(c, key));
> +
> +		err = ubifs_lookup_level0(c, &start_key, &znode, &n);
> +		if (unlikely(err < 0))
> +			goto out_unlock;

i guess that out_unlock should be replaced with out_free to free dent.

> +
> +		err = search_dh_cookie(c, key, dent, cookie, &znode, &n);
> +		if (err)
> +			goto out_free;
> +	}
> +
> +	if (znode->cnext || !ubifs_zn_dirty(znode)) {
> +		znode = dirty_cow_bottom_up(c, znode);
> +		if (IS_ERR(znode)) {
> +			err = PTR_ERR(znode);
> +			goto out_unlock;

this out_unlock should also be.

> +		}
> +	}
> +	err = tnc_delete(c, znode, n);
> +
> +out_free:
> +	kfree(dent);
> +out_unlock:
> +	if (!err)
> +		err = dbg_check_tnc(c, 0);
> +	mutex_unlock(&c->tnc_mutex);
> +	return err;
> +}
> +
> +/**
>   * key_in_range - determine if a key falls within a range of keys.
>   * @c: UBIFS file-system description object
>   * @key: key to check
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index ca72382ce6cc..36df4613b803 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1589,6 +1589,8 @@ int ubifs_tnc_add_nm(struct ubifs_info *c, const union ubifs_key *key,
>  int ubifs_tnc_remove(struct ubifs_info *c, const union ubifs_key *key);
>  int ubifs_tnc_remove_nm(struct ubifs_info *c, const union ubifs_key *key,
>  			const struct fscrypt_name *nm);
> +int ubifs_tnc_remove_dh(struct ubifs_info *c, const union ubifs_key *key,
> +			uint32_t cookie);
>  int ubifs_tnc_remove_range(struct ubifs_info *c, union ubifs_key *from_key,
>  			   union ubifs_key *to_key);
>  int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum);
> -- 
> 2.10.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

thanks,
Hyunchul
