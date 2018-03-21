Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyYgk-0007bY-4e
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 08:01:40 +0000
Date: Wed, 21 Mar 2018 09:01:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: dwmw2@infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: devices: check mtd_device_register() return code
Message-ID: <20180321090123.07d55e32@xps13>
In-Reply-To: <20180321053709.GA5611@seema-Inspiron-15-3567>
References: <20180321053709.GA5611@seema-Inspiron-15-3567>
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

Hi Arushi,

On Wed, 21 Mar 2018 11:07:09 +0530, Arushi Singhal
<arushisinghal19971997@gmail.com> wrote:

> stfsm_probe() misses error handling of mtd_device_register().
>=20
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
>  drivers/mtd/devices/st_spi_fsm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_sp=
i_fsm.c
> index 7bc29d7..e1aa4f8 100644
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -2125,7 +2125,13 @@ static int stfsm_probe(struct platform_device *pde=
v)
>  		(long long)fsm->mtd.size, (long long)(fsm->mtd.size >> 20),
>  		fsm->mtd.erasesize, (fsm->mtd.erasesize >> 10));
> =20
> -	return mtd_device_register(&fsm->mtd, NULL, 0);
> +	ret =3D mtd_device_register(&fsm->mtd, NULL, 0);
> +	if (ret) {
> +		pr_err("Failed to register device\n");
> +		return ret;
> +	}
> +
> +	return 0;

I don't think this bring anything. However, if you want to fix
something you should jump below on error to disable the clock instead
of returning 'ret' directly.

> =20
>  err_clk_unprepare:
>  	clk_disable_unprepare(fsm->clk);

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
