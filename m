MIME-Version: 1.0
In-Reply-To: <BANLkTimk0+2LUeo5sq8w4ohRq-qCe_2t_Q@mail.gmail.com>
References: <1308712645-5986-1-git-send-email-leiwen@marvell.com>
	<BANLkTinQB-hXMRy5+BXKQSrPq=sVrorCVA@mail.gmail.com>
	<BANLkTimk0+2LUeo5sq8w4ohRq-qCe_2t_Q@mail.gmail.com>
Date: Wed, 22 Jun 2011 15:06:52 +0200
Message-ID: <BANLkTim54jEKmxAQFNMGCyWwAu+FhVu0KA@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: enable multiple chip select support
From: Daniel Mack <zonque@gmail.com>
To: Lei Wen <adrian.wenl@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
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

Hi Lei,

On Wed, Jun 22, 2011 at 2:21 PM, Lei Wen <adrian.wenl@gmail.com> wrote:
> Hi Daniel,
>
> On Wed, Jun 22, 2011 at 7:39 PM, Daniel Mack <zonque@gmail.com> wrote:
>> On Wed, Jun 22, 2011 at 5:17 AM, Lei Wen <leiwen@marvell.com> wrote:
>>> Current pxa3xx_nand controller has two chip select which
>>> both be workable. This patch enable this feature.
>>>
>>> Update platform driver to support this feature.
>>>
>>> Another notice should be taken that:
>>> When you want to use this feature, you should not enable the
>>> keep configuration feature, for two chip select could be
>>> attached with different nand chip. The different page size
>>> and timing requirement make the keep configuration impossible.
>>>
>>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>>> ---
>>> =A0arch/arm/mach-mmp/aspenite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>>> =A0arch/arm/mach-pxa/cm-x300.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A05 +-
>>> =A0arch/arm/mach-pxa/colibri-pxa3xx.c =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +-
>>> =A0arch/arm/mach-pxa/littleton.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A05 +-
>>> =A0arch/arm/mach-pxa/mxm8x10.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A09 +-
>>> =A0arch/arm/mach-pxa/raumfeld.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>>> =A0arch/arm/mach-pxa/zylonite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>>> =A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =A0 =A08 +-
>>> =A0drivers/mtd/nand/pxa3xx_nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0735 =
+++++++++++++++-----------
>>> =A09 files changed, 444 insertions(+), 338 deletions(-)
>>
>> This patch doesn't apply for me on top of Linus' master branch. Which
>> tree are you based on currently?
>
> Actually it is based on Linux 3.0-rc2 and add two patches pending to
> l2-mtd-2.6.git already:
>
> mtd: pxa3xx_nand: fix nand detection issue
> mtd: pxa3xx_nand: Fix blank page ECC mismatch

I have a similar setup, also with those two patches on top, but
applying your patch gives me:

Applying: MTD: pxa3xx_nand: enable multiple chip select support
error: patch failed: drivers/mtd/nand/pxa3xx_nand.c:477
error: drivers/mtd/nand/pxa3xx_nand.c: patch does not apply
Patch failed at 0001 MTD: pxa3xx_nand: enable multiple chip select support
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

Could you push your branch somewhere?

>>> =A0#ifdef CONFIG_PM
>>> @@ -1183,8 +1278,8 @@ static int pxa3xx_nand_resume(struct platform_dev=
ice *pdev)
>>> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D platform_get_drvdata(p=
dev);
>>> =A0 =A0 =A0 =A0struct mtd_info *mtd =3D info->mtd;
>>>
>>> - =A0 =A0 =A0 nand_writel(info, NDTR0CS0, info->ndtr0cs0);
>>> - =A0 =A0 =A0 nand_writel(info, NDTR1CS0, info->ndtr1cs0);
>>> + =A0 =A0 =A0 nand_writel(nand, NDTR0CS0, info->ndtr0cs0);
>>> + =A0 =A0 =A0 nand_writel(nand, NDTR1CS0, info->ndtr1cs0);
>>> =A0 =A0 =A0 =A0clk_enable(info->clk);
>>
>> This won't compile.
>
> Could you post your build log?

I didn't compile it because I couldn't, but "nand" is certainly
undefined in this context now. Did you compile and test this code with
"CONFIG_PM=3Dy"?


Thanks,
Daniel
