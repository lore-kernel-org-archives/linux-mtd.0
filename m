Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbnfb-0004AA-Pi
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 12:17:57 +0000
Date: Thu, 9 Feb 2017 13:17:28 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Weinberger <richard@nod.at>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 22/24] ubifs: Convert to separately allocated bdi
Message-ID: <20170209121728.GE16825@quack2.suse.cz>
References: <20170202173422.3240-1-jack@suse.cz>
 <20170202173422.3240-23-jack@suse.cz>
 <d0d1d396-a340-866b-c931-974fa8ea53a1@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0d1d396-a340-866b-c931-974fa8ea53a1@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 08-02-17 12:24:00, Richard Weinberger wrote:
> Am 02.02.2017 um 18:34 schrieb Jan Kara:
> > Allocate struct backing_dev_info separately instead of embedding it
> > inside the superblock. This unifies handling of bdi among users.
> > 
> > CC: Richard Weinberger <richard@nod.at>
> > CC: Artem Bityutskiy <dedekind1@gmail.com>
> > CC: Adrian Hunter <adrian.hunter@intel.com>
> > CC: linux-mtd@lists.infradead.org
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/ubifs/super.c | 23 +++++++----------------
> >  fs/ubifs/ubifs.h |  3 ---
> >  2 files changed, 7 insertions(+), 19 deletions(-)
> > 
> > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > index e08aa04fc835..34810eb52b22 100644
> > --- a/fs/ubifs/super.c
> > +++ b/fs/ubifs/super.c
> > @@ -1827,7 +1827,6 @@ static void ubifs_put_super(struct super_block *sb)
> >  	}
> >  
> >  	ubifs_umount(c);
> > -	bdi_destroy(&c->bdi);
> >  	ubi_close_volume(c->ubi);
> >  	mutex_unlock(&c->umount_mutex);
> >  }
> > @@ -2019,29 +2018,23 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
> >  		goto out;
> >  	}
> >  
> > +	err = ubifs_parse_options(c, data, 0);
> > +	if (err)
> > +		goto out_close;
> > +
> >  	/*
> >  	 * UBIFS provides 'backing_dev_info' in order to disable read-ahead. For
> >  	 * UBIFS, I/O is not deferred, it is done immediately in readpage,
> >  	 * which means the user would have to wait not just for their own I/O
> >  	 * but the read-ahead I/O as well i.e. completely pointless.
> >  	 *
> > -	 * Read-ahead will be disabled because @c->bdi.ra_pages is 0.
> > +	 * Read-ahead will be disabled because @sb->s_bdi->ra_pages is 0.
> >  	 */
> > -	c->bdi.name = "ubifs",
> > -	c->bdi.capabilities = 0;
> 
> So ->capabilities is now zero by default since you use __GFP_ZERO in
> bdi_alloc().
> At least for UBIFS I'll add a comment on this, otherwise it is not so
> clear that UBIFS wants a BDI with no capabilities and how it achieves that.

OK, I've modified the comment to:

         * Read-ahead will be disabled because @sb->s_bdi->ra_pages is 0. Also
         * @sb->s_bdi->capabilities are initialized to 0 so there won't be any
         * writeback happening.
         */


> Acked-by: Richard Weinberger <richard@nod.at>

Thanks.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
