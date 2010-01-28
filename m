Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaX8V-00039h-7G
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 16:22:35 +0000
Subject: Re: [PATCHv2 3/7] nandsim: Define CONFIG_NANDSIM_MAX_PARTS and use
	it instead of MAX_MTD_DEVICES
From: Ben Hutchings <bhutchings@solarflare.com>
To: dedekind1@gmail.com
In-Reply-To: <1264695182.1973.149.camel@localhost>
References: <1263337726.3011.20.camel@achroite.uk.solarflarecom.com>
	<1264695182.1973.149.camel@localhost>
Content-Type: text/plain
Date: Thu, 28 Jan 2010 16:22:21 +0000
Message-Id: <1264695741.2783.6.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-01-28 at 18:13 +0200, Artem Bityutskiy wrote:
> On Tue, 2010-01-12 at 23:08 +0000, Ben Hutchings wrote:
> > MAX_MTD_DEVICES is about to be removed.
> > 
> > Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
> > ---
> >  drivers/mtd/nand/nandsim.c |    7 +++++--
> >  1 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> > index 7281000..58c255e 100644
> > --- a/drivers/mtd/nand/nandsim.c
> > +++ b/drivers/mtd/nand/nandsim.c
> > @@ -80,6 +80,9 @@
> >  #ifndef CONFIG_NANDSIM_DBG
> >  #define CONFIG_NANDSIM_DBG        0
> >  #endif
> > +#ifndef CONFIG_NANDSIM_MAX_PARTS
> > +#define CONFIG_NANDSIM_MAX_PARTS  32
> > +#endif
> 
> Since this is not a Kconfig option, please, remove the CONFIG_ prefix.

While I understand that CONFIG_* should be reserved to Kconfig, this is
consistent with the existing build-time options in this file.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
