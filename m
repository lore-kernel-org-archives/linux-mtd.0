Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N39vw-0002kx-2S
	for linux-mtd@lists.infradead.org; Wed, 28 Oct 2009 14:55:37 +0000
Received: by fg-out-1718.google.com with SMTP id e21so484996fga.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Oct 2009 07:55:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256730627.29885.782.camel@localhost>
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1256730627.29885.782.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 28 Oct 2009 20:25:08 +0530
Message-ID: <ce9ab5790910280755h77dc7b37u6176f58a377443b0@mail.gmail.com>
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mika Korhonen <ext-mika.2.korhonen@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 28, 2009 at 5:20 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Thu, 2009-09-03 at 14:15 +0300, Mika Korhonen wrote:
>> Add module parameter "parts" to omap2-onenand driver. Parameter format i=
s
>> the same as for cmdlinepart except mtd-id must not be specified - it
>> gets prepended by the driver, i.e.: parts=3D<partdef>[,<partdef>]*
>>
>> This allows one to repartition the OneNAND chip and is useful for flashi=
ng
>> applications that do the partitioning from scratch or want to backup and
>> update the partitioning.
>>
>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>> ---
>> =A0drivers/mtd/cmdlinepart.c =A0 | =A0 35 +++++++++++++++++++++++++++++-=
-----
>> =A0drivers/mtd/onenand/omap2.c | =A0 29 +++++++++++++++++++++++++++++
>> =A02 files changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>> index 1479da6..77fa7b7 100644
>> --- a/drivers/mtd/cmdlinepart.c
>> +++ b/drivers/mtd/cmdlinepart.c
>> @@ -5,7 +5,7 @@
>> =A0 *
>> =A0 * The format for the command line is as follows:
>> =A0 *
>> - * mtdparts=3D<mtddef>[;<mtddef]
>> + * mtdparts=3D<mtddef>[;<mtddef>]
>> =A0 * <mtddef> =A0:=3D <mtd-id>:<partdef>[,<partdef>]
>> =A0 * =A0 =A0 =A0 =A0 =A0 =A0 =A0where <mtd-id> is the name from the "ca=
t /proc/mtd" command
>> =A0 * <partdef> :=3D <size>[@offset][<name>][ro][lk]
>> @@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
>> =A0/* mtdpart_setup() parses into here */
>> =A0static struct cmdline_mtd_partition *partitions;
>>
>> -/* the command line passed to mtdpart_setupd() */
>> +/* the command line passed to mtdpart_setup() */
>> =A0static char *cmdline;
>> =A0static int cmdline_parsed =3D 0;
>>
>> @@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
>> =A0{
>> =A0 =A0 =A0 cmdline_parsed =3D 1;
>>
>> - =A0 =A0 for( ; s !=3D NULL; )
>> - =A0 =A0 {
>> - =A0 =A0 =A0 =A0 =A0 =A0 struct cmdline_mtd_partition *this_mtd;
>> + =A0 =A0 for ( ; s !=3D NULL; ) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct cmdline_mtd_partition *this_mtd, *mtd, =
*mtd_prev;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_partition *parts;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int mtd_id_len;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int num_parts;
>> @@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 this_mtd->mtd_id =3D (char*)(this_mtd + 1);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len=
 + 1);
>>
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* remove existing ones with the same id */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mtd_prev =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 for (mtd =3D partitions; mtd;) =A0 =A0{
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strcmp(this_mtd->mtd_id, m=
td->mtd_id) =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_IN=
FO "old entry for mtd id %s "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 "exists, removing\n", mtd->mtd_id);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mtd_prev) =
{
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mtd_prev->next =3D mtd->next;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 kfree(mtd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mtd =3D mtd_prev->next;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 partitions =3D mtd->next;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 kfree(mtd);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mtd =3D partitions;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd_prev =3D m=
td;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd =3D mtd->n=
ext;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* link into chain */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 this_mtd->next =3D partitions;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 partitions =3D this_mtd;
>> @@ -354,12 +374,15 @@ static int parse_cmdline_partitions(struct mtd_inf=
o *master,
>> =A0 *
>> =A0 * This function needs to be visible for bootloaders.
>> =A0 */
>> -static int mtdpart_setup(char *s)
>> +int mtdpart_setup(char *s)
>> =A0{
>> =A0 =A0 =A0 cmdline =3D s;
>> + =A0 =A0 cmdline_parsed =3D 0;
>> =A0 =A0 =A0 return 1;
>> =A0}
>
> This global flag is not nice. Not sure what would be a better way, but
> may be you have an idea how to do this nicer?
>
>> +EXPORT_SYMBOL(mtdpart_setup);
>> +
>> =A0__setup("mtdparts=3D", mtdpart_setup);
>>
>> =A0static struct mtd_part_parser cmdline_parser =3D {
>> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
>> index 0108ed4..b216a92 100644
>> --- a/drivers/mtd/onenand/omap2.c
>> +++ b/drivers/mtd/onenand/omap2.c
>> @@ -45,6 +45,7 @@
>> =A0#include <mach/board.h>
>>
>> =A0#define DRIVER_NAME "omap2-onenand"
>> +#define DRIVER_NAME_SIZE sizeof(DRIVER_NAME)
>
> No need to '#define' this, this is really an unnecessary complication
> for readability.
>
>>
>> =A0#define ONENAND_IO_SIZE =A0 =A0 =A0 =A0 =A0 =A0 =A0SZ_128K
>> =A0#define ONENAND_BUFRAM_SIZE =A0(1024 * 5)
>> @@ -64,6 +65,17 @@ struct omap2_onenand {
>> =A0 =A0 =A0 int (*setup)(void __iomem *base, int freq);
>> =A0};
>>
>> +
>> +#ifdef CONFIG_MTD_CMDLINE_PARTS
>> +extern int mtdpart_setup(char *);
>> +
>> +static const char *part_probes[] =3D { "cmdlinepart", NULL };
>> +static char parts[256] =3D DRIVER_NAME ":";
>> +
>> +module_param_string(parts, parts + DRIVER_NAME_SIZE, 256 - DRIVER_NAME_=
SIZE, 0);
>> +#endif
>
> Please, do not make the module parameter to be compiled conditionally.
> If you add this parameter, I think it should be there all the time. Just
> use 'select' in Kconfig and make sure the parser is always there.
>
>> +
>> +
>> =A0static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
>> =A0{
>> =A0 =A0 =A0 struct omap2_onenand *c =3D data;
>> @@ -709,6 +721,23 @@ static int __devinit omap2_onenand_probe(struct pla=
tform_device *pdev)
>> =A0 =A0 =A0 }
>>
>> =A0#ifdef CONFIG_MTD_PARTITIONS
>> +#ifdef CONFIG_MTD_CMDLINE_PARTS
>> + =A0 =A0 printk(KERN_INFO "parts=3D%s\n", parts);
>> + =A0 =A0 /* check module parameter */
>> + =A0 =A0 if (parts[DRIVER_NAME_SIZE] !=3D '\0') {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* check parts string */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (strchr(parts, ';') || strchr(parts + DRIVE=
R_NAME_SIZE, ':')) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_probe=
: invalid partition parameter\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtdpart_setup(parts);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>
> Unnecessary { }
> Please, use %s and __func__ instead of hard-coding function names.
>
>> + =A0 =A0 }
>> + =A0 =A0 r =3D parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0)=
;
>> + =A0 =A0 if (r > 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* module param or kernel command line arg */
>> + =A0 =A0 =A0 =A0 =A0 =A0 r =3D add_mtd_partitions(&c->mtd, c->parts, r)=
;
>> + =A0 =A0 } else

here too... Unnecessary { }

>> +#endif
>> =A0 =A0 =A0 if (pdata->parts !=3D NULL)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D add_mtd_partitions(&c->mtd, pdata->par=
ts,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0pdata->nr_parts);
>
> This #ifdef injecting is bad, but it should go away if you do what I
> suggest above.
>

--=20
Regards,
Vimal Singh
