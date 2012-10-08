Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL42g-0007gV-M2
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 03:30:07 +0000
Message-ID: <5072496A.3040205@freescale.com>
Date: Mon, 8 Oct 2012 11:32:58 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>	<50723E5C.3020403@freescale.com>
 <CAOMZO5AE22Kscv8JAxiazzR5NSvEH+qs4QxBC6aEQqi3ZCpCpg@mail.gmail.com>
In-Reply-To: <CAOMZO5AE22Kscv8JAxiazzR5NSvEH+qs4QxBC6aEQqi3ZCpCpg@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA10=D4=C208=C8=D5 11:22, Fabio Estevam =D0=B4=B5=C0:
> On Sun, Oct 7, 2012 at 11:45 PM, Huang Shijie <b32955@freescale.com> wr=
ote:
>> =D3=DA 2012=C4=EA09=D4=C224=C8=D5 02:31, Fabio Estevam =D0=B4=B5=C0:
>>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>>
>>> On a mx28 board the following error happens since commit 638064e56c
>>> (mtd: gpmi: change the code for clocks):
>>>
>>> gpmi-nand: probe of 8000c000.gpmi-nand failed with error -12
>>>
>>> Acquire the clock using "NULL" as it was done previously, so that the=
 driver
>>> can register on mx23/mx28 as well.
>>>
>>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>>> ---
>>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/gpmi-nand/gpmi-nand.c
>>> index c46be6c..1f23cb4 100644
>>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>>> @@ -492,7 +492,7 @@ static int __devinit gpmi_get_clks(struct gpmi_na=
nd_data *this)
>>>       int i;
>>>
>>>       /* The main clock is stored in the first. */
>>> -     r->clock[0] =3D clk_get(this->dev, "gpmi_io");
>>> +     r->clock[0] =3D clk_get(this->dev, NULL);
>> Please do not change this line.
>>
>> The gpmi_io is for mx6q.
>> If you replace it with `NULL`. The mx6q can not find the proper clock.
> What about this?
>
> index 42978f1b..7b1aded 100644
> --- a/drivers/clk/mxs/clk-imx28.c
> +++ b/drivers/clk/mxs/clk-imx28.c
> @@ -139,7 +139,7 @@ enum imx28_clk {
>         ssp0_div, ssp1_div, ssp2_div, ssp3_div, gpmi_div, emi_pll,
>         emi_xtal, lcdif_div, etm_div, ptp, saif0_div, saif1_div,
>         clk32k_div, rtc, lradc, spdif_div, clk32k, pwm, uart, ssp0,
> -       ssp1, ssp2, ssp3, gpmi, spdif, emi, saif0, saif1, lcdif, etm,
> +       ssp1, ssp2, ssp3, gpmi_io, spdif, emi, saif0, saif1, lcdif, etm=
,
>         fec, can0, can1, usb0, usb1, usb0_pwr, usb1_pwr, enet_out,
>         clk_max
>  };
> @@ -208,7 +208,7 @@ int __init mx28_clocks_init(void)
>         clks[ssp1] =3D mxs_clk_gate("ssp1", "ssp1_div", SSP1, 31);
>         clks[ssp2] =3D mxs_clk_gate("ssp2", "ssp2_div", SSP2, 31);
>         clks[ssp3] =3D mxs_clk_gate("ssp3", "ssp3_div", SSP3, 31);
> -       clks[gpmi] =3D mxs_clk_gate("gpmi", "gpmi_div", GPMI, 31);
> +       clks[gpmi_io] =3D mxs_clk_gate("gpmi_io", "gpmi_div", GPMI, 31)=
;
:)

This patch is really not needed.

The clk_get() can get the right clock in the mx23/mx28. I tested them.

Please read the code of clk_get().


BR
Huang Shijie


>         clks[spdif] =3D mxs_clk_gate("spdif", "spdif_div", SPDIF, 31);
>         clks[emi] =3D mxs_clk_gate("emi", "emi_sel", EMI, 31);
>         clks[saif0] =3D mxs_clk_gate("saif0", "saif0_div", SAIF0, 31);
>
> Can you please test it on mx28?
>
> Regards,
>
> Fabio Estevam
>
