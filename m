Received: from mail-fx0-f48.google.com ([209.85.161.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUMWc-000358-KM
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 16:54:23 +0000
Received: by mail-fx0-f48.google.com with SMTP id 2so2370217fxm.21
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Dec 2010 08:54:22 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: nand: add check for out of page read
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Liu <liu.h.jason@gmail.com>
In-Reply-To: <AANLkTi=zB7UBjkvGYv_wdwZpH1Ghatn6eye1z5616h4X@mail.gmail.com>
References: <1290156045-11719-1-git-send-email-r64343@freescale.com>
	<1292340409.2538.40.camel@localhost>
	<AANLkTi=zB7UBjkvGYv_wdwZpH1Ghatn6eye1z5616h4X@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 18:54:05 +0200
Message-ID: <1292777645.13362.3.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jason Liu <r64343@freescale.com>, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-15 at 09:55 +0800, Jason Liu wrote:
> >        /* Do not allow reads past end of device */
> >        if (unlikely(from >= mtd->size ||
> >                     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
> >                                        (from >> chip->page_shift)) * len)) {
> >                DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read beyond end "
> >                                        "of device\n", __func__);
> >                return -EINVAL;
> >        }
> 
> Here the mtd->size in nand_base.c should be the NAND flash chip size,

I think this is partition size as well.

> while in nand_oobtest,
> 
>               /* Attempt to read off end of device */
>                 ops.mode      = MTD_OOB_AUTO;
>                 ops.len       = 0;
>                 ops.retlen    = 0;
>                 ops.ooblen    = mtd->ecclayout->oobavail;
>                 ops.oobretlen = 0;
>                 ops.ooboffs   = 1;
>                 ops.datbuf    = NULL;
>                 ops.oobbuf    = readbuf;
>                 printk(PRINT_PREF "attempting to read past end of device\n");
>                 printk(PRINT_PREF "an error is expected...\n");
>                 err = mtd->read_oob(mtd, mtd->size - mtd->writesize, &ops);
>                 if (err) {
>                         printk(PRINT_PREF "error occurred as expected\n");
>                         err = 0;
>                 } else {
>                         printk(PRINT_PREF "error: read past end of device\n");
>                         errcnt += 1;
>                 }
>         }
> 
> here, mtd->size is mtd partition size right? when the mtd partition is
> not the last MTD partition, the error will happen.

I think this is the same in both. Try to debug this with printks().

> 
> I have tested on real NAND, while not on nandsim.

Please, try to reproduce this with nandsim as well, and if it works, try
to find out why (using printk debugging)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
