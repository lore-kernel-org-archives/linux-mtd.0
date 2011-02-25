Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psvb0-00035v-9B
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:12:26 +0000
Received: by wyf23 with SMTP id 23so1536356wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 03:12:24 -0800 (PST)
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viresh Kumar <viresh.kumar@st.com>
In-Reply-To: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 13:11:02 +0200
Message-ID: <1298632262.2798.66.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, linus.walleij@stericsson.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-02-23 at 12:19 +0530, Viresh Kumar wrote:
> In most of the cases partitions info, width, etc comes from board files. And
> device structure may be defined in machine files, common to all board files.
> Thus, we need to set platform data from board file, for which
> fsmc_nand_set_plat_data routine is required.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
> ---
>  include/linux/mtd/fsmc.h |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
> index 6987995..0cba324 100644
> --- a/include/linux/mtd/fsmc.h
> +++ b/include/linux/mtd/fsmc.h
> @@ -160,4 +160,21 @@ extern void __init fsmc_init_board_info(struct platform_device *pdev,
>  		struct mtd_partition *partitions, unsigned int nr_partitions,
>  		unsigned int width);
>  
> +/* This function is used to set platform data field of pdev->dev */
> +static inline void fsmc_nand_set_plat_data(struct platform_device *pdev,
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

Isn't this function too big to be an inline func in a header file?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
