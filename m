Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PswaH-0003Tk-OW
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 12:15:46 +0000
Subject: Re: [PATCH V2] fsmc-nand: Add fsmc_nand_set_plat_data in
	linux/mtd/fsmc.h
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Viresh Kumar <viresh.kumar@st.com>
In-Reply-To: <954e52aaae5014c2d72ac76f603f288186d67fa1.1298634044.git.viresh.kumar@st.com>
References: <954e52aaae5014c2d72ac76f603f288186d67fa1.1298634044.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 14:14:19 +0200
Message-ID: <1298636059.2798.98.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, linus.walleij@stericsson.com
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 17:22 +0530, Viresh Kumar wrote:
> +/* This function is used to set platform data field of pdev->dev */
> +void fsmc_nand_set_plat_data(struct platform_device *pdev,
> +		struct mtd_partition *partitions, unsigned int nr_partitions,
> +		unsigned int options, unsigned int width)
> +{
> +	struct fsmc_nand_platform_data *plat_data;
> +	plat_data = dev_get_platdata(&pdev->dev);
> +
> +	if (partitions) {
> +		plat_data->partitions = partitions;
> +		plat_data->nr_partitions = nr_partitions;
> +	}
> +
> +	plat_data->options = options;
> +	plat_data->width = width;
> +}
> +EXPORT_SYMBOL_GPL(fsmc_nand_set_plat_data);
> +
>  /* Assert CS signal based on chipnr */
>  static void fsmc_select_chip(struct mtd_info *mtd, int chipnr)
>  {
> diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
> index 6987995..29e039b 100644
> --- a/include/linux/mtd/fsmc.h
> +++ b/include/linux/mtd/fsmc.h
> @@ -160,4 +160,9 @@ extern void __init fsmc_init_board_info(struct platform_device *pdev,
>  		struct mtd_partition *partitions, unsigned int nr_partitions,
>  		unsigned int width);
>  
> +/* This function is used to set platform data field of pdev->dev */

Sorry for nit-picking, but having 2 copies of the same comment is prone
to inconsistency :-) I think the general linux way is to put the comment
above the function body and leave the prototype declarations without any
comments.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
