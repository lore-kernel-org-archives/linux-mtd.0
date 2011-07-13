Message-ID: <4E1D7A1E.1020802@mvista.com>
Date: Wed, 13 Jul 2011 14:57:34 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Lei Wen <leiwen@marvell.com>
Subject: Re: [PATCH V7 2/4] MTD: pxa3xx_nand: convert all printk into dev_*
References: <1310466535-15287-1-git-send-email-leiwen@marvell.com>
	<1310481336-13230-3-git-send-email-leiwen@marvell.com>
In-Reply-To: <1310481336-13230-3-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Yu Tang <ytang5@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 12-07-2011 18:35, Lei Wen wrote:

> Signed-off-by: Lei Wen<leiwen@marvell.com>
> ---
>   drivers/mtd/nand/pxa3xx_nand.c |   27 ++++++++++++++++-----------
>   1 files changed, 16 insertions(+), 11 deletions(-)

> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 1efecf7..afe14bd 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
[...]
> @@ -774,11 +774,15 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
>   	struct pxa3xx_nand_platform_data *pdata = pdev->dev.platform_data;
>   	uint32_t ndcr = 0x0; /* enable all interrupts */
>
> -	if (f->page_size != 2048 && f->page_size != 512)
> +	if (f->page_size != 2048 && f->page_size != 512) {
> +		dev_err(&pdev->dev, "Current only support 2048 and 512 size\n");
>   		return -EINVAL;
> +	}
>
> -	if (f->flash_width != 16 && f->flash_width != 8)
> +	if (f->flash_width != 16 && f->flash_width != 8) {
> +		dev_err(&pdev->dev, "Only support 8bit and 16 bit!\n");

    So this patch not only converts printk() to dev_*() calls, it also adds 
some dev_err() calls? This should have been mentioned in the change long at 
least...

>   		return -EINVAL;
> +	}
>
>   	/* calculate flash information */
>   	info->cmdset =&default_cmdset;
> @@ -898,7 +902,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>   	if (!ret) {
>   		kfree(mtd);
>   		info->mtd = NULL;
> -		printk(KERN_INFO "There is no nand chip on cs 0!\n");
> +		dev_info(&info->pdev->dev, "There is no nand chip on cs 0!\n");
>
>   		return -EINVAL;
>   	}
> @@ -906,11 +910,12 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>   	chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
>   	id = *((uint16_t *)(info->data_buff));
>   	if (id != 0)
> -		printk(KERN_INFO "Detect a flash id %x\n", id);
> +		dev_info(&info->pdev->dev, "Detect a flash id %x\n", id);
>   	else {
>   		kfree(mtd);
>   		info->mtd = NULL;
> -		printk(KERN_WARNING "Read out ID 0, potential timing set wrong!!\n");
> +		dev_warn(&info->pdev->dev, "Read out ID 0, "
> +				"potential timing set wrong!!\n");

    Don't break the string -- this prevents grepping for it.

WBR, Sergei
