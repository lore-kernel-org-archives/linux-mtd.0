Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d09rL-0005Ak-EU
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 16:50:41 +0000
From: Han Xu <han.xu@nxp.com>
To: Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] mtd: nand: gpmi: Fix gpmi_nand_init() error path
Date: Mon, 17 Apr 2017 16:50:12 +0000
Message-ID: <DBXPR04MB080D799B106D9BF9605F2A997060@DBXPR04MB080.eurprd04.prod.outlook.com>
References: <1491813318-4417-1-git-send-email-boris.brezillon@free-electrons.com>,
 <92f29571-c6e3-1860-804e-0635624b65fa@gmail.com>
In-Reply-To: <92f29571-c6e3-1860-804e-0635624b65fa@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marek Vasut <marek.vasut@gmail.com>
Sent: Saturday, April 15, 2017 8:58 AM
To: Boris Brezillon; Richard Weinberger; linux-mtd@lists.infradead.org
Cc: David Woodhouse; Brian Norris; Cyrille Pitchen; Han Xu; Shawn Guo; Sasc=
ha Hauer; Leonard Crestez; Masahiro Yamada
Subject: Re: [PATCH 1/2] mtd: nand: gpmi: Fix gpmi_nand_init() error path

On 04/10/2017 10:35 AM, Boris Brezillon wrote:
> The GPMI driver is wrongly assuming that nand_release() can safely be
> called on an uninitialized/unregistered NAND device.
>
> Add a new err_nand_cleanup label in the error path and only execute if
> nand_scan_tail() succeeded.
>
> Note that we now call nand_cleanup() instead of nand_release()
> (nand_release() is actually grouping the mtd_device_unregister() and
> nand_cleanup() in one call) because there's no point in trying to
> unregister a device that has never been registered.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Han Xu <han.xu@nxp.com>
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index d52139635b67..92279a0d52f1 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -2048,18 +2048,20 @@ static int gpmi_nand_init(struct gpmi_nand_data *=
this)
>
>       ret =3D nand_boot_init(this);
>       if (ret)
> -             goto err_out;
> +             goto err_nand_cleanup;
>       ret =3D chip->scan_bbt(mtd);
>       if (ret)
> -             goto err_out;
> +             goto err_nand_cleanup;
>
>       ret =3D mtd_device_register(mtd, NULL, 0);
>       if (ret)
> -             goto err_out;
> +             goto err_nand_cleanup;
>       return 0;
>
> +err_nand_cleanup:
> +     nand_cleanup(chip);
>  err_out:
> -     gpmi_nand_exit(this);
> +     gpmi_free_dma_buffer(this);
>       return ret;
>  }
>
>


--
Best regards,
Marek Vasut
