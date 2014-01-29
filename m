Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8Ic5-0003am-KW
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 00:02:42 +0000
Received: by mail-ie0-f177.google.com with SMTP id at1so1364163iec.22
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2014 16:02:20 -0800 (PST)
Date: Tue, 28 Jan 2014 16:02:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 49/73] drivers/mtd: delete non-required instances of
 include <linux/init.h>
Message-ID: <20140129000216.GB8919@ld-irv-0074>
References: <1390339396-3479-1-git-send-email-paul.gortmaker@windriver.com>
 <1390339396-3479-50-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390339396-3479-50-git-send-email-paul.gortmaker@windriver.com>
Cc: linux-arch@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 21, 2014 at 04:22:52PM -0500, Paul Gortmaker wrote:
> None of these files are actually using any __init type directives
> and hence don't need to include <linux/init.h>.  Most are just a
> left over from __devinit and __cpuinit removal, or simply due to
> code getting copied from one driver to the next.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

> diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
> index 8fc06bf..3428034e 100644
> --- a/drivers/mtd/maps/sa1100-flash.c
> +++ b/drivers/mtd/maps/sa1100-flash.c
> @@ -7,7 +7,6 @@
>  #include <linux/types.h>
>  #include <linux/ioport.h>
>  #include <linux/kernel.h>
> -#include <linux/init.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>

This file uses __exit_p(), from <linux/init.h>. So I dropped this hunk
and pushed the rest to l2-mtd.git/next.

Thanks,
Brian
