Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcWOx-00015g-Jz
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 07:45:32 +0000
Message-ID: <1368604064.13665.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: add a new field to mtd_info{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 15 May 2013 10:47:44 +0300
In-Reply-To: <1367562104-8955-2-git-send-email-b32955@freescale.com>
References: <1367562104-8955-1-git-send-email-b32955@freescale.com>
 <1367562104-8955-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-05-03 at 14:21 +0800, Huang Shijie wrote:
> In order to implement the NAND boot for some Freescale's chips, such as
> imx23/imx28/imx50/imx6, we use a tool (called kobs-ng) to burn the uboot
> and some metadata to nand chip. And the ROM code will use the metadata to
> configrate the BCH, and to find the uboot.
> 
> The ECC information(ecc step size, ecc strength) which is used to configrate
> the BCH is part of the metadata. The kobs-ng can gets the ecc strength from
> the sys node /sys/*/ecc_strength now. But it can not gets the ecc step size.
> 
> This patch adds a new field to store the ecc step size in mtd_info{}, and
> it makes preparation for the next patches.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  include/linux/mtd/mtd.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 183a304..b93035f 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -173,6 +173,9 @@ struct mtd_info {
>  	/* ECC layout structure pointer - read only! */
>  	struct nand_ecclayout *ecclayout;
>  
> +	/* the ecc step size. */
> +	unsigned int ecc_size;

It would really be nice to harmonize the naming and probably stick to
ecc_step everywhere. To me things looks confusing, because ecc_size is
actually ECC step size, and not the size of ECC codes.

-- 
Best Regards,
Artem Bityutskiy
