Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUOHB-0007sm-6J
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 17:42:06 +0000
Subject: Re: [PATCH 5/6] mtdblock: Replace array of block cache info with
	pointers in struct mtd_info
From: Ben Hutchings <bhutchings@solarflare.com>
To: dedekind1@gmail.com
In-Reply-To: <1263119681.7315.156.camel@localhost.localdomain>
References: <1262704951.2837.14.camel@achroite.uk.solarflarecom.com>
	<1263119681.7315.156.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 11 Jan 2010 17:41:56 +0000
Message-Id: <1263231716.2781.29.camel@achroite.uk.solarflarecom.com>
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

On Sun, 2010-01-10 at 12:34 +0200, Artem Bityutskiy wrote:
> On Tue, 2010-01-05 at 15:22 +0000, Ben Hutchings wrote:
> >  	mutex_lock(&mtdblk->cache_mutex);
> >  	write_cached_data(mtdblk);
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 0f32a9b..5c1b1ac 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -177,6 +177,10 @@ struct mtd_info {
> >  	 */
> >  	struct backing_dev_info *backing_dev_info;
> >  
> > +#if defined(CONFIG_MTD_BLOCK) || defined(CONFIG_MTD_BLOCK_MODULE)
> > +	/* Block device state */
> > +	struct mtdblk_dev *blk_dev;
> > +#endif
> 
> I think injecting this to mtd_info is conceptually very wrong. It breaks
> layering. Block devices sit on top of MTD devices, not vice-versa. Lower
> layer (MTD) should not know anything about the higher layer (block).

I agree in principle, but it already does know about block and char
devices.

> I think you should a global list or rb-tree instead of the
> 'mtdblks[MAX_MTD_DEVICES]' array.

I can try that.

> But you should not inject block device
> fields to 'struct mtd_info'.
> 
> Moreover, all this mtdblock stuff is legacy, and coupling it tighter to
> 'struct mtd_info' is not a good idea.

I don't think this makes it significantly worse.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
