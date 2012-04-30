Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOtgw-0000R6-Vq
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 16:43:15 +0000
Message-ID: <4F9EC11A.7020201@freescale.com>
Date: Mon, 30 Apr 2012 11:43:06 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 07/10] mtd: IFC NAND: utilize oob_required parameter
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-8-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Li Yang <leoli@freescale.com>,
 linux-mtd@lists.infradead.org, Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/27/2012 08:29 PM, Brian Norris wrote:
> @@ -717,7 +718,8 @@ static void fsl_ifc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			       const uint8_t *buf, int oob_required)
>  {
>  	fsl_ifc_write_buf(mtd, buf, mtd->writesize);
> -	fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	if (oob_required)
> +		fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>  }

This will result in writing junk to the non-ECC OOB bytes as opposed to
leaving it alone.

-Scott
