Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erjfd-0002YV-6Y
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 12:20:24 +0000
From: Richard Weinberger <richard@nod.at>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mtd: ubi: block: Fix error for write access
Date: Fri, 02 Mar 2018 13:21:27 +0100
Message-ID: <304002421.gctIWao8Ge@blindfold>
In-Reply-To: <20180302111618.22820-1-romain.izard.pro@gmail.com>
References: <20180302111618.22820-1-romain.izard.pro@gmail.com>
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

Am Freitag, 2. M=E4rz 2018, 12:16:18 CET schrieb Romain Izard:
> When opening a device with write access, ubiblock_open returns an error
> code. Currently, this error code is -EPERM, but this is not the right
> value.
>=20
> The open function for other block devices returns -EROFS when opening
> read-only devices with FMODE_WRITE set. When used with dm-verity, the
> veritysetup userspace tool is expecting EROFS, and refuses to use the
> ubiblock device.
>=20
> Use -EROFS for ubiblock as well. As a result, veritysetup accepts the
> ubiblock device as valid.
>=20
> Fixes: 9d54c8a33eec (UBI: R/O block driver on top of UBI volumes)
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
>  drivers/mtd/ubi/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index b210fdb31c98..4533423cf2aa 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -242,7 +242,7 @@ static int ubiblock_open(struct block_device *bdev,
> fmode_t mode) * in any case.
>  	 */
>  	if (mode & FMODE_WRITE) {
> -		ret =3D -EPERM;
> +		ret =3D -EROFS;

Queued for -next.

Thanks,
//richard
