Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkRE4-0001KD-PR
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 08:41:28 +0000
Date: Wed, 23 Aug 2017 10:40:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nandsim: remove debugfs entries in error path
Message-ID: <20170823104052.2cba1eb2@bbrezillon>
In-Reply-To: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
References: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
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

On Wed, 23 Aug 2017 09:03:04 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> The debugfs entries must be removed before an error is returned in the
> probe function. Otherwise another try to load the module fails and when
> the debugfs files are accessed without the module loaded, the kernel
> still tries to call a function in that module.

Unfortunately this patch conflicts with [1], but feel free to send it to
stable with my

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Regards,

Boris

[1]http://git.infradead.org/l2-mtd.git/commit/e8e3edb95ce6a146bc774b6cfad35=
53f4383edc8

>=20
> Fixes: 5346c27c5fed ("mtd: nandsim: Introduce debugfs infrastructure")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/nand/nandsim.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 03a0d057bf2f..e4211c3cc49b 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -2373,6 +2373,7 @@ static int __init ns_init_module(void)
>          return 0;
> =20
>  err_exit:
> +	nandsim_debugfs_remove(nand);
>  	free_nandsim(nand);
>  	nand_release(nsmtd);
>  	for (i =3D 0;i < ARRAY_SIZE(nand->partitions); ++i)
