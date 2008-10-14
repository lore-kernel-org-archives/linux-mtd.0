Date: Tue, 14 Oct 2008 14:03:45 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC/PATCH 4/8] LPDDR QINFO records definitions
In-Reply-To: <1223979253.6770.765.camel@macbook.infradead.org>
Message-ID: <alpine.LFD.1.10.0810141401220.6452@casper.infradead.org>
References: <alpine.LFD.1.10.0810082227360.13328@casper.infradead.org>
	<1223979253.6770.765.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
> > 
> > --- /dev/null
> > +++ b/include/linux/mtd/qinfo.h
> > @@ -0,0 +1,91 @@
> > +#include <linux/mtd/map.h>
> > +#include <linux/wait.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/delay.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/flashchip.h>
> > +#include <linux/mtd/partitions.h>
> > +
> > +#ifndef __LINUX_MTD_QINFO_H
> > +#define __LINUX_MTD_QINFO_H
> 
> GCC does magic optimisations to avoid looking at include files for a
> second time -- but only if your include guard is around the _whole_
> file, iirc. So it's best to move those #includes down below the 
> #ifndef __LINUX_MTD_QINFO_H
>
Correct, it seems I missed this. Thank you for notice. It will be fixed.

Thanks,
Alexey
