Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9i2b-0006Bh-JS
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 22:28:26 +0000
Received: by mail-pd0-f172.google.com with SMTP id y13so19799884pdi.3
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 14:28:04 -0800 (PST)
Date: Fri, 9 Jan 2015 14:28:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] mtd: spi-nor: don't return found by JEDEC ID a non-JEDEC
 flash
Message-ID: <20150109222310.GY9759@ld-irv-0074>
References: <1418511647-24736-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418511647-24736-1-git-send-email-vladimir_zapolskiy@mentor.com>
Cc: Huang Shijie <b32955@freescale.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 14, 2014 at 01:00:47AM +0200, Vladimir Zapolskiy wrote:
> In attempt to spi_nor_scan() for an expected JEDEC compliant device by
> reading RDID register don't return the first found non-JEDEC device
> entry from spi_nor_ids[] table, if RDID is zero.
> 
> First of all zeroes in RDID may be evidence for not correctly working
> SPI, secondly empty RDID can not be used to select a particular JEDEC
> non-compliant device correctly.
> 
> The best possible solution is
> * not to rely on spi_nor_read_id(), if expected device is non-JEDEC,
> * not to substitute an expected JEDEC device with some arbitrary
>   chosen non-JEDEC device, if RDID is zero.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

This patch doesn't apply to the latest tree. I think this commit
probably already fixes your issue:

  https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=09ffafb6977dc930770af2910edc3b469651131d

  commit 09ffafb6977dc930770af2910edc3b469651131d
  Author: Huang Shijie <shijie.huang@intel.com>
  Date:   Thu Nov 6 07:34:01 2014 +0100

      mtd: spi-nor: add id/id_len for flash_info{}

> ---
>  drivers/mtd/spi-nor/spi-nor.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c51ee52..119ace9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -661,6 +661,12 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
>  
>  	ext_jedec = id[3] << 8 | id[4];
>  
> +	/* Non-JEDEC flash memory can not be detected correctly */
> +	if (!jedec && !ext_jedec) {
> +		dev_err(nor->dev, "JEDEC compliant device is not found\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
>  	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>  		info = (void *)spi_nor_ids[tmp].driver_data;
>  		if (info->jedec_id == jedec) {

Brian
