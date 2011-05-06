Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIQmZ-0002fo-I8
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 19:33:49 +0000
Received: by wwb39 with SMTP id 39so2803637wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 12:33:45 -0700 (PDT)
Date: Fri, 6 May 2011 20:33:42 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC PATCH 9/9] nand/denali: support MTD partitioning
Message-ID: <20110506193342.GO3997@pulham.picochip.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-10-git-send-email-jamie@jamieiles.com>
	<1304692395.7222.65.camel@localhost>
	<BANLkTi=9u5bH3eoCasxMhO05Qvh0cJxyqQ@mail.gmail.com>
	<1304707397.7222.100.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304707397.7222.100.camel@localhost>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 06, 2011 at 09:43:17PM +0300, Artem Bityutskiy wrote:
> On Fri, 2011-05-06 at 16:18 +0100, Jamie Iles wrote:
> > On 6 May 2011 15:33, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > > On Fri, 2011-05-06 at 15:29 +0100, Jamie Iles wrote:
> > >> If CONFIG_MTD_PARTITION is enabled then take the partitions from the
> > >> platform data.
> > >>
> > >> Cc: David Woodhouse <dwmw2@infradead.org>
> > >> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> > >> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> > >> ---
> > >>  drivers/mtd/nand/denali.c            |    8 ++++++++
> > >>  include/linux/platform_data/denali.h |    6 +++++-
> > >>  2 files changed, 13 insertions(+), 1 deletions(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> > >> index c79009f..ae954de 100644
> > >> --- a/drivers/mtd/nand/denali.c
> > >> +++ b/drivers/mtd/nand/denali.c
> > >> @@ -23,6 +23,7 @@
> > >>  #include <linux/mutex.h>
> > >>  #include <linux/slab.h>
> > >>  #include <linux/mtd/mtd.h>
> > >> +#include <linux/mtd/partitions.h>
> > >>  #include <linux/module.h>
> > >>  #include <linux/platform_data/denali.h>
> > >>
> > >> @@ -1563,7 +1564,14 @@ int denali_init(struct denali_nand_info *denali)
> > >>               goto failed_req_irq;
> > >>       }
> > >>
> > >> +#ifdef CONFIG_MTD_PARTITIONS
> > >> +     if (pdata && pdata->parts) {
> > >> +             ret = add_mtd_partitions(&denali->mtd, pdata->parts,
> > >> +                                      pdata->nr_parts);
> > >> +     } else
> > >> +#endif /* CONFIG_MTD_PARTITIONS */
> > >>       ret = add_mtd_device(&denali->mtd);
> > >> +
> > >
> > > Oops:
> > > http://www.linux-mtd.infradead.org/doc/general.html#L_partitions_ban
> > 
> > Oops indeed. Thanks for pointing that out.  Just for my clarification:
> > making the denali config select MTD_PARTITIONS for this patch then
> > removing the preprocessor garbage and always calling
> > add_mtd_partitions would *not* be ok?
> 
> No :-) That's the whole point of the ban - no one wants to clean up the
> crap and everyone wants to just get patches in ASAP.

OK, I just wanted to make sure that I'd read it properly.

> So I suggest you to separate this patch, and make the rest to go in
> independently, and then solve the partitions issue separately, if you
> have time/will/etc.

Will do.  I will try and have a look at a proper global fix soon too.

> Please, do not remove the mailing list from CC.

Sorry, finger trouble!

Jamie
