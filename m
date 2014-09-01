Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOHfC-0006PV-6I
 for linux-mtd@lists.infradead.org; Mon, 01 Sep 2014 02:48:15 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NB700GVTBRPBM50@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 01 Sep 2014 11:47:49 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'bpqw' <bpqw@micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DB7BE@NTXXIAMBX02.xacn.micron.com>
In-reply-to: <A765B125120D1346A63912DDE6D8B6315DB7BE@NTXXIAMBX02.xacn.micron.com>
Subject: Re: [PATCH 1/1] mtd: cfi_cmdset_0002:add fixup for Micron M29EW after
 erase operation
Date: Mon, 01 Sep 2014 11:47:43 +0900
Message-id: <013d01cfc58f$1e4c0f10$5ae42d30$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'David Woodhouse' <dwmw2@infradead.org>, 'Jingoo Han' <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, 'Paul Gortmaker' <paul.gortmaker@windriver.com>,
 linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
 'Christian Riesch' <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, September 01, 2014 11:21 AM, Bean Huo wrote:
> 
> For Micron M29EW,20ms delay is needed after erase operation.

You already added the reason to cfi_fixup_m29ew_delay_after_erase().
However, please add the comment to this commit message.

> 
> Signed-off-by: BeanHuo <bpqw@micron.com>

BeanHuo/Bean Huo

Others look good.

Best regards,
Jingoo Han

> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 5a4bfe3..9b0de91 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -509,6 +509,16 @@ static void cfi_fixup_m29ew_delay_after_resume(struct cfi_private *cfi)
>  		cfi_udelay(500);
>  }
> 
> +static void cfi_fixup_m29ew_delay_after_erase(struct cfi_private *cfi)
> +{
> +	/*
> +	 * Resolving the Delay After ERASE Issue @low temperature.
> +	 * 20ms delay is needed after erase operation.
> +	 */
> +	if (is_m29ew(cfi))
> +		cfi_udelay(20000);
> +}
> +
>  struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)  {
>  	struct cfi_private *cfi = map->fldrv_priv; @@ -2397,6 +2407,7 @@ static int __xipram
> do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  		ret = -EIO;
>  	}
> 
> +	cfi_fixup_m29ew_delay_after_erase(cfi);
>  	chip->state = FL_READY;
>  	DISABLE_VPP(map);
>  	put_chip(map, chip, adr);
> --
> 1.7.9.5
