Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUR8e-0002xC-VF
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 20:45:29 +0000
Subject: Re: [PATCH 5/6] mtdblock: Replace array of block cache info with
	pointers in struct mtd_info
From: Ben Hutchings <bhutchings@solarflare.com>
To: dedekind1@gmail.com
In-Reply-To: <1263231716.2781.29.camel@achroite.uk.solarflarecom.com>
References: <1262704951.2837.14.camel@achroite.uk.solarflarecom.com>
	<1263119681.7315.156.camel@localhost.localdomain>
	<1263231716.2781.29.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Mon, 11 Jan 2010 20:45:20 +0000
Message-Id: <1263242720.2781.44.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-01-11 at 17:41 +0000, Ben Hutchings wrote:
> On Sun, 2010-01-10 at 12:34 +0200, Artem Bityutskiy wrote:
> > On Tue, 2010-01-05 at 15:22 +0000, Ben Hutchings wrote:
> > >  	mutex_lock(&mtdblk->cache_mutex);
> > >  	write_cached_data(mtdblk);
> > > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > > index 0f32a9b..5c1b1ac 100644
> > > --- a/include/linux/mtd/mtd.h
> > > +++ b/include/linux/mtd/mtd.h
> > > @@ -177,6 +177,10 @@ struct mtd_info {
> > >  	 */
> > >  	struct backing_dev_info *backing_dev_info;
> > >  
> > > +#if defined(CONFIG_MTD_BLOCK) || defined(CONFIG_MTD_BLOCK_MODULE)
> > > +	/* Block device state */
> > > +	struct mtdblk_dev *blk_dev;
> > > +#endif
> > 
> > I think injecting this to mtd_info is conceptually very wrong. It breaks
> > layering. Block devices sit on top of MTD devices, not vice-versa. Lower
> > layer (MTD) should not know anything about the higher layer (block).
> 
> I agree in principle, but it already does know about block and char
> devices.
[...]

It looks like this is actually quite easy to do cleanly.  Based on the
original mtdblock code I thought that the cache structures (struct
mtdblk_dev) could be shared between multiple block translation devices
(struct mtd_blktrans_dev).  However, instances of each type have to be
uniquely identified by MTD index, so this cannot happen.  It should be
possible to embed struct mtd_blktrans_dev in struct mtdblk_dev and then
look up the latter with container_of().  Right?

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
