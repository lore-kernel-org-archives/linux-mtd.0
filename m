Subject: Re: [PATCH] mtd: cfi_probe: print manufacturer and id of probed chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100614103345.26103.40429.stgit@dev.siriade.com>
References: <20100614103345.26103.40429.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 09:45:18 +0300
Message-ID: <1277793918.1041.970.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 12:33 +0200, Guillaume LECERF wrote:
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_probe.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index b2acd32..5f5ba3e 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -235,9 +235,9 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>  	cfi_qry_mode_off(base, map, cfi);
>  	xip_allowed(base, map);
>  
> -	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
> +	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. mfr=0x%08x id=0x%08x\n",
>  	       map->name, cfi->interleave, cfi->device_type*8, base,
> -	       map->bankwidth*8);
> +	       map->bankwidth*8, cfi->mfr, cfi->id);

This is not a debugging print, so I think you should do it in a more
user-friendly way. E.g., "manufect. ID %#08x, chip id %#08x".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
