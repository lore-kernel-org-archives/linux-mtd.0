Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNxOP-0005zY-Ag
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 02:28:14 +0000
Message-ID: <4F9B56A3.3060601@freescale.com>
Date: Sat, 28 Apr 2012 10:32:03 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 08/10] mtd: gpmi-nand: utilize oob_requested parameter
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-9-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Wolfram Sang <w.sang@pengutronix.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA04=D4=C228=C8=D5 09:29, Brian Norris =D0=B4=B5=C0:
> Don't read OOB if the caller didn't request it.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   35 +++++++++++++++++-------=
-------
>  1 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index ec16f2e..805bcf3 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -907,22 +907,25 @@ static int gpmi_ecc_read_page(struct mtd_info *mt=
d, struct nand_chip *chip,
>  		mtd->ecc_stats.corrected +=3D corrected;
>  	}
> =20
> -	/*
> -	 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob() for
> -	 * details about our policy for delivering the OOB.
> -	 *
> -	 * We fill the caller's buffer with set bits, and then copy the block
> -	 * mark to th caller's buffer. Note that, if block mark swapping was
> -	 * necessary, it has already been done, so we can rely on the first
> -	 * byte of the auxiliary buffer to contain the block mark.
> -	 */
> -	memset(chip->oob_poi, ~0, mtd->oobsize);
> -	chip->oob_poi[0] =3D ((uint8_t *) auxiliary_virt)[0];
> +	if (oob_required) {
> +		/*
> +		 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob()
> +		 * for details about our policy for delivering the OOB.
> +		 *
> +		 * We fill the caller's buffer with set bits, and then copy the
> +		 * block mark to th caller's buffer. Note that, if block mark
> +		 * swapping was necessary, it has already been done, so we can
> +		 * rely on the first byte of the auxiliary buffer to contain
> +		 * the block mark.
> +		 */
> +		memset(chip->oob_poi, ~0, mtd->oobsize);
> +		chip->oob_poi[0] =3D ((uint8_t *) auxiliary_virt)[0];
> =20
> -	read_page_swap_end(this, buf, mtd->writesize,
> -			this->payload_virt, this->payload_phys,
> -			nfc_geo->payload_size,
> -			payload_virt, payload_phys);
> +		read_page_swap_end(this, buf, mtd->writesize,
> +				this->payload_virt, this->payload_phys,
> +				nfc_geo->payload_size,
> +				payload_virt, payload_phys);
> +	}
>  exit_nfc:
>  	return ret;
>  }
it's ok to me.

Acked-by: Huang Shijie <b32955@freescale.com>
