Received: from mail-qy0-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEurt-00016P-Vg
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 00:43:48 +0000
Received: by qyk9 with SMTP id 9so176973qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Jun 2009 17:43:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244573555-8577-1-git-send-email-mika.j.korhonen@gmail.com>
References: <1244573555-8577-1-git-send-email-mika.j.korhonen@gmail.com>
Date: Fri, 12 Jun 2009 09:43:40 +0900
Message-ID: <9c9fda240906111743y42e6d50q92ba7c3df2b9ffc@mail.gmail.com>
Subject: Re: [PATCH] MTD OneNAND: typo fixes
From: Kyungmin Park <kyungmin78@gmail.com>
To: Mika Korhonen <mika.j.korhonen@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: kyungmin78@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Wed, Jun 10, 2009 at 3:52 AM, Mika Korhonen<mika.j.korhonen@gmail.com> w=
rote:
> Signed-off-by: Mika Korhonen <mika.j.korhonen@gmail.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 20 ++++++++++----------
> =A01 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 864327e..4c18736 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1182,7 +1182,7 @@ static int onenand_read_ops_nolock(struct mtd_info =
*mtd, loff_t from,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Chip boundary handling =
in DDP
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Now we issued chip 1 re=
ad and pointed chip 1
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* bufferam so we have to=
 point chip 0 bufferam.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* bufferram so we have t=
o point chip 0 bufferram.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_DDP(this) &=
&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unlikely(from =3D=
=3D (this->chipsize >> 1))) {
> @@ -1858,8 +1858,8 @@ static int onenand_write_ops_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_NEXT_BUFFERRAM=
(this);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 2 PLANE, MLC, and Flex-OneNAND doesn't=
 support
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* write-while-programe feature.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 2 PLANE, MLC, and Flex-OneNAND do not =
support
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* write-while-program feature.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ONENAND_IS_2PLANE(this) && !first) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_PREV_BUFFERRAM=
(this);
> @@ -1870,7 +1870,7 @@ static int onenand_write_ops_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(m=
td, prev, !ret && !prev_subpage);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0written -=
=3D prevlen;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: write failed %d\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -1896,7 +1896,7 @@ static int onenand_write_ops_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* In partial page write w=
e don't update bufferram */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(m=
td, to, !ret && !subpage);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_write_ops_nolock: write failed %d\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -2192,7 +2192,7 @@ static int onenand_erase(struct mtd_info *mtd, stru=
ct erase_info *instr)
> =A0 =A0 =A0 =A0/* Grab the lock and see if the device is available */
> =A0 =A0 =A0 =A0onenand_get_device(mtd, FL_ERASING);
>
> - =A0 =A0 =A0 /* Loop throught the pages */
> + =A0 =A0 =A0 /* Loop through the blocks */
> =A0 =A0 =A0 =A0instr->state =3D MTD_ERASING;
>
> =A0 =A0 =A0 =A0while (len) {
> @@ -2319,7 +2319,7 @@ static int onenand_default_block_markbad(struct mtd=
_info *mtd, loff_t ofs)
> =A0 =A0 =A0 =A0 if (bbm->bbt)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bbm->bbt[block >> 2] |=3D 0x01 << ((block=
 & 0x03) << 1);
>
> - =A0 =A0 =A0 =A0/* We write two bytes, so we dont have to mess with 16 b=
it access */
> + =A0 =A0 =A0 =A0/* We write two bytes, so we don't have to mess with 16-=
bit access */
> =A0 =A0 =A0 =A0 ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);
> =A0 =A0 =A0 =A0/* FIXME : What to do when marking SLC block in partition
> =A0 =A0 =A0 =A0 * =A0 =A0 =A0 =A0 with MLC erasesize? For now, it is not =
advisable to
> @@ -2548,7 +2548,7 @@ static void onenand_unlock_all(struct mtd_info *mtd=
)
>
> =A0#ifdef CONFIG_MTD_ONENAND_OTP
>
> -/* Interal OTP operation */
> +/* Internal OTP operation */
> =A0typedef int (*otp_op_t)(struct mtd_info *mtd, loff_t form, size_t len,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t *retlen, u_char *buf);
>
> @@ -2912,7 +2912,7 @@ static void onenand_check_features(struct mtd_info =
*mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND_HAS_2PLANE;
>
> =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_2Gb:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 2Gb DDP don't have 2 plane */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 2Gb DDP does not have 2 plane */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ONENAND_IS_DDP(this))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND=
_HAS_2PLANE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND_HAS_UNLOCK_ALL;
> @@ -3374,7 +3374,7 @@ static int onenand_probe(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0/* It's real page size */
> =A0 =A0 =A0 =A0this->writesize =3D mtd->writesize;
>
> - =A0 =A0 =A0 /* REVIST: Multichip handling */
> + =A0 =A0 =A0 /* REVISIT: Multichip handling */
>
> =A0 =A0 =A0 =A0if (FLEXONENAND(this))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flexonenand_get_size(mtd);
> --
> 1.6.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
