Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQwh9-0001QB-6O
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 15:19:28 +0000
Date: Thu, 7 Jun 2018 17:19:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: mxc: set spare area size register explicitly
Message-ID: <20180607171911.7a7ee649@xps13>
In-Reply-To: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
References: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Martin,

On Sun,  3 Jun 2018 13:31:35 +0200, Martin Kaiser <martin@kaiser.cx>
wrote:

> The v21 version of the NAND flash controller contains a Spare Area Size
> Register (SPAS) at offset 0x10. Its setting defaults to the maximum
> spare area size of 218 bytes. The size that is set in this register is
> used by the controller when it calculates the ECC bytes internally in
> hardware.
>=20
> Usually, this register is updated from settings in the IIM fuses when
> the system is booting from nand flash. For other boot media, however,

s/nand/NAND

> the SPAS register remains at the default setting, which may not work for
> the particular flash chip on the board. The same goes for flash chips
> whose configuration cannot be set in the IIM fuses (e.g. chips with 2k
> sector size and 128 bytes spare area size can't be configured in the IIM
> fuses on imx25 systems).
>=20
> Set the SPAS register explicitly during the preset operation. Derive the
> register value from mtd->oobsize that was detected during probe by
> decoding the flash chip's ID bytes.
>=20
> While at it, rename the define for the spare area register's offset to
> NFC_V21_RSLTSPARE_AREA. The register at offset 0x10 on v1 controllers is
> different from the register on v21 controllers.
>=20
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mtd/nand/raw/mxc_nand.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_n=
and.c
> index 45786e7..c2f8572 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -48,7 +48,7 @@
>  #define NFC_V1_V2_CONFIG		(host->regs + 0x0a)
>  #define NFC_V1_V2_ECC_STATUS_RESULT	(host->regs + 0x0c)
>  #define NFC_V1_V2_RSLTMAIN_AREA		(host->regs + 0x0e)
> -#define NFC_V1_V2_RSLTSPARE_AREA	(host->regs + 0x10)
> +#define NFC_V21_RSLTSPARE_AREA		(host->regs + 0x10)
>  #define NFC_V1_V2_WRPROT		(host->regs + 0x12)
>  #define NFC_V1_UNLOCKSTART_BLKADDR	(host->regs + 0x14)
>  #define NFC_V1_UNLOCKEND_BLKADDR	(host->regs + 0x16)
> @@ -1274,6 +1274,9 @@ static void preset_v2(struct mtd_info *mtd)
>  	writew(config1, NFC_V1_V2_CONFIG1);
>  	/* preset operation */
> =20
> +	/* spare area size in 16bit words */

I thought I understood the problem with your commit message but
then I don't get this comment. What's the link between 16-bit buses? Is
this preset valid for both 8 and 16-bit bus width?

> +	writew(mtd->oobsize >> 1, NFC_V21_RSLTSPARE_AREA);
> +

If this is for dividing per two oobsize value, I would really prefer a
'/ 2' and let the compiler optimize things. Unless the spec is explicit
about some shifting of course.

>  	/* Unlock the internal RAM Buffer */
>  	writew(0x2, NFC_V1_V2_CONFIG);
> =20

Thanks for fixing this.

Regards,
Miqu=C3=A8l
