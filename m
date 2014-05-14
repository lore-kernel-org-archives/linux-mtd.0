Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkiI6-0002Ko-M4
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 23:08:51 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5L005HS6Y24W00@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 15 May 2014 08:08:26 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>,
 'David Woodhouse' <dwmw2@infradead.org>
References: <20140514141900.GB18082@mwanda>
In-reply-to: <20140514141900.GB18082@mwanda>
Subject: Re: [patch] mtd: cfi: indent some if statements
Date: Thu, 15 May 2014 08:08:25 +0900
Message-id: <005301cf6fc9$69236270$3b6a2750$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org,
 'Brian Norris' <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, May 14, 2014 11:19 PM, Dan Carpenter wrote:
> 
> The break statements should be indented another tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
> index 6293855..423666b 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0020.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0020.c
> @@ -961,7 +961,7 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
>  			chipnum++;
> 
>  			if (chipnum >= cfi->numchips)
> -			break;
> +				break;
>  		}
>  	}
> 
> @@ -1170,7 +1170,7 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  			chipnum++;
> 
>  			if (chipnum >= cfi->numchips)
> -			break;
> +				break;
>  		}
>  	}
>  	return 0;
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> index 08049f6..09c79bd 100644
> --- a/drivers/mtd/chips/cfi_util.c
> +++ b/drivers/mtd/chips/cfi_util.c
> @@ -239,7 +239,7 @@ int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
>  			chipnum++;
> 
>  			if (chipnum >= cfi->numchips)
> -			break;
> +				break;
>  		}
>  	}
> 
