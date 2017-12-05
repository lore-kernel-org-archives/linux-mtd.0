Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMJuz-0006vV-1f
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 20:34:20 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Check that BP bits are set properly
To: Aaron Sierra <asierra@xes-inc.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Cc: Joe Schultz <jschultz@xes-inc.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <84804381.386644.1512497624913.JavaMail.zimbra@xes-inc.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <00653598-9bf7-38f2-9890-d40766e4d681@wedev4u.fr>
Date: Tue, 5 Dec 2017 21:33:51 +0100
MIME-Version: 1.0
In-Reply-To: <84804381.386644.1512497624913.JavaMail.zimbra@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 05/12/2017 à 19:13, Aaron Sierra a écrit :
> Previously, the lock and unlock functions returned success even if the
> BP bits were not actually updated in the status register due to
> hardware write protection. Introduce write_sr_and_check() to write and
> read back the status register to ensure the desired BP bits are
> actually set as requested.
> 
> Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> v2: * Removed unnecessary spi_nor_wait_till_ready() call
>     * Renamed "new" variable to "status_new"
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bc266f7..c3ee168 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -552,6 +552,27 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	return ret;
>  }
>  
> +/* Write status register and ensure bits in mask match written values */
> +static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
> +{
> +	int ret;
> +
> +	write_enable(nor);
> +	ret = write_sr(nor, status_new);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +
> +	ret = read_sr(nor);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
> +}
> +
>  static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
>  				 uint64_t *len)
>  {
> @@ -650,7 +671,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
>  	bool use_top;
> -	int ret;
>  
>  	status_old = read_sr(nor);
>  	if (status_old < 0)
> @@ -714,11 +734,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	if ((status_new & mask) < (status_old & mask))
>  		return -EINVAL;
>  
> -	write_enable(nor);
> -	ret = write_sr(nor, status_new);
> -	if (ret)
> -		return ret;
> -	return spi_nor_wait_till_ready(nor);
> +	return write_sr_and_check(nor, status_new, mask);
>  }
>  
>  /*
> @@ -735,7 +751,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
>  	bool use_top;
> -	int ret;
>  
>  	status_old = read_sr(nor);
>  	if (status_old < 0)
> @@ -802,11 +817,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	if ((status_new & mask) > (status_old & mask))
>  		return -EINVAL;
>  
> -	write_enable(nor);
> -	ret = write_sr(nor, status_new);
> -	if (ret)
> -		return ret;
> -	return spi_nor_wait_till_ready(nor);
> +	return write_sr_and_check(nor, status_new, mask);
>  }
>  
>  /*
> 
