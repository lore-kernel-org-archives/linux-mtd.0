Received: from mail-da0-x234.google.com ([2607:f8b0:400e:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UceyE-0005iI-LM
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 16:54:31 +0000
Received: by mail-da0-f52.google.com with SMTP id o9so1088198dan.39
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2013 09:54:09 -0700 (PDT)
Message-ID: <5193BDAA.8040909@gmail.com>
Date: Wed, 15 May 2013 22:24:02 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 09/11] mtd: parse out the ECC info for the full-id
 nand chips
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-10-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607232-2210-10-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/15/2013 2:10 PM, Huang Shijie wrote:
> Parse out the ECC information for the full-id nand chips.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>   drivers/mtd/nand/nand_base.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 41e5c07..359e105 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3243,6 +3243,8 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>   		chip->cellinfo = id_data[2];
>   		chip->chipsize = (uint64_t)type->chipsize << 20;
>   		chip->options |= type->options;
> +		chip->ecc_strength = NAND_ECC_STRENGTH(type);
> +		chip->ecc_step = NAND_ECC_STEP(type);

Does all NAND chips define this? I mean the patch 10/11 "mtd: add the 
ecc info for some full-id nand chips". What does the above result for 
the other chips? Does it get populated at runtime?

~Vikram
