Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fv1rv-0001AR-Vt
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 14:54:55 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Gstir <david@sigma-star.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/25] ubifs: Add authentication nodes to journal
Date: Wed, 29 Aug 2018 16:54:30 +0200
Message-ID: <1631201.FhrAdlTAGn@blindfold>
In-Reply-To: <20180829143834.wwojzrwmpadxqiqk@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <1901352.nUraZMrBkh@blindfold>
 <20180829143834.wwojzrwmpadxqiqk@pengutronix.de>
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

Am Mittwoch, 29. August 2018, 16:38:34 CEST schrieb Sascha Hauer:
> On Mon, Aug 27, 2018 at 10:48:26PM +0200, Richard Weinberger wrote:
> > >  	release_head(c, BASEHD);
> > >  	kfree(dent);
> > > +	ubifs_add_dirt(c, lnum, ubifs_auth_node_sz(c));
> > 
> > You have to account it immediately because while a commit you have no longer
> > a reference to them?
> > Upon replay you should have since you scan LEBs anyway.
> 
> What do you mean here? Is that a suggestion to change something?

I don't fully understand how you keep the lprops dirty counter correct for
auth nodes. Hence the question.

Auth nodes are not referenced by the index, so you have to keep track of
them manually.
Is your current approach "mark them dirty immediately and rely on LPT commit"
to not get lost of an auth node?

I expected auth nodes getting dirtied also during journal reply.

> > 
> > An shouldn't this only get called when the file system is authenticated?
> > AFAICT ubifs_add_dirt(c, lnum, 0) is not a no-op.
> 
> Right. I changed it to use the ubifs_add_auth_dirt() helper that you
> suggested below.
> 
> > 
> > >  	if (deletion) {
> > >  		if (nm->hash)
> > > @@ -677,8 +709,9 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
> > >  			 const union ubifs_key *key, const void *buf, int len)
> > >  {
> > >  	struct ubifs_data_node *data;
> > > -	int err, lnum, offs, compr_type, out_len, compr_len;
> > > +	int err, lnum, offs, compr_type, out_len, compr_len, auth_len;
> > >  	int dlen = COMPRESSED_DATA_NODE_BUF_SZ, allocated = 1;
> > > +	int aligned_dlen;
> > >  	struct ubifs_inode *ui = ubifs_inode(inode);
> > >  	bool encrypted = ubifs_crypt_is_encrypted(inode);
> > >  	u8 hash[UBIFS_MAX_HASH_LEN];
> > > @@ -690,7 +723,9 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
> > >  	if (encrypted)
> > >  		dlen += UBIFS_CIPHER_BLOCK_SIZE;
> > >  
> > > -	data = kmalloc(dlen, GFP_NOFS | __GFP_NOWARN);
> > > +	auth_len = ubifs_auth_node_sz(c);
> > > +
> > > +	data = kmalloc(dlen + auth_len, GFP_NOFS | __GFP_NOWARN);
> > >  	if (!data) {
> > >  		/*
> > >  		 * Fall-back to the write reserve buffer. Note, we might be
> > > @@ -729,15 +764,16 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
> > >  	}
> > >  
> > >  	dlen = UBIFS_DATA_NODE_SZ + out_len;
> > > +	aligned_dlen = ALIGN(dlen, 8);
> > >  	data->compr_type = cpu_to_le16(compr_type);
> > >  
> > >  	/* Make reservation before allocating sequence numbers */
> > > -	err = make_reservation(c, DATAHD, dlen);
> > > +	err = make_reservation(c, DATAHD, aligned_dlen + auth_len);
> > 
> > Okay, now I understand the ALIGN(), ubifs nodes need to be aligned
> > at an 8 border. Makes sense, _but_ you change this also for the non-authenticated
> > case.
> 
> I assumed that make_reservation would align len anyway. I can't find the
> place that led me to that assumption anymore and even if this is true
> it's probably safer to just stick to the original len for the
> non-authenticated case, so I'll change this and other places to use
> the non aligned len.
> 
> BTW could you have a look at ubifs_jnl_change_xattr()? Unlike other
> function in this file it explicitly calls make_reservation() with the
> length of the last node aligned. Do you have an idea why?

Uhh. Let me check this.
More corner cases, I fear.

> > > @@ -1511,12 +1580,14 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
> > >  	hlen = host_ui->data_len + UBIFS_INO_NODE_SZ;
> > >  	len = aligned_xlen + UBIFS_INO_NODE_SZ + ALIGN(hlen, 8);
> > >  
> > > -	xent = kzalloc(len, GFP_NOFS);
> > > +	tlen = len + ubifs_auth_node_sz(c);
> > 
> > xlen, hlen, len, tlen, oh my.. ;-)
> > What does the "t" stand for?
> > Sorry, I'm very bad at naming things.
> 
> I must have thought of something like total_len. I could change it to
> write_len if that sounds better to you.

write_len is very good!

Thanks,
//richard
