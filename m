Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKi6E-0002cm-AS
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 07:17:55 +0000
Date: Thu, 30 Jul 2015 09:17:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 4/4] mtd: nand: print full chip ID
Message-ID: <20150730091730.1774291d@bbrezillon>
In-Reply-To: <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hans, Michal,

On Wed, 29 Jul 2015 19:53:54 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> From: Michal Suchanek <hramrach@gmail.com>
> 
> Full chip ID is printed so user has data to paste from syslog in case
> of chip misidentification.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mtd/nand/nand_base.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e2e2690..13e9938 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4243,7 +4243,7 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
>  }
>  
>  static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
> -		   struct nand_flash_dev *type, u8 *id_data, int *busw)
> +		   struct nand_flash_dev *type, const u8 *id_data, int *busw)
>  {
>  	if (!strncmp(type->id, id_data, type->id_len)) {
>  		mtd->writesize = type->pagesize;
> @@ -4269,6 +4269,26 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /*
> + * Print full detail of chip ID read from chip.
> + */
> +static void print_nand_chip_info(int maf_id, int dev_id, u8 id_data[8])
> +{
> +	u8 delim[8] = { [0 ... 7] = ',' };
> +
> +	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
> +		maf_id, dev_id);
> +
> +	delim[7] = ' ';
> +	delim[nand_id_len(id_data, 8) - 1] = ';';
> +
> +	pr_info("chip id data: 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c\n",
> +		id_data[0], delim[0], id_data[1], delim[1],
> +		id_data[2], delim[2], id_data[3], delim[3],
> +		id_data[4], delim[4], id_data[5], delim[5],
> +		id_data[6], delim[6], id_data[7], delim[7]);

This looks like debug information to me, how about using pr_debug ?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
