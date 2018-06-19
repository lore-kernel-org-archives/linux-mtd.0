Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV9j3-0005ZB-Sb
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 06:02:48 +0000
Date: Tue, 19 Jun 2018 08:02:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 3/6] mtd: rawnand: micron: add fixup for ONFI
 revision
Message-ID: <20180619080224.3bc1efa3@bbrezillon>
In-Reply-To: <20180619053125.16792-4-chris.packham@alliedtelesis.co.nz>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-4-chris.packham@alliedtelesis.co.nz>
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

On Tue, 19 Jun 2018 17:31:22 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the
> revision number field of the ONFI parameter page. Rather than rejecting
> these outright assume ONFI version 1.0 if the revision number is 00 00.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> This is now qualified on vendor == MICRON. I haven't qualified this
> based on specific chips the ABAFA (id=d1) and ABBFA (id=a1) variants are
> documented to have this behaviour.
> 
> Changes in v2:
> - use fixup_onfi_param_page
> 
>  drivers/mtd/nand/raw/nand_micron.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index 0af45b134c0c..e582c9e61715 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -287,6 +287,14 @@ static int micron_nand_init(struct nand_chip *chip)
>  	return 0;
>  }
>  
> +static void micron_fixup_onfi_param_page(struct nand_chip *chip,
> +					 struct nand_onfi_params *p)
> +{

Could you add a comment repeating what you have in your commit message
here?

With this addressed

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> +	if (le16_to_cpu(p->revision) == 0)
> +		p->revision = cpu_to_le16(1 << 1);
> +}
> +
>  const struct nand_manufacturer_ops micron_nand_manuf_ops = {
>  	.init = micron_nand_init,
> +	.fixup_onfi_param_page = micron_fixup_onfi_param_page,
>  };
