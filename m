Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMC1w-0002zx-E4
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 06:14:02 +0000
Date: Thu, 11 Oct 2012 08:13:53 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the
 base address
Message-ID: <20121011061353.GH10151@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAMjpGUcRni7ni-FtVAN-pqnuHDK-WeeO6U=480K=1sCDhb7qjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjpGUcRni7ni-FtVAN-pqnuHDK-WeeO6U=480K=1sCDhb7qjQ@mail.gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 11, 2012 at 12:21:59AM -0400, Mike Frysinger wrote:
> On Mon, Oct 8, 2012 at 11:25 AM, Uwe Kleine-König wrote:
> > --- a/drivers/mtd/maps/uclinux.c
> > +++ b/drivers/mtd/maps/uclinux.c
> > @@ -23,12 +23,13 @@
> >
> >  /****************************************************************************/
> >
> > -struct map_info uclinux_ram_map = {
> > -       .name = "RAM",
> > -       .phys = (unsigned long)__bss_stop,
> > +static struct map_info uclinux_ram_map = {
> >         .size = 0,
> >  };
> 
> this change will break Blackfin systems.  i mentioned last time
> someone tried to make this and we talked about adding a comment to
> prevent future breakage, but that seems to not have happened.
yeah, I really think adding a comment would be the right thing as I
don't see what could be the problem here you're talking about.

> i don't think's necessary either for the larger change here.  use the logic:
>     if (physaddr != -1)
>         mapp->phys = physaddr;
> and keep the default initialization.
> -mike
 
Thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
