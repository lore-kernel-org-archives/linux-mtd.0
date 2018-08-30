Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvOAm-0007qw-5U
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2018 14:43:50 +0000
Date: Thu, 30 Aug 2018 16:43:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/25] ubifs: Add auth nodes to garbage collector journal
 head
Message-ID: <20180830144335.4hcam2pkocz5umqx@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-16-s.hauer@pengutronix.de>
 <1660996.WYUJqu3I4M@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1660996.WYUJqu3I4M@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 27, 2018 at 10:51:56PM +0200, Richard Weinberger wrote:
> Am Mittwoch, 4. Juli 2018, 14:41:27 CEST schrieb Sascha Hauer:
> > To be able to authenticate the garbage collector journal head add
> > authentication nodes to the buds the garbage collector creates.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  fs/ubifs/gc.c | 37 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 34 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> > index ac3a3f7c6a6e..8feeeb12b6ed 100644
> > --- a/fs/ubifs/gc.c
> > +++ b/fs/ubifs/gc.c
> > @@ -365,12 +365,13 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
> >  
> >  	/* Write nodes to their new location. Use the first-fit strategy */
> >  	while (1) {
> > -		int avail;
> > +		int avail, moved = 0;
> >  		struct ubifs_scan_node *snod, *tmp;
> >  
> >  		/* Move data nodes */
> >  		list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
> > -			avail = c->leb_size - wbuf->offs - wbuf->used;
> > +			avail = c->leb_size - wbuf->offs - wbuf->used -
> > +					ubifs_auth_node_sz(c);
> >  			if  (snod->len > avail)
> >  				/*
> >  				 * Do not skip data nodes in order to optimize
> > @@ -378,14 +379,19 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
> >  				 */
> >  				break;
> >  
> > +			ubifs_shash_update(c, c->jheads[GCHD].log_hash,
> > +					   snod->node, snod->len);
> > +
> >  			err = move_node(c, sleb, snod, wbuf);
> >  			if (err)
> >  				goto out;
> > +			moved = 1;
> >  		}
> >  
> >  		/* Move non-data nodes */
> >  		list_for_each_entry_safe(snod, tmp, &nondata, list) {
> > -			avail = c->leb_size - wbuf->offs - wbuf->used;
> > +			avail = c->leb_size - wbuf->offs - wbuf->used -
> > +					ubifs_auth_node_sz(c);
> >  			if (avail < min)
> >  				break;
> >  
> > @@ -403,7 +409,32 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
> >  				continue;
> >  			}
> >  
> > +			ubifs_shash_update(c, c->jheads[GCHD].log_hash,
> > +					   snod->node, snod->len);
> > +
> >  			err = move_node(c, sleb, snod, wbuf);
> > +			if (err)
> > +				goto out;
> > +			moved = 1;
> > +		}
> > +
> > +		if (ubifs_authenticated(c) && moved) {
> > +			struct ubifs_auth_node *auth;
> > +
> > +			auth = kmalloc(ubifs_auth_node_sz(c), GFP_NOFS);
> > +			if (!auth) {
> > +				err = -ENOMEM;
> > +				goto out;
> > +			}
> > +
> > +			ubifs_prepare_auth_node(c, auth,
> > +						c->jheads[GCHD].log_hash);
> 
> ubifs_prepare_auth_node() does a crypto_shash_final(), check.
> But the overall "hash life cycle" is not 100% clear to me.
> For example, does move_nodes() assume that the hash is initialized
> or is it allowed that an crypto_shash_update() happened before?

move_nodes() assumes that the hash is
- initialized
- updated with the commit start node
- updated with all reference nodes before the one that point into
  the current LEB
- updated with the reference node pointing to the current LEB


To make that more clear here is the overall life cycle of the auth hashes:

Everything starts in ubifs_log_start_commit(). We initialize the global
log hash and update it with the commit start node:

>	ubifs_shash_init(c->log_hash);
>	ubifs_shash_update(c, c->log_hash, cs, UBIFS_CS_NODE_SZ);

Afterwards still in ubifs_log_start_commit() ref nodes are created for
each journal head. We update the global log hash with the reference
nodes and copy the current state into each journal heads log hash:

>	for (i = 0; i < c->jhead_cnt; i++) {
>		ubifs_prepare_node(c, ref, UBIFS_REF_NODE_SZ, 0);
>		ubifs_shash_update(c, c->log_hash, ref, UBIFS_REF_NODE_SZ);
>		ubifs_shash_copy_state(c, c->log_hash, c->jheads[i].log_hash);
>	}

>From here on each journal head has its own log hash derived from the
global log hash. Whenever something is written to a journal head we
update the hash of that journal head. For the garbage collector this
happens in gc.c move_nodes():

>	for_each_node_in_gc_leb()
>		ubifs_shash_update(c, c->jheads[GCHD].log_hash, snod->node, snod->len);

For the base head and data head this happens in journal.c write_head():

>	ubifs_hash_nodes(c, buf, len, c->jheads[jhead].log_hash);

Whenever we want to write an auth node we can now call
ubifs_prepare_auth_node() with a journal heads current log hash state.
This creates us a suitable auth node with the correct hash. The trick
here is that not the hash state is finalized, but a copy thereof, so the
hash state can be continued to use.

The final interesting thing happens when a journal head is switched to a
new LEB in ubifs_add_bud_to_log(). We update the global log hash with the
newly created reference node and again the state is copied to the journal
heads log hash:

>	ubifs_shash_update(c, c->log_hash, ref, UBIFS_REF_NODE_SZ);
>	ubifs_shash_copy_state(c, c->log_hash, c->jheads[jhead].log_hash);

I hope that makes it more clear.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
