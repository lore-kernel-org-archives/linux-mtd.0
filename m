Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8EQ4-00072e-KS
 for linux-mtd@lists.infradead.org; Mon, 05 Jan 2015 20:38:33 +0000
Received: by mail-pd0-f175.google.com with SMTP id g10so28749112pdj.6
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2015 12:38:11 -0800 (PST)
Date: Mon, 5 Jan 2015 12:38:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 1/6] mtd: nand: Check length of ID before reading bits
 per cell
Message-ID: <20150105203808.GE9759@ld-irv-0074>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-2-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417525136-25731-2-git-send-email-ezequiel.garcia@imgtec.com>
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 linux-mtd@lists.infradead.org, arnaud.mouiche@invoxia.com,
 Huang Shijie <shijie8@gmail.com>, James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A little tangential to the big-picture discussion, but I'll get this out
there:

On Tue, Dec 02, 2014 at 09:58:51AM -0300, Ezequiel Garcia wrote:
> The table-based NAND identification currently reads the number
> of bits per cell from the 3rd byte of the extended ID. This is done
> for the so-called 'full ID' devices; i.e. devices that have a known
> length ID.
> 
> However, if the ID length is shorter than three, there's no 3rd byte,
> and so it's wrong to read the bits per cell from there. Fix this by
> adding a check for the ID length.

You're right about the problem, but I'm not sure about the fix. I
actually don't know why we are using the ID bytes to guess at the number
of bits per cell here; the point of the full-id checks is that with some
NAND, we just can't decode all the information reliably from the ID.

I'd kinda rather just see bits-per-cell represented as a separate bit;
either a new field, or in the 'options' field.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> ---
>  drivers/mtd/nand/nand_base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 5b5c627..a4c9cee 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3589,7 +3589,8 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>  		mtd->erasesize = type->erasesize;
>  		mtd->oobsize = type->oobsize;
>  
> -		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
> +		if (type->id_len > 2)
> +			chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
>  		chip->chipsize = (uint64_t)type->chipsize << 20;
>  		chip->options |= type->options;
>  		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);

Brian
