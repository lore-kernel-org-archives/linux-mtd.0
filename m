Date: Wed, 12 Oct 2016 11:01:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org,
 krzk@kernel.org, javier@osg.samsung.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: s3c2410: parse the device configuration from
 OF node
Message-ID: <20161012110105.49830f86@bbrezillon>
In-Reply-To: <1475711217-974-4-git-send-email-sergio.prado@e-labworks.com>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
 <1475711217-974-4-git-send-email-sergio.prado@e-labworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergio,

On Wed,  5 Oct 2016 20:46:57 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Allows configuring Samsung's s3c2410 memory controller using a
> devicetree.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  drivers/mtd/nand/s3c2410.c                     | 171 ++++++++++++++++++++++---
>  include/linux/platform_data/mtd-nand-s3c2410.h |   1 +
>  2 files changed, 156 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 174ac9dc4265..352cf2656bc8 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c

[...]

> +
> +static int s3c2410_nand_init_timings(struct s3c2410_nand_info *info,
> +				     struct nand_chip *chip)
> +{
> +	struct s3c2410_platform_nand *pdata = info->platform;
> +	const struct nand_sdr_timings *t;
> +	int tacls, mode;
> +
> +	mode = onfi_get_async_timing_mode(chip);
> +	if (mode == ONFI_TIMING_MODE_UNKNOWN)
> +		mode = chip->onfi_timing_mode_default;
> +
> +	t = onfi_async_timing_mode_to_sdr_timings(mode);
> +	if (IS_ERR(t))
> +		return PTR_ERR(t);

We recently introduced an method to automate timing selection and
configuration [1]. Can you switch to this approach (the changes are in
the nand/next branch [2] and should appear in 4.9-rc1)?

Thanks,

Boris

[1]https://www.spinics.net/lists/arm-kernel/msg532007.html 
[2]https://github.com/linux-nand/linux/tree/nand/next
