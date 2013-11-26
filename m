Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlD3t-0002LR-Fx
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 07:27:58 +0000
Message-ID: <52944E45.6070803@freescale.com>
Date: Tue, 26 Nov 2013 15:31:17 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
In-Reply-To: <1385382728-7913-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 balbi@ti.com, ezequiel.garcia@free-electrons.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8825=E6=97=A5 20:32, Pekon Gupta =E5=86=99=
=E9=81=93:
> This patch is alternative implementation for following commit which int=
roduced
> NAND_BUSWIDTH_AUTO for detection of bus-width during device probe
>     commit 64b37b2a63eb2f80b65c7185f0013f8ffc637ae3
>     Author:     Matthieu CASTET<matthieu.castet@parrot.com>
>     AuthorDate: 2012-11-06
>
> As NAND device is identified only during nand_scan_ident(), so this pat=
ch
> assumes that NAND driver may un-initialized or partially congigured whi=
le
> calling nand_scan_ident(). Hence, this patch does following:
>
> (1) Temporarily configures 'bus-width=3Dx8' mode before reading ONFI pa=
rameters,
>   (as required by ONFI spec Refer[*]), and then reverts to original bus=
-width.
>   This allows nand_flash_detect_onfi() to read ONFI paramers page even =
if
>   bus-width was un-initialized or incorrectly configured.
>
> (2) reconfigures driver with correct bus-width determined by:
>   - either by reading ONFI param OR
>   - as found in nand_flash_id[] table
>   So, any driver-specific callback overrides should be done post nand_s=
can_ident.
>
> This patch removes any dependency on either 'DT binding' or 'platform d=
ata' to
> for determining NAND device bus-width.
>
> [*] Reference: ONFI spec version 3.1 (section 3.5.3. Target Initializat=
ion)
>      "The Read ID and Read Parameter Page commands only use the lower 8=
-bits
>       of the data bus. The host shall not issue commands that use a wor=
d
>       data width on x16 devices until the host determines the device su=
pports
>       a 16-bit data bus width in the parameter page."
>
>
> Signed-off-by: Pekon Gupta<pekon@ti.com>
> ---
>   drivers/mtd/nand/nand_base.c | 43 ++++++++++++++++++-----------------=
--------
>   include/linux/mtd/nand.h     |  7 -------
>   2 files changed, 18 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index bd39f7b..3d581a4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2942,14 +2942,9 @@ static int nand_flash_detect_onfi(struct mtd_inf=
o *mtd, struct nand_chip *chip,
>   		chip->read_byte(mtd) !=3D 'F' || chip->read_byte(mtd) !=3D 'I')
>   		return 0;
>
> -	/*
> -	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> -	 * with NAND_BUSWIDTH_16
> -	 */
> -	if (chip->options&  NAND_BUSWIDTH_16) {
> -		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
> -		return 0;
> -	}
> +	/* ONFI must be probed in 8-bit mode only, so switch to x8 mode */
> +	if (chip->options&  NAND_BUSWIDTH_16)
> +		nand_set_defaults(chip, 0);
>
>   	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>   	for (i =3D 0; i<  3; i++) {
> @@ -2962,7 +2957,7 @@ static int nand_flash_detect_onfi(struct mtd_info=
 *mtd, struct nand_chip *chip,
>
>   	if (i =3D=3D 3) {
>   		pr_err("Could not find valid ONFI parameter page; aborting\n");
> -		return 0;
> +		goto return_error;
>   	}
>
>   	/* Check version */
> @@ -2980,7 +2975,7 @@ static int nand_flash_detect_onfi(struct mtd_info=
 *mtd, struct nand_chip *chip,
>
>   	if (!chip->onfi_version) {
>   		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
> -		return 0;
> +		goto return_error;
>   	}
>
>   	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> @@ -3033,6 +3028,12 @@ static int nand_flash_detect_onfi(struct mtd_inf=
o *mtd, struct nand_chip *chip,
>   	}
If it is 16bit bus, could we reconfigure the bus width in here?
it's better to limit the influence only in the ONFI code.

thanks
Huang Shijie


>
>   	return 1;
