Received: from moutng.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THXHP-0004JG-1E
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2012 09:54:46 +0000
Date: Fri, 28 Sep 2012 11:54:37 +0200 (CEST)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH v2 1/2] mtd: sh_flctl: Setup and release DMA channels
In-Reply-To: <CABYn4sw6uXtA7V-goLGv3H7AZ1zbWLAHZqGd+5w9eB_e8yua9w@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1209281152130.5428@axis700.grange>
References: <1348478315-10789-1-git-send-email-hechtb@gmail.com>
 <Pine.LNX.4.64.1209271656020.7862@axis700.grange>
 <CABYn4sw6uXtA7V-goLGv3H7AZ1zbWLAHZqGd+5w9eB_e8yua9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Vikram Narayanan <vikram186@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 28 Sep 2012, Bastian Hecht wrote:

[snip]

> >> diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
> >> index 01e4b15..20d3f48 100644
> >> --- a/include/linux/mtd/sh_flctl.h
> >> +++ b/include/linux/mtd/sh_flctl.h
> >> @@ -20,10 +20,12 @@
> >>  #ifndef __SH_FLCTL_H__
> >>  #define __SH_FLCTL_H__
> >>
> >> +#include <linux/dmaengine.h>
> >>  #include <linux/mtd/mtd.h>
> >>  #include <linux/mtd/nand.h>
> >>  #include <linux/mtd/partitions.h>
> >>  #include <linux/pm_qos.h>
> >> +#include <linux/sh_dma.h>
> >
> > Here headers aren't actually needed - you can just forward-declare "struct
> > dma_chan." OTOH, what _is_ indeed needed is <linux/completion.h>.
> 
> Oh yes, I'll add <linux/completion.h>.
> About the forward declration: Do I really need it? We use a struct
> pointer and I am unsure if the compiler just needs to know the name
> and nothing more. I've tested it and included sh_flctl.h (without any
> DMA headers) in some driver that has no idea about DMA.
> gcc didn't complain.

I'm not sure about this, I think, sometimes there might be cases, when gcc 
doesn't complain. Or (more likely) the header is pulled in via another 
one, or some other header has this forward-declaration. But in any case I 
wouldn't rely on either of those and declare what's needed explicitly.

> Adding a non-pointer member
> + struct sh_dma test;
> lead to an error, so struct sh_dma is really unknown.

Of course, the compiler has to know the size of the struct to allocate 
space for it:-)

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
