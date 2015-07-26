Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJG0O-0006NA-8K
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2015 07:05:52 +0000
Received: by iecri3 with SMTP id ri3so44769243iec.2
 for <linux-mtd@lists.infradead.org>; Sun, 26 Jul 2015 00:05:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437835063-58407-3-git-send-email-eastyjr@gmail.com>
References: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
 <1437835063-58407-3-git-send-email-eastyjr@gmail.com>
Date: Sun, 26 Jul 2015 09:05:31 +0200
Message-ID: <CACna6rxvk0pOSotaErMuhCU_-qd+e6PV+3osx9dOe-GgsiH4zQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] mtd: bcm47xxpart.c: Adding Xaiomi board support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Joseph East <eastyjr@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On 25 July 2015 at 16:37, Joseph East <eastyjr@gmail.com> wrote:
> ---

Oh and now you're sending my patch pretending its your. NACK!


>  drivers/mtd/bcm47xxpart.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 55a1462..a27d185 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -33,6 +33,7 @@
>  /* Magics */
>  #define BOARD_DATA_MAGIC               0x5246504D      /* MPFR */
>  #define BOARD_DATA_MAGIC2              0xBD0D0BBD
> +#define BOARD_DATA_XIAOMI_MAGIC        0x474D4442      /* GMDB */
>  #define CFE_MAGIC                      0x43464531      /* 1EFC */
>  #define FACTORY_MAGIC                  0x59544346      /* FCTY */
>  #define NVRAM_HEADER                   0x48534C46      /* FLSH */
> @@ -263,7 +264,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>                 }
>
>                 /* Some devices (ex. WNDR3700v3) don't have a standard 'M=
PFR' */
> -               if (buf[0x000 / 4] =3D=3D BOARD_DATA_MAGIC2) {
> +               if (buf[0x000 / 4] =3D=3D BOARD_DATA_MAGIC2 ||
> +                   le32_to_cpu(buf[0x000 / 4]) =3D=3D BOARD_DATA_XIAOMI_=
MAGIC) {

le32_to_cpu won't work here obviously, so it seems you didn't even
test it on a proper device. Nack.

--=20
Rafa=C5=82
