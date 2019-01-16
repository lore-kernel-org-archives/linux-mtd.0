From: Joakim.Tjernlund@infinera.com (Joakim Tjernlund)
Date: Wed, 16 Jan 2019 08:33:13 +0000
Subject: [PATCH] mtd: cfi: Fixed endless loop problem in CFI when value
 was written but corrupted.
In-Reply-To: <20190116003211.GA57460@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
References: <20190116003211.GA57460@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
Message-ID: <acd7f2257808f78aa76840e6789c7f65c08986ef.camel@infinera.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2019-01-16 at 00:32 +0000, Przemyslaw Sobon wrote:
> 
> 
> There was an endless loop in CFI Flash driver when a value was written
> incorrectly. In such case chip_ready returns true but chip_good returns
> false and we never get out of the loop.
> 
> The solution was to break the loop in 2 cases, either device is ready or
> device is not ready and timeout elapsed. The correctness of the write is
> checked after the loop ended. That way we ensure the loop always ends.
> 
> Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>


hmm, current code was introduced by Tokunori Ikegami <ikegami@allied-telesis.co.jp> to address another problem he had.
See 
   mtd: cfi_cmdset_0002: Change write buffer to check correct value
and
   mtd: cfi_cmdset_0002: Change erase functions to check chip good only

I wonder if you need to wrap an extra loop with retries around chip_good to adress the problem Tokunori had.

Tokunori, what do you think ?

Jocke
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..6cc31d2057e9 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1879,15 +1879,18 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>                 if (time_after(jiffies, timeo) && !chip_ready(map, adr))
>                         break;
> 
> -               if (chip_good(map, adr, datum)) {
> -                       xip_enable(map, chip, adr);
> -                       goto op_done;
> -               }
> +               if (chip_ready(map, adr))
> +                       break;
> 
>                 /* Latency issues. Drop the lock, wait a while and retry */
>                 UDELAY(map, chip, adr, 1);
>         }
> 
> +       if (chip_good(map, adr, datum)) {
> +               xip_enable(map, chip, adr);
> +               goto op_done;
> +       }
> +
>         /*
>          * Recovery from write-buffer programming failures requires
>          * the write-to-buffer-reset sequence.  Since the last part
> --
> 2.16.5
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-mtd%2F&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C35b64c743938427ffa7208d67b4a2a60%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636831955813341722&amp;sdata=TgI7aw8Qv57MY%2B62KWS87kyfte2A8qQY5OFjQc9Vhwc%3D&amp;reserved=0
