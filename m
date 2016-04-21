Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atL6E-0005s6-8O
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 20:21:18 +0000
Date: Thu, 21 Apr 2016 22:20:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-mtd@lists.infradead.org, Eva Rachel Retuya <eraretuya@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Manuel =?UTF-8?B?UMOpZ291cmk=?=
 =?UTF-8?B?w6ktR29ubmFyZA==?= <mpg@elzevir.fr>, Janani Ravichandran
 <janani.rvchndrn@gmail.com>, devel@driverdev.osuosl.org (open list:STAGING
 SUBSYSTEM), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH V3 05/11] staging: mt29f_spinand: set ECC algorithm
 explicitly
Message-ID: <20160421222056.1deb7d13@bbrezillon>
In-Reply-To: <1460926387-9563-6-git-send-email-zajec5@gmail.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-6-git-send-email-zajec5@gmail.com>
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

Hi Greg,

On Sun, 17 Apr 2016 22:53:01 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).

Do you mind if I take this patch through the NAND tree in order to avoid
dependency problems?

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/stag=
ing/mt29f_spinand/mt29f_spinand.c
> index f503699..e389009 100644
> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -900,6 +900,7 @@ static int spinand_probe(struct spi_device *spi_nand)
>  	chip->ecc.write_page =3D spinand_write_page_hwecc;
>  #else
>  	chip->ecc.mode	=3D NAND_ECC_SOFT;
> +	chip->ecc.algo	=3D NAND_ECC_HAMMING;
>  	if (spinand_disable_ecc(spi_nand) < 0)
>  		dev_info(&spi_nand->dev, "%s: disable ecc failed!\n",
>  			 __func__);



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
