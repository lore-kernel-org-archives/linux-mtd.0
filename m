Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0qB1-00016V-Sn
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 06:30:04 +0000
Received: by pwi5 with SMTP id 5so139581pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 23:30:02 -0700 (PDT)
Sender: Grant Likely <glikely@secretlab.ca>
Date: Wed, 29 Sep 2010 15:29:58 +0900
From: Grant Likely <grant.likely@secretlab.ca>
To: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 2/7] of: MTD: Fix OF probing on little-endian systems
Message-ID: <20100929062958.GE2439@angua.secretlab.ca>
References: <1285739538-29058-1-git-send-email-monstr@monstr.eu>
	<1285739538-29058-2-git-send-email-monstr@monstr.eu>
	<1285739538-29058-3-git-send-email-monstr@monstr.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1285739538-29058-3-git-send-email-monstr@monstr.eu>
Cc: microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-mtd@lists.infradead.org, duyl@xilinx.com, linnj@xilinx.com,
	edgar.iglesias@gmail.com, David Woodhouse <dwmw2@infradead.org>,
	john.williams@petalogix.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 29, 2010 at 03:52:13PM +1000, Michal Simek wrote:
> Convert big-endian DTB to little-endian if necessary.
> 
> Signed-off-by: Michal Simek <monstr@monstr.eu>
> CC: David Woodhouse <dwmw2@infradead.org>
> CC: Tejun Heo <tj@kernel.org>
> CC: Grant Likely <grant.likely@secretlab.ca>
> CC: linux-mtd@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> CC: devicetree-discuss@lists.ozlabs.org

Applied, thanks.

g.

> ---
>  drivers/mtd/maps/physmap_of.c |    2 +-
>  drivers/mtd/ofpart.c          |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index fe63f6b..ec3edf6 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -294,7 +294,7 @@ static int __devinit of_flash_probe(struct platform_device *dev,
>  		info->list[i].map.name = dev_name(&dev->dev);
>  		info->list[i].map.phys = res.start;
>  		info->list[i].map.size = res_size;
> -		info->list[i].map.bankwidth = *width;
> +		info->list[i].map.bankwidth = be32_to_cpup(width);
>  
>  		err = -ENOMEM;
>  		info->list[i].map.virt = ioremap(info->list[i].map.phys,
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 8bf7dc6..7bd171e 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -53,8 +53,8 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
>  			continue;
>  		}
>  
> -		(*pparts)[i].offset = reg[0];
> -		(*pparts)[i].size = reg[1];
> +		(*pparts)[i].offset = be32_to_cpu(reg[0]);
> +		(*pparts)[i].size = be32_to_cpu(reg[1]);
>  
>  		partname = of_get_property(pp, "label", &len);
>  		if (!partname)
> -- 
> 1.5.5.1
> 
