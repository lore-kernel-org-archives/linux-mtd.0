MIME-Version: 1.0
In-Reply-To: <1309246361.23597.30.camel@sauron>
References: <4E031900.50108@compulab.co.il>
	<1309000666-5242-1-git-send-email-leiwen@marvell.com>
	<1309246361.23597.30.camel@sauron>
Date: Tue, 28 Jun 2011 23:12:38 +0800
Message-ID: <BANLkTik6gSqYk1FsnCGS7WgfupgA6jdY0A@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: enable multiple chip select support
From: Lei Wen <adrian.wenl@gmail.com>
To: dedekind1@gmail.com, Igor Grinberg <grinberg@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2011 at 3:32 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Sat, 2011-06-25 at 04:17 -0700, Lei Wen wrote:
>> Current pxa3xx_nand controller has two chip select which
>> both be workable. This patch enable this feature.
>>
>> Update platform driver to support this feature.
>>
>> Another notice should be taken that:
>> When you want to use this feature, you should not enable the
>> keep configuration feature, for two chip select could be
>> attached with different nand chip. The different page size
>> and timing requirement make the keep configuration impossible.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> ---
>> =A0arch/arm/mach-mmp/aspenite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/cm-x300.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/colibri-pxa3xx.c =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +-
>> =A0arch/arm/mach-pxa/littleton.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/mxm8x10.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A09 +-
>> =A0arch/arm/mach-pxa/raumfeld.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>> =A0arch/arm/mach-pxa/zylonite.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +-
>> =A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =A0 19 +-
>> =A0drivers/mtd/nand/pxa3xx_nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0512 +=
++++++++++++++-----------
>> =A09 files changed, 346 insertions(+), 224 deletions(-)
>
> In general huge patches like this are not encouraged and it is better to
> split them. At least the printk changes can be in a separate patch. Then
> re-naming host to info probably could be another patch. Could you please
> rather do a series of smaller patches? Also, if you use dev_info and the
> like functions, you probably do not need the pxa3xx_nand prefix anymore.
>

Hi Artem & Igor,

Thanks for your suggestion, I would seperate this patch and push back later=
.

Best regards,
Lei
