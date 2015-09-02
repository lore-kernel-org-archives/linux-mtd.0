Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZX3w3-0007qD-Kz
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 09:02:28 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 07/10] mtd: spi-nor: add mtd_is_locked() support
Date: Wed, 2 Sep 2015 11:01:49 +0200
Cc: linux-mtd@lists.infradead.org
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-8-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201509021101.49731.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, September 01, 2015 at 09:57:12 PM, Brian Norris wrote:
> This enables ioctl(MEMISLOCKED). Status can now be reported in the
> mtdinfo or flash_lock utilities found in mtd-utils.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 37 ++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h   |  3 +++
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 62fa1b4ff3c0..c4fb1205f1d3 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -519,6 +519,24 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs,
> uint64_t len) return write_sr(nor, status_new);
>  }
> 
> +/*
> + * Check if a region of the flash is (completely) locked. See stm_lock()
> for + * more info.
> + *
> + * Returns 1 if entire region is locked, 0 if any portion is unlocked, and
> + * negative on errors.
> + */
> +static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	int status;
> +
> +	status = read_sr(nor);
> +	if (status < 0)
> +		return status;
> +
> +	return stm_is_locked_sr(nor, ofs, len, status);
> +}
> +
>  static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> @@ -549,6 +567,21 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t
> ofs, uint64_t len) return ret;
>  }
> 
> +static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t
> len) +{
> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	int ret;
> +
> +	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
> +	if (ret)
> +		return ret;
> +
> +	ret = nor->flash_is_locked(nor, ofs, len);

Is nor->flash_is_locked () always available or should you check this here ?

> +
> +	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
> +	return ret;
> +}
> +
[...]
