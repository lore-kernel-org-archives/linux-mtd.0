Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LxS0V-00065N-BT
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 20:28:29 +0000
Date: Fri, 24 Apr 2009 22:27:36 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/6] OneNand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090424202736.GI2953@game.jcrosoft.org>
References: <cover.1240384958.git.rubini@gnudd.com>
	<e06507b00cbf2bcb35e80dec547f8ef91c67158b.1240384958.git.rubini@gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e06507b00cbf2bcb35e80dec547f8ef91c67158b.1240384958.git.rubini@gnudd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09:41 Wed 22 Apr     , Alessandro Rubini wrote:
> From: Alessandro Rubini <rubini@unipv.it>
> 
> Add the platform_device and the configuration used to activate
> the OneNand device found on the NHK8815 evaluation kit.
it will be nice to known on which one you boot at runtime
> 
> Signed-off-by: Alessandro Rubini <rubini@unipv.it>
> Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
> ---
> 
> This and one-nand are Cc: to the mtd list, the other patches
> have been sent only to linux-arm-kernel.
> 
> +	},
> +};
> +
> +static struct platform_device nhk8815_onenand_device = {
> +	.name		= "onenand",
> +	.id		= -1,
> +	.dev		= {
> +		.platform_data	= &nhk8815_onenand_data,
> +	},
> +	.resource	= nhk8815_onenand_resource,
> +	.num_resources	= ARRAY_SIZE(nhk8815_onenand_resource),
> +};
> +
> +static void __init nhk8815_onenand_init(void)
> +{
> +#ifdef CONFIG_ONENAND
> +       /* Set up SMCS0 for OneNand */
> +       writel(0x000030db, FSMC_BCR0);
> +       writel(0x02100551, FSMC_BTR0);
same as nand it will be better, more readable and easier to maintain to use macro
to generate these SMCSx config instead hard code value

otherwise looks fine

Best Regards,
J.
