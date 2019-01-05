Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfmTp-0001XN-BZ
 for linux-mtd@lists.infradead.org; Sat, 05 Jan 2019 13:59:14 +0000
Date: Sat, 5 Jan 2019 14:58:59 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Emil Lenngren <emil.lenngren@gmail.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
Message-ID: <20190105145845.7a28d8f8@bbrezillon>
In-Reply-To: <20181221115831.9595-1-emil.lenngren@gmail.com>
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
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

On Fri, 21 Dec 2018 12:58:14 +0100
Emil Lenngren <emil.lenngren@gmail.com> wrote:

> SPI NAND flashes don't accept new commands while an erase is ongoing.
> Make sure to wait until the device is ready before writing the marker.
> 
> Just as with the erase op, no error check is performed since we want
> to continue writing the marker even if the erase fails.
> 
> Signed-off-by: Emil Lenngren <emil.lenngren@gmail.com>
> ---
>  drivers/mtd/nand/spi/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 479c2f2cf1..c2724d34e6 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -685,6 +685,8 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>  
>  	spinand_erase_op(spinand, pos);
>  
> +	spinand_wait(spinand, NULL);
> +

After thinking a bit more about it, I think we should simply write the
BBM and skip the erase operation. Marking a block bad is just about
writing 0 to the first 2 bytes of the OOB area, and we don't need the
block to be erased to do that.

>  	memset(spinand->oobbuf, 0, 2);
>  	return spinand_write_page(spinand, &req);
>  }
