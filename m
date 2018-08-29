Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1futze-0006yf-MO
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 06:30:20 +0000
Date: Wed, 29 Aug 2018 08:30:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/25] ubifs: add helper functions for authentication
 support
Message-ID: <20180829063003.goc3eekjo42jkrgy@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-11-s.hauer@pengutronix.de>
 <1675445.itdTWD7r8S@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675445.itdTWD7r8S@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Mon, Aug 27, 2018 at 02:50:37PM +0200, Richard Weinberger wrote:
> Am Mittwoch, 4. Juli 2018, 14:41:22 CEST schrieb Sascha Hauer:
> > This patch adds the various helper functions needed for authentication
> > support. We need functions to hash nodes, to embed HMACs into a node and
> > to compare hashes and HMACs. Most functions first check if this
> > filesystem is authenticated and bail out early if not, which makes the
> > functions safe to be called with disabled authentication.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > +void ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
> > +			     struct shash_desc *inhash)
> > +{
> > +	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
> > +	struct ubifs_auth_node *auth = node;
> > +	u8 hash[crypto_shash_descsize(c->hash_tfm)];
> 
> Doesn't this introduce a new VLA?
> Not that me make Kees unhappy. ;-)

/me just read https://lwn.net/Articles/749064/ and now realizes why this
is considered harmful.

Thanks for the review. I'll look into this and all the other points. I
guess that'll keep me busy for some time.

Thanks
  Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
