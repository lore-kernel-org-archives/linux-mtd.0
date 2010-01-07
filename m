Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSm8u-0001Zq-IK
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 06:46:53 +0000
Received: by bwz4 with SMTP id 4so11360792bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 22:46:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791001060606w46483e93o753913c01752a4b6@mail.gmail.com>
References: <ce9ab5791001060606w46483e93o753913c01752a4b6@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 7 Jan 2010 12:16:26 +0530
Message-ID: <ce9ab5791001062246n23420337g3fb8d3eb365083b0@mail.gmail.com>
Subject: Re: [PATCH 3/3][NAND][OMAP]: Fixing issue in oamp nand driver in
	prefetch mode read
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 6, 2010 at 7:36 PM, Vimal Singh <vimal.newwork@gmail.com> wrote=
:
> From 3700088e8da8c890d9e4c6eb626e18287d149b97 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Tue, 5 Jan 2010 16:37:03 +0530
> Subject: [PATCH] NAND: OMAP: Fixing issue in oamp nand driver in
> prefetch mode read
>
> There is a bug in nand prefetch read routine, which comes into effect
> only if nand device is a 16-bit device (as we have in zoom boards).
> This bug is effective only with below combination of conditions:
> 1. nand deivce, in use, is a 16 bit device
> 2. nand driver supports 'subpage' read
> 3. SW ECC is in use
>
> This was not seen old =A0kernel (ex: .23), because when, in early days,
> we tested this (nand prefetch read in LDP boards) there was no
> 'subpage read' support.
> Later when we had subpage read in (.27) kernel, we had hw ecc enabled
> always in our internal tree. So, we missed this bug.
>
> This patch fixes the issue.
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> =A0drivers/mtd/nand/omap2.c | =A0 11 +++++++----
> =A01 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 16120e2..7df303a 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -295,11 +295,14 @@ static void omap_read_buf_pref(struct mtd_info
> *mtd, u_char *buf, int len)
> =A0 =A0 =A0 =A0u32 *p =3D (u32 *)buf;
>
> =A0 =A0 =A0 =A0/* take care of subpage reads */
> - =A0 =A0 =A0 for (; len % 4 !=3D 0; ) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 *buf++ =3D __raw_readb(info->nand.IO_ADDR_R=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 len--;
> + =A0 =A0 =A0 if (len % 4) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (info->nand.options & NAND_BUSWIDTH_16)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_read_buf16(mtd, buf, l=
en % 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_read_buf8(mtd, buf, le=
n % 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u32 *) (buf + len % 4);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D len % 4;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 p =3D (u32 *) buf;
>
> =A0 =A0 =A0 =A0/* configure and start prefetch transfer */
> =A0 =A0 =A0 =A0ret =3D gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0x0)=
;
> --
> 1.5.5
>

Above patch was line wrapped. Here is the correct one:


>From 3700088e8da8c890d9e4c6eb626e18287d149b97 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Tue, 5 Jan 2010 16:37:03 +0530
Subject: [PATCH] NAND: OMAP: Fixing issue in oamp nand driver in
prefetch mode read

There is a bug in nand prefetch read routine, which comes into effect
only if nand device is a 16-bit device (as we have in zoom boards).
This bug is effective only with below combination of conditions:
1. nand deivce, in use, is a 16 bit device
2. nand driver supports 'subpage' read
3. SW ECC is in use

This was not seen old  kernel (ex: .23), because when, in early days,
we tested this (nand prefetch read in LDP boards) there was no
'subpage read' support.
Later when we had subpage read in (.27) kernel, we had hw ecc enabled
always in our internal tree. So, we missed this bug.

This patch fixes the issue.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/omap2.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 16120e2..7df303a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -295,11 +295,14 @@ static void omap_read_buf_pref(struct
 	u32 *p =3D (u32 *)buf;

 	/* take care of subpage reads */
-	for (; len % 4 !=3D 0; ) {
-		*buf++ =3D __raw_readb(info->nand.IO_ADDR_R);
-		len--;
+	if (len % 4) {
+		if (info->nand.options & NAND_BUSWIDTH_16)
+			omap_read_buf16(mtd, buf, len % 4);
+		else
+			omap_read_buf8(mtd, buf, len % 4);
+		p =3D (u32 *) (buf + len % 4);
+		len -=3D len % 4;
 	}
-	p =3D (u32 *) buf;

 	/* configure and start prefetch transfer */
 	ret =3D gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0x0);
--=20
1.5.5
