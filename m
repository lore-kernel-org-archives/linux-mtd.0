Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHzjP-0006fI-Lo
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 14:40:44 +0000
Received: by wyb28 with SMTP id 28so2126440wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2011 07:40:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304334638-2198-1-git-send-email-kishore.kadiyala@ti.com>
References: <1304334638-2198-1-git-send-email-kishore.kadiyala@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 5 May 2011 19:50:40 +0530
Message-ID: <BANLkTimfXSOTKPpxFG8+JpCxvpzd14aBOQ@mail.gmail.com>
Subject: Re: [PATCH] omap : nand : fix subpage ecc issue with prefetch
To: Kishore Kadiyala <kishore.kadiyala@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: bdefaria@adeneo-embedded.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Can you please give a look on this patch?
This patch fixes is required for anyone who wants to use this driver
without using HW ECC.

-- Vimal

On Mon, May 2, 2011 at 4:40 PM, Kishore Kadiyala
<kishore.kadiyala@ti.com> wrote:
> For prefetch engine, read and write =A0got broken in commit '2c01946c'.
> We never hit a scenario of not getting 'gpmc_prefetch_enable'
> call success.
> When reading/writing a subpage with a non divisible by 4 ecc number
> of bytes, the mis-aligned bytes gets handled first before enabling
> the Prefetch engine, then it reads/writes rest of the bytes.
>
> Signed-off-by: Kishore Kadiyala <kishore.kadiyala@ti.com>
> Signed-off-by: Vimal Singh <vimal.newwork@gmail.com>
> Reported-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
> ---
> =A0drivers/mtd/nand/omap2.c | =A0 12 +++++-------
> =A01 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index da9a351..2c8040f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -263,11 +263,10 @@ static void omap_read_buf_pref(struct mtd_info *mtd=
, u_char *buf, int len)
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* PFPW engine is busy, use cpu copy metho=
d */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (info->nand.options & NAND_BUSWIDTH_16)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_read_buf16(mtd, buf, l=
en);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_read_buf16(mtd, (u_cha=
r *)p, len);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_read_buf8(mtd, buf, le=
n);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_read_buf8(mtd, (u_char=
 *)p, len);
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u32 *) buf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0do {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r_count =3D gpmc_read_stat=
us(GPMC_PREFETCH_FIFO_CNT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r_count =3D r_count >> 2;
> @@ -293,7 +292,7 @@ static void omap_write_buf_pref(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0struct omap_nand_info, mtd);
> =A0 =A0 =A0 =A0uint32_t w_count =3D 0;
> =A0 =A0 =A0 =A0int i =3D 0, ret =3D 0;
> - =A0 =A0 =A0 u16 *p;
> + =A0 =A0 =A0 u16 *p =3D (u16 *)buf;
> =A0 =A0 =A0 =A0unsigned long tim, limit;
>
> =A0 =A0 =A0 =A0/* take care of subpage writes */
> @@ -309,11 +308,10 @@ static void omap_write_buf_pref(struct mtd_info *mt=
d,
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* PFPW engine is busy, use cpu copy metho=
d */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (info->nand.options & NAND_BUSWIDTH_16)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf16(mtd, buf, =
len);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf16(mtd, (u_ch=
ar *)p, len);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf8(mtd, buf, l=
en);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_write_buf8(mtd, (u_cha=
r *)p, len);
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u16 *) buf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while (len) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0w_count =3D gpmc_read_stat=
us(GPMC_PREFETCH_FIFO_CNT);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0w_count =3D w_count >> 1;
> --
> 1.7.4.1
>
>
