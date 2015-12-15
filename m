Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8u6D-0001iQ-HN
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 18:13:22 +0000
Received: by mail-pa0-x22f.google.com with SMTP id hk6so8560449pad.2
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2015 10:13:00 -0800 (PST)
Date: Tue, 15 Dec 2015 10:12:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH] mtd: spi-nor: wait until lock/unlock operations are ready
Message-ID: <20151215181257.GD10460@google.com>
References: <1448240997-26969-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448240997-26969-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 22, 2015 at 10:09:57PM -0300, Ezequiel Garcia wrote:
> On Micron and Numonyx devices, the status register write command
> (WRSR), raises a work-in-progress bit (WIP) on the status register.
> The datasheets for these devices specify that while the status
> register write is in progress, the status register WIP bit can still
> be read to check the end of the operation.
> 
> This commit adds a wait_till_ready call on lock/unlock operations,
> only for these manufacturers. This is needed to prevent applications
> from issuing erase or program operations before the unlock operation
> is completed.
> 
> Reported-by: Stas Sergeev <stsp@list.ru>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e9c26c0e2258..acc9b05e02be 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -485,6 +485,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	u8 status_old, status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 shift = ffs(mask) - 1, pow, val;
> +	int ret;

I've merged other patches in the meantime (sorry), so this might need a
rebasing on l2-mtd.git. I'd do it, but should get a v2 anyway.

>  
>  	status_old = read_sr(nor);
>  
> @@ -521,7 +522,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  		return -EINVAL;
>  
>  	write_enable(nor);
> -	return write_sr(nor, status_new);
> +	ret = write_sr(nor, status_new);
> +	if (ret)
> +		return ret;
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +	return 0;

Why not just return spi_nor_wait_till_ready(nor)?

>  }
>  
>  /*
> @@ -535,6 +542,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	uint8_t status_old, status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 shift = ffs(mask) - 1, pow, val;
> +	int ret;
>  
>  	status_old = read_sr(nor);
>  
> @@ -569,7 +577,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  		return -EINVAL;
>  
>  	write_enable(nor);
> -	return write_sr(nor, status_new);
> +	ret = write_sr(nor, status_new);
> +	if (ret)
> +		return ret;
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +	return 0;

Same?

>  }
>  
>  /*

Brian
