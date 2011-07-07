MIME-Version: 1.0
In-Reply-To: <4E1411BB.4010000@compulab.co.il>
References: <1309319494-17951-1-git-send-email-leiwen@marvell.com>
	<1309771536-10597-4-git-send-email-leiwen@marvell.com>
	<4E1411BB.4010000@compulab.co.il>
Date: Thu, 7 Jul 2011 14:26:23 +0800
Message-ID: <CALZhoSQgoMS7bSRx1V-tMX+aG4idF6Z-Xr3CorFSXwPMHvacXw@mail.gmail.com>
Subject: Re: [PATCH 3/4] MTD: pxa3xx_nand: enable multiple chip select support
From: Lei Wen <adrian.wenl@gmail.com>
To: Igor Grinberg <grinberg@compulab.co.il>, Daniel Mack <zonque@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Lei Wen <leiwen@marvell.com>, Yu Tang <ytang5@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Igor && Daniel,

On Wed, Jul 6, 2011 at 3:41 PM, Igor Grinberg <grinberg@compulab.co.il> wro=
te:
> On 07/04/11 12:25, Lei Wen wrote:
>
>> =A0#ifdef CONFIG_PM
>> @@ -1203,8 +1259,12 @@ static int pxa3xx_nand_resume(struct platform_dev=
ice *pdev)
>> =A0{
>> =A0 =A0 =A0 struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev)=
;
>>
>> - =A0 =A0 nand_writel(info, NDTR0CS0, info->host->ndtr0cs0);
>> - =A0 =A0 nand_writel(info, NDTR1CS0, info->host->ndtr1cs0);
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Directly set the chip select to a invalid value,
>> + =A0 =A0 =A0* then the driver would reset the timing according
>> + =A0 =A0 =A0* to current chip select at the beginning of cmdfunc
>> + =A0 =A0 =A0*/
>> + =A0 =A0 info->cs =3D 0xff;
>
> Thinking of this for the second (or third) time,
> If you have keep config enabled and have only one nand chip,
> this will brake the keep config...
>
> Daniel,
>
> have you tested the suspend/resume with this patch?
> (and keep_config on?)
>

Do you still have concern with this change?
If not, I would push the next round of patch set including merging
patch 3 and 4.

Thanks,
Lei
