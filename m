Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6KbA-00051Q-U7
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 07:18:25 +0000
Date: Wed, 11 Jun 2008 09:18:14 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bruce_Leonard@selinc.com
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080611071814.GC2432@logfs.org>
References: <20080608121020.GA13200@logfs.org>
	<OF397179E3.A6764D8A-ON88257464.007D81C8-88257465.0000E0CF@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF397179E3.A6764D8A-ON88257464.007D81C8-88257465.0000E0CF@selinc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 10 June 2008 17:09:35 -0700, Bruce_Leonard@selinc.com wrote:
> 
> I think I'm starting to glean some things and one of those things is that 
> I think I'm in over my head :(.  Are you suggesting that the direction we 
> want to move is to change the MTD layer over to function the same way as 
> the Block I/O layer?

Either that or move the block io layer to function the same way as mtd.
Effectively the two should meet somewhere in between, but it's going to
be a lot closer to current block io than current mtd.  We want all the
goodies of both worlds, and block io simply has more.

> With all of it's attendant infrastructure?  I've 
> read through the 'Block Device Drivers' chapter of 'Understanding the 
> Linux Kernal'.  It talks about the I/O scheduler and queues of requests 
> consisting of multiple bios which can consist of multiple segments 
> (bio_vec?), and a WHOLE lot of 'stuff'.  If that's what we're talking 
> about then it's WAY beyond my scope or my abilities.

That's ok.  I don't expect you to do it all.  What I would like is to
solve your problem in a way that brings us closer to block io instead of
farther away.

> > +static int ram_submit_fio(struct mtd_info *mtd, struct fio *fio)
> > +{
> > +   int i, err = 0;
> > +   u32 ofs;
> > +   size_t *retlen;
> > +   const u_char *buf;
> > +   struct fio_vec *vec;
> > +
> > +   /* This driver cannot deal with device >32bit yet */
> > +   if (fio->fi_blockno * mtd->erasesize + fio->block_ofs + fio->fi_len
> > +         > 0xffffffff)
> > +      return -EIO;
> > +
> > +   ofs = fio->fi_blockno * mtd->erasesize + fio->block_ofs;
> > +
> > +   if (fio->fi_command == FI_ERASE) {
> > +      memset(mtd->priv + ofs, 0xff, fio->fi_len);
> > +      goto out;
> > +   }
> > +
> > +   for (i = 0; i < fio->fi_vcnt; i++) {
> > +      vec = fio->fi_io_vec + i;
> > +      buf = kmap_atomic(vec->fv_page, KM_USER0);
> > +      switch (fio->fi_command) {
> > +      case FI_READ:
> > +         err = ram_read(mtd, ofs, vec->fv_len, &retlen,
> > +               buf + vec->fv_offset);
> 
> 'len' confuses me a bit as it comes from vec->fv_len rather than fi_len. 
> Why use the length from the vector rather than the struct fio?  Should 
> they be initialized to the same thing?  I would think to use fi_len as the 
> calling function should have loaded that at the same time it figured out 
> where to start from (i.e., when it loaded fi_blockno and fi_blockofs). I'm 
> sure I'm missing something because I've never used struct page before and 
> it's probably obvious to someone with more kernel experiance.

An io-vector is used to scatter-gather io.  Basically you tell a driver
to write those 4 meg of data in one huge chunk to the device.  And, by
the way, the data is currently scattered all over memory and the
individual bits are here, here, here, here, here,...

That's why we have a loop and within each iteration of the loop only one
fragment is processed.  Each fragment consists of the page, starting
offset within the page and length.  The sum of all fragments length
fields should equal fio->fi_len.  (And it might be a good idea to check
that to catch bugs.)

> Does vec->fv_len represent the remaining length of vec->fv_page?  And 
> vec->fv_offset the offset to start accessing vec->fv_page from?  Sorry to 
> be asking dumb questions.

Just keep asking.  Your questions are far from dumb.  And lack of
experience is often a good thing.  Sometimes all the adults strongly
believe the emperor is wearing clothes and it takes a child to point out
the obvious facts. :)

Jörn

-- 
Homo Sapiens is a goal, not a description.
-- unknown
