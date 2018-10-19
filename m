Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQE1-0003kk-In
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:35:42 +0000
Date: Fri, 19 Oct 2018 10:33:29 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: boris.brezillon@free-electrons.com, Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: cfi_cmdset_0002: Remove goto statemnet from
 do_write_buffer()
Message-ID: <20181019103329.313ea0a4@bbrezillon>
In-Reply-To: <20181019081320.12843-4-ikegami@allied-telesis.co.jp>
References: <20181019081320.12843-1-ikegami@allied-telesis.co.jp>
 <20181019081320.12843-4-ikegami@allied-telesis.co.jp>
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

In the subject: s/statemnet/statement/

On Fri, 19 Oct 2018 17:13:20 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> Also change to call xip_enable() once only.

Just like for the other patches I'd like to have more explanation in
the commit message. And please split the commit in 2 commits since you
seem to do 2 unrelated changes:
- drop a label+gotos
- call xip_enable() only once.

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 48 +++++++++++++++--------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index c2e51768a02c..060edd2f1693 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1883,39 +1883,41 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  		}
>  
>  		if (chip_good(map, adr, datum)) {
> -			xip_enable(map, chip, adr);
> -			goto op_done;
> +			break;
>  		}
>  
> -		if (time_after(jiffies, timeo))
> +		if (time_after(jiffies, timeo)) {
> +			ret = -EIO;
>  			break;
> +		}
>  
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}
>  
> -	/*
> -	 * Recovery from write-buffer programming failures requires
> -	 * the write-to-buffer-reset sequence.  Since the last part
> -	 * of the sequence also works as a normal reset, we can run
> -	 * the same commands regardless of why we are here.
> -	 * See e.g.
> -	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
> -	 */
> -	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> -			 cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> -			 cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
> -			 cfi->device_type, NULL);
> -	xip_enable(map, chip, adr);
> -	/* FIXME - should have reset delay before continuing */
> +	if (ret) {
> +		/*
> +		 * Recovery from write-buffer programming failures requires
> +		 * the write-to-buffer-reset sequence.  Since the last part
> +		 * of the sequence also works as a normal reset, we can run
> +		 * the same commands regardless of why we are here.
> +		 * See e.g.
> +		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
> +		 */
> +		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> +				 cfi->device_type, NULL);
> +		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> +				 cfi->device_type, NULL);
> +		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
> +				 cfi->device_type, NULL);
> +		/* FIXME - should have reset delay before continuing */
>  
> -	printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
> -	       __func__, adr);
> +		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
> +		       __func__, adr);
> +	}
> +
> +	xip_enable(map, chip, adr);
>  
> -	ret = -EIO;
> - op_done:
>  	chip->state = FL_READY;
>  	DISABLE_VPP(map);
>  	put_chip(map, chip, adr);
