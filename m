Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMlhU-0007Ow-Ix
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 19:47:01 +0000
Message-ID: <4F9702E8.2070106@freescale.com>
Date: Tue, 24 Apr 2012 14:45:44 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 5/7] mtd: nand: read_page() returns max_bitflips
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-6-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335295105-7981-6-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Nick Spence <nick.spence@freescale.com>, linux-mtd@lists.infradead.org,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Jamie Iles <jamie@jamieiles.com>,
 Axel Lin <axel.lin@gmail.com>, Roy Zang <tie-fei.zang@freescale.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/24/2012 02:18 PM, Mike Dunn wrote:
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 872cc96..df36037 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -63,6 +63,7 @@ struct fsl_ifc_nand_ctrl {
>  	unsigned int oob;	/* Non zero if operating on OOB data	*/
>  	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
>  	unsigned int counter;	/* counter for the initializations	*/
> +	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
>  };
>  
>  static struct fsl_ifc_nand_ctrl *ifc_nand_ctrl;
> @@ -268,6 +269,8 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  		int sector = bufnum * chip->ecc.steps;
>  		int sector_end = sector + chip->ecc.steps - 1;
>  
> +		nctrl->max_bitflips = 0;
> +
>  		for (i = sector / 4; i <= sector_end / 4; i++)
>  			eccstat[i] = in_be32(&ifc->ifc_nand.nand_eccstat[i]);
>  

I'd prefer to clear max_bitflips before this if-block, so that we can
rely on max_bitflips being zero when ECC wasn't requested.

Otherwise ACK the eLBC and IFC changes.

-Scott
