Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dgnlm-0006P8-DX
 for linux-mtd@lists.infradead.org; Sun, 13 Aug 2017 07:57:12 +0000
Date: Sun, 13 Aug 2017 09:56:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pan Bian <bianpan2016@163.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: mtd: nand: use dma_mapping_error to check map errors
Message-ID: <20170813095648.4a2a2764@bbrezillon>
In-Reply-To: <1502202942-23984-1-git-send-email-bianpan2016@163.com>
References: <1502202942-23984-1-git-send-email-bianpan2016@163.com>
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

Le Tue,  8 Aug 2017 22:35:42 +0800,
Pan Bian <bianpan2016@163.com> a =C3=A9crit :

> The return value of dma_map_single() should be checked by
> dma_mapping_error(). However, in function flctl_dma_fifo0_transfer(), its
> return value is checked against NULL, which could result in failures.

Applied, thanks.

Boris

>=20
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
>  drivers/mtd/nand/sh_flctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 891ac7b..2404d66 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -411,7 +411,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *=
flctl, unsigned long *buf,
> =20
>  	dma_addr =3D dma_map_single(chan->device->dev, buf, len, dir);
> =20
> -	if (dma_addr)
> +	if (!dma_mapping_error(chan->device->dev, dma_addr))
>  		desc =3D dmaengine_prep_slave_single(chan, dma_addr, len,
>  			tr_dir, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> =20
