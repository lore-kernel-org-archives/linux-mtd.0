Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKQ81-00088K-3I
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 07:16:09 +0000
Received: by gwb1 with SMTP id 1so505866gwb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 00:16:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTinGFDHj4s6nAXMiq8dYW_UO6W+YXg@mail.gmail.com>
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
	<20110511183322.da0739c9.akpm@linux-foundation.org>
	<BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>
	<BANLkTinGFDHj4s6nAXMiq8dYW_UO6W+YXg@mail.gmail.com>
Date: Thu, 12 May 2011 02:16:07 -0500
Message-ID: <BANLkTin5X7d+_b5+7N5g941bz12jc+zMZA@mail.gmail.com>
Subject: Re: Bug in MTD NAND ONFI chipsize detection
From: Nitin Garg <nitingarg98@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Why isn't my patch going through? re-sending again,

Signed-off-by: Nitin Garg <nitingarg98@xxxxxxxx>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..cdf6015 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
mtd_info *mtd, struct nand_chip *chip,
 	mtd->writesize =3D le32_to_cpu(p->byte_per_page);
 	mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->writesize;
 	mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
-	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->erases=
ize;
+	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
le32_to_cpu(p->lun_count) * mtd->erasesize;
 	busw =3D 0;
 	if (le16_to_cpu(p->features) & 1)
 		busw =3D NAND_BUSWIDTH_16;
--=20
1.5.5.6



On Thu, May 12, 2011 at 2:05 AM, Nitin Garg <nitingarg98@gmail.com> wrote:
> Here is the tested patch, pls apply.
>
> From 1a73f1c3d066a491d0c806883788ab9abdc736f3 Mon Sep 17 00:00:00 2001
> From: Nitin Garg <nitingarg98@gmail.com>
> Date: Thu, 12 May 2011 01:31:53 -0500
> Subject: [PATCH] Fix ONFI NAND flash size detection by using number of
> Logical Units in device
>
> Signed-off-by: Nitin Garg <nitingarg98@gmail.com>
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c54a4cb..cdf6015 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
> mtd_info *mtd, struct nand_chip *chip,
> =A0 =A0 =A0 =A0mtd->writesize =3D le32_to_cpu(p->byte_per_page);
> =A0 =A0 =A0 =A0mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->=
writesize;
> =A0 =A0 =A0 =A0mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
> - =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun)=
 *
> mtd->erasesize;
> + =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun)=
 *
> le32_to_cpu(p->lun_count) * mtd->erasesize;
> =A0 =A0 =A0 =A0busw =3D 0;
> =A0 =A0 =A0 =A0if (le16_to_cpu(p->features) & 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busw =3D NAND_BUSWIDTH_16;
> --
> 1.5.5.6
>
