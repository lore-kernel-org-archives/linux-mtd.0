Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJpBd-0004Ms-A4
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 20:39:49 +0000
Received: by pabkd10 with SMTP id kd10so56959941pab.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2015 13:39:27 -0700 (PDT)
Date: Mon, 27 Jul 2015 13:39:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: ofpart: do not fail probe when no partitions
 exist
Message-ID: <20150727203924.GQ8876@google.com>
References: <cover.1438028045.git.hramrach@gmail.com>
 <2feb6039b908bbe7daf98c0fc3b7c8f725c36ac3.1438028045.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2feb6039b908bbe7daf98c0fc3b7c8f725c36ac3.1438028045.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 27, 2015 at 08:30:43PM -0000, Michal Suchanek wrote:
...
> The controller-data node contains no partition information and no other
> subnodes with partition information exist.
> 
> The ofpart code returns an error when there are subnodes of the flash DT
> node but no partitions are found. This error is then propagated to
> mtdpart which propagetes it to MTD probe which fails probing the flash
> device.
> 
> Change this condition to a warning so that flash without partitions can
> be accessed on Exynos with ofpart support compiled in.

You never replied to my suggestion here:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/352206.html

Particularly, "just define a proper compatibile property for [the
'controller-data'] subnode, and ofpart.c will naturally handle this".

> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> 
> --
>  - add more verbose explanation
> ---
>  drivers/mtd/ofpart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index aa26c32..a29d29f 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -94,10 +94,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  
>  	if (!i) {
>  		of_node_put(pp);
> -		pr_err("No valid partition found on %s\n", node->full_name);
> +		pr_warn("No valid partition found on %s\n", node->full_name);
>  		kfree(*pparts);
>  		*pparts = NULL;
> -		return -EINVAL;
> +		return 0;

I don't really like this, since it can turn other invalid device trees
into a silent fallback. I'd really prefer we make it easy to tell the
difference between a MTD partition subnode and another foo-bar subnode.

>  	}
>  
>  	return nr_parts;

Brian
