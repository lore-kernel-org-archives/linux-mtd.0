Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvNCF-0005hQ-W4
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2018 13:41:17 +0000
Date: Thu, 30 Aug 2018 15:41:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/25] ubifs: Add authentication nodes to journal
Message-ID: <20180830134103.qftgy2hdlopfup5s@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <1901352.nUraZMrBkh@blindfold>
 <20180829143834.wwojzrwmpadxqiqk@pengutronix.de>
 <1631201.FhrAdlTAGn@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631201.FhrAdlTAGn@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 29, 2018 at 04:54:30PM +0200, Richard Weinberger wrote:
> Am Mittwoch, 29. August 2018, 16:38:34 CEST schrieb Sascha Hauer:
> > On Mon, Aug 27, 2018 at 10:48:26PM +0200, Richard Weinberger wrote:
> > > >  	release_head(c, BASEHD);
> > > >  	kfree(dent);
> > > > +	ubifs_add_dirt(c, lnum, ubifs_auth_node_sz(c));
> > > 
> > > You have to account it immediately because while a commit you have no longer
> > > a reference to them?
> > > Upon replay you should have since you scan LEBs anyway.
> > 
> > What do you mean here? Is that a suggestion to change something?
> 
> I don't fully understand how you keep the lprops dirty counter correct for
> auth nodes. Hence the question.
> 
> Auth nodes are not referenced by the index, so you have to keep track of
> them manually.

Yes. That's why I call ubifs_add_dirt(c, lnum, ubifs_auth_node_sz(c))
each time I create an auth node.

> Is your current approach "mark them dirty immediately and rely on LPT commit"
> to not get lost of an auth node?

Yes, I mark the auth nodes dirty in the assumption that the correct
values are written on a LPT commit.

> 
> I expected auth nodes getting dirtied also during journal reply.

Yes, this happens in replay.c replay_bud(). "used" gets increased with
every node found except when it's an auth node. Here "used" is not
increased, the result is that the auth node adds to the dirty space.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
