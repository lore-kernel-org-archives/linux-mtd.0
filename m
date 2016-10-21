Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxdPw-00068Y-Li
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 17:15:43 +0000
Received: by mail-pf0-x22e.google.com with SMTP id r16so59914243pfg.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 10:14:43 -0700 (PDT)
Date: Fri, 21 Oct 2016 10:14:39 -0700
From: Michael Halcrow <mhalcrow@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 15/26] ubifs: Implement encrypt/decrypt for all IO
Message-ID: <20161021171439.GA17121@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-16-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-16-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:30PM +0200, Richard Weinberger wrote:
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/file.c    |  36 ++++++++++++++++++
>  fs/ubifs/journal.c | 105 +++++++++++++++++++++++++++++++++++++++++++----------
>  fs/ubifs/super.c   |   6 ++-
>  fs/ubifs/ubifs.h   |   6 +++
>  4 files changed, 131 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index bd0049788e24..60e089d50c82 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -78,6 +78,24 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
>  		goto dump;
>  
>  	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
> +
> +	if (ubifs_crypt_is_encrypted(inode)) {
> +		int clen = le16_to_cpu(dn->compr_size);
> +
> +		if (clen <= 0 || clen > UBIFS_BLOCK_SIZE || clen > dlen)
> +			goto dump;
> +
> +		ubifs_assert(dlen <= UBIFS_BLOCK_SIZE);
> +		err = fscrypt_decrypt_buffer(inode, &dn->data, &dn->data, dlen, block, GFP_NOFS);
> +		if (err) {
> +			ubifs_err(c, "fscrypt_decrypt_buffer failed: %i", err);
> +			return err;
> +		}
> +
> +		ubifs_assert(clen <= dlen);
> +		dlen = clen;
> +	}
> +
>  	out_len = UBIFS_BLOCK_SIZE;
>  	err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
>  			       le16_to_cpu(dn->compr_type));
> @@ -650,6 +668,24 @@ static int populate_page(struct ubifs_info *c, struct page *page,
>  
>  			dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
>  			out_len = UBIFS_BLOCK_SIZE;
> +
> +			if (ubifs_crypt_is_encrypted(inode)) {
> +				int clen = le16_to_cpu(dn->compr_size);
> +
> +				if (clen <= 0 || clen > UBIFS_BLOCK_SIZE || clen > dlen)
> +					goto out_err;
> +
> +				ubifs_assert(dlen <= UBIFS_BLOCK_SIZE);
> +				err = fscrypt_decrypt_buffer(inode, &dn->data, &dn->data, dlen, page_block, GFP_NOFS);
> +				if (err) {
> +					ubifs_err(c, "fscrypt_decrypt_buffer failed: %i", err);
> +					goto out_err;
> +				}
> +
> +				ubifs_assert(clen <= dlen);
> +				dlen = clen;
> +			}
> +
>  			err = ubifs_decompress(c, &dn->data, dlen, addr, &out_len,
>  					       le16_to_cpu(dn->compr_type));
>  			if (err || len != out_len)
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index a643de4e3d91..da694e520ec8 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -691,11 +691,15 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
>  	int err, lnum, offs, compr_type, out_len;
>  	int dlen = COMPRESSED_DATA_NODE_BUF_SZ, allocated = 1;
>  	struct ubifs_inode *ui = ubifs_inode(inode);
> +	bool encrypted = ubifs_crypt_is_encrypted(inode);
>  
>  	dbg_jnlk(key, "ino %lu, blk %u, len %d, key ",
>  		(unsigned long)key_inum(c, key), key_block(c, key), len);
>  	ubifs_assert(len <= UBIFS_BLOCK_SIZE);
>  
> +	if (encrypted)
> +		dlen += UBIFS_CIPHER_BLOCK_SIZE;
> +
>  	data = kmalloc(dlen, GFP_NOFS | __GFP_NOWARN);
>  	if (!data) {
>  		/*
> @@ -724,6 +728,26 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
>  	ubifs_compress(c, buf, len, &data->data, &out_len, &compr_type);

Compress-before-encrypt is a hazard.

http://www.iacr.org/cryptodb/archive/2002/FSE/3091/3091.pdf

>  	ubifs_assert(out_len <= UBIFS_BLOCK_SIZE);
>  
> +	if (encrypted) {
> +		void *p = &data->data;
> +		int plen = round_up(out_len, UBIFS_CIPHER_BLOCK_SIZE);
> +
> +		data->compr_size = cpu_to_le16(out_len);
> +
> +		if (plen != out_len) {
> +			memset(p + out_len, 0, plen - out_len);
> +			out_len = plen;
> +		}
> +
> +		err = fscrypt_encrypt_buffer(inode, &data->data, &data->data, out_len, key_block(c, key), GFP_NOFS);
> +		if (err) {
> +			ubifs_err(c, "fscrypt_encrypt_buffer failed: %i", err);
> +			goto out_free;
> +		}
> +	} else {
> +		data->compr_size = 0;
> +	}
> +
>  	dlen = UBIFS_DATA_NODE_SZ + out_len;
>  	data->compr_type = cpu_to_le16(compr_type);
>  
> @@ -1083,31 +1107,79 @@ out_free:
>  }
>  
>  /**
> - * recomp_data_node - re-compress a truncated data node.
> + * truncate_data_node - re-compress/encrypt a truncated data node.
> + * @c: UBIFS file-system description object
> + * @inode: inode which referes to the data node
> + * @block: data block number
>   * @dn: data node to re-compress
>   * @new_len: new length
>   *
>   * This function is used when an inode is truncated and the last data node of
> - * the inode has to be re-compressed and re-written.
> + * the inode has to be re-compressed/encrypted and re-written.
>   */
> -static int recomp_data_node(const struct ubifs_info *c,
> -			    struct ubifs_data_node *dn, int *new_len)
> +static int truncate_data_node(const struct ubifs_info *c, struct inode *inode,
> +			      unsigned int block, struct ubifs_data_node *dn,
> +			      int *new_len)
>  {
>  	void *buf;
> -	int err, len, compr_type, out_len;
> +	int err, dlen, compr_type, out_len, old_dlen;
>  
>  	out_len = le32_to_cpu(dn->size);
>  	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	len = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
> +	dlen = old_dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
>  	compr_type = le16_to_cpu(dn->compr_type);
> -	err = ubifs_decompress(c, &dn->data, len, buf, &out_len, compr_type);
> -	if (err)
> -		goto out;
>  
> -	ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
> +	if (ubifs_crypt_is_encrypted(inode)) {
> +		int clen = le16_to_cpu(dn->compr_size);
> +
> +		if (clen <= 0 || clen > UBIFS_BLOCK_SIZE || clen > dlen) {
> +			ubifs_err(c, "bad compr_size: %i", clen);
> +			err = -EINVAL;
> +			goto out;
> +		}
> +
> +		err = fscrypt_decrypt_buffer(inode, &dn->data, &dn->data, dlen, block, GFP_NOFS);
> +		if (err) {
> +			ubifs_err(c, "fscrypt_decrypt_buffer failed: %i", err);
> +			goto out;
> +		}
> +
> +		ubifs_assert(clen <= dlen);
> +		dlen = clen;
> +	}
> +
> +	if (compr_type != UBIFS_COMPR_NONE) {
> +		err = ubifs_decompress(c, &dn->data, dlen, buf, &out_len, compr_type);
> +		if (err)
> +			goto out;
> +
> +		ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
> +	}
> +
> +	if (ubifs_crypt_is_encrypted(inode)) {
> +		void *p = &dn->data;
> +		int plen = round_up(out_len, UBIFS_CIPHER_BLOCK_SIZE);
> +
> +		ubifs_assert(old_dlen >= plen);
> +		dn->compr_size = cpu_to_le16(out_len);
> +
> +		if (plen != out_len) {
> +			memset(p + out_len, 0, plen - out_len);
> +			out_len = plen;
> +		}
> +
> +		err = fscrypt_encrypt_buffer(inode, &dn->data, &dn->data, out_len, block, GFP_NOFS);
> +		if (err) {
> +			ubifs_msg(c, "fscrypt_encrypt_buffer failed: %i", err);
> +			goto out;
> +		}
> +	} else {
> +		dn->compr_size = 0;
> +	}
> +
>  	ubifs_assert(out_len <= UBIFS_BLOCK_SIZE);
>  	dn->compr_type = cpu_to_le16(compr_type);
>  	dn->size = cpu_to_le32(*new_len);
> @@ -1179,16 +1251,9 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
>  			if (le32_to_cpu(dn->size) <= dlen)
>  				dlen = 0; /* Nothing to do */
>  			else {
> -				int compr_type = le16_to_cpu(dn->compr_type);
> -
> -				if (compr_type != UBIFS_COMPR_NONE) {
> -					err = recomp_data_node(c, dn, &dlen);
> -					if (err)
> -						goto out_free;
> -				} else {
> -					dn->size = cpu_to_le32(dlen);
> -					dlen += UBIFS_DATA_NODE_SZ;
> -				}
> +				err = truncate_data_node(c, inode, blk, dn, &dlen);
> +				if (err)
> +					goto out_free;
>  			}
>  		}
>  	}
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index a31222947265..ae25c908fbe5 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1210,7 +1210,8 @@ static int mount_ubifs(struct ubifs_info *c)
>  		bu_init(c);
>  
>  	if (!c->ro_mount) {
> -		c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ,
> +		c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ + \
> +					       UBIFS_CIPHER_BLOCK_SIZE,
>  					       GFP_KERNEL);
>  		if (!c->write_reserve_buf)
>  			goto out_free;
> @@ -1623,7 +1624,8 @@ static int ubifs_remount_rw(struct ubifs_info *c)
>  		goto out;
>  	}
>  
> -	c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ, GFP_KERNEL);
> +	c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ + \
> +				       UBIFS_CIPHER_BLOCK_SIZE, GFP_KERNEL);
>  	if (!c->write_reserve_buf) {
>  		err = -ENOMEM;
>  		goto out;
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 63dd027727ca..6c56a08afcd7 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -139,6 +139,12 @@
>   */
>  #define WORST_COMPR_FACTOR 2
>  
> +#ifdef CONFIG_UBIFS_FS_ENCRYPTION
> +#define UBIFS_CIPHER_BLOCK_SIZE FS_CRYPTO_BLOCK_SIZE
> +#else
> +#define UBIFS_CIPHER_BLOCK_SIZE 0
> +#endif
> +
>  /*
>   * How much memory is needed for a buffer where we compress a data node.
>   */
> -- 
> 2.7.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
