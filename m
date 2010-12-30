Received: from smtp4-g21.free.fr ([212.27.42.4])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PYEFP-0000j2-Rs
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2010 08:52:37 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: fix for printing NAND model
Date: Thu, 30 Dec 2010 09:52:30 +0100
References: <4D1C4338.2030003@rw-gmbh.de>
In-Reply-To: <4D1C4338.2030003@rw-gmbh.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201012300952.30921.ffainelli@freebox.fr>
Cc: Ralf =?iso-8859-1?q?R=F6sch?= <ralf.roesch@rw-gmbh.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thursday 30 December 2010 09:30:48 Ralf R=F6sch wrote:
> Signed-off-by: Ralf Roesch <ralf.roesch@rw-gmbh.de>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 1f75a1b..f29183a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3157,7 +3157,7 @@ ident_done:
>  	printk(KERN_INFO "NAND device: Manufacturer ID:"
>  		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
>  		nand_manuf_ids[maf_idx].name,
> -	chip->onfi_version ? type->name : chip->onfi_params.model);
> +	chip->onfi_version ? chip->onfi_params.model : type->name);
>   	return type;
>  }

The same fix has already been submitted and applied a couple of days ago:=20
http://patchwork.ozlabs.org/patch/75222/
=2D-
=46lorian
