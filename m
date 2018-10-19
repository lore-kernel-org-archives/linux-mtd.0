Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQBs-00068i-9t
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:31:30 +0000
Date: Fri, 19 Oct 2018 10:31:16 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: boris.brezillon@free-electrons.com, Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Message-ID: <20181019103116.478ff84a@bbrezillon>
In-Reply-To: <20181019081320.12843-3-ikegami@allied-telesis.co.jp>
References: <20181019081320.12843-1-ikegami@allied-telesis.co.jp>
 <20181019081320.12843-3-ikegami@allied-telesis.co.jp>
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

On Fri, 19 Oct 2018 17:13:19 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> It is enough to use chip_good() only so chip_ready() is not necessary.
> For this change the order to check timeout is also needed to chagne.

								^ change

And again, you're not explaining why.

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 251c9e1675bd..c2e51768a02c 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1882,14 +1882,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> -			break;
> -
>  		if (chip_good(map, adr, datum)) {
>  			xip_enable(map, chip, adr);
>  			goto op_done;
>  		}
>  
> +		if (time_after(jiffies, timeo))
> +			break;
> +
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}
