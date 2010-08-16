Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Okyhv-0003m5-5T
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 12:22:28 +0000
Received: by eye22 with SMTP id 22so1044887eye.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 05:22:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281948641.29696.1.camel@mola>
References: <1281948641.29696.1.camel@mola>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 Aug 2010 20:22:05 +0800
Message-ID: <AANLkTi=YSS0-Nf4MWOw30YDrCdrkmtzLhv7DXfsoJTjX@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for
	samsung2GbX8
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Haojian Zhuang <haojian.zhuang@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc'ed Lei and Haojian.

On Mon, Aug 16, 2010 at 4:50 PM, Axel Lin <axel.lin@gmail.com> wrote:
> This patch adds timing settings for samsung2GbX8 and
> fixes the cmdset settings. samsung2GbX8 is large page.
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 16 ++++++++++++++--
> =C2=A01 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 4d89f37..47c0442 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -227,9 +227,21 @@ static struct pxa3xx_nand_flash samsung512MbX16 =3D =
{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x46ec=
,
> =C2=A0};
>
> +static struct pxa3xx_nand_timing samsung2GbX8_timing =3D {
> + =C2=A0 =C2=A0 =C2=A0 .tCH =C2=A0 =C2=A0=3D 5,
> + =C2=A0 =C2=A0 =C2=A0 .tCS =C2=A0 =C2=A0=3D 20,
> + =C2=A0 =C2=A0 =C2=A0 .tWH =C2=A0 =C2=A0=3D 10,
> + =C2=A0 =C2=A0 =C2=A0 .tWP =C2=A0 =C2=A0=3D 12,
> + =C2=A0 =C2=A0 =C2=A0 .tRH =C2=A0 =C2=A0=3D 10,
> + =C2=A0 =C2=A0 =C2=A0 .tRP =C2=A0 =C2=A0=3D 12,
> + =C2=A0 =C2=A0 =C2=A0 .tR =C2=A0 =C2=A0 =3D 25000,
> + =C2=A0 =C2=A0 =C2=A0 .tWHR =C2=A0 =3D 60,
> + =C2=A0 =C2=A0 =C2=A0 .tAR =C2=A0 =C2=A0=3D 10,
> +};
> +
> =C2=A0static struct pxa3xx_nand_flash samsung2GbX8 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung51=
2MbX16_timing,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpage=
_cmdset,
> + =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung2G=
bX8_timing,
> + =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepage=
_cmdset,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.page_per_block =3D 64,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.flash_width =C2=A0 =C2=A0=3D 8,
> --
> 1.7.2
>
>
>
>
