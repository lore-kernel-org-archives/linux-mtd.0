Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwwyY-0006qb-Qt
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 17:47:31 +0000
Message-ID: <5481EF9B.8070601@broadcom.com>
Date: Fri, 5 Dec 2014 09:47:07 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/3] mtd: nand: added nand_shutdown
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
 <1417746968-28747-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1417746968-28747-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: cdoban@broadcom.com, rjui@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14-12-04 06:36 PM, Brian Norris wrote:
> From: Scott Branden <sbranden@broadcom.com>
>
> Add nand_shutdown to wait for current nand operations to finish and prevent
> further operations by changing the nand flash state to FL_SHUTDOWN.
>
> This is addressing a problem observed during reboot tests using UBIFS
> root file system: NAND erase operations that are in progress during
> system reboot/shutdown are causing partial erased blocks. Although UBI should
> be able to detect and recover from this error, this change will avoid
> the creation of partial erased blocks on reboot in the middle of a NAND erase
> operation.
>
> Signed-off-by: Scott Branden <sbranden@broadcom.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Modified to use the new mtd->_reboot hook
>
> Not tested yet
Tested by: Scott Branden <sbranden@broadcom.com>
>
>   drivers/mtd/nand/nand_base.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 41585dfb206f..382354b5547b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2944,6 +2944,16 @@ static void nand_resume(struct mtd_info *mtd)
>   			__func__);
>   }
>
> +/**
> + * nand_shutdown - [MTD Interface] Finish the current NAND operation and
> + *                 prevent further operations
> + * @mtd: MTD device structure
> + */
> +static void nand_shutdown(struct mtd_info *mtd)
> +{
> +	nand_get_device(mtd, FL_SHUTDOWN);
> +}
> +
>   /* Set default functions */
>   static void nand_set_defaults(struct nand_chip *chip, int busw)
>   {
> @@ -4146,6 +4156,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>   	mtd->_unlock = NULL;
>   	mtd->_suspend = nand_suspend;
>   	mtd->_resume = nand_resume;
> +	mtd->_reboot = nand_shutdown;
>   	mtd->_block_isreserved = nand_block_isreserved;
>   	mtd->_block_isbad = nand_block_isbad;
>   	mtd->_block_markbad = nand_block_markbad;
>
