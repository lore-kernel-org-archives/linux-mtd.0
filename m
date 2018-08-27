Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuNK0-0007gE-QI
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 19:37:10 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/25] ubifs: authentication: Add hashes to index nodes
Date: Mon, 27 Aug 2018 21:36:56 +0200
Message-ID: <2092924.iTNEbfF25J@blindfold>
In-Reply-To: <20180704124137.13396-14-s.hauer@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-14-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 4. Juli 2018, 14:41:25 CEST schrieb Sascha Hauer:
> With this patch the hashes over the index nodes stored in the tree node
> cache are written to flash and are checked when read back from flash.
> The hash of the root index node is stored in the master node.
> 
> During journal replay the hashes are regenerated from the read nodes
> and stored in the tree node cache. This means the nodes must previously
> be authenticated by other means. This is done in a later patch.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  fs/ubifs/master.c     |  3 +++
>  fs/ubifs/misc.h       |  5 +++--
>  fs/ubifs/replay.c     | 29 ++++++++++++++++++-----------
>  fs/ubifs/tnc.c        | 13 +++++++++++++
>  fs/ubifs/tnc_commit.c | 26 ++++++++++++++++++++++++++
>  fs/ubifs/tnc_misc.c   | 16 +++++++++++++++-
>  fs/ubifs/ubifs.h      |  4 ++++
>  7 files changed, 82 insertions(+), 14 deletions(-)
> 

[...]

> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
> index a47fced47823..a00809d4fe6f 100644
> --- a/fs/ubifs/tnc.c
> +++ b/fs/ubifs/tnc.c
> @@ -488,6 +488,12 @@ static int try_read_node(const struct ubifs_info *c, void *buf, int type,
>  	if (crc != node_crc)
>  		return 0;
>  
> +	err = ubifs_node_check_hash(c, buf, zbr->hash);
> +	if (err) {
> +		ubifs_err(c, "hash mismatch on node at LEB %d:%d", lnum, offs);
> +		return 0;
> +	}

Hmm, I think a global "hash is bad" handler would be nice to have.
That way we always report in the same way.

Maybe also a new file system specific ioctl to query whether a hash
failure was noticed.

>  	return 1;
>  }
>  
> @@ -1713,6 +1719,13 @@ static int validate_data_node(struct ubifs_info *c, void *buf,
>  		goto out;
>  	}
>  
> +	err = ubifs_node_check_hash(c, buf, zbr->hash);
> +	if (err) {
> +		ubifs_err(c, "hash mismatch on node at LEB %d:%d",
> +			  zbr->lnum, zbr->offs);
> +		return err;
> +	}
> +
>  	len = le32_to_cpu(ch->len);
>  	if (len != zbr->len) {
>  		ubifs_err(c, "bad node length %d, expected %d", len, zbr->len);
> diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
> index a9df94ad46a3..3ad78d538885 100644
> --- a/fs/ubifs/tnc_commit.c
> +++ b/fs/ubifs/tnc_commit.c
> @@ -38,6 +38,7 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
>  			 struct ubifs_znode *znode, int lnum, int offs, int len)
>  {
>  	struct ubifs_znode *zp;
> +	u8 hash[UBIFS_MAX_HASH_LEN];
>  	int i, err;
>  
>  	/* Make index node */
> @@ -62,6 +63,7 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
>  		}
>  	}
>  	ubifs_prepare_node(c, idx, len, 0);
> +	ubifs_node_calc_hash(c, idx, hash);
>  
>  	znode->lnum = lnum;
>  	znode->offs = offs;
> @@ -78,10 +80,12 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
>  		zbr->lnum = lnum;
>  		zbr->offs = offs;
>  		zbr->len = len;
> +		ubifs_copy_hash(c, hash, zbr->hash);
>  	} else {
>  		c->zroot.lnum = lnum;
>  		c->zroot.offs = offs;
>  		c->zroot.len = len;
> +		ubifs_copy_hash(c, hash, c->zroot.hash);
>  	}
>  	c->calc_idx_sz += ALIGN(len, 8);
>  
> @@ -647,6 +651,8 @@ static int get_znodes_to_commit(struct ubifs_info *c)
>  			znode->cnext = c->cnext;
>  			break;
>  		}
> +		znode->cparent = znode->parent;
> +		znode->ciip = znode->iip;
>  		znode->cnext = cnext;
>  		znode = cnext;
>  		cnt += 1;
> @@ -840,6 +846,8 @@ static int write_index(struct ubifs_info *c)
>  	}
>  
>  	while (1) {
> +		u8 hash[UBIFS_MAX_HASH_LEN];
> +
>  		cond_resched();
>  
>  		znode = cnext;
> @@ -857,6 +865,7 @@ static int write_index(struct ubifs_info *c)
>  			br->lnum = cpu_to_le32(zbr->lnum);
>  			br->offs = cpu_to_le32(zbr->offs);
>  			br->len = cpu_to_le32(zbr->len);
> +			ubifs_copy_hash(c, zbr->hash, ubifs_branch_hash(c, br));
>  			if (!zbr->lnum || !zbr->len) {
>  				ubifs_err(c, "bad ref in znode");
>  				ubifs_dump_znode(c, znode);
> @@ -868,6 +877,23 @@ static int write_index(struct ubifs_info *c)
>  		}
>  		len = ubifs_idx_node_sz(c, znode->child_cnt);
>  		ubifs_prepare_node(c, idx, len, 0);
> +		ubifs_node_calc_hash(c, idx, hash);
> +
> +		mutex_lock(&c->tnc_mutex);

This lock looks correct too me.
Just in case, you did test with lockdep enabled? :-)
