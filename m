Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3gRg-0006wK-1o
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2016 09:42:29 +0000
Date: Mon, 7 Nov 2016 10:41:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Frans Klaver <fransklaver@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use uncached MMIO access for BCM53573
Message-ID: <20161107104156.0f79c416@bbrezillon>
In-Reply-To: <1471263690-32512-1-git-send-email-zajec5@gmail.com>
References: <1471263690-32512-1-git-send-email-zajec5@gmail.com>
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

On Mon, 15 Aug 2016 14:21:28 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> BCM53573 is a new series of Broadcom's SoCs. It's based on ARM and uses
> this old ChipCommon-based flash access. Early tests resulted in flash
> corruptions that were tracked down to using cached MMIO for flash read
> access. Switch to ioremap_nocache conditionally to support BCM53573 and
> don't break performance on old MIPS devices.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bc=
m47xxsflash.c
> index 1c65c15..514be04 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -296,16 +296,30 @@ static int bcm47xxsflash_bcma_probe(struct platform=
_device *pdev)
>  		dev_err(dev, "can't request region for resource %pR\n", res);
>  		return -EBUSY;
>  	}
> -	b47s->window =3D ioremap_cache(res->start, resource_size(res));
> -	if (!b47s->window) {
> -		dev_err(dev, "ioremap failed for resource %pR\n", res);
> -		return -ENOMEM;
> -	}
> =20
>  	b47s->bcma_cc =3D container_of(sflash, struct bcma_drv_cc, sflash);
>  	b47s->cc_read =3D bcm47xxsflash_bcma_cc_read;
>  	b47s->cc_write =3D bcm47xxsflash_bcma_cc_write;
> =20
> +	/*
> +	 * On old MIPS devices cache was magically invalidated when needed,
> +	 * allowing us to use cached access and gain some performance. Trying
> +	 * the same on ARM based BCM53573 results in flash corruptions, we need
> +	 * to use uncached access for it.
> +	 *
> +	 * It may be arch specific, but right now there is only 1 ARM SoC using
> +	 * this driver, so let's follow Broadcom's reference code and check
> +	 * ChipCommon revision.
> +	 */
> +	if (b47s->bcma_cc->core->id.rev =3D=3D 54)
> +		b47s->window =3D ioremap_nocache(res->start, resource_size(res));
> +	else
> +		b47s->window =3D ioremap_cache(res->start, resource_size(res));
> +	if (!b47s->window) {
> +		dev_err(dev, "ioremap failed for resource %pR\n", res);
> +		return -ENOMEM;
> +	}
> +
>  	switch (b47s->bcma_cc->capabilities & BCMA_CC_CAP_FLASHT) {
>  	case BCMA_CC_FLASHT_STSER:
>  		b47s->type =3D BCM47XXSFLASH_TYPE_ST;
