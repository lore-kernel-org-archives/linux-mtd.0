Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMtY5-0006Px-Lc
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 04:09:50 +0000
Received: by lagy4 with SMTP id y4so1262801lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2012 21:09:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335295105-7981-7-git-send-email-mikedunn@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-7-git-send-email-mikedunn@newsguy.com>
Date: Tue, 24 Apr 2012 21:09:47 -0700
Message-ID: <CAN8TOE-LwD28wDS62pYCt-cmhVetm0-1OvvRXPZLH-vUfWcd7g@mail.gmail.com>
Subject: Re: [PATCH 6/7] mtd: nand: sanity checks of ecc strength in
 nand_scan_tail()
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
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

Hi Mike,

On Tue, Apr 24, 2012 at 12:18 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> This patch adds sanity checks that ensure that drivers for controllers wi=
th
> hardware ECC set the 'strength' element in struct nand_ecc_ctrl. =A0Also =
stylistic
> changes to the line that calculates strength for software ECC. =A0Both su=
ggested
> during discussion [1].
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040467.html

Thanks for addressing these issues! Note my comment below though.

> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 28 ++++++++++++++++++++++------
> =A01 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 3137abd..275c43f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3302,10 +3302,21 @@ int nand_scan_tail(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "hard=
ware ECC not possible\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!chip->ecc.strength) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("Driver must set ec=
c.strength when using hardware ECC\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!chip->ecc.read_page)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.read_page =3D na=
nd_read_page_hwecc_oob_first;
>
> =A0 =A0 =A0 =A0case NAND_ECC_HW:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!chip->ecc.strength) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("Driver must set ec=
c.strength when using hardware ECC\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Use standard hwecc read page function? =
*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!chip->ecc.read_page)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.read_page =3D na=
nd_read_page_hwecc;
> @@ -3345,12 +3356,17 @@ int nand_scan_tail(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!chip->ecc.write_oob)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.write_oob =3D na=
nd_write_oob_syndrome;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mtd->writesize >=3D chip->ecc.size)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("%d byte HW ECC not possible on "
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"%d byte page size, =
fallback to SW ECC\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.size, mtd-=
>writesize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mtd->writesize >=3D chip->ecc.size) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!chip->ecc.strength) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("Dr=
iver must set ecc.strength when using hardware ECC\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break; =A0/* all's well */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("%d byte HW ECC not possible on %d =
byte page size, fallback to SW ECC\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.size, mtd->writes=
ize);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.mode =3D NAND_ECC_SOFT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* fall through */
>
> =A0 =A0 =A0 =A0case NAND_ECC_SOFT:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.calculate =3D nand_calculate_ecc=
;

I think you only need this last check (under ECC_HW_SYNDROME), since
the ECC_HW and ECC_HW_OOB_FIRST cases necessarily fall through to
ECC_HW_SYNDROME case. (Note the lack of 'break;' statements in the
first two 'case's.)

Brian
