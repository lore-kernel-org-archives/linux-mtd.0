Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eR1Yc-0001Js-Dw
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 19:58:40 +0000
Date: Mon, 18 Dec 2017 20:58:15 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/4 v3] mtd: onenand: samsung: Remove a useless include
Message-ID: <20171218205815.38edd0d2@bbrezillon>
In-Reply-To: <3841b40286522d07585e773fb62c4c737ebf757b.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
 <3841b40286522d07585e773fb62c4c737ebf757b.1513230484.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't know how you generated the patch series, but this one should be
4/4 and not 3/4.

On Thu, 14 Dec 2017 07:03:52 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> This include is not needed, so remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Cross-compiled tested-only
> 
> v3: new patch in the serie
> ---
>  drivers/mtd/onenand/samsung.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index 206aa90140c9..c21d025fee87 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -25,8 +25,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  
> -#include <asm/mach/flash.h>
> -
>  #include "samsung.h"
>  
>  enum soc_type {
