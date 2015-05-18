Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuTqr-0006sn-A6
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 22:49:38 +0000
Received: by pabts4 with SMTP id ts4so170107008pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 15:49:15 -0700 (PDT)
Date: Mon, 18 May 2015 15:49:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: part: add generic parsing of linux,part-probe
Message-ID: <20150518224910.GU11598@ld-irv-0074>
References: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431884112-28236-1-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, jogo@openwrt.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 17, 2015 at 07:35:12PM +0200, Hauke Mehrtens wrote:
> This moves the linux,part-probe device tree parsing code from
> physmap_of.c to mtdpart.c. Now all drivers can use this feature by just
> providing a reference to they device tree node in struct

s/they/their/
or
s/they/the/
?

> mtd_part_parser_data.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/maps/physmap_of.c | 40 +---------------------------------------
>  drivers/mtd/mtdpart.c         | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 774b32f..fd3750f 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -112,45 +112,9 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
>  static const char * const part_probe_types_def[] = {
>  	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
>  
> -static const char * const *of_get_probes(struct device_node *dp)
> -{
> -	const char *cp;
> -	int cplen;
> -	unsigned int l;
> -	unsigned int count;
> -	const char **res;
> -
> -	cp = of_get_property(dp, "linux,part-probe", &cplen);
> -	if (cp == NULL)
> -		return part_probe_types_def;
> -
> -	count = 0;
> -	for (l = 0; l != cplen; l++)
> -		if (cp[l] == 0)
> -			count++;
> -
> -	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
> -	count = 0;
> -	while (cplen > 0) {
> -		res[count] = cp;
> -		l = strlen(cp) + 1;
> -		cp += l;
> -		cplen -= l;
> -		count++;
> -	}
> -	return res;
> -}
> -
> -static void of_free_probes(const char * const *probes)
> -{
> -	if (probes != part_probe_types_def)
> -		kfree(probes);
> -}

Huh. I didn't even notice this code existed. Like you, I've wondered if
we could have a better way to suggest the partition parser types without
out specifying them in each driver. That seems like the wrong level of
abstraction.

Ideally, we'd just be able to have a standard set that satisfies all
users, like how all loaded block device partitioners are all checked for
each block device (check_part[] in block/partitions/check.c). The only
problem I can think of would be if some parsers have subtleties such
that they can't safely be applied to all MTDs, even with careful
prioritization.

But if that doesn't work, then I suppose a device-tree property like
this could work.

> -
>  static const struct of_device_id of_flash_match[];
>  static int of_flash_probe(struct platform_device *dev)
>  {
> -	const char * const *part_probe_types;
>  	const struct of_device_id *match;
>  	struct device_node *dp = dev->dev.of_node;
>  	struct resource res;
> @@ -310,10 +274,8 @@ static int of_flash_probe(struct platform_device *dev)
>  		goto err_out;
>  
>  	ppdata.of_node = dp;
> -	part_probe_types = of_get_probes(dp);
> -	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
> +	mtd_device_parse_register(info->cmtd, part_probe_types_def, &ppdata,
>  			NULL, 0);
> -	of_free_probes(part_probe_types);
>  
>  	kfree(mtd_list);
>  
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index cafdb88..b3059d6 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -29,6 +29,7 @@
>  #include <linux/kmod.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/of.h>
>  #include <linux/err.h>
>  #include <linux/kconfig.h>
>  
> @@ -718,6 +719,35 @@ void deregister_mtd_parser(struct mtd_part_parser *p)
>  }
>  EXPORT_SYMBOL_GPL(deregister_mtd_parser);
>  
> +static const char * const *of_get_probes(struct device_node *dp)

Maybe a quick comment at the top to note that if non-NULL, its return
value must be kfree()'d by the caller? Could be helpful if we want to
move the code elsewhere. (I'm almost tempted to suggest moving this to
drivers/of/of_mtd.c, in fact.)

> +{
> +	const char *cp;
> +	int cplen;
> +	unsigned int l;
> +	unsigned int count;
> +	const char **res;
> +
> +	cp = of_get_property(dp, "linux,part-probe", &cplen);

I see this is not property is not documented in the first place. If
we're going to make it generically useful, we definitely need to
document it, including what the supported partition probe names are.

I'm also kind of ambivalent on this point, but I might as well ask: does
the 'linux,...' naming make sense? We're not really supposed to be
putting pure software information in the device tree, let alone info
that's specific to Linux. I see how the partition parser could be (and
should be, really) considered OS-agnostic, though, and might deserve a
spot in the DT, at least if it's not safe to run arbitrary partition
parsers on all MTDs.

> +	if (cp == NULL)
> +		return NULL;
> +
> +	count = 0;
> +	for (l = 0; l != cplen; l++)
> +		if (cp[l] == 0)
> +			count++;
> +
> +	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);

Might as well fix the spacing here while you're moving the code around.

> +	count = 0;
> +	while (cplen > 0) {
> +		res[count] = cp;
> +		l = strlen(cp) + 1;
> +		cp += l;
> +		cplen -= l;
> +		count++;
> +	}
> +	return res;
> +}
> +
>  /*
>   * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
>   * are changing this array!
> @@ -754,6 +784,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  {
>  	struct mtd_part_parser *parser;
>  	int ret = 0;
> +	const char *const *types_of = NULL;
> +
> +	if (data && data->of_node) {
> +		types_of = of_get_probes(data->of_node);
> +		if (types_of != NULL)
> +			types = types_of;
> +	}

I'm not sure I really like the semantics here. This means that the
device tree can override all Linux defaults. So we can't, for instance,
have the cmdline parser override all other selections (e.g., for
debugging), or make sure that 'ofpart' is available for all MTDs.

>  
>  	if (!types)
>  		types = default_mtd_part_types;

In fact, I don't really like this existing hunk either ^^^. It has the
same effect, of killing things like cmdlinepart, which should be
available on all MTDs.

> @@ -772,6 +809,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  			break;
>  		}
>  	}
> +	kfree(types_of);
>  	return ret;
>  }
>  

Brian
