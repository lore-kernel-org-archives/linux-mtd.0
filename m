Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aa6wO-0006P6-AP
 for linux-mtd@lists.infradead.org; Sun, 28 Feb 2016 19:23:41 +0000
Received: by mail-wm0-x22d.google.com with SMTP id l68so11717946wml.0
 for <linux-mtd@lists.infradead.org>; Sun, 28 Feb 2016 11:23:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1454095537-130536-7-git-send-email-computersforpeace@gmail.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
 <1454095537-130536-7-git-send-email-computersforpeace@gmail.com>
Date: Sun, 28 Feb 2016 16:23:18 -0300
Message-ID: <CAAEAJfAnrZCAp+5GakaG36Kcr3dQ2_e-WGOm9e=92Ctq1NyL=Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, Daniel Kurtz <djkurtz@chromium.org>
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

On 29 January 2016 at 16:25, Brian Norris <computersforpeace@gmail.com> wro=
te:
> We can't determine this purely by manufacturer type (see commit
> 67b9bcd36906 ("mtd: spi-nor: fix Spansion regressions (aliased with
> Winbond)")), and it's not autodetectable by anything like SFDP. So make
> a new flag for it.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> v2: no change
>
>  drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index 9cd92f135fa2..a47e9dd29456 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -69,6 +69,7 @@ struct flash_info {
>  #define SPI_NOR_DUAL_READ      BIT(5)  /* Flash supports Dual Read */
>  #define SPI_NOR_QUAD_READ      BIT(6)  /* Flash supports Quad Read */
>  #define USE_FSR                        BIT(7)  /* use flag status regist=
er */
> +#define SPI_NOR_HAS_LOCK       BIT(8)  /* Flash supports lock/unlock via=
 SR */
>  };
>
>  #define JEDEC_MFR(info)        ((info)->id[0])
> @@ -1280,7 +1281,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *n=
ame, enum read_mode mode)
>
>         if (JEDEC_MFR(info) =3D=3D SNOR_MFR_ATMEL ||
>             JEDEC_MFR(info) =3D=3D SNOR_MFR_INTEL ||
> -           JEDEC_MFR(info) =3D=3D SNOR_MFR_SST) {
> +           JEDEC_MFR(info) =3D=3D SNOR_MFR_SST ||
> +           info->flags & SPI_NOR_HAS_LOCK) {
>                 write_enable(nor);
>                 write_sr(nor, 0);
>                 spi_nor_wait_till_ready(nor);
> @@ -1297,7 +1299,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *n=
ame, enum read_mode mode)
>         mtd->_read =3D spi_nor_read;
>
>         /* NOR protection support for STmicro/Micron chips and similar */
> -       if (JEDEC_MFR(info) =3D=3D SNOR_MFR_MICRON) {
> +       if (JEDEC_MFR(info) =3D=3D SNOR_MFR_MICRON ||
> +                       info->flags & SPI_NOR_HAS_LOCK) {

Nitpick: indentation looks off here.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
