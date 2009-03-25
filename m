Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQaP-0007qi-0L
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:44:00 +0000
From: "Singh, Vimal" <vimalsingh@ti.com>
To: Wolfgang Grandegger <wg@grandegger.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linuxppc-dev@ozlabs.org"
	<linuxppc-dev@ozlabs.org>
Date: Wed, 25 Mar 2009 16:13:38 +0530
Subject: RE: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
Message-ID: <19F8576C6E063C45BE387C64729E73940427A869E0@dbde02.ent.ti.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>,
	<1237975701-23201-2-git-send-email-wg@grandegger.com>
In-Reply-To: <1237975701-23201-2-git-send-email-wg@grandegger.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +static void fun_select_chip(struct mtd_info *mtd, int chip_nr)
> +{
> +       struct nand_chip *chip =3D mtd->priv;
> +       struct fsl_upm_nand *fun =3D to_fsl_upm_nand(mtd);
> +
> +       if (chip_nr =3D=3D -1) {
> +               chip->cmd_ctrl(mtd, NAND_CMD_NONE, 0 |=20
> NAND_CTRL_CHANGE);
> +       } else if (chip_nr >=3D 0) {
> +               fun->chip_number =3D chip_nr;
> +               chip->IO_ADDR_R =3D chip->IO_ADDR_W =3D
> +                       fun->io_base + chip_nr * fun->chip_offset;
> +       } else {
> +               BUG();
> +       }
braces are not required here...


> +       prop =3D of_get_property(ofdev->node, "num-chips", &size);
> +       if (prop && size =3D=3D sizeof(uint32_t)) {
> +               fun->num_chips =3D *prop;
> +               if (fun->num_chips >=3D NAND_MAX_CHIPS) {
> +                       dev_err(&ofdev->dev, "too much chips");
> +                       ret =3D -EINVAL;
> +                       goto err1;
> +               }
> +       } else {
> +               fun->num_chips =3D 1;
> +       }
ditto...=
