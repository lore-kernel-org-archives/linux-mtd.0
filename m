Received: from gate.crashing.org ([63.228.1.57])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUZbC-0002Vr-DA
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 04:42:57 +0000
Subject: Re: [PATCH v2] Check name property to determine partition nodes.
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Benjamin Krill <ben@codiert.org>
In-Reply-To: <20090123161805.GA2598@codiert.org>
References: <20090123161805.GA2598@codiert.org>
Content-Type: text/plain
Date: Wed, 04 Feb 2009 15:09:02 +1100
Message-Id: <1233720542.16867.187.camel@pasglop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, vwool@ru.mvista.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, dwg@au1.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-01-23 at 17:18 +0100, Benjamin Krill wrote:
> SLOF has a further node which could not be evaluate
> by the current routine. The current routine returns
> because the node hasn't the required reg property. As
> fix this patch adds a check to determine the partition
> child nodes. If the node is not an partition the number
> of total partitions will be decreased and loop continue
> with the next nodes.

Somebody on the MTD list is taking that ? David ? Or should I merge it
via powerpc ?

Cheers,
Ben.

> Signed-off-by: Benjamin Krill <ben@codiert.org>
> ---
>  drivers/mtd/ofpart.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 9e45b3f..3e164f0 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -46,6 +46,13 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
>  		const u32 *reg;
>  		int len;
>  
> +		/* check if this is a partition node */
> +		partname = of_get_property(pp, "name", &len);
> +		if (strcmp(partname, "partition") != 0) {
> +			nr_parts--;
> +			continue;
> +		}
> +
>  		reg = of_get_property(pp, "reg", &len);
>  		if (!reg || (len != 2 * sizeof(u32))) {
>  			of_node_put(pp);
