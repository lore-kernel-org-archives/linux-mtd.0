Received: from mail-db9lp0252.outbound.messaging.microsoft.com
 ([213.199.154.252] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0Mhs-0004ba-Rd
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 02:47:53 +0000
Date: Tue, 7 Jan 2014 10:13:38 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v7] mtd: gpmi: Deal with bitflips in erased regions
Message-ID: <20140107021336.GA8109@shlinux2.ap.freescale.net>
References: <1388784439-23004-1-git-send-email-eliedebrauwer@gmail.com>
 <1388784439-23004-2-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1388784439-23004-2-git-send-email-eliedebrauwer@gmail.com>
Cc: shijie8@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 10:27:19PM +0100, Elie De Brauwer wrote:
> 
> @@ -1003,15 +1028,27 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
>  
>  	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> -		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
> +		if (*status == STATUS_GOOD)
>  			continue;
>  
>  		if (*status == STATUS_UNCORRECTABLE) {
>  			mtd->ecc_stats.failed++;
>  			continue;
>  		}
> -		mtd->ecc_stats.corrected += *status;
> -		max_bitflips = max_t(unsigned int, max_bitflips, *status);
> +
> +		/* 

Hi Brian:
  Please do not forget to remove the whitespace at the end of the above line
  when you merge this patch.

thanks
Huang Shijie


> +		 * The number of bitflips are either counted in software
> +		 * in case of an erased chunk or otherwise reported by
> +		 * the BCH block.
> +		 */
> +		if (*status == STATUS_ERASED)
> +			flips = erased_sector_bitflips(payload_virt, i,
> +							       nfc_geo);
> +		else
> +			flips = *status;
> +
