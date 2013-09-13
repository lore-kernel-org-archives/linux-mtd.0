Message-ID: <52329AD3.2050608@freescale.com>
Date: Fri, 13 Sep 2013 12:55:47 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
 <20130913025827.GA3051@gmail.com> <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com> <20130912205644.GW29403@sirena.org.uk>
In-Reply-To: <20130912205644.GW29403@sirena.org.uk>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C213=C8=D5 04:56, Mark Brown =D0=B4=B5=C0:
> On Fri, Sep 13, 2013 at 12:12:14AM -0400, Huang Shijie wrote:
>
>> I think the controller is designed for the NOR flash, yes, a little
>> strange.
> I think this is part of the problem - you're trying to represent
> something that isn't really a SPI controller as a SPI controller (or at
> least trying to implement functionality beyond that which a SPI
> controller has).
>
The QuadSpi is not a traditional SPI controller, but i think it is still
a SPI controller.
It connects and controls the SPI NOR FLASH, so what do you think it is?


>> Mark and you want to create the LUT instruction sequence at the runtim=
e,
>> But there is some disadvantage if we do so:
>>   [1] low efficiency:=20
>>   [2] we may can not create all the LUT instruction sequence at the
>>       runtime. For example, the buffer program(OPCODE_PP):
>>   [3] We may can not create the LUT instruction sequence at the runtim=
e,
>>       since we can not get enough information from the spi_transfer{}.
>>       A whole LUT instruction sequence may needs the following info:
> What this is saying to me is that you should not be impementing this as
If the quadspi controller is not a SPI controller, what controller is it?


> a SPI controller, trying to do that is breaking the abstracton that SPI
> is offering.  Like people have said SPI is just about byte streams.
yes, SPI is now just about the byte streams.



But the Quadspi controller can not work with the byte streams directly,
it works with the LUT instruction sequences, so we have to parse the
byte streams,
and then uses the right LUT to trigger the transaction.



> I think what you should be doing is refactoring the MTD code which
> interfaces to SPI flashes to split out the code so that there's an
> abstraction which can express what this controller (and presumably
> other controllers) can do and then implement this functionaltiy at
> that level.
If i follow this advice, i have to create a new file cloned by the m25p80=
.c,
and replace all the SPI APIs with other APIs.

I have no idea what APIs can be used to replace the SPI APIs.


thanks
Huang Shijie
