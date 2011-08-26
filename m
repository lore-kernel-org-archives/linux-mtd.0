MIME-Version: 1.0
In-Reply-To: <4E57118E.90100@freescale.com>
References: <1314171204-25458-1-git-send-email-b32955@freescale.com>
	<1314272091.18988.53.camel@sauron> <4E57118E.90100@freescale.com>
Date: Fri, 26 Aug 2011 15:34:47 +0200
Message-ID: <CAHMSPgPPCujzifQ8jRa7vn+9eFb=O4otCEbzC3n+pNh=kryC=w@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, s.hauer@pengutronix.de, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested-by: Koen Beel <koen.beel@barco.com>

On Fri, Aug 26, 2011 at 5:22 AM, Huang Shijie <b32955@freescale.com> wrote:
> Hi Artem:
>>
>> On Wed, 2011-08-24 at 15:33 +0800, Huang Shijie wrote:
>>>
>>> The patch set is based on Artem's tree:
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://git.infradead.org/users/dedekind/l2-m=
td-2.6.git
>>>
>>> The general-purpose media interface(GPMI) controller is a flexible
>>> interface
>>> to up to several NAND flashs.
>>>
>>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC
>>> accelerator.
>>>
>>> With the help of BCH, the GPMI controller can choose to do the hardware
>>> ECC or
>>> not.
>>>
>>> This driver is a _pure_ MTD NAND controller driver now.
>>
>> I've pushed these patches to my l2-mtd-2.6.git tree. I assume they are
>> independent of the other patches of yours: "[PATCH v8 0/4] add the
>> GPMI-NAND support for imx23/imx28".
>>
> thanks very much :)
>
> Huang Shijie
>>
>> I did not really review the driver carefully, but the code looks neat at
>> the first glance. My tree is in linux-next, so you should see your
>> driver there.
>>
>> Also, if someone gives it more review, and you send a new version, I can
>> always pick it up.
>>
>> Thanks.
>>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
