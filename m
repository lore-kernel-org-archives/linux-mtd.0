Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9VVK-0002b9-3M
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 08:32:58 +0000
Date: Tue, 22 Jul 2014 10:32:24 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: add ONFI timing mode to nand_timings
 converter
Message-ID: <20140722103224.68841929@bbrezillon>
In-Reply-To: <20140722023947.GZ7537@ld-irv-0074>
References: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
 <1405064982-11456-3-git-send-email-boris.brezillon@free-electrons.com>
 <20140722023947.GZ7537@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 21 Jul 2014 19:39:47 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Fri, Jul 11, 2014 at 09:49:42AM +0200, Boris BREZILLON wrote:
> > --- /dev/null
> > +++ b/drivers/mtd/nand/nand_timings.c
> > @@ -0,0 +1,250 @@
> > +/*
> > + *  Copyright (C) 2014 Free Electrons
> > + *
> > + *  Author: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + */
> > +#include <linux/mtd/nand.h>
> [...]
> > +/**
> > + * onfi_async_timing_mode_to_sdr_timings - [NAND Interface] Retrieve NAND
> > + * timings according to the given ONFI timing mode
> > + * @mode: ONFI timing mode
> > + */
> > +const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode)
> > +{
> > +	if (mode < 0 || mode >= ARRAY_SIZE(onfi_sdr_timings))
> 
> Might need <linux/kernel.h> for this.
> 
> > +		return ERR_PTR(-EINVAL);
> 
> And <linux/err.h> for this.
> 
> > +
> > +	return &onfi_sdr_timings[mode];
> > +}
> > +EXPORT_SYMBOL(onfi_async_timing_mode_to_sdr_timings);
> 
> <linux/export.h> for this.

Thanks for fixing these issues (I tend to rely on other inclusions when
the compiler does not yell at me :-))

Best Regards,

Boris



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
