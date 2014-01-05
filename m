Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzvqT-0003Ac-Qe
 for linux-mtd@lists.infradead.org; Sun, 05 Jan 2014 22:06:58 +0000
Received: by mail-pa0-f53.google.com with SMTP id hz1so17704768pad.26
 for <linux-mtd@lists.infradead.org>; Sun, 05 Jan 2014 14:06:34 -0800 (PST)
Date: Sun, 5 Jan 2014 14:06:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH] mtd: Hide CONFIG_MTD_BLKDEVS from the menu
Message-ID: <20140105220626.GA25372@norris-Latitude-E6410>
References: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140105084547.GA2929@brian-ubuntu>
 <20140105173756.GA13922@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140105173756.GA13922@localhost>
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

On Sun, Jan 05, 2014 at 02:37:57PM -0300, Ezequiel Garcia wrote:
> On Sun, Jan 05, 2014 at 12:46:10AM -0800, Brian Norris wrote:
> > 
> > Hmm, I'm seeing some issues with this patch. I think it's problematic
> > that you are changing MTD_BLKDEVS from tristate to bool. We can't have
> [..]
> > 
> > I believe the correct solution would be the following additional diff:
> > 
> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index cdaa4e512c97..5ebcda39f554 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -161,7 +161,7 @@ comment "User Modules And Translation Layers"
> >  # MTD block device support is select'ed if needed
> >  #
> >  config MTD_BLKDEVS
> > -	bool
> > +	tristate
> >  
> >  config MTD_BLOCK
> >  	tristate "Caching block device access to MTD devices"
> > --
> > 
> > I'll squash this into your patch if I don't hear any objections.
> > 
> 
> The solution looks fine. Thanks for taking care of it.

OK, squahsed and pushed to l2-mtd.git.

Brian
