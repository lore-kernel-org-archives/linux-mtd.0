MIME-Version: 1.0
In-Reply-To: <4E1D7A1E.1020802@mvista.com>
References: <1310466535-15287-1-git-send-email-leiwen@marvell.com>
	<1310481336-13230-3-git-send-email-leiwen@marvell.com>
	<4E1D7A1E.1020802@mvista.com>
Date: Wed, 13 Jul 2011 20:41:53 +0800
Message-ID: <CALZhoSShiGBPdZtxUK1c6+PPMJQWHM5G6Ucb6+H=Tb+aszCu5g@mail.gmail.com>
Subject: Re: [PATCH V7 2/4] MTD: pxa3xx_nand: convert all printk into dev_*
From: Lei Wen <adrian.wenl@gmail.com>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Lei Wen <leiwen@marvell.com>, Yu Tang <ytang5@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

On Wed, Jul 13, 2011 at 6:57 PM, Sergei Shtylyov <sshtylyov@mvista.com> wro=
te:
> Hello.
>
> On 12-07-2011 18:35, Lei Wen wrote:
>
>> Signed-off-by: Lei Wen<leiwen@marvell.com>
>> ---
>> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 27 ++++++++++++++++-----------
>> =A01 files changed, 16 insertions(+), 11 deletions(-)
>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index 1efecf7..afe14bd 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>
> [...]
>>
>> @@ -774,11 +774,15 @@ static int pxa3xx_nand_config_flash(struct
>> pxa3xx_nand_info *info,
>> =A0 =A0 =A0 =A0struct pxa3xx_nand_platform_data *pdata =3D pdev->dev.pla=
tform_data;
>> =A0 =A0 =A0 =A0uint32_t ndcr =3D 0x0; /* enable all interrupts */
>>
>> - =A0 =A0 =A0 if (f->page_size !=3D 2048 && f->page_size !=3D 512)
>> + =A0 =A0 =A0 if (f->page_size !=3D 2048 && f->page_size !=3D 512) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Current only support =
2048 and 512
>> size\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>> + =A0 =A0 =A0 }
>>
>> - =A0 =A0 =A0 if (f->flash_width !=3D 16 && f->flash_width !=3D 8)
>> + =A0 =A0 =A0 if (f->flash_width !=3D 16 && f->flash_width !=3D 8) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Only support 8bit and=
 16 bit!\n");
>
> =A0 So this patch not only converts printk() to dev_*() calls, it also ad=
ds
> some dev_err() calls? This should have been mentioned in the change long =
at
> least...

What do you mean by "chang long"? Do you mean the cover letter or the
patch name?
Certainly it is a good suggest to show it in the change version list.

>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>> + =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 =A0/* calculate flash information */
>> =A0 =A0 =A0 =A0info->cmdset =3D&default_cmdset;
>> @@ -898,7 +902,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>> =A0 =A0 =A0 =A0if (!ret) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(mtd);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->mtd =3D NULL;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "There is no nand chip on=
 cs 0!\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(&info->pdev->dev, "There is no na=
nd chip on cs
>> 0!\n");
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>> =A0 =A0 =A0 =A0}
>> @@ -906,11 +910,12 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>> =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
>> =A0 =A0 =A0 =A0id =3D *((uint16_t *)(info->data_buff));
>> =A0 =A0 =A0 =A0if (id !=3D 0)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "Detect a flash id %x\n",=
 id);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(&info->pdev->dev, "Detect a flash=
 id %x\n", id);
>> =A0 =A0 =A0 =A0else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(mtd);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->mtd =3D NULL;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "Read out ID 0, potent=
ial timing set
>> wrong!!\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&info->pdev->dev, "Read out ID 0,=
 "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "potential=
 timing set wrong!!\n");
>
> =A0 Don't break the string -- this prevents grepping for it.

Thanks, I would fix it.

Best regards,
Lei
