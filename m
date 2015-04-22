Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ykyo8-00048w-Ug
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 17:51:34 +0000
Received: by pdea3 with SMTP id a3so280597573pde.3
 for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2015 10:51:11 -0700 (PDT)
Date: Wed, 22 Apr 2015 10:51:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?=
 <peterpandong@micron.com>
Subject: Re: [PATCH 2/6] mtd: diskonchip: don't call nand_scan_bbt() directly
Message-ID: <20150422175108.GX32500@ld-irv-0074>
References: <87F60714EC601C4C83DFF1D2E3D390A02728255E@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A02728255E@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2015 at 02:11:24AM +0000, Peter Pan 潘栋 (peterpandong) wrote:
> The diskonchip driver almost uses the default nand_base hooks as-is,
> except that it provides custom on-flash BBT descriptors and avoids using
> factory-marked bad blockers.
> 
> So let's refactor the BBT initialization code into a private 'late_init'
> hook which handles all the private details. Note the usage of
> NAND_SKIP_BBTSCAN, which allows us to defer the BBT scan until we've
> prepared everything.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>

Why are you just resending my patch? You could Ack/Review/Test it
instead. (Did you test it?)

http://patchwork.ozlabs.org/patch/444605/

> ---
>  drivers/mtd/nand/diskonchip.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> index f68a7bc..e580014 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c
> @@ -69,6 +69,9 @@ struct doc_priv {
>  	int mh0_page;
>  	int mh1_page;
>  	struct mtd_info *nextdoc;
> +
> +	/* Handle the last stage of initialization (BBT scan, partitioning) */
> +	int (*late_init)(struct mtd_info *mtd);
>  };
>  
>  /* This is the syndrome computed by the HW ecc generator upon reading an empty
> @@ -1294,10 +1297,10 @@ static int __init nftl_scan_bbt(struct mtd_info *mtd)
>  		this->bbt_md = NULL;
>  	}
>  
> -	/* It's safe to set bd=NULL below because NAND_BBT_CREATE is not set.
> -	   At least as nand_bbt.c is currently written. */
> -	if ((ret = nand_scan_bbt(mtd, NULL)))
> +	ret = this->scan_bbt(mtd);
> +	if (ret)
>  		return ret;
> +
>  	mtd_device_register(mtd, NULL, 0);
>  	if (!no_autopart)
>  		mtd_device_register(mtd, parts, numparts);
> @@ -1344,10 +1347,10 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
>  		this->bbt_md->pattern = "TBB_SYSM";
>  	}
>  
> -	/* It's safe to set bd=NULL below because NAND_BBT_CREATE is not set.
> -	   At least as nand_bbt.c is currently written. */
> -	if ((ret = nand_scan_bbt(mtd, NULL)))
> +	ret = this->scan_bbt(mtd);
> +	if (ret)
>  		return ret;
> +
>  	memset((char *)parts, 0, sizeof(parts));
>  	numparts = inftl_partscan(mtd, parts);
>  	/* At least for now, require the INFTL Media Header.  We could probably
> @@ -1369,7 +1372,7 @@ static inline int __init doc2000_init(struct mtd_info *mtd)
>  	this->read_byte = doc2000_read_byte;
>  	this->write_buf = doc2000_writebuf;
>  	this->read_buf = doc2000_readbuf;
> -	this->scan_bbt = nftl_scan_bbt;
> +	doc->late_init = nftl_scan_bbt;
>  
>  	doc->CDSNControl = CDSN_CTRL_FLASH_IO | CDSN_CTRL_ECC_IO;
>  	doc2000_count_chips(mtd);
> @@ -1396,13 +1399,13 @@ static inline int __init doc2001_init(struct mtd_info *mtd)
>  		   can have multiple chips. */
>  		doc2000_count_chips(mtd);
>  		mtd->name = "DiskOnChip 2000 (INFTL Model)";
> -		this->scan_bbt = inftl_scan_bbt;
> +		doc->late_init = inftl_scan_bbt;
>  		return (4 * doc->chips_per_floor);
>  	} else {
>  		/* Bog-standard Millennium */
>  		doc->chips_per_floor = 1;
>  		mtd->name = "DiskOnChip Millennium";
> -		this->scan_bbt = nftl_scan_bbt;
> +		doc->late_init = nftl_scan_bbt;
>  		return 1;
>  	}
>  }
> @@ -1415,7 +1418,7 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
>  	this->read_byte = doc2001plus_read_byte;
>  	this->write_buf = doc2001plus_writebuf;
>  	this->read_buf = doc2001plus_readbuf;
> -	this->scan_bbt = inftl_scan_bbt;
> +	doc->late_init = inftl_scan_bbt;
>  	this->cmd_ctrl = NULL;
>  	this->select_chip = doc2001plus_select_chip;
>  	this->cmdfunc = doc2001plus_command;
> @@ -1591,6 +1594,8 @@ static int __init doc_probe(unsigned long physadr)
>  	nand->ecc.bytes		= 6;
>  	nand->ecc.strength	= 2;
>  	nand->bbt_options	= NAND_BBT_USE_FLASH;
> +	/* Skip the automatic BBT scan so we can run it manually */
> +	nand->options		|= NAND_SKIP_BBTSCAN;
>  
>  	doc->physadr		= physadr;
>  	doc->virtadr		= virtadr;
> @@ -1608,7 +1613,7 @@ static int __init doc_probe(unsigned long physadr)
>  	else
>  		numchips = doc2001_init(mtd);
>  
> -	if ((ret = nand_scan(mtd, numchips))) {
> +	if ((ret = nand_scan(mtd, numchips)) || (ret = doc->late_init(mtd))) {
>  		/* DBB note: i believe nand_release is necessary here, as
>  		   buffers may have been allocated in nand_base.  Check with
>  		   Thomas. FIX ME! */
> -- 
> 1.9.1
> 
