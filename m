Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbSoy-0004V6-57
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 10:16:16 +0000
Message-ID: <5270DD0C.2090902@freescale.com>
Date: Wed, 30 Oct 2013 18:18:52 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, dedekind1@gmail.com, balbi@ti.com,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8830=E6=97=A5 17:20, Sourav Poddar =E5=86=
=99=E9=81=93:
> @@ -1051,6 +1184,15 @@ static int m25p_probe(struct spi_device *spi)
>   	flash->page_size =3D info->page_size;
>   	flash->mtd.writebufsize =3D flash->page_size;
>
> +	if (spi->mode&  SPI_RX_QUAD&&  info->flags&  M25P80_QUAD_READ) {
> +		ret =3D set_quad_mode(flash, info->jedec_id);
> +		if (ret) {
> +			dev_err(&flash->spi->dev, "quad mode not supported\n");
> +			return ret;
> +		}
> +		flash->quad_read =3D true;
> +	}
Do we really need the M25P80_QUAD_READ?

Some NOR flash can supports both the QUAD read and DDR QUAD read, while=20
some NOR flash only supports the
QUAD read.

when we try to add the DDR QUAD READ support, should we add another=20
flag, such as M25P80_DDR_QUAD_READ?

Add Mark for this email.

I think you'd better CC this patch to the SPI maillist & Mark,.


thanks
Huang Shijie
