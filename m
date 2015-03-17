Received: from mail-qg0-f48.google.com ([209.85.192.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXoe2-00021s-Kz
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 10:22:43 +0000
Received: by qgh62 with SMTP id 62so3525546qgh.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2015 03:22:20 -0700 (PDT)
Message-ID: <5507FFBC.6080709@vanguardiasur.com.ar>
Date: Tue, 17 Mar 2015 07:19:40 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Dan Ehrenberg <dehrenberg@chromium.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] UBI: block: Dynamically allocate minor numbers
References: <1426553743-5398-1-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1426553743-5398-1-git-send-email-dehrenberg@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: gwendal@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/16/2015 09:55 PM, Dan Ehrenberg wrote:
> This patch makes ubiblock devices have minor numbers beginning from
> 0, allocated dynamically independently of the ubi device/volume
> number. This property becomes useful because, on 32-bit architectures
> with LFS turned off in a userspace program, device minor numbers
> over 8 bits cause stat to return -EOVERFLOW. If the device number is
> high (>1) due to multiple MTD partitions, such an overflow will occur.
> While enabling LFS is clearly a nicer solution, it's often difficult
> to turn on in practice globally as many widely distributed packages
> don't work with LFS on.
> 
> Other storage systems have their own workarounds, with SCSI making
> multiple device majors and MMC having a config option for the number
> of partitions per device. A completely dynamic minor numbering is
> simpler than these. It is unlikely that anyone is depending on a
> static minor number since the major is dynamic anyway. In addition,
> ubiblock is still relatively new, so now is the time to make such
> changes.
> 
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> 
> ---
> Changes in v2: Removed config option and made dynamic minor universal
> 
>  drivers/mtd/ubi/block.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index db2c05b..6faf268 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -48,6 +48,7 @@
>  #include <linux/blk-mq.h>
>  #include <linux/hdreg.h>
>  #include <linux/scatterlist.h>
> +#include <linux/idr.h>
>  #include <asm/div64.h>
>  
>  #include "ubi-media.h"
> @@ -351,6 +352,18 @@ static struct blk_mq_ops ubiblock_mq_ops = {
>  	.map_queue      = blk_mq_map_queue,
>  };
>  
> +static DEFINE_IDR(ubiblock_minor_idr);
> +
> +static int ubiblock_alloc_minor(struct ubiblock *dev)
> +{
> +	return idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
> +}
> +
> +static void ubiblock_remove_minor(int minor)
> +{
> +	idr_remove(&ubiblock_minor_idr, minor);
> +}
> +

How about just using idr_alloc,remove directly instead of having this
tiny wrappers? They don't seem to add much value.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
