Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pu2ao-0001jr-Rp
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2011 12:52:51 +0000
Subject: Re: [PATCH V2 resend] fsmc-nand: Add fsmc_nand_set_plat_data in
	drivers/mtd/nand/fsmc_nand.c
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Viresh Kumar <viresh.kumar@st.com>
In-Reply-To: <8b8879499520ac641f7e38ac0e40182eb7f32f85.1298866118.git.viresh.kumar@st.com>
References: <8b8879499520ac641f7e38ac0e40182eb7f32f85.1298866118.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Feb 2011 14:51:18 +0200
Message-ID: <1298897478.2809.12.camel@localhost>
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

On Mon, 2011-02-28 at 09:39 +0530, Viresh Kumar wrote:
> In most of the cases partitions info, width, etc comes from board files. And
> device structure may be defined in machine files, common to all board files.
> Thus, we need to set platform data from board file, for which
> fsmc_nand_set_plat_data routine is required.

Hi, sorry, but after looking a bit closer I do not see why you need this
function.

Why could not you set up the width, options, and partitions in the
straight in board file, e.g., like arch/arm/mach-omap2/board-igep0030.c
sets partitions for onenand driver? Also, for partitions you can use
command line arguments, like this is done in
drivers/mtd/onenand/generic.c
 
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

Just looks a bit too much to add a function which simply assigns
parameters and then export it. If you'll need to initialize more
parameters later, will you add more arguments there?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
