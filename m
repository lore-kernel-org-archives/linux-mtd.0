Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuOsP-00028W-LH
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 21:16:48 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/25] ubifs: authenticate replayed journal
Date: Mon, 27 Aug 2018 23:16:32 +0200
Message-ID: <2400170.163Ix3ckZ8@blindfold>
In-Reply-To: <20180704124137.13396-17-s.hauer@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-17-s.hauer@pengutronix.de>
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

Am Mittwoch, 4. Juli 2018, 14:41:28 CEST schrieb Sascha Hauer:
> Make sure that during replay all buds can be authenticated. To do
> this we calculate the hash chain until we find an authentication
> node and check the HMAC in that node against the current status
> of the hash chain.
> 
> After a power cut it can happen that some nodes have been written, but
> not yet the authentication node for them. These nodes have to be
> discarded during replay.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  fs/ubifs/replay.c | 116 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
> index 07a66ae90e89..45da17d1a74e 100644
> --- a/fs/ubifs/replay.c
> +++ b/fs/ubifs/replay.c
> @@ -34,6 +34,8 @@
>  
>  #include "ubifs.h"
>  #include <linux/list_sort.h>
> +#include <crypto/hash.h>
> +#include <crypto/algapi.h>
>  
>  /**
>   * struct replay_entry - replay list entry.
> @@ -530,6 +532,79 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
>  	return data == 0xFFFFFFFF;
>  }
>  
> +/**
> + * authenticate_sleb - authenticate one scan LEB
> + * @c: UBIFS file-system description object
> + * @sleb: the scan LEB to authenticate
> + * @log_hash:
> + * @is_last: if true, this is is the last LEB
> + *
> + * This function iterates over the buds of a single LEB authenticating all buds
> + * with the authentication nodes on this LEB. Authentication nodes are written
> + * after some buds and contain a HMAC covering the authentication node itself
> + * and the buds between the last authentication node and the current
> + * authentication node. It can happen that the last buds cannot be authenticated
> + * because a powercut happened when some nodes were written but not the
> + * corresponding authentication node. This function returns the number of nodes
> + * that could be authenticated or a negative error code.
> + */
> +static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
> +			     struct shash_desc *log_hash, int is_last)
> +{
> +	int n_not_auth = 0;
> +	struct ubifs_scan_node *snod;
> +	int n_nodes = 0;
> +	int err;
> +
> +	if (!ubifs_authenticated(c))
> +		return sleb->nodes_cnt;
> +
> +	list_for_each_entry(snod, &sleb->nodes, list) {
> +
> +		n_nodes++;
> +
> +		if (snod->type == UBIFS_AUTH_NODE) {
> +			struct ubifs_auth_node *auth = snod->node;
> +			SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
> +			u8 hash[crypto_shash_descsize(c->hash_tfm)];
> +			SHASH_DESC_ON_STACK(hmac_desc, c->hmac_tfm);
> +			u8 hmac[c->hmac_desc_len];
> +
> +			hash_desc->tfm = c->hash_tfm;
> +			hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
> +
> +			ubifs_shash_copy_state(c, log_hash, hash_desc);
> +			crypto_shash_final(hash_desc, hash);
> +
> +			hmac_desc->tfm = c->hmac_tfm;
> +			hmac_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
> +			crypto_shash_digest(hmac_desc, hash, c->hash_len, hmac);
> +
> +			err = ubifs_check_hmac(c, auth->hmac, hmac);
> +			if (err) {
> +				err = -EPERM;
> +				goto out;
> +			}
> +			n_not_auth = 0;
> +		} else {
> +			crypto_shash_update(log_hash, snod->node, snod->len);
> +			n_not_auth++;
> +		}
> +	}
> +
> +	/*
> +	 * A powercut can happen when some nodes were written, but not yet
> +	 * the corresponding authentication node. This may only happen on
> +	 * the last bud though.
> +	 */

Can you please add a little debug prints around that?

Thanks,
//richard
