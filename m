Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8xHz-0002Lz-98
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 20:33:11 +0000
Received: by mail-pa0-f45.google.com with SMTP id lf10so7093927pab.4
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 12:32:48 -0800 (PST)
Date: Wed, 7 Jan 2015 12:32:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: support TRX data partition being UBI
Message-ID: <20150107203245.GL9759@ld-irv-0074>
References: <1417456220-22815-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1417456220-22815-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 01, 2014 at 06:50:20PM +0100, Rafał Miłecki wrote:
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git. Thanks.

But one question below.

> ---
>  drivers/mtd/bcm47xxpart.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index cc13ea5..26a4a4a 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -40,6 +40,7 @@
>  #define ML_MAGIC2			0x26594131
>  #define TRX_MAGIC			0x30524448
>  #define SQSH_MAGIC			0x71736873	/* shsq */
> +#define UBI_EC_MAGIC			0x23494255	/* UBI# */
>  
>  struct trx_header {
>  	uint32_t magic;
> @@ -50,7 +51,7 @@ struct trx_header {
>  	uint32_t offset[3];
>  } __packed;
>  
> -static void bcm47xxpart_add_part(struct mtd_partition *part, char *name,
> +static void bcm47xxpart_add_part(struct mtd_partition *part, const char *name,
>  				 u64 offset, uint32_t mask_flags)
>  {
>  	part->name = name;
> @@ -58,6 +59,26 @@ static void bcm47xxpart_add_part(struct mtd_partition *part, char *name,
>  	part->mask_flags = mask_flags;
>  }
>  
> +static const char *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
> +						  size_t offset)
> +{
> +	uint32_t buf;
> +	size_t bytes_read;
> +
> +	if (mtd_read(master, offset, sizeof(buf), &bytes_read,
> +		     (uint8_t *)&buf) < 0) {
> +		pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
> +			offset);
> +		goto out_default;
> +	}
> +
> +	if (buf == UBI_EC_MAGIC)

Are there any endianness issues here? You're reading in byte-by-byte,
but you then treat it like a normal 32-bit word. I guess the markers are
always written in native endianness?

> +		return "ubi";
> +
> +out_default:
> +	return "rootfs";
> +}
> +
>  static int bcm47xxpart_parse(struct mtd_info *master,
>  			     struct mtd_partition **pparts,
>  			     struct mtd_part_parser_data *data)
> @@ -186,8 +207,11 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  			 * we want to have jffs2 (overlay) in the same mtd.
>  			 */
>  			if (trx->offset[i]) {
> +				const char *name;
> +
> +				name = bcm47xxpart_trx_data_part_name(master, offset + trx->offset[i]);
>  				bcm47xxpart_add_part(&parts[curr_part++],
> -						     "rootfs",
> +						     name,
>  						     offset + trx->offset[i],
>  						     0);
>  				i++;

Brian
