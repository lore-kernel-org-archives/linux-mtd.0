Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGDpQ-0003Sj-3B
 for linux-mtd@lists.infradead.org; Sun, 11 Dec 2016 23:46:49 +0000
Received: by mail-ua0-x241.google.com with SMTP id 50so6999070uae.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 15:46:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1481302167-28044-4-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 10:46:03 +1100
Message-ID: <CACPK8Xcj4P34-4krGbnimVG89wMcHoRX4XJ66-_7KtAt6-vTkA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: aspeed: used a label property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> This can be used to easily identify a chip on a system with multiple
> chips.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Our userspace benefits from having this.

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 99302b0d7786..9119c0ca86b6 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -676,6 +676,8 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_c=
ontroller *controller,
>                 nor->prepare =3D aspeed_smc_prep;
>                 nor->unprepare =3D aspeed_smc_unprep;
>
> +               mtd->name =3D of_get_property(child, "label", NULL);
> +
>                 ret =3D aspeed_smc_chip_setup_init(chip, r);
>                 if (ret)
>                         break;
> --
> 2.7.4
>
