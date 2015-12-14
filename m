Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8XFa-0000rT-Gy
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 17:49:32 +0000
Date: Mon, 14 Dec 2015 18:49:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] mtd: bcm47xxnflash: really unregister NAND on device
 removal
Message-ID: <20151214184907.3460eb71@bbrezillon>
In-Reply-To: <1449623099-21634-1-git-send-email-computersforpeace@gmail.com>
References: <1449623099-21634-1-git-send-email-computersforpeace@gmail.com>
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

On Tue,  8 Dec 2015 17:04:59 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> The field bcma_nflash::mtd is never set to be non-zero anywhere, but we
> test for it in the removal path. So the MTD is never unregistered.
>=20
> Also, we should use nand_release(), not mtd_device_unregister().
>=20
> Finally, we don't need to use the 'platdata' for stashing/retrieving our
> *driver* data -- that's what *_{get,set}_drvdata() are for.
>=20
> So, kill off bcm_nflash::mtd, and stash the struct bcm47xxnflash in
> drvdata instead. Also move the forward declaration of mtd_info up a bit,
> since struct bcma_sflash should be using it.
>=20
> Caught while inspecting other changes being made to this driver. Compile
> tested only.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: "Rafa=C5=82 Mi=C5=82ecki" <zajec5@gmail.com>
> Cc: linux-wireless@vger.kernel.org

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Might have some small conflict with Boris' NAND/MTD refactoring patch set=
. I
> can rebase this small one if his gets in proper shape. Just wanted to get=
 this
> out there.
>=20
>  drivers/mtd/nand/bcm47xxnflash/main.c       | 7 ++++---
>  include/linux/bcma/bcma_driver_chipcommon.h | 6 ++----
>  2 files changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm=
47xxnflash/main.c
> index 9ba0c0f2cd9b..0b3acc439181 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/main.c
> +++ b/drivers/mtd/nand/bcm47xxnflash/main.c
> @@ -49,6 +49,8 @@ static int bcm47xxnflash_probe(struct platform_device *=
pdev)
>  		return err;
>  	}
> =20
> +	platform_set_drvdata(pdev, b47n);
> +
>  	err =3D mtd_device_parse_register(&b47n->mtd, probes, NULL, NULL, 0);
>  	if (err) {
>  		pr_err("Failed to register MTD device: %d\n", err);
> @@ -60,10 +62,9 @@ static int bcm47xxnflash_probe(struct platform_device =
*pdev)
> =20
>  static int bcm47xxnflash_remove(struct platform_device *pdev)
>  {
> -	struct bcma_nflash *nflash =3D dev_get_platdata(&pdev->dev);
> +	struct bcm47xxnflash *nflash =3D platform_get_drvdata(pdev);
> =20
> -	if (nflash->mtd)
> -		mtd_device_unregister(nflash->mtd);
> +	nand_release(&nflash->mtd);
> =20
>  	return 0;
>  }
> diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/=
bcma/bcma_driver_chipcommon.h
> index cf038431a5cc..db51a6ffb7d6 100644
> --- a/include/linux/bcma/bcma_driver_chipcommon.h
> +++ b/include/linux/bcma/bcma_driver_chipcommon.h
> @@ -579,6 +579,8 @@ struct bcma_pflash {
>  };
> =20
>  #ifdef CONFIG_BCMA_SFLASH
> +struct mtd_info;
> +
>  struct bcma_sflash {
>  	bool present;
>  	u32 window;
> @@ -592,13 +594,9 @@ struct bcma_sflash {
>  #endif
> =20
>  #ifdef CONFIG_BCMA_NFLASH
> -struct mtd_info;
> -
>  struct bcma_nflash {
>  	bool present;
>  	bool boot;		/* This is the flash the SoC boots from */
> -
> -	struct mtd_info *mtd;
>  };
>  #endif
> =20



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
