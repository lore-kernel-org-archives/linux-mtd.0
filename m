Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJeo3-0005B9-6i
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 13:20:43 +0000
Date: Mon, 5 Nov 2018 14:20:17 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: boris.brezillon@free-electrons.com, Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 04/11] mtd: cfi_cmdset_0002: Call xip_enable() once
 only in do_write_buffer().
Message-ID: <20181105142017.2e51b8aa@bbrezillon>
In-Reply-To: <20181025163219.25788-5-ikegami@allied-telesis.co.jp>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-5-ikegami@allied-telesis.co.jp>
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

On Fri, 26 Oct 2018 01:32:12 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> By the removed goto statement it can be called xip_enable() once.
> Also for a maintainability refactor it to call the function only once.

Would have worked with the op_done label too if you place the
xip_enable() call just after this label, right?

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> Changes since v2:
> - None.
> 
> Changes since v1:
> - Split from the patch v1 3/3.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index deffafab067e..a3fa2d7b1ba0 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1882,10 +1882,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (chip_good(map, adr, datum)) {
> -			xip_enable(map, chip, adr);
> +		if (chip_good(map, adr, datum))
>  			break;
> -		}
>  
>  		if (time_after(jiffies, timeo)) {
>  			ret = -EIO;
> @@ -1911,13 +1909,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  				 cfi->device_type, NULL);
>  		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
>  				 cfi->device_type, NULL);
> -		xip_enable(map, chip, adr);
>  		/* FIXME - should have reset delay before continuing */
>  
>  		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
>  		       __func__, adr);
>  	}
>  
> +	xip_enable(map, chip, adr);
> +
>  	chip->state = FL_READY;
>  	DISABLE_VPP(map);
>  	put_chip(map, chip, adr);
