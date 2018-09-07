Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyDxA-0001tf-Sc
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 10:25:30 +0000
Date: Fri, 7 Sep 2018 12:25:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/25] ubifs: authentication: Add hashes to index nodes
Message-ID: <20180907102516.2dr3x3mevuu2l2mz@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-14-s.hauer@pengutronix.de>
 <2092924.iTNEbfF25J@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2092924.iTNEbfF25J@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 27, 2018 at 09:36:56PM +0200, Richard Weinberger wrote:
> > diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
> > index a47fced47823..a00809d4fe6f 100644
> > --- a/fs/ubifs/tnc.c
> > +++ b/fs/ubifs/tnc.c
> > @@ -488,6 +488,12 @@ static int try_read_node(const struct ubifs_info *c, void *buf, int type,
> >  	if (crc != node_crc)
> >  		return 0;
> >  
> > +	err = ubifs_node_check_hash(c, buf, zbr->hash);
> > +	if (err) {
> > +		ubifs_err(c, "hash mismatch on node at LEB %d:%d", lnum, offs);
> > +		return 0;
> > +	}
> 
> Hmm, I think a global "hash is bad" handler would be nice to have.
> That way we always report in the same way.

I created a function reporting a bad hash, so every failure goes through
the same code...

> 
> Maybe also a new file system specific ioctl to query whether a hash
> failure was noticed.

but I'll leave that for a later excercise if that's ok. I am unsure how
useful such an ioctl() is. It's too easy to interpret such a hash
mismatch as some kind of security violation when it's more likely just a
bug somewhere.

> > @@ -868,6 +877,23 @@ static int write_index(struct ubifs_info *c)
> >  		}
> >  		len = ubifs_idx_node_sz(c, znode->child_cnt);
> >  		ubifs_prepare_node(c, idx, len, 0);
> > +		ubifs_node_calc_hash(c, idx, hash);
> > +
> > +		mutex_lock(&c->tnc_mutex);
> 
> This lock looks correct too me.
> Just in case, you did test with lockdep enabled? :-)

Yes, I had lockdep enabled in all my tests.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
