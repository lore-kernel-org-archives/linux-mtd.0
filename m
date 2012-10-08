Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL43i-0007jv-Lu
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 03:31:11 +0000
Message-ID: <507249B1.7040308@freescale.com>
Date: Mon, 8 Oct 2012 11:34:09 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>
 <50723E5C.3020403@freescale.com> <201210080515.19706.marex@denx.de>
In-Reply-To: <201210080515.19706.marex@denx.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA10=D4=C208=C8=D5 11:15, Marek Vasut =D0=B4=B5=C0:
> Dear Huang Shijie,
>
>> =D3=DA 2012=C4=EA09=D4=C224=C8=D5 02:31, Fabio Estevam =D0=B4=B5=C0:
>>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>>
>>> On a mx28 board the following error happens since commit 638064e56c
>>> (mtd: gpmi: change the code for clocks):
>>>
>>> gpmi-nand: probe of 8000c000.gpmi-nand failed with error -12
>>>
>>> Acquire the clock using "NULL" as it was done previously, so that the
>>> driver can register on mx23/mx28 as well.
>>>
>>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>>> ---
>>>
>>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>>> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index c46be6c..1f23cb4 10064=
4
>>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>>> @@ -492,7 +492,7 @@ static int __devinit gpmi_get_clks(struct
>>> gpmi_nand_data *this)
>>>
>>>  	int i;
>>>  =09
>>>  	/* The main clock is stored in the first. */
>>>
>>> -	r->clock[0] =3D clk_get(this->dev, "gpmi_io");
>>> +	r->clock[0] =3D clk_get(this->dev, NULL);
>> Please do not change this line.
>>
>> The gpmi_io is for mx6q.
>> If you replace it with `NULL`. The mx6q can not find the proper clock.
> Suggestion is really welcome though, please :) This is a problem, GPMI =
NAND is=20
> broken on anything !=3D mx6q. Huang, can you please also test the chang=
es you do=20
> to GPMI NAND on mx28/mx23 so we can avoid this breakage in the future?
yes. I tested in the mx23/mx28. It's ok, do not worry.

BR
Huang Shijie
> Best regards,
> Marek Vasut
>
