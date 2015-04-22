Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkynT-00040B-MQ
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 17:50:52 +0000
Received: by pabsx10 with SMTP id sx10so279204141pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2015 10:50:29 -0700 (PDT)
Date: Wed, 22 Apr 2015 10:50:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?=
 <peterpandong@micron.com>
Subject: Re: [PATCH 1/6] mtd: nand_bbt: drop unnecessary header
Message-ID: <20150422175021.GW32500@ld-irv-0074>
References: <87F60714EC601C4C83DFF1D2E3D390A02728254F@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A02728254F@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "zajec5@gmail.com" <zajec5@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2015 at 02:09:41AM +0000, Peter Pan 潘栋 (peterpandong) wrote:
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>

Why are you just resending my patches? You could Ack/Reviewed-by/etc.
instead...

http://patchwork.ozlabs.org/patch/444604/

> ---
>  drivers/mtd/nand/nand_bbt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 9bb8453..307a285 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -64,7 +64,6 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/bbm.h>
>  #include <linux/mtd/nand.h>
> -#include <linux/mtd/nand_ecc.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/vmalloc.h>
> -- 
> 1.9.1
