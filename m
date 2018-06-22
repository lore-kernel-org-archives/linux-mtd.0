Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWKNY-0008Ga-5G
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 11:37:25 +0000
Date: Fri, 22 Jun 2018 13:37:02 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: dataflash: Use ULL suffix for 64-bit constants
Message-ID: <20180622133702.73698862@bbrezillon>
In-Reply-To: <20180622070425.26573-1-geert@linux-m68k.org>
References: <20180622070425.26573-1-geert@linux-m68k.org>
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

On Fri, 22 Jun 2018 09:04:25 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> With gcc 4.1.2 when compiling for 32-bit:
>=20
>     drivers/mtd/devices/mtd_dataflash.c:736: warning: integer constant is=
 too large for =E2=80=98long=E2=80=99 type
>     drivers/mtd/devices/mtd_dataflash.c:737: warning: integer constant is=
 too large for =E2=80=98long=E2=80=99 type
>=20
> Add the missing "ULL" suffixes to fix this.
>=20
> Fixes: 67e4145ebf2c161d ("mtd: dataflash: Add flash_info for AT45DB641E")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Applied.

Thanks,

Boris

> ---
> v2:
>   - Add Acked-by.
> ---
>  drivers/mtd/devices/mtd_dataflash.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mt=
d_dataflash.c
> index 3a6f450d1093c4c5..53febe8a68c3cdfa 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -733,8 +733,8 @@ static struct flash_info dataflash_data[] =3D {
>  	{ "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
>  	{ "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS},
> =20
> -	{ "AT45DB641E",  0x1f28000100, 32768, 264, 9, SUP_EXTID | SUP_POW2PS},
> -	{ "at45db641e",  0x1f28000100, 32768, 256, 8, SUP_EXTID | SUP_POW2PS | =
IS_POW2PS},
> +	{ "AT45DB641E",  0x1f28000100ULL, 32768, 264, 9, SUP_EXTID | SUP_POW2PS=
},
> +	{ "at45db641e",  0x1f28000100ULL, 32768, 256, 8, SUP_EXTID | SUP_POW2PS=
 | IS_POW2PS},
>  };
> =20
>  static struct flash_info *jedec_lookup(struct spi_device *spi,
