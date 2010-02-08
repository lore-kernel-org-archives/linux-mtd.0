Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NePBR-0007qc-2O
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 08:41:34 +0000
Received: by fxm2 with SMTP id 2so207115fxm.31
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Feb 2010 00:41:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791002080039t4e818aedr7d0ecdf3bb8af845@mail.gmail.com>
References: <ce9ab5791002030751q21cd9759nb776fa06e89cad46@mail.gmail.com>
	<ce9ab5791002080039t4e818aedr7d0ecdf3bb8af845@mail.gmail.com>
Date: Mon, 8 Feb 2010 14:11:24 +0530
Message-ID: <7f9d1ffb1002080041j5f60729cu6090d27f4d3cdeb9@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Adding nand lock/unlock routines.
From: kishore kadiyala <kishorek.kadiyala@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 8, 2010 at 2:09 PM, Vimal Singh <vimal.newwork@gmail.com> wrote=
:
> From a28c230f3bd8fa765f78c0be91370f146e71f670 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Wed, 3 Feb 2010 14:32:06 +0530
> Subject: [PATCH 2/2] Adding nand lock/unlock routines.
>
> Adding nand lock / unlock routines. At least 'micron' parts
> support this.
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0164 ++++++++++++++++++++++++++++++++=
++++++++++
> =A0include/linux/mtd/nand.h =A0 =A0 | =A0 10 +++
> =A02 files changed, 174 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 2dfeb4b..a2dddca 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -864,6 +864,168 @@ static int nand_wait(struct
> =A0}
>
> =A0/**
> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
> + *
> + * @param mtd - mtd info
> + * @param ofs - offset to start unlock from
> + * @param len - length to unlock
> + * @invert - =A0when =3D 0, unlock the range of blocks within the lower =
and
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0upper boundary address
> + * =A0 =A0 =A0 =A0 =A0 =A0whne =3D 1, unlock the range of blocks outside=
 the boundaries
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of the lower and upper bou=
ndary address
> + *
> + * @return - unlock status
> + */
> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 uint64_t len, int invert)
> +{
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int status, page;
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> +
> + =A0 =A0 =A0 /* Submit address of first page to unlock */
> + =A0 =A0 =A0 page =3D ofs >> chip->page_shift;
> + =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pagem=
ask);
> +
> + =A0 =A0 =A0 /* Submit address of last page to unlock */
> + =A0 =A0 =A0 page =3D (ofs + len) >> chip->page_shift;
> + =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (page | inv=
ert) & chip->pagemask);
> +
> + =A0 =A0 =A0 /* Call wait ready function */
> + =A0 =A0 =A0 status =3D chip->waitfunc(mtd, chip);
> + =A0 =A0 =A0 udelay(1000);
> + =A0 =A0 =A0 /* See if device thinks it succeeded */
> + =A0 =A0 =A0 if (status & 0x01) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status =
=3D 0x%08x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __func__, status);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/**
> + * nand_unlock - [REPLACABLE] unlocks specified locked blockes
> + *
> + * @param mtd - mtd info
> + * @param ofs - offset to start unlock from
> + * @param len - length to unlock
> + *
> + * @return - unlock status
> + */
> +int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int chipnr;
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> +
> + =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "%s: start =3D 0x%012llx, len =3D %=
llu\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, (unsigned long lo=
ng)ofs, len);
> +
> + =A0 =A0 =A0 if (check_offs_len(mtd, instr->addr, instr->len))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;

This patch breaks the compilation. See below:

drivers/mtd/nand/nand_base.c: In function 'nand_unlock':
drivers/mtd/nand/nand_base.c:926: error: 'instr' undeclared (first use
in this function)
drivers/mtd/nand/nand_base.c:926: error: (Each undeclared identifier
is reported only once
drivers/mtd/nand/nand_base.c:926: error: for each function it appears in.)
drivers/mtd/nand/nand_base.c: In function 'nand_lock':
drivers/mtd/nand/nand_base.c:983: error: 'instr' undeclared (first use
in this function)
make[3]: *** [drivers/mtd/nand/nand_base.o] Error 1

Regards,
Kishore
