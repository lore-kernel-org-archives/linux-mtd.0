Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MUJbJ-0000Mt-4g
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 12:10:17 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1032132qwf.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jul 2009 05:10:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <50ed4996479c95b93714ac814608d5f0db85238d.1248434636.git.rubini@unipv.it>
References: <cover.1248434635.git.rubini@unipv.it>
	<50ed4996479c95b93714ac814608d5f0db85238d.1248434636.git.rubini@unipv.it>
Date: Fri, 24 Jul 2009 17:40:11 +0530
Message-ID: <ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815
	board)
From: vimal singh <vimal.newwork@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux@arm.linux.org.uk
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please run ''checkpatch.pl' for this patch and try to fix the errors.

Few more comments below:

On Fri, Jul 24, 2009 at 5:02 PM, Alessandro Rubini<rubini-list@gnudd.com> w=
rote:
> From: Alessandro Rubini <rubini@unipv.it>
>
>
> Signed-off-by: Alessandro Rubini <rubini@unipv.it>
> Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
> ---
---sinp---

> +static inline int parity(int b) /* uses low 8 bits: returns 0 or all-1 *=
/
> +{
> + =A0 =A0 =A0 b =3D b ^ (b >> 4);
> + =A0 =A0 =A0 b =3D b ^ (b >> 2);
> + =A0 =A0 =A0 return (b ^ (b >> 1)) & 1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ? ~0 : 0;
> +}

This function is not required anymore, can be removed.

> +
> +static struct nand_ecclayout nomadik_ecc_layout =3D {
> + =A0 =A0 =A0 .eccbytes =3D 3 * 4,
> + =A0 =A0 =A0 .eccpos =3D { /* each subpage has 16 bytes: pos 2,3,4 hosts=
 ECC */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x02, 0x03, 0x04,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x12, 0x13, 0x14,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x23, 0x24,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x32, 0x33, 0x34},
> + =A0 =A0 =A0 /* let's keep bytes 5,6,7 for us, just in case we change EC=
C algo */
> + =A0 =A0 =A0 .oobfree =3D { {0x08, 0x08}, {0x18, 0x08}, {0x28, 0x08}, {0=
x38, 0x08} },
> +};
> +
> +static void nomadik_ecc_control(struct mtd_info *mtd, int mode)
> +{
> + =A0 =A0 =A0 /* No need to enable hw ecc, it's on by default */
> +}
> +
> +static void nomadik_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int=
 ctrl)
> +{
> + =A0 =A0 =A0 struct nand_chip *nand =3D mtd->priv;
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D nand->priv;
> +
> + =A0 =A0 =A0 if (cmd =3D=3D NAND_CMD_NONE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 if (ctrl & NAND_CLE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->cmd_va);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->addr_va);
> +}
> +
> +static int nomadik_nand_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> + =A0 =A0 =A0 struct nomadik_nand_host *host;
> + =A0 =A0 =A0 struct mtd_info *mtd;
> + =A0 =A0 =A0 struct nand_chip *nand;
> + =A0 =A0 =A0 struct resource *res;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 /* Allocate memory for the device structure (and zero it) *=
/
> + =A0 =A0 =A0 host =3D kzalloc(sizeof(struct nomadik_nand_host), GFP_KERN=
EL);
> + =A0 =A0 =A0 if (!host) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Failed to allocate dev=
ice structure.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Call the client's init function, if any */
> + =A0 =A0 =A0 if (pdata->init && (ret =3D pdata->init()) < 0) {

'checkpatch.pl' here... (do not use assignment in if condition)

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Init function failed\n=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* ioremap three regions */
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_addr");
> + =A0 =A0 =A0 if (!res) {ret =3D -EIO; goto err_unmap; }
> + =A0 =A0 =A0 host->addr_va =3D ioremap(res->start, res->end - res->start=
 + 1);
> +
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_data");
> + =A0 =A0 =A0 if (!res) {ret =3D -EIO; goto err_unmap; }
> + =A0 =A0 =A0 host->data_va =3D ioremap(res->start, res->end - res->start=
 + 1);
> +
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_cmd");
> + =A0 =A0 =A0 if (!res) {ret =3D -EIO; goto err_unmap; }
> + =A0 =A0 =A0 host->cmd_va =3D ioremap(res->start, res->end - res->start =
+ 1);

'checkpatch.pl' here... (trailing statements should be on next line)

> +
> + =A0 =A0 =A0 if (!host->addr_va || !host->data_va || !host->cmd_va) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Link all private pointers */
> + =A0 =A0 =A0 mtd =3D &host->mtd;
> + =A0 =A0 =A0 nand =3D &host->nand;
> + =A0 =A0 =A0 mtd->priv =3D nand;
> + =A0 =A0 =A0 nand->priv =3D host;
> +
> + =A0 =A0 =A0 host->mtd.owner =3D THIS_MODULE;
> + =A0 =A0 =A0 nand->IO_ADDR_R =3D host->data_va;
> + =A0 =A0 =A0 nand->IO_ADDR_W =3D host->data_va;
> + =A0 =A0 =A0 nand->cmd_ctrl =3D nomadik_cmd_ctrl;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* This stanza declares ECC_HW but uses soft routines. It=
's because
> + =A0 =A0 =A0 =A0* HW claims to make the calculation but not the correcti=
on. However,
> + =A0 =A0 =A0 =A0* I haven't managed to get the desired data out of it un=
til now.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 nand->ecc.mode =3D NAND_ECC_HW;

this can be 'NAND_ECC_SOFT' here... then

> + =A0 =A0 =A0 nand->ecc.calculate =3D nand_calculate_ecc;
> + =A0 =A0 =A0 nand->ecc.correct =3D nand_correct_data;
you need not to do these here.

> + =A0 =A0 =A0 nand->ecc.hwctl =3D nomadik_ecc_control;
> + =A0 =A0 =A0 nand->ecc.size =3D 512;
> + =A0 =A0 =A0 nand->ecc.bytes =3D 3;
> +
> + =A0 =A0 =A0 nand->options =3D pdata->options;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Scan to find existance of the device
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (nand_scan(&host->mtd, 1)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> + =A0 =A0 =A0 add_mtd_partitions(&host->mtd, pdata->parts, pdata->nparts)=
;
> +#else
> + =A0 =A0 =A0 pr_info("Registering %s as whole device\n", mtd->name);
> + =A0 =A0 =A0 add_mtd_device(mtd);
> +#endif
> +
> + =A0 =A0 =A0 platform_set_drvdata(pdev, host);
> + =A0 =A0 =A0 return 0;
> +
> + err_unmap:
> + =A0 =A0 =A0 if (host->cmd_va) iounmap(host->cmd_va);
> + =A0 =A0 =A0 if (host->data_va) iounmap(host->data_va);
> + =A0 =A0 =A0 if (host->addr_va) iounmap(host->addr_va);

'checkpatch.pl' here... (trailing statements should be on next line)

-vimal
