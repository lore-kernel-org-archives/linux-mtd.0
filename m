Date: Wed, 24 Aug 2011 12:08:26 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Jason Liu <jason.hui@linaro.org>
Subject: Re: [PATCH] mtd: check parts pointer before using it
Message-ID: <20110824110826.GD23757@pulham.picochip.com>
References: <1314183181-4197-1-git-send-email-jason.hui@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1314183181-4197-1-git-send-email-jason.hui@linaro.org>
Cc: David.Woodhouse@intel.com, patches@linaro.org, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jason,

On Wed, Aug 24, 2011 at 06:53:01PM +0800, Jason Liu wrote:
> The code has the check for parts but it called after kmemdup,
> kmemdup(parts, sizeof(*parts) * nr_parts,...)
> if (!parts)
> 	return -ENOMEM
> 
> In fact, we need check parts before safely using it.
> 
> Signed-off-by: Jason Liu <jason.hui@linaro.org>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>
> 
> ---
> This patch is based on git://git.infradead.org/users/dedekind/l2-mtd-2.6.git
> ---
>  drivers/mtd/mtdcore.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 09bdbac..ce59ff5 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -465,12 +465,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
>  	struct mtd_partition *real_parts;
>  
>  	err = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
> -	if (err <= 0 && nr_parts) {
> +	if (err <= 0 && nr_parts && !parts) {

I don't think this is right.  Don't we want to check that parts is != 
NULL?  So

	if (err <= 0 && nr_parts && parts)

instead?  We don't want to kmemdup() NULL.

>  		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
>  				     GFP_KERNEL);
>  		err = nr_parts;
> -		if (!parts)
> -			err = -ENOMEM;

I think this hunk should be changed to:

		if (!real_parts)
			err = -ENOMEM;

and keep the check so that we're checking kmemdup()'s allocation is 
successful.

Jamie
