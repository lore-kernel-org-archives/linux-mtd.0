From: "Gupta, Pekon" <pekon@ti.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: RE: [RFC PATCH] mtd: add per NAND partition ECC config
Date: Mon, 10 Feb 2014 11:55:07 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6F1F0@DBDE04.ent.ti.com>
References: <1391855206-5974-1-git-send-email-b.brezillon.dev@gmail.com>
In-Reply-To: <1391855206-5974-1-git-send-email-b.brezillon.dev@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

>From: Boris BREZILLON
>
>This patch aims to add per partition ECC config for NAND devices.
>It defines a new field in the mtd struct to store the mtd ECC config and
>thus each mtd partition device can store its config instead of using the
>default NAND chip config.
>
>This feature is needed to support the sunxi boot0 paritition case:
>Allwinner boot code (BROM) requires a specific HW ECC for its boot code
>that may not fit the HW NAND requirements for the entire NAND chip.
>
>Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
>---
>Hello,
>
>This patch is just a draft that implement per partition ECC config.
>It's currently not properly splitted (it should be separated in several
>patches) and not documented either.
>
>There's at least one point that bother me in the current implementation:
>I introduced DT notions in the nand core code by the mean of the get_ecc_c=
trl
>callback, and so far this was kept out of mtd/nand core code (I guess it w=
as
>on purpose).
>
>Please let me know if you see other drawbacks.
>
>If you think per partition ECC should not be implemented, could you help m=
e
>find a way to handle sunxi specific case decribed above ?
>
There was a discussion on having per partition based ECC earlier [1].
Though I was not in favor of supporting it earlier, but your proposal looks=
 good.
However, I still feel there are more caveats here, to explore..

[...]

>@@ -364,7 +367,13 @@ static struct mtd_part *allocate_partition(struct mtd=
_info *master,
> 	slave->mtd.writesize =3D master->writesize;
> 	slave->mtd.writebufsize =3D master->writebufsize;
> 	slave->mtd.oobsize =3D master->oobsize;
>-	slave->mtd.oobavail =3D master->oobavail;
>+	if (part->eccctrl) {
>+		slave->mtd.eccctrl =3D part->eccctrl;
>+		slave->mtd.oobavail =3D part->eccctrl->layout->oobavail;
>+	} else {
>+		slave->mtd.eccctrl =3D master->eccctrl;
>+		slave->mtd.oobavail =3D master->oobavail;
>+	}
> 	slave->mtd.subpage_sft =3D master->subpage_sft;
>
> 	slave->mtd.name =3D name;
>@@ -515,9 +524,15 @@ static struct mtd_part *allocate_partition(struct mtd=
_info *master,
> 			part->name);
> 	}
>
>-	slave->mtd.ecclayout =3D master->ecclayout;
>-	slave->mtd.ecc_step_size =3D master->ecc_step_size;
>-	slave->mtd.ecc_strength =3D master->ecc_strength;
>+	if (part->eccctrl) {
>+		slave->mtd.ecclayout =3D part->eccctrl->layout;
>+		slave->mtd.ecc_step_size =3D part->eccctrl->size;
>+		slave->mtd.ecc_strength =3D part->eccctrl->strength;

You have to replicate 'struct nand_ecc_ctrl' from 'nand_chip' to 'mtd_info'
because each ECC algorithm may have its own callback for hwctl(), calculate=
(), and correct().
How do you plan to populate those ?  In driver probe ?

>+	} else {
>+		slave->mtd.ecclayout =3D master->ecclayout;
>+		slave->mtd.ecc_step_size =3D master->ecc_step_size;
>+		slave->mtd.ecc_strength =3D master->ecc_strength;
>+	}
> 	slave->mtd.bitflip_threshold =3D master->bitflip_threshold;
>
> 	if (master->_block_isbad) {

[...]

>+const struct nand_ecc_ctrl *nand_get_ecc_ctrl(struct mtd_info *mtd,
>+					      nand_ecc_modes_t mode,
>+					      struct device_node *np)
>+{
>+	struct nand_chip *chip =3D mtd->priv;
>+	struct nand_ecc_ctrl *ecc;
>+	u32 ecc_step, ecc_strength;
>+	int ret;
>+
>+	if (mode !=3D NAND_ECC_NONE && mode !=3D NAND_ECC_SOFT &&
>+	    mode !=3D NAND_ECC_SOFT_BCH)
>+		return ERR_PTR(-EINVAL);
>+
>+	ecc =3D kzalloc(sizeof(*ecc), GFP_KERNEL);
>+	if (!ecc)
>+		return ERR_PTR(-ENOMEM);
>+
>+	ecc->size =3D chip->ecc_step_ds;
>+	ecc->strength =3D chip->ecc_strength_ds;
>+	if (!of_get_nand_ecc_level(np, &ecc_strength, &ecc_step)) {
>+		ecc->size =3D ecc_step;
>+		ecc->strength =3D ecc_strength;
>+	}
>+

Here we may need to ecc_strength for each partition.
Example: for OMAP3 ROM supports only HAM1 (1-bit hamming),
      but kernel may support up-to BCH8 (8-bit BCH) ECC schemes.
But, anyways that's specific to OMAP platforms..

>+	switch (mode) {
>+	case NAND_ECC_NONE:
>+		break;
>+	case NAND_ECC_SOFT:
>+		break;
>+	case NAND_ECC_SOFT_BCH:
>+		ecc->bytes =3D ((ecc->strength * fls(8 * ecc->size)) + 7) / 8;
>+		break;
>+	default:
>+		ret =3D -EINVAL;
>+		goto err;
>+	}
>+
>+	ecc->mode =3D mode;
>+	ret =3D nand_ecc_ctrl_init(mtd, ecc);
>+	if (ret)
>+		goto err;
>+
>+	ecc->release =3D nand_release_ecc_ctrl;
>+
>+	return ecc;
>+
>+err:
>+	kfree(ecc);
>+	return ERR_PTR(ret);
>+}
>+EXPORT_SYMBOL(nand_get_ecc_ctrl);
>+

I'll be happy to extend and test this, if you plan a complete version.

[1] http://comments.gmane.org/gmane.linux.ports.arm.omap/108083
(you can skip initial discussion about OMAP3, and jump to Thomas Petazzoni =
| 2 Dec 17:19 2013)


with regards, pekon
