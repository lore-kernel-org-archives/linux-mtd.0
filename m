Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbS38-0001On-0L
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 09:26:50 +0000
Message-ID: <5270D16C.6030802@freescale.com>
Date: Wed, 30 Oct 2013 17:29:16 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 balbi@ti.com, dedekind1@gmail.com
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
> @@ -1077,6 +1221,12 @@ static int m25p_probe(struct spi_device *spi)
>   		flash->addr_width =3D 4;
>   		if (JEDEC_MFR(info->jedec_id) =3D=3D CFI_MFR_AMD) {
>   			/* Dedicated 4-byte command set */
> +			if (flash->quad_read)
> +				flash->read_opcode =3D OPCODE_QUAD_READ_4B;
> +			else
> +				flash->read_opcode =3D flash->fast_read ?
> +					OPCODE_FAST_READ_4B :
> +					OPCODE_NORM_READ_4B;
>   			flash->read_opcode =3D flash->fast_read ?
>   				OPCODE_FAST_READ_4B :
>   				OPCODE_NORM_READ_4B;
you missed to remove these three lines above?

thanks
Huang Shijie
