Received: from smtp4-g21.free.fr ([212.27.42.4])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PS9aV-0001l7-5z
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2010 14:41:16 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: nand: rearrange ONFI revision checking,
	add ONFI 2.3
Date: Mon, 13 Dec 2010 15:40:52 +0100
References: <1292142213-645-1-git-send-email-computersforpeace@gmail.com>
	<1292142213-645-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1292142213-645-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201012131540.52835.ffainelli@freebox.fr>
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 12 December 2010 09:23:33 Brian Norris wrote:
> In checking for the ONFI revision, the first conditional (for checking
> "unsupported" ONFI) seems unnecessary.  All ONFI revisions should be
> backwards-compatible; even if this is not the case on some newer ONFI
> revision, it should simply fail the second version-checking if-else block
> (i.e., the bit-fields for 1.0, 2.0, etc. would not be set to 1). Thus, we
> move our "unsupported" condition after having checked each bit field.
> 
> Also, it's simple enough to add a condition for ONFI revision 2.3. Note
> that this does *NOT* mean we handle all new features of ONFI versions
> above 1.0.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Florian Fainelli <ffainelli@freebox.fr>

> ---
>  drivers/mtd/nand/nand_base.c |   20 ++++++++++++--------
>  1 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 38b5eb0..2237a87 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2872,20 +2872,24 @@ static int nand_flash_detect_onfi(struct mtd_info
> *mtd, struct nand_chip *chip,
> 
>  	/* check version */
>  	val = le16_to_cpu(p->revision);
> -	if (val == 1 || val > (1 << 4)) {
> -		printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
> -								__func__, val);
> -		return 0;
> -	}
> -
> -	if (val & (1 << 4))
> +	if (val & (1 << 5))
> +		chip->onfi_version = 23;
> +	else if (val & (1 << 4))
>  		chip->onfi_version = 22;
>  	else if (val & (1 << 3))
>  		chip->onfi_version = 21;
>  	else if (val & (1 << 2))
>  		chip->onfi_version = 20;
> -	else
> +	else if (val & (1 << 1))
>  		chip->onfi_version = 10;
> +	else
> +		chip->onfi_version = 0;
> +
> +	if (!chip->onfi_version) {
> +		printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
> +								__func__, val);
> +		return 0;
> +	}
> 
>  	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
>  	sanitize_string(p->model, sizeof(p->model));
