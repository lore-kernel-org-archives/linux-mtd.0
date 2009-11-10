Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N7md9-0003Ig-TC
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 09:03:21 +0000
Received: by bwz4 with SMTP id 4so4336800bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Nov 2009 01:03:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4AF905B8.4070704@nokia.com>
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<ce9ab5790910290625u9baaf14le5ab14fe4d6ba783@mail.gmail.com>
	<4AF905B8.4070704@nokia.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 10 Nov 2009 14:32:54 +0530
Message-ID: <ce9ab5790911100102q64c5cb6an371ff7f1b7699a4f@mail.gmail.com>
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 10, 2009 at 11:48 AM, Mika Korhonen
<ext-mika.2.korhonen@nokia.com> wrote:
> ext Vimal Singh wrote:
>>
>> On Thu, Sep 3, 2009 at 4:45 PM, Mika Korhonen
>> <ext-mika.2.korhonen@nokia.com> wrote:
>>
>>>
>>> Add module parameter "parts" to omap2-onenand driver. Parameter format =
is
>>> the same as for cmdlinepart except mtd-id must not be specified - it
>>> gets prepended by the driver, i.e.: parts=3D<partdef>[,<partdef>]*
>>>
>>> This allows one to repartition the OneNAND chip and is useful for
>>> flashing
>>> applications that do the partitioning from scratch or want to backup an=
d
>>> update the partitioning.
>>>
>>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>>> ---
>>> =A0drivers/mtd/cmdlinepart.c =A0 | =A0 35 +++++++++++++++++++++++++++++=
------
>>> =A0drivers/mtd/onenand/omap2.c | =A0 29 +++++++++++++++++++++++++++++
>>> =A02 files changed, 58 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>>> index 1479da6..77fa7b7 100644
>>> --- a/drivers/mtd/cmdlinepart.c
>>> +++ b/drivers/mtd/cmdlinepart.c
>>> @@ -5,7 +5,7 @@
>>> =A0*
>>> =A0* The format for the command line is as follows:
>>> =A0*
>>> - * mtdparts=3D<mtddef>[;<mtddef]
>>> + * mtdparts=3D<mtddef>[;<mtddef>]
>>> =A0* <mtddef> =A0:=3D <mtd-id>:<partdef>[,<partdef>]
>>> =A0* =A0 =A0 =A0 =A0 =A0 =A0 =A0where <mtd-id> is the name from the "ca=
t /proc/mtd"
>>> command
>>> =A0* <partdef> :=3D <size>[@offset][<name>][ro][lk]
>>> @@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
>>> =A0/* mtdpart_setup() parses into here */
>>> =A0static struct cmdline_mtd_partition *partitions;
>>>
>>> -/* the command line passed to mtdpart_setupd() */
>>> +/* the command line passed to mtdpart_setup() */
>>> =A0static char *cmdline;
>>> =A0static int cmdline_parsed =3D 0;
>>>
>>> @@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
>>> =A0{
>>> =A0 =A0 =A0 cmdline_parsed =3D 1;
>>>
>>> - =A0 =A0 =A0 for( ; s !=3D NULL; )
>>> - =A0 =A0 =A0 {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cmdline_mtd_partition *this_mtd;
>>> + =A0 =A0 =A0 for ( ; s !=3D NULL; ) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cmdline_mtd_partition *this_mtd, *=
mtd, *mtd_prev;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_partition *parts;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int mtd_id_len;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 int num_parts;
>>> @@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 this_mtd->mtd_id =3D (char*)(this_mtd + 1);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_le=
n + 1);
>>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* remove existing ones with the same id =
*/
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd_prev =3D NULL;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (mtd =3D partitions; mtd;) =A0 =A0{
>>>
>>
>> Space instead of tab.
>>
>>
>>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strcmp(this_mtd->mtd_=
id, mtd->mtd_id) =3D=3D 0) {
>>>
>>
>> Hmm... I guess you won't get your device id matched here. Since the
>> string you are passing from omap onenand driver is something like
>> this:
>> omap2-onenand:.....
>>
>> while mtd registers device ids in different format, something like:
>> 'omap2-onenand.0'
>>
>>
>
> It's been tested, and it matches. In parse_cmdline_partitions() mtd_id is
> set from mtd_info.name of the chip. Could be that cmdlinepart.c is outdat=
ed,
> though.

I am still not convinced. I use to get below prints when I boot up
(this is for NAND and should be same for OneNAND too):
...
omap2-nand driver initializing
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xbc (Micron NAND 512MiB
1,8V 16-bit)
Creating 7 MTD partitions on "omap2-nand.0":
...
This print comes from 'add_mtd_partitions' (drivers/mtd/mtdpart.c):
printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts,
master->name);

And I use to give cmdline like this:
"mtdparts=3Domap2-nand.0:512k@0(p1),1280k@512k(p2),768k@1792k(p3),5m@2560k(=
p4),123392k@7680k(p5)"

and this works for me.

--=20
Regards,
Vimal Singh
