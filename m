Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEW7x-0005TW-Sy
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 03:09:03 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb10so5602456pad.23
 for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2013 20:08:40 -0700 (PDT)
Message-ID: <521D69B6.7070504@gmail.com>
Date: Tue, 27 Aug 2013 20:08:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1377509808-29363-7-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since we may see a v4 anyway, I'll make a comment here that I've been 
mulling over.

On 08/26/2013 02:36 AM, Huang Shijie wrote:
> Current code sets the mtd->type with MTD_NANDFLASH for both
> SLC and MLC. So the jffs2 may supports the MLC nand, but in actually,
> the jffs2 should not support the MLC.
>
> This patch uses the nand_is_slc() to check the nand cell type,
> and set the mtd->type with the right nand type.
>
> After this patch, the jffs2 only can support the SLC nand.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>

This patch doesn't note here that it is breaking the ABI: it is the 
first (AFAIK; I don't think onenand ever actually had MLC, right?) patch 
to cause an MTD to show up as MTD_MLCNANDFLASH (and "unknown" in sysfs 
-- but you change this later to "mlc-nand"). This should be made more 
clear, if we're going to do this. And you should document and explain it 
*before* this patch.

But more importantly, you don't really answer this question I have: why 
we want to expose this MTD_MLCNANDFLASH type to user-space? It seems you 
need this for internal drivers' usage and for JFFS2 (both valid 
reasons). But exporting it to user-space just makes us work to change 
mtd-utils (and any other scripts that might rely on these types). Note 
that not everybody upgrades mtd-utils along with their kernel.

One argument in favor of your change: so a user can programmatically 
determine whether to use JFFS2 or UBIFS on a particular NAND. (But then 
again, SLC are getting more and more MLC-like properties that make them 
unsuitable for JFFS2...)

So, I would recommend a few rearrangements of part of this series:
(1) fixup the sysfs show() function and ABI documentation (in the same 
patch) to cover "mlc-nand". *** must clearly explain the rationale for 
userspace change (currently missing) ***
(2) do any changes to JFFS2 based on the MLC type
(3) allow nand_base.c to export MTD_MLCNANDFLASH

> ---
>   drivers/mtd/nand/nand_base.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8755a74..5957fe7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3781,7 +3781,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>   		chip->options |= NAND_SUBPAGE_READ;
>
>   	/* Fill in remaining MTD driver data */
> -	mtd->type = MTD_NANDFLASH;
> +	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
>   	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
>   						MTD_CAP_NANDFLASH;
>   	mtd->_erase = nand_erase;
>

Brian
