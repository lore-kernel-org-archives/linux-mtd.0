Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYAsy-0004U0-PH
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 08:30:49 +0000
Message-ID: <5264E6A9.6070400@freescale.com>
Date: Mon, 21 Oct 2013 16:32:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>	<5260DA32.4090502@freescale.com>
 <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
 <5264A220.2070900@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2910B@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2910B@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8821=E6=97=A5 14:01, Gupta, Pekon =E5=86=99=
=E9=81=93:
> Hi Shijie,
>
>> From: Huang Shijie
>>
>> I am too busy too, i am starting to code the Qspi driver now.
>>
> (1)
> Your controller uses LUT based approach, So in case, you are planning t=
o
> follow DT based approach of populating flash information in your QSPI
> controller then I can help you to put that as part of generic framework
> so that both ti-qspi and fsl-qspi can re-use it.
it's very good.
> (2)
> Also, would you be interested in deriving generic framework for serial
> NOR something like mtd/spinor/.. where m25p80 can plug-in ?

yes.

Do you have any solution about the generic framework for spi nor?

i want to chage the m25p80.c, and make it not only work for SPI drivers,=20
but also can work for SPI-NOR(QSPI) driver.

thanks
Huang Shijie


> Based on the following cleaned up version of mtd/spinand/...
> https://lkml.org/lkml/2013/6/26/88
> by Mona Anonuevo<manonuevo@micron.com>
>
>
> with regards, pekon
>
