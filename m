Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewNi0-0003v1-13
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 07:53:58 +0000
From: Richard Weinberger <richard@nod.at>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2 v2] mtd: ubi: use put_device() if device_register fail
Date: Thu, 15 Mar 2018 08:55:09 +0100
Message-ID: <5296799.FRhcbj8Hd9@blindfold>
In-Reply-To: <1521098431-29565-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1521098431-29565-1-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 15. M=E4rz 2018, 08:20:31 CET schrieb Arvind Yadav:
> if device_register() returned an error! Always use put_device()
> to give up the reference initialized.

Like DaveM said, there is no need to shout and use "!".
=20
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
> change in v2:
>         Fix use-after-free bug. move put_device() after cdev_del().
>=20
>  drivers/mtd/ubi/vmt.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 3fd8d7f..93c6163 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -610,6 +610,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct
> ubi_volume *vol)
>=20
>  out_cdev:
>  	cdev_del(&vol->cdev);
> +	put_device(&vol->dev);
>  	return err;

The more I dig into device code, the more questions I have.
Why is cdev_del() not part of the release function?

Thanks,
//richard
