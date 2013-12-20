Received: from mail-yh0-x22e.google.com ([2607:f8b0:4002:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtpYa-0003qs-C6
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 02:11:17 +0000
Received: by mail-yh0-f46.google.com with SMTP id l109so506049yhq.5
 for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2013 18:10:55 -0800 (PST)
Date: Thu, 19 Dec 2013 18:05:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH] mtd: Hide CONFIG_MTD_BLKDEVS from the menu
Message-ID: <20131220020518.GB18175@norris-Latitude-E6410>
References: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131220004712.GA12803@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131220004712.GA12803@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 19, 2013 at 09:47:13PM -0300, Ezequiel Garcia wrote:
> On Fri, Dec 13, 2013 at 10:58:44AM -0300, Ezequiel Garcia wrote:
> > Make this option a hidden one and get a cleaner configuration.
> > This option just selects a common infrastructure for MTD-based devices
> > to expose a block interface. There is no point in allowing a separate
> > enable/disable.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/Kconfig | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index 5fab4e6e..2a0ca2a 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -158,9 +158,7 @@ config MTD_BCM47XX_PARTS
> >  comment "User Modules And Translation Layers"
> >  
> >  config MTD_BLKDEVS
> > -	tristate "Common interface to block layer for MTD 'translation layers'"
> > -	depends on BLOCK
> > -	default n
> > +	bool
> >  
> >  config MTD_BLOCK
> >  	tristate "Caching block device access to MTD devices"
> 
> Any comments on this one?

It looks OK to me. I might add a comment above MTD_BLKDEVS like I see in
some other similar Kconfig not-user-selectable options:

#
# MTD block device support is select'ed if needed
#

Brian
