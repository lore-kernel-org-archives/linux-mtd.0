Message-ID: <4FF138F2.6070503@freescale.com>
Date: Mon, 2 Jul 2012 14:00:18 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Hui Wang <jason77.wang@gmail.com>
Subject: Re: [PATCH v3 3/3] mtd: gpmi: change the code for clocks
References: <1341200327-8144-1-git-send-email-shijie8@gmail.com>
 <1341200327-8144-4-git-send-email-shijie8@gmail.com>
 <4FF133F9.50704@gmail.com>
In-Reply-To: <4FF133F9.50704@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: shawn.guo@linaro.org, dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 dong.aisheng@linaro.org, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B407=E6=9C=8802=E6=97=A5 13:39, Hui Wang =E5=86=99=E9=
=81=93:
> Huang Shijie wrote:
>> The gpmi nand driver may needs several clocks(MX6Q needs five clocks).
>>
>> In the old clock framework, all these clocks are chained together,
>> all you need is to manipulate the first clock.
>>
>> But the kernel uses the common clk framework now, which forces us to
>> get the clocks one by one. When we use them, we have to enable them
>> one by one too.
>>
>> Signed-off-by: Huang Shijie <shijie8@gmail.com>
>> ---
>> arch/arm/boot/dts/imx6q-arm2.dts | 2 +-
>> drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 43 ++++++++++++++---
>> drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 82=20
>> ++++++++++++++++++++++++++++----
>> drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 3 +-
>> 4 files changed, 111 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6q-arm2.dts=20
>> b/arch/arm/boot/dts/imx6q-arm2.dts
>> index 14e72e2..027a2f8 100644
>> --- a/arch/arm/boot/dts/imx6q-arm2.dts
>> +++ b/arch/arm/boot/dts/imx6q-arm2.dts
>> @@ -25,7 +25,7 @@
>> gpmi-nand@00112000 {
>> pinctrl-names =3D "default";
>> pinctrl-0 =3D <&pinctrl_gpmi_nand_1>;
>> - status =3D "disabled"; /* gpmi nand conflicts with SD */
>> + status =3D "okay"; /* gpmi nand conflicts with SD */
>> };
>>
>> aips-bus@02100000 { /* AIPS2 */
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c=20
>> b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> index a1f4332..c3778c0 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> @@ -124,12 +124,40 @@ error:
>> return -ETIMEDOUT;
>> }
>>
>> +static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
>> +{
>> + struct clk *clk;
>> + int ret;
>> + int i;
>> +
>> + for (i =3D 0; i < GPMI_CLK_MAX; i++) {
>> + clk =3D this->resources.clock[i];
>> + if (!clk)
>> + break;
>> +
>> + if (v) {
>> + ret =3D clk_prepare_enable(clk);
>> + if (ret)
>> + goto err_clk;
>> + } else {
>> + clk_disable_unprepare(clk);
>> + }
>> + }
>> + return 0;
>> +
>> +err_clk:
> Doesn't this design introduce clk_enalbe/disable un-balance problems?
>
> Suppose you successfully enabled 1st and 2nd clocks, and failed at the=20
> third clock, this function will return, then the caller function will=20
> check the return value and call
>
> __gpmi_enable_clk(this, 0), in this function, it will unconditionally=20
> disable all five clocks.
thanks, fix it in next version.

Huang Shijie
>
>
> Regards,
> Hui.
>
>> + return ret;
>> +}
>> +
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
