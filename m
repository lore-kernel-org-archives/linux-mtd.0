Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OoFA6-0004ur-Hy
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 12:33:03 +0000
Received: from dflp53.itg.ti.com ([128.247.5.6])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o7PCWw3N030130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2010 07:32:58 -0500
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Wolfram Sang'" <w.sang@pengutronix.de>, <linux-mtd@lists.infradead.org>
References: <1282738700-30966-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1282738700-30966-1-git-send-email-w.sang@pengutronix.de>
Subject: RE: [RFC] nand/davinci: Fix comment to match the code
Date: Wed, 25 Aug 2010 17:57:40 +0530
Message-ID: <039d01cb4450$e8f7d6a0$bae783e0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Artem Bityutskiy' <Artem.Bityutskiy@nokia.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	'Sneha Narnakaje' <nsnehaprabha@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Aug 25, 2010 at 17:48:20, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> 
> Found while debugging a NAND issue with a dm365.
> 
>  drivers/mtd/nand/davinci_nand.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 2ac7367..53f864a 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -369,8 +369,9 @@ compare:
>  	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
>  	 * begin trying to poll for the state, you may fall right out of your
>  	 * loop without any of the correction calculations having taken place.
> -	 * The recommendation from the hardware team is to wait till ECC_STATE
> -	 * reads less than 4, which means ECC HW has entered correction state.
> +	 * The recommendation from the hardware team is to initially delay as
> +	 * long as ECC_STATE reads less than 4. After that, ECC HW has entered
> +	 * correction state.
>  	 */
>  	do {
>  		ecc_state = (davinci_nand_readl(info,
> -- 

Thanks for pointing this out, but I have already corrected this and submitted
the patch. Artem Bityutskity has pushed this patch to his l2-mtd-2.6 / master
tree.

Regards,
Sudhakar
