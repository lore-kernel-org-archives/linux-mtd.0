Received: from mga14.intel.com ([143.182.124.37])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5zV0-0007NZ-Dp
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:04:47 +0000
Message-ID: <1331298422.29445.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Fri, 09 Mar 2012 15:07:02 +0200
In-Reply-To: <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Armando Visconti <armando.visconti@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org, linux-mtd@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@st.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-03-07 at 17:00 +0530, Vipin Kumar wrote:
> +static struct mtd_partition partition_info_64KB_blk[] = {
> +	{
> +		.name = "X-loader",
> +		.offset = 0,
> +		.size = 4*0x10000,
> +	},
> +	{
> +		.name = "U-Boot",
> +		.offset = 4*0x10000,
> +		.size = 8*0x40000,
> +	},
> +	{
> +		.name = "Kernel",
> +		.offset = (4+8)*0x10000,
> +		.size = 64*0x40000,
> +	},
> +	{
> +		.name = "Root File System",
> +		.offset = (4+8+64)*0x10000,
> +		.size = MTDPART_SIZ_FULL,
> +	},
> +};

Shouldn't this kind of data come from DT/platform data or cmdline
instead? Does it make sense to have it hard-coded in the driver?

-- 
Best Regards,
Artem Bityutskiy
