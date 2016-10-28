Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c021b-0005FI-C1
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 07:56:29 +0000
Date: Fri, 28 Oct 2016 09:56:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ville Michael Baillie <ville.michael.baillie@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: davinci: Fix unaligned 16-bit NAND read
Message-ID: <20161028095602.7a02f404@bbrezillon>
In-Reply-To: <20161021092605.GA14609@gmail.com>
References: <20161021092605.GA14609@gmail.com>
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

Hi Michael,

On Fri, 21 Oct 2016 10:26:05 +0100
Ville Michael Baillie <ville.michael.baillie@gmail.com> wrote:

> This patch fixes a rare bug when reading from 16-bit NAND flashes, by
> not allowing 8-bit read accesses within nand_davinci_read_buf().
> 
> In certain situations, an non 16-bit aligned buffer is passed to
> nand_davinci_read_buf(), which causes 8-bit accesses to be performed.
> However, the NAND will be returning 16-bit words, and half of these will
> be discarded.
> 
> This was observed when running mtd_stresstest.ko, which would report ECC
> errors when reading from a non 16-bit aligned offset into a page, and
> reading at least one subsequent page in the same read.
> 
> Signed-off-by: Ville Michael Baillie <ville.michael.baillie@gmail.com>
> ---
>  drivers/mtd/nand/davinci_nand.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 27fa8b8..ed9cd0d 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -442,12 +442,24 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
>  static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> +	u16 tmp;
>  
>  	if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
>  		ioread32_rep(chip->IO_ADDR_R, buf, len >> 2);
>  	else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
>  		ioread16_rep(chip->IO_ADDR_R, buf, len >> 1);
> -	else
> +	else if (chip->options & NAND_BUSWIDTH_16) {
> +		/*
> +		 * if NAND buswidth is 16 then 8 bit accesses
> +		 * will silently discard half the data
> +		 */
> +		len /= 2;
> +		while (len--) {
> +			tmp = ioread16(chip->IO_ADDR_R);
> +			memcpy(buf, &tmp, sizeof(u16));
> +			buf += sizeof(u16);
> +		}

Hm, you're not checking the len alignment here. Not sure this
is safe to assume len will always be a multiple of 2 bytes.

How about doing the following instead:

		/* Use ioread16_rep for aligned accesses. */
		if (IS_ALIGNED(addr, sizeof(u16))) {
			ioread16_rep(chip->IO_ADDR_R, buf, len >> 1);
			buf += len & ~0x1;
			len &= 0x1;
		}

		/*
		 * Now handle unaligned accesses.
		 * Warning: in case of unaligned len, we are consuming
		 * one extra byte, which is then discarded. It's fine
		 * as long as the caller does not call ->read_buf()
		 * twice without re-issuing a command in the middle.
		 * Otherwise, this means we lost one byte.
		 */
		for (; len > 0; len -= sizeof(u16)) {
			u16 tmp;

			tmp = ioread16(chip->IO_ADDR_R);
			memcpy(buf, &tmp,
			       len < sizeof(u16) ? len : sizeof(u16));
			buf += sizeof(u16);
		}

> +	} else
>  		ioread8_rep(chip->IO_ADDR_R, buf, len);

	} else {
		ioread8_rep(chip->IO_ADDR_R, buf, len);
	}

>  }
>  
