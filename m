Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw12g-0002pa-Lk
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 02:51:23 +0000
Date: Thu, 26 Dec 2013 10:19:39 +0800
From: Huang Shijie <b32955@freescale.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: nand:  assign mtd->name in find_full_id_nand
Message-ID: <20131226021937.GA6752@shlinux2.ap.freescale.net>
References: <C3050A4DBA34F345975765E43127F10F25E47E20@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E47E20@SZXEMA512-MBX.china.huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 01:51:58AM +0000, Caizhiyong wrote:
> From: Cai Zhiyong <caizhiyong@huawei.com>
> Date: Wed, 25 Dec 2013 21:19:21 +0800
> Subject: [PATCH] mtd: nand: assign mtd->name in find_full_id_nand
> 
> This patch assigned the type->name to mtd->name when mtd->name is
> NULL in function "find_full_id_nand".
> mtd->name is NULL may cause some problem.
> 
> Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> ---
>  drivers/mtd/nand/nand_base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9b3bb3c..404e83d 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3327,6 +3327,9 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  		*busw = type->options & NAND_BUSWIDTH_16;
>  
> +		if (!mtd->name)
> +			mtd->name = type->name;
> +
>  		return true;
>  	}
>  	return false;
Acked-by: Huang Shijie <b32955@freescale.com>
