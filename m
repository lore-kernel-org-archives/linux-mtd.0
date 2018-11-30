Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSgDx-00014P-7K
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 10:40:43 +0000
Date: Fri, 30 Nov 2018 11:40:19 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Provide default address width and latency
 for map selection
Message-ID: <20181130114019.175ab7ec@bbrezillon>
In-Reply-To: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
References: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
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

On Thu, 29 Nov 2018 18:15:34 +0000
"Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
wrote:

> JESD216 allows "variable address length" and "variable latency" in
> Configuration Detection Command Descriptors, in other words "as-is".
> And they are still unset during Sector Map Parameter Table parsing,
> which led to "map_id" determined erroneously as 0 for, e.g. S25FS128S.
> 
> Fixes: b038e8e3b ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 828d03e..5557c89 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2893,6 +2893,16 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt)
>  		nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>  		addr = smpt[i + 1];
>  
> +		/*
> +		 * JESD216 allows to omit particular address length or latency
> +		 * specification in the header and at this point they are still
> +		 * unset, so we need some heuristics. One example is S25FS128S.
> +		 */
> +		if (!nor->addr_width)
> +			nor->addr_width = 3;
> +		if (!nor->read_dummy)
> +			nor->read_dummy = 8;
> +

Looks like the same problem was reported by Yogesh here [1]. One more
proof that parsing SFDP is not trivial. I mean, what's the point of
defining a generic tables to describe NOR capabilities if you then
depend on vendor/chip specific init to read those tables...

Anyway, I think this sort of initialization should be placed in a
pre_sfdp() fixup hook, as getting the right values likely requires
reading some volatile/non-volatile regs.

>  		err = spi_nor_read_raw(nor, addr, 1, &data_byte);
>  		if (err)
>  			goto out;

[1]https://lkml.org/lkml/2018/10/22/354
