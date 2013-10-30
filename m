Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbSWK-00047i-Tw
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 09:57:04 +0000
Date: Wed, 30 Oct 2013 06:56:41 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH -next] mtd: remove duplicated include from mtdcore.c
Message-ID: <20131030095640.GC2453@localhost>
References: <CAPgLHd8=fLjqnKEoTB2C+7R=Nz7bdV0D5ttO29em=P8nX-Tvag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPgLHd8=fLjqnKEoTB2C+7R=Nz7bdV0D5ttO29em=P8nX-Tvag@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, yongjun_wei@trendmicro.com.cn,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 30, 2013 at 01:34:22PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Remove duplicated include.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/mtd/mtdcore.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 7189089..92311a5 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -37,7 +37,6 @@
>  #include <linux/backing-dev.h>
>  #include <linux/gfp.h>
>  #include <linux/slab.h>
> -#include <linux/major.h>
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> 
> 

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Ooops.. sorry about that. This was introduced by me in this one:

commit 40d1b2e461f28c4add582ef7ca8ed9f16f6b5add
Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date:   Sun Oct 13 18:05:23 2013 -0300

mtd: Move major number definitions to major.h
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
