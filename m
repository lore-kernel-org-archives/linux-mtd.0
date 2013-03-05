Received: from mail-pb0-f52.google.com ([209.85.160.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCmO9-0000Ub-9H
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 07:34:17 +0000
Received: by mail-pb0-f52.google.com with SMTP id ma3so4054935pbc.11
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 23:34:16 -0800 (PST)
Message-ID: <51359FCE.4060605@gmail.com>
Date: Mon, 04 Mar 2013 23:33:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH 3/3] mtd: nand_base: Use readsb/readsw/writesb/writesw
 if possible
References: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
 <1362038541-22406-3-git-send-email-shc_work@mail.ru>
In-Reply-To: <1362038541-22406-3-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

I'm not an expert on IO accessors, but since you asked...

On 02/28/2013 12:02 AM, Alexander Shiyan wrote:
> This patch provide using readsb/readsw/writesb/writesw functions
> if it possible for particular platform.

The commit description does not give enough motivation. Should this 
improve performance? Or is this just a "cleanup"? (If the latter, then 
it fails, as the resulting code is much less clean.)

> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>   drivers/mtd/nand/nand_base.c |   29 ++++++++++++++++++++++++-----
>   1 files changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 382b857..4efde01 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -214,11 +214,16 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
>    */
>   static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
>   {
> -	int i;
>   	struct nand_chip *chip = mtd->priv;
>
> +#ifndef writesb

No one guarantees that 'writesb' will be a macro and not a static inline 
function, do they?

> +	int i;
> +
>   	for (i = 0; i < len; i++)
>   		writeb(buf[i], chip->IO_ADDR_W);
> +#else
> +	writesb(chip->IO_ADDR_W, buf, len);
> +#endif
>   }

These #ifndef's are very ugly and are likely the wrong way(TM). The 
first question I ask when I see this is: why isn't this interface 
available on all platforms? In fact, it seems like it has been dropped 
from the asm-generic headers and specifically recommended against. See:

commit b2656a138ab7bc4e7abd3b1cbd6d1f105c7a7186
Author: Will Deacon <will.deacon@arm.com>
Date:   Wed Oct 17 16:45:01 2012 +0100

     asm-generic: io: remove {read,write} string functions

Quote: "We should encourage driver writers to use the 
io{read,write}{8,16,32}_rep functions instead."

So, an alternative patch might use iowrite8_rep() here unconditionally.

>   /**

<snipped the rest; same comments apply>

Brian
