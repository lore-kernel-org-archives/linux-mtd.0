Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuySt-0003dx-Sf
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 11:16:49 +0000
Date: Wed, 29 Aug 2018 13:16:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/25] ubifs: Add hashes to the tree node cache
Message-ID: <20180829111635.zfgaosho3ambuk6t@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-13-s.hauer@pengutronix.de>
 <3260968.WmIi4lir0Q@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3260968.WmIi4lir0Q@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 27, 2018 at 09:18:25PM +0200, Richard Weinberger wrote:
> Am Mittwoch, 4. Juli 2018, 14:41:24 CEST schrieb Sascha Hauer:
> > As part of the UBIFS authentication support every branch in the index
> > gets a hash covering the referenced node. To make that happen the tree
> > node cache needs hashes over the nodes. This patch adds a hash argument
> > to ubifs_tnc_add() and ubifs_tnc_add_nm(). The hashes are calculated
> > from the callers of these functions which actually prepare the nodes.
> > With this patch all the leaf nodes of the index tree get hashes, but
> > currently nothing is done with these hashes, this is left for a later
> > patch.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  fs/ubifs/journal.c | 93 ++++++++++++++++++++++++++++++++++------------
> >  fs/ubifs/replay.c  |  4 +-
> >  fs/ubifs/tnc.c     | 10 ++++-
> >  fs/ubifs/ubifs.h   |  7 +++-
> >  4 files changed, 84 insertions(+), 30 deletions(-)
> > 
> > diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> > index 754d969eb27e..55b35bc33c31 100644
> > --- a/fs/ubifs/journal.c
> > +++ b/fs/ubifs/journal.c
> > @@ -517,6 +517,9 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
> >  	struct ubifs_dent_node *dent;
> >  	struct ubifs_ino_node *ino;
> >  	union ubifs_key dent_key, ino_key;
> > +	u8 hash_dent[UBIFS_MAX_HASH_LEN];
> > +	u8 hash_ino[UBIFS_MAX_HASH_LEN];
> > +	u8 hash_ino_host[UBIFS_MAX_HASH_LEN];
> 
> With authentication enabled, this makes perfectly sense.
> But if someone builds UBIFS without and has a memory constraint system,
> we could save by setting UBIFS_MAX_HASH_LEN to 0. What do you think?
> Although, we need another define to not influence ubifs-media.h.

I gave it a try and it looks good. Will do it that way.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
