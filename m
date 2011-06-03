MIME-Version: 1.0
In-Reply-To: <1305865207-7869-1-git-send-email-leiwen@marvell.com>
References: <BANLkTimos3-Ds4Y8FDfDZegqAhH7nSS4PA@mail.gmail.com>
	<1305865207-7869-1-git-send-email-leiwen@marvell.com>
Date: Fri, 3 Jun 2011 23:11:54 +0800
Message-ID: <BANLkTinuqQmp43K4H0iPDbb-H-rDA_nL9w@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: fix nand detection issue
From: Lei Wen <adrian.wenl@gmail.com>
To: Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	stable@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested-by: Daniel Mack <zonque@gmail.com>

Also cc to MTD maillist and stable kernel.

On Fri, May 20, 2011 at 12:20 PM, Lei Wen <leiwen@marvell.com> wrote:
> When keep_config is set, the detection would goes different routine.
> That the driver would read out the setting which is set previously
> by bootloader. While most bootloader keep the irq mask as off, and
> current driver need all irq default open, keep_config behavior would
> lead to no irq at all.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> ---
> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 12 +++++++-----
> =A01 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index ff07012..9896aef 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -813,7 +813,7 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_na=
nd_info *info)
> =A0 =A0 =A0 =A0info->page_size =3D ndcr & NDCR_PAGE_SZ ? 2048 : 512;
> =A0 =A0 =A0 =A0/* set info fields needed to read id */
> =A0 =A0 =A0 =A0info->read_id_bytes =3D (info->page_size =3D=3D 2048) ? 4 =
: 2;
> - =A0 =A0 =A0 info->reg_ndcr =3D ndcr;
> + =A0 =A0 =A0 info->reg_ndcr =3D ndcr & ~NDCR_INT_MASK;
> =A0 =A0 =A0 =A0info->cmdset =3D &default_cmdset;
>
> =A0 =A0 =A0 =A0info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);
> @@ -882,7 +882,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D mtd->priv;
> =A0 =A0 =A0 =A0struct platform_device *pdev =3D info->pdev;
> =A0 =A0 =A0 =A0struct pxa3xx_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> - =A0 =A0 =A0 struct nand_flash_dev pxa3xx_flash_ids[2] =3D { {NULL,}, {N=
ULL,} };
> + =A0 =A0 =A0 struct nand_flash_dev pxa3xx_flash_ids[2], *def =3D NULL;
> =A0 =A0 =A0 =A0const struct pxa3xx_nand_flash *f =3D NULL;
> =A0 =A0 =A0 =A0struct nand_chip *chip =3D mtd->priv;
> =A0 =A0 =A0 =A0uint32_t id =3D -1;
> @@ -942,8 +942,10 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0pxa3xx_flash_ids[0].erasesize =3D f->page_size * f->page_p=
er_block;
> =A0 =A0 =A0 =A0if (f->flash_width =3D=3D 16)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pxa3xx_flash_ids[0].options =3D NAND_BUSWI=
DTH_16;
> + =A0 =A0 =A0 pxa3xx_flash_ids[1].name =3D NULL;
> + =A0 =A0 =A0 def =3D pxa3xx_flash_ids;
> =A0KEEP_CONFIG:
> - =A0 =A0 =A0 if (nand_scan_ident(mtd, 1, pxa3xx_flash_ids))
> + =A0 =A0 =A0 if (nand_scan_ident(mtd, 1, def))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
> =A0 =A0 =A0 =A0/* calculate addressing information */
> =A0 =A0 =A0 =A0info->col_addr_cycles =3D (mtd->writesize >=3D 2048) ? 2 :=
 1;
> @@ -954,9 +956,9 @@ KEEP_CONFIG:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->row_addr_cycles =3D 2;
> =A0 =A0 =A0 =A0mtd->name =3D mtd_names[0];
> =A0 =A0 =A0 =A0chip->ecc.mode =3D NAND_ECC_HW;
> - =A0 =A0 =A0 chip->ecc.size =3D f->page_size;
> + =A0 =A0 =A0 chip->ecc.size =3D info->page_size;
>
> - =A0 =A0 =A0 chip->options =3D (f->flash_width =3D=3D 16) ? NAND_BUSWIDT=
H_16 : 0;
> + =A0 =A0 =A0 chip->options =3D (info->reg_ndcr & NDCR_DWIDTH_M) ? NAND_B=
USWIDTH_16 : 0;
> =A0 =A0 =A0 =A0chip->options |=3D NAND_NO_AUTOINCR;
> =A0 =A0 =A0 =A0chip->options |=3D NAND_NO_READRDY;
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
