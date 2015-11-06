Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zunp3-0007mm-1M
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 20:41:21 +0000
Date: Fri, 6 Nov 2015 14:40:56 -0600
From: Rob Herring <robh@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH v4] mtd: ofpart: document the lock flag.
Message-ID: <20151106204056.GA6525@rob-hp-laptop>
References: <1446237240-10695-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446237240-10695-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 30, 2015 at 01:34:00PM -0700, Brian Norris wrote:
> From: Michal Suchanek <hramrach@gmail.com>
> 
> The lock flag of ofpart is undocumented. Add to binding doc.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> It seems my reasoning here [1] was wrong (thanks Sascha!). This is a rewrite of
> Michal's binding doc from [2].
> 
> Note that this property is still broken for the CONFIG_MTD_PARTITIONED_MASTER=y
> case.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062822.html
> [2] http://lists.infradead.org/pipermail/linux-mtd/2015-August/061155.html
> 
>  Documentation/devicetree/bindings/mtd/partition.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 8e5557da1955..a7d4d35550e3 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -23,6 +23,8 @@ Optional properties:
>    partition should only be mounted read-only. This is usually used for flash
>    partitions containing early-boot firmware images or data which should not be
>    clobbered.
> +- lock : Do not unlock the partition at initialization time (not supported on
> +  all devices)
>  
>  Examples:
>  
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
