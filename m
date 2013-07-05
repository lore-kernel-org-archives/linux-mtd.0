Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uulyq-0004TJ-2z
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2013 16:02:01 +0000
Received: by mail-pa0-f44.google.com with SMTP id lj1so1444179pab.17
 for <linux-mtd@lists.infradead.org>; Thu, 04 Jul 2013 09:01:37 -0700 (PDT)
Message-ID: <51D644C4.7090202@gmail.com>
Date: Fri, 05 Jul 2013 00:00:04 -0400
From: Huang Shijie <shijie8@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1368760654-28754-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
Cc: dedekind1@gmail.com, vikram186@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年05月16日 23:17, Huang Shijie 写道:
> 1.) Why add the ECC information to the nand_chip{} ?
>    Each nand chip has its requirement for the ECC correctability, such as
>    "4bit ECC for each 512Byte" or "40bit ECC for each 1024Byte".
>    This ECC info is very important to the nand controller, such as gpmi.
>
>    Take the Micron MT29F64G08CBABA for example, its geometry is
>    8k page size, 744 bytes oob size and it requires 40bit ECC per 1K bytes.
>    If we do not provide the ECC info to the gpmi nand driver, it has to
>    calculate the ECC correctability itself. The gpmi driver will gets the 56bit
>    ECC for per 1K bytes which is beyond its BCH's 40bit ecc capibility.
>    The gpmi will quits in this case. But in actually, the gpmi can supports
>    this nand chip if it can get the right ECC info.
>
> 2.) About the patch set:
>    2.1) patch 1:
>    	      The keynote patch.
>
>    2.2) patch 2 ~ patch 6:
>                These patches are for ONFI nand.
>                Parse out the ecc info from the parameter page if we can, else
> 	       parse out the ecc info from the extended parameter page.
> 	       
>    2.2) patch 7 ~ patch 9:
>                Add the ECC info for full-id nand, and parse it out.
>
>    2.3) patch 10 
>                The gpmi uses the ecc info to set the BCH module. and with this
> 	       patch set, the gpmi can supports the MT29F64G08CBABA now.
>
> v5 --> v6:
> 	[0] rename the ecc_strength/ecc_step to ecc_strength_ds/ecc_step_ds.
> 	[1] fix a case when "the codeword is 0".
> 	[2] fix typo.
> 	[3] add the 'O' to the diagram in the gpmi patch.
>
> v4 --> v5:
> 	[0] rebase the new l2-mtd(dropped the 3 merged patches).
> 	[1] rename ecc_size to ecc_step.
> 	[2] change the comment for the new fields.
>
> v3 --> v4:
> 	[0] remove the printk for "out of memory".
> 	[1] remove the hardcode nand_command_lp(). Update the chip->cmd_func
> 	    before we call the nand_flash_detect_ext_param_page().
> 	[2] split the ecc_info to two fields for full id nand.
> 	[3] update the comments for ecc_strength/ecc_size (from Brian).
> 	       
> v2 --> v3:
> 	[0] add a new patch to define the semantics of the two fields.
> 	[1] Use the Change Read Column command to remove the "last" argument.
> 	[2] simplify the onfi_feature().
> 	[3] Use kmalloc() to replace kcalloc().
> 	[4] others.
>
> v1 --> v2:
> 	[0] Since the first 3 patches are accepted, I do not send them in the
> 	    version 2.
> 	[1] add NAND_ prefix for macros used by the full-id nands.
> 	[2] add onfi_ prefix for the extend parameter page data structures.
> 	[3] rename the onfi_get_feature() to onfi_feature().
> 	[4] I re-test this patch set again.
>
> Huang Shijie (10):
>   mtd: add datasheet's ECC information to nand_chip{}
>   mtd: get the ECC info from the parameter page for ONFI nand
>   mtd: add data structures for Extended Parameter Page
>   mtd: add a helper to get the supported features for ONFI nand
>   mtd: get the ECC info from the Extended Parameter Page
>   mtd: replace the hardcode with the onfi_feature()
>   mtd: add ECC info for nand_flash_dev{}
>   mtd: parse out the ECC info for the full-id nand chips
>   mtd: add the ecc info for some full-id nand chips
>   mtd: gpmi: set the BCH's geometry with the ecc info
>
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  132 +++++++++++++++++++++++++++++++-
>  drivers/mtd/nand/nand_base.c           |   93 ++++++++++++++++++++++-
>  drivers/mtd/nand/nand_ids.c            |    8 +-
>  include/linux/mtd/nand.h               |   72 +++++++++++++++++-
>  4 files changed, 296 insertions(+), 9 deletions(-)
>
Hi Artem:
Could you merge this patch set?


thanks
Huang Shijie
