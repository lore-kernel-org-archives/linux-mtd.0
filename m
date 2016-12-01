Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCVUy-0004aV-CY
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 17:50:21 +0000
Received: by mail-pg0-x242.google.com with SMTP id x23so5247805pgx.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 09:49:59 -0800 (PST)
Date: Thu, 1 Dec 2016 09:49:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: tango: Add standard legalese header
Message-ID: <20161201174957.GM77253@google.com>
References: <583FF9D6.9090109@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <583FF9D6.9090109@sigmadesigns.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 11:22:14AM +0100, Marc Gonzalez wrote:
> Provide proper copyright notice and license information.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> I originally didn't provide this information because I thought
> MODULE_AUTHOR defined the copyright holder, and MODULE_LICENSE
> defined the license. (So I figured the header was redundant.)

It may be redundant, but (IANAL) I expect the macros are more
interesting to machines (which can do things like handle GPL vs. non-GPL
symbols, and print out nice 'modinfo') and maybe programmers (who are
often more like machines than lawyers) than to lawyers.

> ---
>  drivers/mtd/nand/tango_nand.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index 7ed35348993e..cc23db64f0ca 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -1,3 +1,11 @@
> +/*
> + * Copyright (C) 2016 Sigma Designs
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + */
> +

Thanks. Applied to l2-mtd.git.

Brian

>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/clk.h>
> -- 
> 2.9.0
