Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxBu-0002jd-6k
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:13:51 +0000
Date: Tue, 26 Apr 2016 09:13:27 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: Pass -EUCLEAN to userspace?
Message-ID: <20160426071327.GJ7860@pengutronix.de>
References: <20160422172456.7aaf301c@bbrezillon>
 <20160422172802.4fa830d1@bbrezillon> <571A47D3.6040602@nod.at>
 <20160425052857.GA7860@pengutronix.de>
 <20160425095034.697411aa@bbrezillon>
 <20160425082211.GC7860@pengutronix.de>
 <20160425104041.555b8ed5@bbrezillon>
 <20160425091416.GD7860@pengutronix.de>
 <20160425112616.01f9e4e4@bbrezillon>
 <20160425161144.0f366c9e@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160425161144.0f366c9e@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed typo in subject, maybe this helps finding this thread in the
archives.

On Mon, Apr 25, 2016 at 04:11:44PM +0200, Boris Brezillon wrote:
> On Mon, 25 Apr 2016 11:26:16 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > > > 
> > > > Regarding the maximum number of bitflips per chunk, maybe we can make it
> > > > part of the ioctl request instead of saving the statistics at the MTD
> > > > level.
> > > > 
> > > > How about creating a new ioctl taking a pointer to this struct as a
> > > > parameter:
> > > > 
> > > > struct mtd_extended_read_ops {
> > > > 	/* Existing params */
> > > > 	unsigned int mode;
> > > > 	size_t len;
> > > > 	size_t retlen;
> > > > 	size_t ooblen;
> > > > 	size_t oobretlen;
> > > > 	uint32_t ooboffs;
> > > > 	void *datbuf;
> > > > 	void *oobbuf;
> > > > 
> > > > 	/*
> > > > 	 * Param containing the maximum number of bitflips for this
> > > > 	 * read request.
> > > > 	 */
> > > > 	unsigned int max_bitflips;
> > > > };    
> > > 
> > > Not sure how this ioctl exactly should look like, but this would solve
> > > the problem.  
> > 
> > Let me design a quick prototype, I'll let you follow up with the patch
> > submission process...
> 
> Below is an untested patch adding a new ioctl returning the ECC/read stats.
> Feel free to debug/enhance this implementation and submit it to the MTD
> ML.

Thanks Boris, I'll give it a try.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
