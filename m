Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbdSs-0007kO-J9
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 21:38:13 +0000
Received: by mail-oa0-f53.google.com with SMTP id n12so2117261oag.26
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2013 14:37:50 -0700 (PDT)
Date: Wed, 30 Oct 2013 17:37:41 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH -next] mtd: remove duplicated include from mtdcore.c
Message-ID: <20131030213741.GA20059@norris.computersforpeace.net>
References: <CAPgLHd8=fLjqnKEoTB2C+7R=Nz7bdV0D5ttO29em=P8nX-Tvag@mail.gmail.com>
 <20131030095640.GC2453@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131030095640.GC2453@localhost>
Cc: linux-mtd@lists.infradead.org, yongjun_wei@trendmicro.com.cn,
 Wei Yongjun <weiyj.lk@gmail.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 30, 2013 at 06:56:41AM -0300, Ezequiel Garcia wrote:
> On Wed, Oct 30, 2013 at 01:34:22PM +0800, Wei Yongjun wrote:
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > 
> > Remove duplicated include.
> > 
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > ---
> >  drivers/mtd/mtdcore.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 7189089..92311a5 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -37,7 +37,6 @@
> >  #include <linux/backing-dev.h>
> >  #include <linux/gfp.h>
> >  #include <linux/slab.h>
> > -#include <linux/major.h>
> >  
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/partitions.h>
> > 
> > 
> 
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed to l2-mtd.git, thanks Wei! It probably could just be squashed
into the original patch, but I'm not sure it's actually worth the
rebase.

Brian
