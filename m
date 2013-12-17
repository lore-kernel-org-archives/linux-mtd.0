Received: from mail-db9lp0251.outbound.messaging.microsoft.com
 ([213.199.154.251] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsm8o-000843-44
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 04:20:19 +0000
Date: Tue, 17 Dec 2013 11:50:33 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131217035031.GE12575@shlinux2.ap.freescale.net>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 15, 2013 at 07:44:21PM +0100, Elie De Brauwer wrote:
> @@ -1057,15 +1082,27 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
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
> +		if (*status == STATUS_ERASED)
> +			if (gpmi_allones(this))
> +				continue;
I think it is better to use "break" here, not "continue".

Since if the gpmi_allones() return true, it means all the ECC chunks are
0xff.

thanks
Huang Shijie.
