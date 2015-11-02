Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zt42I-0000Wj-8L
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 01:35:52 +0000
Message-ID: <5636BC3D.5000200@cn.fujitsu.com>
Date: Mon, 2 Nov 2015 09:28:29 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
CC: <david@sigma-star.at>
Subject: Re: [PATCH 05/11] ubifs: remove ununsed ubifs context from key helpers
References: <1446290160-30696-1-git-send-email-richard@nod.at>
 <1446290160-30696-6-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-6-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, all ubifs_info *c in key.h are not used, But I am
not sure about is that intentional or not.

Ping Artem...

Yang

On 10/31/2015 07:15 PM, Richard Weinberger wrote:
> From: David Gstir <david@sigma-star.at>
>
> Various key helper functions in ubifs-utils/include/key.h require the
> ubifs_info context. Since this context is never used, so we can remove it.
>
> Signed-off-by: David Gstir <david@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   ubifs-utils/include/key.h           | 24 ++++++------------------
>   ubifs-utils/lib/scan.c              | 10 ++++------
>   ubifs-utils/ubifs_dump/ubifs_dump.c | 22 +++++++++++-----------
>   3 files changed, 21 insertions(+), 35 deletions(-)
>
> diff --git a/ubifs-utils/include/key.h b/ubifs-utils/include/key.h
> index 779981a..9ee7597 100644
> --- a/ubifs-utils/include/key.h
> +++ b/ubifs-utils/include/key.h
> @@ -92,7 +92,6 @@ static inline uint32_t key_test_hash(const char *str, int len)
>
>   /**
>    * ino_key_init - initialize inode key.
> - * @c: UBIFS file-system description object
>    * @key: key to initialize
>    * @inum: inode number
>    */
> @@ -190,12 +189,10 @@ static inline int keys_cmp(const union ubifs_key *key1,
>
>   /**
>    * key_read - transform a key to in-memory format.
> - * @c: UBIFS file-system description object
>    * @from: the key to transform
>    * @to: the key to store the result
>    */
> -static inline void key_read(const struct ubifs_info *c __attribute__((unused)), const void *from,
> -			    union ubifs_key *to)
> +static inline void key_read(const void *from, union ubifs_key *to)
>   {
>   	const union ubifs_key *f = from;
>
> @@ -205,45 +202,38 @@ static inline void key_read(const struct ubifs_info *c __attribute__((unused)),
>
>   /**
>    * invalid_key_init - initialize invalid node key.
> - * @c: UBIFS file-system description object
>    * @key: key to initialize
>    *
>    * This is a helper function which marks a @key object as invalid.
>    */
> -static inline void invalid_key_init(const struct ubifs_info *c __attribute__((unused)),
> -				    union ubifs_key *key)
> +static inline void invalid_key_init(union ubifs_key *key)
>   {
>   	key->u32[0] = 0xDEADBEAF;
>   	key->u32[1] = UBIFS_INVALID_KEY;
>   }
>   /**
>    * key_type - get key type.
> - * @c: UBIFS file-system description object
>    * @key: key to get type of
>    */
> -static inline int key_type(const struct ubifs_info *c __attribute__((unused)),
> -			   const union ubifs_key *key)
> +static inline int key_type(const union ubifs_key *key)
>   {
>   	return key->u32[1] >> UBIFS_S_KEY_BLOCK_BITS;
>   }
>
>   /*
>    * key_hash - get directory entry hash.
> - * @c: UBIFS file-system description object
>    * @key: the key to get hash from
>    */
> -static inline uint32_t key_hash(const struct ubifs_info *c __attribute__((unused)),
> -				const union ubifs_key *key)
> +static inline uint32_t key_hash(const union ubifs_key *key)
>   {
>   	return key->u32[1] & UBIFS_S_KEY_HASH_MASK;
>   }
>
>   /**
>    * key_inum - fetch inode number from key.
> - * @c: UBIFS file-system description object
>    * @k: key to fetch inode number from
>    */
> -static inline ino_t key_inum(const struct ubifs_info *c __attribute__((unused)), const void *k)
> +static inline ino_t key_inum(const void *k)
>   {
>   	const union ubifs_key *key = k;
>
> @@ -252,11 +242,9 @@ static inline ino_t key_inum(const struct ubifs_info *c __attribute__((unused)),
>
>   /**
>    * key_block - get data block number.
> - * @c: UBIFS file-system description object
>    * @key: the key to get the block number from
>    */
> -static inline unsigned int key_block(const struct ubifs_info *c __attribute__((unused)),
> -				     const union ubifs_key *key)
> +static inline unsigned int key_block(const union ubifs_key *key)
>   {
>   	return key->u32[1] & UBIFS_S_KEY_BLOCK_MASK;
>   }
> diff --git a/ubifs-utils/lib/scan.c b/ubifs-utils/lib/scan.c
> index 69c84d1..3c5be2c 100644
> --- a/ubifs-utils/lib/scan.c
> +++ b/ubifs-utils/lib/scan.c
> @@ -162,15 +162,13 @@ void ubifs_end_scan(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
>
>   /**
>    * ubifs_add_snod - add a scanned node to LEB scanning information.
> - * @c: UBIFS file-system description object
>    * @sleb: scanning information
>    * @buf: buffer containing node
>    * @offs: offset of node on flash
>    *
>    * This function returns %0 on success and a negative error code on failure.
>    */
> -int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
> -		   void *buf, int offs)
> +int ubifs_add_snod(struct ubifs_scan_leb *sleb, void *buf, int offs)
>   {
>   	struct ubifs_ch *ch = buf;
>   	struct ubifs_ino_node *ino = buf;
> @@ -195,10 +193,10 @@ int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
>   		 * The key is in the same place in all keyed
>   		 * nodes.
>   		 */
> -		key_read(c, &ino->key, &snod->key);
> +		key_read(&ino->key, &snod->key);
>   		break;
>   	default:
> -		invalid_key_init(c, &snod->key);
> +		invalid_key_init(&snod->key);
>   		break;
>   	}
>   	list_add_tail(&snod->list, &sleb->nodes);
> @@ -267,7 +265,7 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
>   			goto error;
>   		}
>
> -		err = ubifs_add_snod(c, sleb, buf, offs);
> +		err = ubifs_add_snod(sleb, buf, offs);
>   		if (err)
>   			goto error;
>
> diff --git a/ubifs-utils/ubifs_dump/ubifs_dump.c b/ubifs-utils/ubifs_dump/ubifs_dump.c
> index eaf8daf..68c2895 100644
> --- a/ubifs-utils/ubifs_dump/ubifs_dump.c
> +++ b/ubifs-utils/ubifs_dump/ubifs_dump.c
> @@ -91,30 +91,30 @@ const char *dbg_snprintf_key(const struct ubifs_info *c,
>   			     const union ubifs_key *key, char *buffer, int len)
>   {
>   	char *p = buffer;
> -	int type = key_type(c, key);
> +	int type = key_type(key);
>
>   	if (c->key_fmt == UBIFS_SIMPLE_KEY_FMT) {
>   		switch (type) {
>
>   		case UBIFS_INO_KEY:
>   			len -= snprintf(p, len, "(%lu, %s)",
> -					(unsigned long)key_inum(c, key),
> +					(unsigned long)key_inum(key),
>   					get_key_type(type));
>   			break;
>   		case UBIFS_DENT_KEY:
>   		case UBIFS_XENT_KEY:
>   			len -= snprintf(p, len, "(%lu, %s, %#08x)",
> -					(unsigned long)key_inum(c, key),
> -					get_key_type(type), key_hash(c, key));
> +					(unsigned long)key_inum(key),
> +					get_key_type(type), key_hash(key));
>   			break;
>   		case UBIFS_DATA_KEY:
>   			len -= snprintf(p, len, "(%lu, %s, %u)",
> -					(unsigned long)key_inum(c, key),
> -					get_key_type(type), key_block(c, key));
> +					(unsigned long)key_inum(key),
> +					get_key_type(type), key_block(key));
>   			break;
>   		case UBIFS_TRUN_KEY:
>   			len -= snprintf(p, len, "(%lu, %s)",
> -					(unsigned long)key_inum(c, key),
> +					(unsigned long)key_inum(key),
>   					get_key_type(type));
>   			break;
>   		default:
> @@ -252,7 +252,7 @@ void dump_node(const struct ubifs_info *c, const void *node)
>   	{
>   		const struct ubifs_ino_node *ino = node;
>
> -		key_read(c, &ino->key, &key);
> +		key_read(&ino->key, &key);
>   		printf("\t\tkey \t\t\t\t%s\n",
>   		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
>   		printf("\t\tcreat_sqnum \t\t\t%llu\n",
> @@ -287,7 +287,7 @@ void dump_node(const struct ubifs_info *c, const void *node)
>   		const struct ubifs_dent_node *dent = node;
>   		int nlen = le16_to_cpu(dent->nlen);
>
> -		key_read(c, &dent->key, &key);
> +		key_read(&dent->key, &key);
>   		printf("\t\tkey \t\t\t\t%s\n",
>   		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
>   		printf("\t\tinum \t\t\t\t%llu\n",
> @@ -311,7 +311,7 @@ void dump_node(const struct ubifs_info *c, const void *node)
>   		const struct ubifs_data_node *dn = node;
>   		int dlen = le32_to_cpu(ch->len) - UBIFS_DATA_NODE_SZ;
>
> -		key_read(c, &dn->key, &key);
> +		key_read(&dn->key, &key);
>   		printf("\t\tkey \t\t\t\t%s\n",
>   		       dbg_snprintf_key(c, &key, key_buf, DBG_KEY_BUF_LEN));
>   		printf("\t\tsize \t\t\t\t%u\n", le32_to_cpu(dn->size));
> @@ -347,7 +347,7 @@ void dump_node(const struct ubifs_info *c, const void *node)
>   			const struct ubifs_branch *br;
>
>   			br = ubifs_idx_branch(c, idx, i);
> -			key_read(c, &br->key, &key);
> +			key_read(&br->key, &key);
>   			printf("\t\t%d: LEB %d:%d len %d key %s\n",
>   			       i, le32_to_cpu(br->lnum), le32_to_cpu(br->offs),
>   			       le32_to_cpu(br->len),
>
