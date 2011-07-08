Message-ID: <4E16B21C.7030102@freescale.com>
Date: Fri, 8 Jul 2011 15:30:36 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 2/4] ARM: mxs: add new a pad control
References: <1310102885-4102-1-git-send-email-b32955@freescale.com>
	<1310102885-4102-3-git-send-email-b32955@freescale.com>
	<20110708072359.GO29624@pengutronix.de>
In-Reply-To: <20110708072359.GO29624@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, s.hauer@pengutronix.de, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B407=E6=9C=8808=E6=97=A5 15:23, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> On Fri, Jul 08, 2011 at 01:28:03PM +0800, Huang Shijie wrote:
>> add a new pad control which is used in some rare cases,
>> such as gpmi-nand device.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   arch/arm/mach-mxs/include/mach/iomux.h |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-mxs/include/mach/iomux.h b/arch/arm/mach-mx=
s/include/mach/iomux.h
>> index 7abdf58..1f31762 100644
>> --- a/arch/arm/mach-mxs/include/mach/iomux.h
>> +++ b/arch/arm/mach-mxs/include/mach/iomux.h
>> @@ -94,6 +94,9 @@ typedef u32 iomux_cfg_t;
>>   /* generic pad control used in most cases */
>>   #define MXS_PAD_CTRL	(MXS_PAD_4MA | MXS_PAD_3V3 | MXS_PAD_NOPULL)
>>
>> +/* special pad control used in rare cases */
> I'd not talk about "rare cases" in the comment. It applies to most pads=
,
> that they are used rarely (at most once per machine :-)
ok. I will remove this comment in next version. :)

>> +#define MXS_PAD_CTRL_12MA	(MXS_PAD_12MA | MXS_PAD_3V3 | MXS_PAD_NOPUL=
L)
> But other than that I fully support this definition.
thanks.

Best Regards
Huang Shijie
> Best regards
> Uwe
>
