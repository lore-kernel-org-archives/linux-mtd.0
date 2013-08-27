Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEMnu-0000aP-Ho
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2013 17:11:43 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx10so5111048pab.27
 for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2013 10:11:02 -0700 (PDT)
Message-ID: <521CDD97.6070203@gmail.com>
Date: Tue, 27 Aug 2013 22:40:47 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: rename the cellinfo to bits_per_cell
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1377509808-29363-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/Aug/2013 3:06 PM, Huang Shijie wrote:
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 2ed2bb3..645721e 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1520,7 +1520,7 @@ int denali_init(struct denali_nand_info *denali)
>   	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
>   	 * SLC if possible.
>   	 * */
> -	if (denali->nand.cellinfo & NAND_CI_CELLTYPE_MSK &&
> +	if (!nand_is_slc(&denali->nand) &&
>   			(denali->mtd.oobsize > (denali->bbtskipbytes +
>   			ECC_15BITS * (denali->mtd.writesize /
>   			ECC_SECTOR_SIZE)))) {

Was just skimming thro this patchset.
Isn't the above change logically conflicting with what this patch is 
supposed to address? Please move this to a different patch.
