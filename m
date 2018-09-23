Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g42hV-000647-Hz
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2018 11:37:34 +0000
Date: Sun, 23 Sep 2018 13:37:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Nick
 Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] mtd: rawnand: Use proper enum for flctl_dma_fifo0_transfer
Message-ID: <20180923133708.58171117@xps13>
In-Reply-To: <20180920233024.28534-1-natechancellor@gmail.com>
References: <20180920233024.28534-1-natechancellor@gmail.com>
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

Hi Nathan,

Nathan Chancellor <natechancellor@gmail.com> wrote on Thu, 20 Sep 2018
16:30:25 -0700:

> Clang warns when one enumerated type is converted implicitly to another:
>=20
> drivers/mtd/nand/raw/sh_flctl.c:483:46: warning: implicit conversion
> from enumeration type 'enum dma_transfer_direction' to different
> enumeration type 'enum dma_data_direction' [-Wenum-conversion]
>                 flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM=
) > 0)
>                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> drivers/mtd/nand/raw/sh_flctl.c:542:46: warning: implicit conversion
> from enumeration type 'enum dma_transfer_direction' to different
> enumeration type 'enum dma_data_direction' [-Wenum-conversion]
>                 flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV=
) > 0)
>                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> 2 warnings generated.
>=20
> Use the proper enums from dma_data_direction to satisfy Clang.
>=20
> DMA_MEM_TO_DEV =3D DMA_TO_DEVICE =3D 1
> DMA_DEV_TO_MEM =3D DMA_FROM_DEVICE =3D 2
>=20
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/mtd/nand/raw/sh_flctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_fl=
ctl.c
> index c0c0798f268f..4d20d033de7b 100644
> --- a/drivers/mtd/nand/raw/sh_flctl.c
> +++ b/drivers/mtd/nand/raw/sh_flctl.c
> @@ -480,7 +480,7 @@ static void read_fiforeg(struct sh_flctl *flctl, int =
rlen, int offset)
> =20
>  	/* initiate DMA transfer */
>  	if (flctl->chan_fifo0_rx && rlen >=3D 32 &&
> -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) > 0)
> +		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_FROM_DEVICE) > 0)
>  			goto convert;	/* DMA success */
> =20
>  	/* do polling transfer */
> @@ -539,7 +539,7 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, =
int rlen,
> =20
>  	/* initiate DMA transfer */
>  	if (flctl->chan_fifo0_tx && rlen >=3D 32 &&
> -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
> +		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_TO_DEVICE) > 0)
>  			return;	/* DMA success */
> =20
>  	/* do polling transfer */


Applied on nand/next with the subject prefix changed to

    mtd: rawnand: sh_flctl:


Thanks,
Miqu=C3=A8l
