Received: from mail.visioncatalog.com ([217.6.246.34] helo=root.phytec.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QAjBD-0007BI-8d
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 13:35:27 +0000
Subject: Re: [PATCH] ARM: omap2: mtd split nand_scan in ident and tail
From: Jan Weitzel <J.Weitzel@phytec.de>
To: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <1302772529-15641-1-git-send-email-j.weitzel@phytec.de>
References: <1302772529-15641-1-git-send-email-j.weitzel@phytec.de>
Date: Fri, 15 Apr 2011 15:34:56 +0200
Message-ID: <1302874496.7246.11.camel@lws-weitzel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
Cc: Artem.Bityutskiy@nokia.com, tony@atomide.com, s.hauer@pengutronix.de,
	s-ghorai@ti.com, vimalsingh@ti.com, dwmw2@infradead.org
Reply-To: J.Weitzel@phytec.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, den 14.04.2011, 11:15 +0200 schrieb Jan Weitzel:
> nand_scan calls nand_scan_ident and nand_scan_tail, setting values like oobvail
> according to ecc.layout. If we change the layout afterwards values are wrong.
> 
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
> ---
>  drivers/mtd/nand/omap2.c |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index da9a351..288423f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1073,9 +1073,9 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
>  	/* DIP switches on some boards change between 8 and 16 bit
>  	 * bus widths for flash.  Try the other width if the first try fails.
>  	 */
> -	if (nand_scan(&info->mtd, 1)) {
> +	if (nand_scan_ident(&info->mtd, 1, NULL)) {
>  		info->nand.options ^= NAND_BUSWIDTH_16;
> -		if (nand_scan(&info->mtd, 1)) {
> +		if (nand_scan_ident(&info->mtd, 1, NULL)) {
>  			err = -ENXIO;
>  			goto out_release_mem_region;
>  		}
> @@ -1101,6 +1101,12 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
>  		info->nand.ecc.layout = &omap_oobinfo;
>  	}
>  
> +	/* second phase scan */
> +	if (nand_scan_tail(&info->mtd)) {
> +		err = -ENXIO;
> +		goto out_release_mem_region;
> +	}
> +
>  #ifdef CONFIG_MTD_PARTITIONS
>  	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
>  	if (err > 0)

So no comments? Is any rework needed? Without this patch I am not able
to mount partions with OMAP_ECC_HAMMING_CODE_HW_ROMCODE. 
Regards, Jan
