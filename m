Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3V14-0006nu-Nu
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 13:26:18 +0000
Received: by bwz4 with SMTP id 4so2692515bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Oct 2009 06:26:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 29 Oct 2009 18:55:53 +0530
Message-ID: <ce9ab5790910290625u9baaf14le5ab14fe4d6ba783@mail.gmail.com>
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
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

On Thu, Sep 3, 2009 at 4:45 PM, Mika Korhonen
<ext-mika.2.korhonen@nokia.com> wrote:
> Add module parameter "parts" to omap2-onenand driver. Parameter format is
> the same as for cmdlinepart except mtd-id must not be specified - it
> gets prepended by the driver, i.e.: parts=3D<partdef>[,<partdef>]*
>
> This allows one to repartition the OneNAND chip and is useful for flashin=
g
> applications that do the partitioning from scratch or want to backup and
> update the partitioning.
>
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> ---
> =A0drivers/mtd/cmdlinepart.c =A0 | =A0 35 +++++++++++++++++++++++++++++--=
----
> =A0drivers/mtd/onenand/omap2.c | =A0 29 +++++++++++++++++++++++++++++
> =A02 files changed, 58 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 1479da6..77fa7b7 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -5,7 +5,7 @@
> =A0*
> =A0* The format for the command line is as follows:
> =A0*
> - * mtdparts=3D<mtddef>[;<mtddef]
> + * mtdparts=3D<mtddef>[;<mtddef>]
> =A0* <mtddef> =A0:=3D <mtd-id>:<partdef>[,<partdef>]
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0where <mtd-id> is the name from the "cat =
/proc/mtd" command
> =A0* <partdef> :=3D <size>[@offset][<name>][ro][lk]
> @@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
> =A0/* mtdpart_setup() parses into here */
> =A0static struct cmdline_mtd_partition *partitions;
>
> -/* the command line passed to mtdpart_setupd() */
> +/* the command line passed to mtdpart_setup() */
> =A0static char *cmdline;
> =A0static int cmdline_parsed =3D 0;
>
> @@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
> =A0{
> =A0 =A0 =A0 =A0cmdline_parsed =3D 1;
>
> - =A0 =A0 =A0 for( ; s !=3D NULL; )
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cmdline_mtd_partition *this_mtd;
> + =A0 =A0 =A0 for ( ; s !=3D NULL; ) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cmdline_mtd_partition *this_mtd, *mt=
d, *mtd_prev;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct mtd_partition *parts;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int mtd_id_len;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int num_parts;
> @@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this_mtd->mtd_id =3D (char*)(this_mtd + 1)=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_l=
en + 1);
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* remove existing ones with the same id */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd_prev =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (mtd =3D partitions; mtd;) =A0 =A0{
Space instead of tab.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strcmp(this_mtd->mtd_id=
, mtd->mtd_id) =3D=3D 0) {
Hmm... I guess you won't get your device id matched here. Since the
string you are passing from omap onenand driver is something like
this:
omap2-onenand:.....

while mtd registers device ids in different format, something like:
'omap2-onenand.0'

--=20
Regards,
Vimal Singh

[snip]

> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +extern int mtdpart_setup(char *);
> +
> +static const char *part_probes[] =3D { "cmdlinepart", NULL };
> +static char parts[256] =3D DRIVER_NAME ":";
> +
> +module_param_string(parts, parts + DRIVER_NAME_SIZE, 256 - DRIVER_NAME_S=
IZE, 0);
> +#endif
> +
> +
> =A0static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
> =A0{
> =A0 =A0 =A0 =A0struct omap2_onenand *c =3D data;
> @@ -709,6 +721,23 @@ static int __devinit omap2_onenand_probe(struct plat=
form_device *pdev)
> =A0 =A0 =A0 =A0}
>
> =A0#ifdef CONFIG_MTD_PARTITIONS
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> + =A0 =A0 =A0 printk(KERN_INFO "parts=3D%s\n", parts);
> + =A0 =A0 =A0 /* check module parameter */
> + =A0 =A0 =A0 if (parts[DRIVER_NAME_SIZE] !=3D '\0') {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* check parts string */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strchr(parts, ';') || strchr(parts + DR=
IVER_NAME_SIZE, ':')) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_pr=
obe: invalid partition parameter\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtdpart_setup(parts);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 r =3D parse_mtd_partitions(&c->mtd, part_probes, &c->parts,=
 0);
> + =A0 =A0 =A0 if (r > 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* module param or kernel command line arg =
*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D add_mtd_partitions(&c->mtd, c->parts,=
 r);
> + =A0 =A0 =A0 } else
> +#endif
> =A0 =A0 =A0 =A0if (pdata->parts !=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r =3D add_mtd_partitions(&c->mtd, pdata->p=
arts,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 pdata->nr_parts);
> --
> 1.6.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
