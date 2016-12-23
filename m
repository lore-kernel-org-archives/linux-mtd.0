Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKMgu-0004ul-5N
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 10:03:09 +0000
Received: by mail-wm0-x242.google.com with SMTP id u144so40631916wmu.0
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2016 02:02:46 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: xway: fix build failure
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1482481032-28043-1-git-send-email-sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c077e285-65e5-f66d-246c-aa58bd88f110@gmail.com>
Date: Fri, 23 Dec 2016 10:07:23 +0100
MIME-Version: 1.0
In-Reply-To: <1482481032-28043-1-git-send-email-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/23/2016 09:17 AM, Sudip Mukherjee wrote:
> The build of mips xway_defconfig was failing with the error:
> 
> drivers/mtd/nand/xway_nand.c:235:1: warning:
> 	data definition has no type or storage class
>  MODULE_DEVICE_TABLE(of, xway_nand_match);
>  ^~~~~~~~~~~~~~~~~~~
> drivers/mtd/nand/xway_nand.c:235:1: error:
> 	type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'
> 		[-Werror=implicit-int]
> 
> It missed to include the header file.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

Acked-by: Marek Vasut <marex@denx.de>

> ---
> 
> Build log of next-20161223 is at:
> https://travis-ci.org/sudipm-mukherjee/parport/jobs/186246753
> 
> This error will be fixed but it will now uncover the next error as the
> build goes on.
> 
>  drivers/mtd/nand/xway_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 1f2948c..00168d6 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -7,6 +7,7 @@
>   *  Copyright © 2016 Hauke Mehrtens <hauke@hauke-m.de>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_platform.h>
> 


-- 
Best regards,
Marek Vasut
